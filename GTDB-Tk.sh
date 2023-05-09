# GTDB-Tk

#!/bin/bash -e
#SBATCH --account       massey03212
#SBATCH --job-name      GTDBTk_GW
#SBATCH --time          03:00:00
#SBATCH --mem           128GB
#SBATCH --cpus-per-task 16
#SBATCH --error         %x_%j.err
#SBATCH --output        %x_%j.out

module purge
module load GTDB-Tk/2.1.0-gimkl-2020a-Python-3.9.9

gtdbtk classify_wf -x fa --cpus 20 --genome_dir dastool_out/_DASTool_bins/ --out_dir gtdbtk_out/