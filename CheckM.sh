# CheckM

#!/bin/bash -e
#SBATCH -A massey03212
#SBATCH -J checkM_Hum_Unwell
#SBATCH --time 00:30:00
#SBATCH --mem 10GB
#SBATCH --ntasks 1
#SBATCH --cpus-per-task 12
#SBATCH -e checkM_Hum_Unwell.err
#SBATCH -o checkM_Hum_Unwell.out
#SBATCH --export NONE

module purge
module load CheckM/1.0.13-gimkl-2018b-Python-3.7.3

checkm lineage_wf -t 10 --pplacer_threads 10 -x fa \
                  --tab_table -f checkm.txt \
                  dastool_out/_DASTool_bins/ checkm_out/