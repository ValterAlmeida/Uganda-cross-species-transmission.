# Dastool

#!/bin/bash -e
#SBATCH -A massey03212
#SBATCH -J dastool_healthy
#SBATCH --time 01:00:00
#SBATCH --mem 20GB
#SBATCH --ntasks 1
#SBATCH --cpus-per-task 32
#SBATCH -e dastool_healthy.err
#SBATCH -o dastool_healthy.out
#SBATCH --export NONE

module purge

mkdir -p dastool_out/

module load DAS_Tool/1.1.1-gimkl-2018b-R-3.6.1
module load DIAMOND/0.9.25-gimkl-2018b
module load USEARCH/11.0.667-i86linux32

DAS_Tool -i metabat_associations.txt,maxbin_associations.txt -l MetaBAT,MaxBin \
         -t 2 --write_bins 1 --search_engine blast \
         -c human_healthy.m1000.fna \
         -o dastool_out/