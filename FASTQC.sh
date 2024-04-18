FASTQC

#!/bin/bash -e
#SBATCH -A massey03212
#SBATCH -J Fastqc
#SBATCH --time 8:00:00
#SBATCH --mem 32GB
#SBATCH --ntasks 1
#SBATCH --cpus-per-task 16
#SBATCH -e fastqc.err
#SBATCH -o fastqc.out
#SBATCH --export NONE

export SLURM_EXPORT_ENV=ALL

# Set up working directories
cd /nesi/nobackup/massey03212/AGRF/AGRF_CAGRF21098330_H3CGTDSX3/trimmomatic_test/script_test

# Load Fastqc
module purge
module load FastQC/0.11.9

# Run FastQC

fastqc *.gz -o /nesi/nobackup/massey03212/AGRF/AGRF_CAGRF21098330_H3CGTDSX3/trimmomatic_test/script_test/fastqc_out