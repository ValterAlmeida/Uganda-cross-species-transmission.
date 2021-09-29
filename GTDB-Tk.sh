# GTDB-Tk

#!/bin/bash
#SBATCH -A massey03212
#SBATCH -J gtdbtk_2
#SBATCH --time 01:50:00
#SBATCH --mem 10GB
#SBATCH --cpus-per-task 12
#SBATCH -e gtdbtk_2.err
#SBATCH -o gtdbtk_2.out
#SBATCH --export NONE

export SLURM_EXPORT_ENV=ALL

module purge
module load GTDB-Tk/1.2.0-gimkl-2020a-Python-3.8.2

gtdbtk classify_wf -x fa --cpus 16 --genome_dir metabat/ --out_dir gtdbtk_metabat_out/

gtdbtk classify_wf -x fasta --cpus 16 --genome_dir maxbin/ --out_dir gtdbtk_maxbin_out/

gtdbtk classify_wf -x fasta --cpus 16 --genome_dir fasta_bins/ --out_dir gtdbtk_concoct_out/