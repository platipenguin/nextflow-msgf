# nextflow-msgf

MSGF.nf and its run.sh file are used to run MS-GF+ searches on multiple pieces of mass spectrometry data using AWS cloud computing resources.

The run.sh file specifies where the program should look for sample spectra, as well as the database and mod file to use.

The MSGF.nf script can be modified to change the number of cores, as well as the amount of RAM dedicated to each individual search.

The script takes in a folder of MS spectra and creates a new channel for each one, enabling all MS-GF+ searches to be run in parallel.
