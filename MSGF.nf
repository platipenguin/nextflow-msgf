#!/usr/bin/env nextflow

// Parameters supplied by the user
params.spectra_folder = false
params.database = false
params.mod = false
params.output_folder = false

modFile = file(params.mod)
databaseFile = file(params.database)

spectrumFileChannel = Channel.fromPath("${params.spectra_folder}/*_dta.txt")

// Run MS-GF+
process msgfPlus {
    container "emlee/msgf:v3.0"
    cpus 8
    memory "8 GB"
    publishDir "${params.output_folder}/"
    
    input:
    file spectra_file from spectrumFileChannel
	file modFile
	file databaseFile
	
	output:
	file "${spectra_file.name.replaceAll(/.txt/, '')}.mzid"
	
	afterScript "rm -r *"

	script:
	"""
	java -Xmx8g -jar /root/MSGFPlus.jar -s ${spectra_file} -d ${databaseFile} -tda 1 -ntt 1 -mod ${modFile} -o ${spectra_file.name.replaceAll(/.txt/, '')}.mzid		
	java -Xmx1g -jar /root/MSGFPlus.jar edu.ucsd.msjava.ui.MzIDToTsv -i ${spectra_file.name.replaceAll(/.txt/, '')}.mzid -showDecoy 1
	"""

}
