Gorilla

#!/bin/bash -e
#SBATCH -A massey03212
#SBATCH -J bbmap_GH
#SBATCH --time 07:00:00
#SBATCH --mem 32GB
#SBATCH --ntasks 1
#SBATCH --array=1-4
#SBATCH --cpus-per-task 12
#SBATCH -e bbmap_GH.err
#SBATCH -o bbmap_GH.out
#SBATCH --export NONE

export SLURM_EXPORT_ENV=ALL

# Set up working directories
cd /nesi/project/massey03212/Uganda/host_filt_files/Gorilla_wild
mkdir -p host_filtered_reads/

# Load BBMap module
module purge
module load BBMap/38.81-gimkl-2020a

for file in *.fastq;
do
base=$(basename ${file} .fastq) 
# Run bbmap
srun bbmap.sh -Xmx27g -t=20 \
minid=0.95 maxindel=3 bwr=0.16 bw=12 quickmatch fast minhits=2 qtrim=rl trimq=10 untrim \
in=${base}.fastq \
path=/nesi/nobackup/massey03212/Uganda/Gorilla/Gorilla_gorilla_Kamilah_GGO_v0/ \
outu=/nesi/project/massey03212/Uganda/host_filt_files/Gorilla_wild/host_filtered_reads/${base}_hostFilt.fastq
done

__________________________________________________________________________________________
Human

#!/bin/bash -e
#SBATCH -A massey03212
#SBATCH -J bbmap_HH
#SBATCH --time 07:00:00
#SBATCH --mem 16GB
#SBATCH --ntasks 1
#SBATCH --array=1-4
#SBATCH --cpus-per-task 12
#SBATCH -e bbmap_HH.err
#SBATCH -o bbmap_HH.out
#SBATCH --export NONE

export SLURM_EXPORT_ENV=ALL

# Set up working directories
cd /nesi/nobackup/massey03212/Uganda/RNA/human_unwell/kraken2/
mkdir -p host_filtered_reads/

# Load BBMap module
module purge
module load BBMap/38.81-gimkl-2020a

for file in *.fastq;
do
base=$(basename ${file} .fastq) 
# Run bbmap
srun bbmap.sh -Xmx27g -t=20 \
minid=0.95 maxindel=3 bwr=0.16 bw=12 quickmatch fast minhits=2 qtrim=rl trimq=10 untrim \
in=${base}.fastq \
path=/nesi/nobackup/massey03212/Uganda/Human/human_GRCh38/ \
outu=/nesi/nobackup/massey03212/Uganda/RNA/human_unwell/kraken2/host_filtered_reads/${base}_hostFilt.fastq
done

__________________________________________________________________________________________
Cattle

#!/bin/bash -e
#SBATCH -A massey03212
#SBATCH -J bbmap_CA
#SBATCH --time 07:00:00
#SBATCH --mem 32GB
#SBATCH --ntasks 1
#SBATCH --array=1-4
#SBATCH --cpus-per-task 12
#SBATCH -e bbmap_CA.err
#SBATCH -o bbmap_CA.out
#SBATCH --export NONE

export SLURM_EXPORT_ENV=ALL

# Set up working directories
cd /nesi/project/massey03212/Uganda/host_filt_files/Cattle
mkdir -p host_filtered_reads/

# Load BBMap module
module purge
module load BBMap/38.81-gimkl-2020a

for file in *.fastq;
do
base=$(basename ${file} .fastq) 
# Run bbmap
srun bbmap.sh -Xmx27g -t=20 \
minid=0.95 maxindel=3 bwr=0.16 bw=12 quickmatch fast minhits=2 qtrim=rl trimq=10 untrim \
in=${base}.fastq \
path=/nesi/nobackup/massey03212/Uganda/Cattle/Bos_taurus/ \
outu=/nesi/project/massey03212/Uganda/host_filt_files/Cattle/host_filtered_reads/${base}_hostFilt.fastq
done

__________________________________________________________________________________________
Goat

#!/bin/bash -e
#SBATCH -A massey03212
#SBATCH -J bbmap_GO
#SBATCH --time 07:00:00
#SBATCH --mem 32GB
#SBATCH --ntasks 1
#SBATCH --array=1-4
#SBATCH --cpus-per-task 12
#SBATCH -e bbmap_GO.err
#SBATCH -o bbmap_GO.out
#SBATCH --export NONE

export SLURM_EXPORT_ENV=ALL

# Set up working directories
cd /nesi/project/massey03212/Uganda/host_filt_files/Goat
mkdir -p host_filtered_reads/

# Load BBMap module
module purge
module load BBMap/38.81-gimkl-2020a

for file in *.fastq;
do
base=$(basename ${file} .fastq) 
# Run bbmap
srun bbmap.sh -Xmx27g -t=20 \
minid=0.95 maxindel=3 bwr=0.16 bw=12 quickmatch fast minhits=2 qtrim=rl trimq=10 untrim \
in=${base}.fastq \
path=/nesi/nobackup/massey03212/Uganda/Goat/Capra_hircus_ARS1/ \
outu=/nesi/project/massey03212/Uganda/host_filt_files/Goat/host_filtered_reads/${base}_hostFilt.fastq
done