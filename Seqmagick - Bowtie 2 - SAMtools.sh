#Seqmagick - Bowtie2 - SAMtools

#!/bin/bash -e
#SBATCH -A massey03212
#SBATCH -J human_healthy_bowtie2
#SBATCH --time 1:40:00
#SBATCH --mem 20GB
#SBATCH --ntasks 1
#SBATCH --cpus-per-task 32
#SBATCH -e human_healthy_bowtie2.err
#SBATCH -o human_healthy_bowtie2.out
#SBATCH --export NONE

export SLURM_EXPORT_ENV=ALL

# Set up working directories
cd /nesi/nobackup/massey03212/Uganda/full_co_assembly/Human/Healthy/host_filtered_reads/megahit_out/bowtie2

# Load Seqmagick, Bowtie2 and SAMtools module
module purge
module load Bowtie2/2.3.5-GCC-7.4.0 SAMtools/1.8-gimkl-2018b
module load seqmagick/0.7.0-gimkl-2018b-Python-3.7.3

# Run Seqmagick
seqmagick convert --min-length 1000 final.contigs.fa human_megahit.m1000.fna

# Run bowtie2
bowtie2-build human_healthy.m1000.fna human_healthy_bt2
bowtie2 -x human_healthy_bt2 06_d01_dna_ug313_hostFilt.fastq,ug302_hostFilt.fastq,ug316_hostFilt.fastq,ug327_hostFilt.fastq,ug340_hostFilt.fastq,ug352_hostFilt.fastq,ug365_hostFilt.fastq,ug376_hostFilt.fastq,ug387_hostFilt.fastq,ug398_hostFilt.fastq,06_e01_dna_ug328_hostFilt.fastq,ug303_hostFilt.fastq,ug317_hostFilt.fastq,ug329_hostFilt.fastq,ug341_hostFilt.fastq,ug355_hostFilt.fastq,ug366_hostFilt.fastq,ug377_hostFilt.fastq,ug388_hostFilt.fastq,ug399_hostFilt.fastq,06_f01_dna_ug335_hostFilt.fastq,ug304_hostFilt.fastq,ug318_hostFilt.fastq,ug330_hostFilt.fastq,ug342_hostFilt.fastq,ug356_hostFilt.fastq,ug367_hostFilt.fastq,ug378_hostFilt.fastq,ug389_hostFilt.fastq,ug400_hostFilt.fastq,3_b05_dna_ug311_hostFilt.fastq,ug306_hostFilt.fastq,ug319_hostFilt.fastq,ug331_hostFilt.fastq,ug343_hostFilt.fastq,ug357_hostFilt.fastq,ug368_hostFilt.fastq,ug379_hostFilt.fastq,ug390_hostFilt.fastq,3_e07_dna_ug353_hostFilt.fastq,ug307_hostFilt.fastq,ug320_hostFilt.fastq,ug332_hostFilt.fastq,ug344_hostFilt.fastq,ug358_hostFilt.fastq,ug369_hostFilt.fastq,ug380_hostFilt.fastq,ug391_hostFilt.fastq,3_e08_dna_ug354_hostFilt.fastq,ug308_hostFilt.fastq,ug321_hostFilt.fastq,ug333_hostFilt.fastq,ug346_hostFilt.fastq,ug359_hostFilt.fastq,ug370_hostFilt.fastq,ug381_hostFilt.fastq,ug392_hostFilt.fastq,ug309_hostFilt.fastq,ug322_hostFilt.fastq,ug334_hostFilt.fastq,ug347_hostFilt.fastq,ug360_hostFilt.fastq,ug371_hostFilt.fastq,ug382_hostFilt.fastq,ug393_hostFilt.fastq,ug310_hostFilt.fastq,ug323_hostFilt.fastq,ug336_hostFilt.fastq,ug348_hostFilt.fastq,ug361_hostFilt.fastq,ug372_hostFilt.fastq,ug383_hostFilt.fastq,ug394_hostFilt.fastq,ug312_hostFilt.fastq,ug324_hostFilt.fastq,ug337_hostFilt.fastq,ug349_hostFilt.fastq,ug362_hostFilt.fastq,ug373_hostFilt.fastq,ug384_hostFilt.fastq,ug395_hostFilt.fastq,ug314_hostFilt.fastq,ug325_hostFilt.fastq,ug338_hostFilt.fastq,ug350_hostFilt.fastq,ug363_hostFilt.fastq,ug374_hostFilt.fastq,ug385_hostFilt.fastq,ug396_hostFilt.fastq,ug301_hostFilt.fastq,ug315_hostFilt.fastq,ug326_hostFilt.fastq,ug339_hostFilt.fastq,ug351_hostFilt.fastq,ug364_hostFilt.fastq,ug375_hostFilt.fastq,ug386_hostFilt.fastq,ug397_hostFilt.fastq -S human_healthy_bt2.bam

# Run SAMtools
samtools sort human_healthy_bt2.bam -o human_healthy_bt2.sorted.bam
samtools index human_healthy_bt2.sorted.bam