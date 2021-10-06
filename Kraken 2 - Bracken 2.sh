Kraken 2

#!/bin/bash -e
#SBATCH -A massey03212
#SBATCH -J Kra_Brac_GO
#SBATCH --time 02:20:00
#SBATCH --mem 32GB
#SBATCH --ntasks 1
#SBATCH --cpus-per-task 16
#SBATCH -e kracken.err
#SBATCH -o kracken.out
#SBATCH --export NONE


#module load
module purge
module load Kraken2/2.1.1-GCC-9.2.0
module load Bracken/2.6.0-GCCcore-9.2.0

# First step

for file in *.fastq
do
base=$(basename ${file} .fastq)
kraken2 --db /opt/nesi/db/Kraken2/standard/ --use-names ${base}.fastq --output ${base}.txt --report ${base}.kreport
done

# Second step
 
for file in *.kreport
do
base=$(basename ${file} .kreport)
bracken -d /opt/nesi/db/Kraken2/standard/ -i ${base}.kreport -o ${base}_bracken.report -t 16 -r 100
done