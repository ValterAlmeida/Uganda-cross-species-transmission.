#!/bin/bash -e
#SBATCH -A massey03212
#SBATCH -J bbmap
#SBATCH --time 14:00:00
#SBATCH --mem 27GB
#SBATCH --ntasks 1
#SBATCH --cpus-per-task 20
#SBATCH --error         %x_%j.err
#SBATCH --output        %x_%j.out

# Set up working directories
cd /nesi/nobackup/massey03212/Comparisons_02_23/Congo_captive_gorilla_Tayte
mkdir -p host_filtered_reads/

# Load BBMap module
module purge
module load BBMap/39.01-GCC-11.3.0

for file in *.fastq;
do
base=$(basename ${file} .fastq)

# Run bbmap
srun bbmap.sh -Xmx27g -t=20 \
minid=0.95 maxindel=3 bwr=0.16 bw=12 quickmatch fast minhits=2 qtrim=rl trimq=10 untrim \
in=${base}.fastq \
path=/nesi/project/massey03212/AGRF/AGRF_CAGRF21098330_H3CGTDSX3/Trimmomatic/bbmap/Gorilla_ref \
outu=/nesi/nobackup/massey03212/Comparisons_02_23/Congo_captive_gorilla_Tayte/host_filtered_reads/${base}_hostFilt.fastq
done
done