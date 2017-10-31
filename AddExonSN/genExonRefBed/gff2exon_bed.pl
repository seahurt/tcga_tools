#!perl
use warnings;
use strict;

die("Usage:perl $0 <gff> <exon.bed>\n") if @ARGV!=2;
my ($gff,$bed)=@ARGV;
open GFF, "$gff";
open BED, ">$bed";
my %genepool;
my %chrmap=(
        "NC_000001.10","1",
        "NC_000002.11","2",
        "NC_000003.11","3",
        "NC_000004.11","4",
        "NC_000005.9","5",
        "NC_000006.11","6",
        "NC_000007.13","7",
        "NC_000008.10","8",
        "NC_000009.11","9",
        "NC_000010.10","10",
        "NC_000011.9","11",
        "NC_000012.11","12",
        "NC_000013.10","13",
        "NC_000014.8","14",
        "NC_000015.9","15",
        "NC_000016.9","16",
        "NC_000017.10","17",
        "NC_000018.9","18",
        "NC_000019.9","19",
        "NC_000020.10","20",
        "NC_000021.8","21",
        "NC_000022.10","22",
        "NC_000023.10","X",
        "NC_000024.9","Y",
        "NC_012920.1","M"
);

print BED "#Chr\tStart\tEnd\tGeneSymbol\n";

while(<GFF>){
    chomp;
    next if /^#/;
    next if /^NT/;
    next if /^NW/;
    my($chr,$refseq,$region,$start,$end,$non1,$non2,$non3,$info)=split /\t/;
    next if $region!~/exon/;
    my $exonid;
    my $gene;
    my $exonNO;
    if($info=~/ID=(id[0-9]+)/){
        $exonid=$1;
    }else{
        $exonid='null';
    }
    if($info=~/gene=([a-zA-Z0-9\-\.]+)/){
        $gene=$1;
        $genepool{$gene}++;
        $exonNO=$genepool{$gene};
    }else{
        $gene='null';
        $exonNO=0;
    }
    if (defined $chrmap{$chr}){
        $chr=$chrmap{$chr};
    }else{
        print "Unnormal Chromosome\n";
    }
    print BED "$chr\t$start\t$end\t$gene\n";
}
close BED;
close GFF; 
