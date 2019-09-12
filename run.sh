#!/bin/bash

set -e

module load nextflow/19.07.0

WORKING_DIR="s3://fh-pi-fredricks-d/lab/Elliot_Lee/temp/nextflow/"

nextflow \
	-C ~/nextflow.config \
	run \
	MSGF.nf \
		--spectra_folder "TestData/" \
		--database "9-11-19_NextflowMSGF/options/Human9606_2-6-2019_TrypPigBov.fasta" \
		--mod "9-11-19_NextflowMSGF/options/MSGFDB_PartTryp_MetOx_20ppmParTol.txt" \
		--output_folder "9-11-19_NextflowMSGF/results/" \
		-w "$WORKING_DIR" \
		-process.queue "spot-test" \
		-with-report 9-11-19_NextflowMSGF/9-11-19_Test3.0.html \
		-resume
