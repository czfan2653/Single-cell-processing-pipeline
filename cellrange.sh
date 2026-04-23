#!/bin/bash

samples=("GSM8076040" "GSM8076041" "GSM8076042" "GSM8076043" "GSM8076044" "GSM8076045" "GSM8076046" "GSM8076047" "GSM8076048" "GSM8076049" "GSM8076050" "GSM8076051" "GSM8076052" "GSM8076053" "GSM8076054" "GSM8076055" "GSM8076056" "GSM8076057" "GSM8076058" "GSM8076059" "GSM8076060" "GSM8076061" "GSM8076062" "GSM8076063" "GSM8076064" "GSM8076065" "GSM8076066" "GSM8076067" "GSM8076068" "GSM8076069" "GSM8076070" "GSM8076071" "GSM8076072" "GSM8076073")

for sample in "${samples[@]}"; do
  echo "Processing sample: $sample"
  
  cellranger count \
    --id=ptenGSE255612_${sample} \
    --transcriptome=/data1/cunzhong/Genomic_ref/Human_GRCh38/refdata-gex-GRCh38-2020-A \
    --fastqs=/data1/cunzhong/AF_dataset/GSE255612 \
    --sample=${sample} \
    --create-bam=false \
    --nosecondary \
    --localcores=28 \
    --localmem=90 \
    --r1-length=26 \
    --output-dir=/data1/cunzhong/AF_dataset/GSE255612_out/${sample}
    
  echo "Finished processing $sample"
done