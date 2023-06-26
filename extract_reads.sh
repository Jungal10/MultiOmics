#!/bin/bash



# Directory containing BAM files

BAM_DIR="/home/storage/DataLake/WIP/Nanopore/outdir_pilot_samples/minimap2"



# Loop through each BAM file in the directory

for BAM_FILE in "${BAM_DIR}"/*_R1.sorted.bam; do

    # Extract the filename without extension

    FILENAME=$(basename "${BAM_FILE}" .bam)

    

    # Define the output BAM filename

    #OUTPUT_BAM="${FILENAME}_3k_10k.bam"
    OUTPUT_BAM="${FILENAME}_less_1k.bam"

    

    # Run the pipeline to extract reads

    #samtools view -h "${BAM_FILE}" | awk '{ if (substr($0,1,1) == "@" || (length($10) >= 3000 && length($10) <= 10000)) {print $0} }' | samtools view -b > "${OUTPUT_BAM}"
    #samtools view -h "${BAM_FILE}" | awk '{ if (substr($0,1,1) == "@" || (length($10) >=  10000)) {print $0} }' | samtools view -b > "${OUTPUT_BAM}"

    samtools view -h "${BAM_FILE}" | awk '{ if (substr($0,1,1) == "@" || (length($10) <  1000)) {print $0} }' | samtools view -b > "${OUTPUT_BAM}"
    

    # Print the processed filename

    echo "Processed: ${BAM_FILE}"

done
