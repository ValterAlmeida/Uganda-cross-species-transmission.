# Metabat - Binning

#!/bin/bash -e
#SBATCH -A massey03212
#SBATCH -J Metabat_CA
#SBATCH --time 02:00:00
#SBATCH --mem 32GB
#SBATCH --cpus-per-task 20
#SBATCH -e metabat.err
#SBATCH -o metabat.out
#SBATCH --export NONE

module purge
module load MetaBAT/2.15-GCC-11.3.0

jgi_summarize_bam_contig_depths --outpqutDepth metabat.txt cattle.sorted.bam

metabat2 -t $SLURM_CPUS_PER_TASK -m 1500 \
         -i cattle.m1000.fna \
         -a metabat.txt \
         -o metabat
