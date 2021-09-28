#SPAdes

#!/bin/bash -e
#SBATCH -A massey03212
#SBATCH -J spades_HU
#SBATCH --time 06:20:00
#SBATCH --mem 20GB
#SBATCH --ntasks 1
#SBATCH --cpus-per-task 12
#SBATCH -e spades.err
#SBATCH -o spades.out
#SBATCH --export NONE

export SLURM_EXPORT_ENV=ALL

# Set up working directories
cd /nesi/project/massey03212/Uganda/host_filt_files/Human_unwell/host_filtered_reads/spades

# Load Spades module
module purge
module load SPAdes/3.15.2-gimkl-2020a

for file in *.fastq;
do
base=$(basename ${file} .fastq) 
# Run Spades
spades.py --meta --12 ${base}.fastq -o ${base}
done

________________________________________

#FOR 5 FILES

#Job ID: 20058448
#Cluster: mahuika
#User/Group: valmeida/valmeida
#State: COMPLETED (exit code 0)
#Cores: 6
#Tasks: 1
#Nodes: 1
#Job Wall-time:  17.87%  00:48:15 of 04:30:00 time limit
#CPU Efficiency: 120.25%  05:48:07 of 04:49:30 core-walltime
#Mem Efficiency: 8.05%  4.83 GB of 60.00 GB








