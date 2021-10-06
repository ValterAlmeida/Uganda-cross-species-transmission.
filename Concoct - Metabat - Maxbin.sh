# Concoct - Metabat - Maxbin

#!/bin/bash -e
#SBATCH -A massey03212
#SBATCH -J concoct_human_healthy
#SBATCH --time 00:40:00
#SBATCH --mem 10G
#SBATCH --ntasks 1
#SBATCH --cpus-per-task 24
#SBATCH -e concoct_human_healthy.err
#SBATCH -o concoct_human_healthy.out
#SBATCH --export NONE

module load CONCOCT/1.1.0-gimkl-2020a-Python-3.8.2

cut_up_fasta.py human_healthy.m1000.fna -c 10000 -o 0 --merge_last -b human_healthy_10K.bed > human_healthy_10K.fa

concoct_coverage_table.py human_healthy_10K.bed mapping/human_healthy.sorted.bam > coverage_table_human_healthy.tsv

concoct --composition_file human_healthy_10K.fa --coverage_file coverage_table_human_healthy.tsv -b concoct_human_healthy_output/

merge_cutup_clustering.py concoct_human_healthy_output/clustering_gt1000.csv > concoct_human_healthy_output/clustering_merged.csv

mkdir concoct_human_healthy_output/fasta_bins
extract_fasta_bins.py human_healthy.m1000.fna concoct_human_healthy_output/clustering_merged.csv --output_path concoct_human_healthy_output/fasta_bins

# Metabat

module load MetaBAT/2.13-GCC-7.4.0

jgi_summarize_bam_contig_depths --outputDepth metabat.txt human_healthy.sorted.bam

metabat2 -t 2 -m 1500 \
         -i human_healthy.m1000.fna \
         -a metabat.txt \
         -o metabat
         
__________________________________________________________________________________________

# Maxbin

module load MaxBin/2.2.6-gimkl-2018b-Perl-5.28.1

cut -f1,4,6,8,10 metabat.txt > maxbin.txt

mkdir -p maxbin/
run_MaxBin.pl -thread 10 -min_contig_length 1500 \
              -contig human_healthy.m1000.fna \
              -abund maxbin.txt \
              -out maxbin
              
__________________________________________________________________________________________

# Creating association files

#Metabat

for bin_path in metabat/*.fa;
do
    bin_name=$(basename ${bin_path} .fa)

    grep ">" ${bin_path} | sed 's/>//g' | sed "s/$/\t${bin_name}/g" >> metabat_associations.txt
done

# Maxbin

for bin_path in maxbin/*.fasta;
do
    bin_name=$(basename ${bin_path} .fasta)
    grep ">" ${bin_path} | sed 's/>//g' | sed "s/$/\t${bin_name}/g" >> maxbin_associations.txt
done