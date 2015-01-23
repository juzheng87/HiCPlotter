# !/bin/bash

gunzip data/HiC/Human/*
gunzip data/HiC/Mouse/*
gunzip data/5C/*

# Basic examples

## Plotting whole chromosome
 python HiCPlotter.py -f data/HiC/Human/hES-nij.chr21.2 -n hES -chr chr21 -r 40000 -o default1 -fh 0
 
## Focusing to a region within a chromosome
 python HiCPlotter.py -f data/HiC/Human/hES-nij.chr21.2 -n hES -chr chr21 -r 40000 -o default2 -ptd 1 -pptd 1 -s 600 -e 900 -fh 0 -w 8 -tr 10

## Visualization of multiple Hi-C datasets
 python HiCPlotter.py -f data/HiC/Human/GSM1081526_TEV_r1_cis.index.chr6.txt_matrix.txt data/HiC/Human/GSM1081528_HRV_r1_cis.index.chr6.txt_matrix.txt data/HiC/Human/GSM1081530_CTRL_r1_cis.index.chr6.txt_matrix.txt data/HiC/Human/GSM1081533_CTCF_r2_cis.index.chr6.txt_matrix.txt -n WT RAD21-Depleted siControl CTCF-Depleted -chr chr6 -r 40000 -fh 0 -pi 0 -sn 0.35 -o Rad21.CTCF -s 2800 -e 2950 -hmc 5

# Examples from publicly available datasets
 
## Visualization of ChIP-Seq and 4C data as histograms
 python HiCPlotter.py -f data/HiC/Mouse/mES.chr2 -n mES -chr chr2 -r 40000 -o HoxD -hist data/HiC/Mouse/GSM1334415_4C_Mouse_EScells_Hoxd4_smoothed_11windows.bedGraph,data/HiC/Mouse/GSM1334440_4C_Mouse_E9.5TB_Hoxd4_smoothed_11windows.bedGraph,data/HiC/Mouse/GSM1334412_4C_Mouse_EScells_Hoxd13_smoothed_11windows.bedGraph,data/HiC/Mouse/GSM1334437_4C_Mouse_E9.5TB_Hoxd13_smoothed_11windows.bedGraph,data/HiC/Mouse/GSM747534_ChIPseq_CTCF_ES_rep1.chr2.bedGraph -hl Hoxd4-ES,Hoxd4-Tail,Hoxd13-ES,Hoxd13-Tail,CTCF-ES -s 1830 -e 1880 -fh 0 -pi 0 -pcd 1 -pcdf data/mES_domains_mm9.bed -fhist 1,1,1,1,0 -hm 2000,2000,2000,2000,50
 
## Visualization of ChIP-Seq and RAP-Seq data as histograms
 python HiCPlotter.py -f data/HiC/Mouse/mES.chrX -n mES -r 40000 -chr chrX -o RAP -fh 0 -hist data/HiC/Mouse/GSE46918_pSM33-0hr-Xist_vs_Input.W10000_O7500.bedGraph,data/HiC/Mouse/GSE46918_pSM33-1hr-Xist_vs_Input.W10000_O7500.bedGraph,data/HiC/Mouse/GSE46918_pSM33-2hr-Xist_vs_Input.W10000_O7500.bedGraph,data/HiC/Mouse/GSE46918_pSM33-3hr-Xist_vs_Input.W10000_O7500.bedGraph,data/HiC/Mouse/GSE46918_pSM33-6hr-Xist_vs_Input.W10000_O7500.bedGraph,data/HiC/Mouse/wgEncodeLicrHistoneEsb4H3k27me3ME0C57bl6StdSig.chrX.bedGraph -hl Xist_0h,Xist_1h,Xist_2h,Xist_3h,Xist_6h,H3K27me3_0h -pi 0 -ptr 0 -fhist 0,1,1,1,1,0 -hmc 4 -sn 0
 
## Plotting multiple conditions, visualization of ChIP-Seq as histograms and Chromatin states as tiles
 python HiCPlotter.py -f data/HiC/Human/hES-nij.chr7.2 data/HiC/Human/IMR90-nij.chr7.2 -n hES IMR90 -chr chr7 -o HoxA -r 40000 -fh 0 -s 650 -e 700 -hist data/HiC/Human/H1.H3K27me3.chr7.bedGraph,data/HiC/Human/H1.Pol2.chr7.bedGraph,data/HiC/Human/H1ctcf.chr7.bedGraph,data/HiC/Human/H1.Rad21.chr7.bedGraph data/HiC/Human/IMR90.H3K27me3.chr7.bedGraph,data/HiC/Human/IMR90.Pol2.chr7.bedGraph,data/HiC/Human/IMR90ctcf.chr7.bedGraph,data/HiC/Human/IMR90.Rad21.chr7.bedGraph -hl H3K27ME3,PolII,CTCF,RAD21 H3K27ME3,PolII,CTCF,RAD21 -t data/HiC/Human/H1_18_core_K27ac_dense.ReprPC.2.bed data/HiC/Human/IMR90_18_core_K27ac_dense.ReprPC.2.bed -tl Polycomb Polycomb -pcd 1 -pcdf data/hESC_domains_hg19.bed data/IMR90_domains_hg19.bed 
 
## Visualization of ChIP-Seq as histograms, ChIA-Pet as arcs and Polycomb domains as tiles
 python HiCPlotter.py -f data/HiC/Mouse/mES.chr3 -n mES -chr chr3 -o Bhlhe22 -r 40000 -s 400 -e 475 -a data/HiC/Mouse/mESC_SMC_ChIPPet.bed -al SMC -hist data/HiC/Mouse/GSM747534_chr3.bedGraph,data/HiC/Mouse/wgEncodeLicrHistoneEsb4H3k27me3ME0C57bl6StdSig.chr3.bedGraph -hl CTCF,H3K27me3 -pi 0 -ptr 0 -t data/HiC/Mouse/mm9_Polycomb_domains.bed -tl Polycomb -tc 00CCFF -ac B4B4B4 -fh 0
 
## Visualization of 4C data as histograms and Enhancers as tiles with text
 python HiCPlotter.py -f data/HiC/Mouse/mES.chr6 -n mES -chr chr6 -r 40000 -o Digit.vs.GT -s 1295 -e 1338 -hist data/HiC/Mouse/GSM1524258_segToFrag_4C_Digits_WT_E12-5_HoxA13_smoothed_11FragsPerWin.bedGraph,data/HiC/Mouse/GSM1524259_segToFrag_4C_GT_WT_E15-5_HoxA13_smoothed_11FragsPerWin.bedGraph -hl Digits,GT -fhist 1,1 -fh 0 -pi 0 -hm 1500,1500 -pcd 1 -pcdf data/mES_domains_mm9.bed -sn 0.4 -t data/HiC/Mouse/LonfatPrimers.bedGraph -tl Enhancers -tt 1 -ptr 0

## Highlighting selected loci
 python HiCPlotter.py -f data/HiC/Human/GM12878-chr10_25kb.RAWobserved_KRnormalizedMatrix.txt data/HiC/Human/K562-chr10_25kb.RAWobserved_KRnormalizedMatrix.txt -n GM12878 K562 -chr chr10 -r 25000 -pi 0 -fh 0 -o High -a data/HiC/Human/GM12878.Rad21.bed data/HiC/Human/K562.Rad21.bed -al ChIA-PET Rad21 -s 3000 -e 3500 -pcd 1 -pcdf data/HiC/Human/GM12878_Arrowhead_domainlist.bed data/HiC/Human/K562_Arrowhead_domainlist.bed -hist data/HiC/Human/wgEncodeUwDnaseGm12878RawRep2.chr10.bedGraph,data/HiC/Human/wgEncodeBroadHistoneGm12878CtcfStdSig.chr10.bedGraph,data/HiC/Human/wgEncodeUwRepliSeqGm12878WaveSignalRep1.bedGraph data/HiC/Human/wgEncodeUwDnaseK562RawRep2.chr10.bedGraph,data/HiC/Human/wgEncodeBroadHistoneK562CtcfStdSig.chr10.bedGraph,data/HiC/Human/wgEncodeUwRepliSeqK562WaveSignalRep1.bedGraph -hl DNAse,CTCF,RepliSeq DNAse,CTCF,RepliSeq -fhist 0,0,1 0,0,1 -pptd 1 -high 1 -hf data/HiC/Human/highlight.bed 

## Annotating certain interactions
 python HiCPlotter.py -f data/HiC/Human/GM12878-chr10_25kb.RAWobserved_KRnormalizedMatrix.txt data/HiC/Human/KBM7-chr10_25kb.RAWobserved_KRnormalizedMatrix.txt data/HiC/Human/K562-chr10_25kb.RAWobserved_KRnormalizedMatrix.txt data/HiC/Human/HUVEC-chr10_25kb.RAWobserved_KRnormalizedMatrix.txt data/HiC/Human/IMR90-chr10_25kb.RAWobserved_KRnormalizedMatrix.txt data/HiC/Human/HMEC-chr10_25kb.RAWobserved_KRnormalizedMatrix.txt data/HiC/Human/NHEK-chr10_25kb.RAWobserved_KRnormalizedMatrix.txt -n GM12878 KBM7 K562 HUVEC IMR90 HMEC NHEK -r 25000 -pi 0 -fh 0 -o Loops -chr chr10 -peak data/HiC/Human/GSE63525_GM12878_replicate_HiCCUPS_looplist.bed data/HiC/Human/GSE63525_KBM7_HiCCUPS_looplist.bed data/HiC/Human/GSE63525_K562_HiCCUPS_looplist.bed data/HiC/Human/GSE63525_HUVEC_HiCCUPS_looplist.bed data/HiC/Human/GSE63525_IMR90_HiCCUPS_looplist.bed data/HiC/Human/GSE63525_HMEC_HiCCUPS_looplist.bed data/HiC/Human/GSE63525_NHEK_HiCCUPS_looplist.bed -s 3600 -e 3675  -ptr 0

## Plotting whole chromosome
 python HiCPlotter.py -f data/HiC/Human/GSM1184323-HiCMYZ-Tcell-Rad21WT-R1.mm9.NA.L-1400000-wDiag-noSS-iced.2.matrix data/HiC/Human/GSM1184321-HiCMYZ-Tcell-Rad21KO-R1.mm9.NA.L-1400000-wDiag-noSS-iced.2.matrix -n Tcell_WT Tcell_Rad21KO -chr Genome -r 1400000 -o Tcell -pi 0 -ptr 0 -wg 1 -hmc 5 -fh 4
 
## Plotting 5C data
 python HiCPlotter.py -f data/5C/GSM873926_mESCs-female-PGK12.1-day2-Replicate1.txt data/5C/GSM873932_femaleXO-mESCs-DXTX-replicate-1.matrix.txt data/5C/GSM873924_female-MEFs-replicate-1.matrix.txt -n mESC mESC_XO MEF -fh 8 -chr chrX -o 5C -sn 2 -pi 0 -rb 1 -e 300 -hmc 5


## Potential

#python HiCPlotter.py -f data/HiC/Human/GM12878-chr10_25kb.RAWobserved_KRnormalizedMatrix.txt data/HiC/Human/K562-chr10_25kb.RAWobserved_KRnormalizedMatrix.txt data/HiC/Human/HUVEC-chr10_25kb.RAWobserved_KRnormalizedMatrix.txt data/HiC/Human/NHEK-chr10_25kb.RAWobserved_KRnormalizedMatrix.txt -n GM12878 K562 HUVEC NHEK -fh 0 -pi 0 -r 25000 -o Together -s 3000 -e 3500 -hist data/HiC/Human/wgEncodeUwDnaseGm12878RawRep2.chr10.bedGraph,data/HiC/Human/wgEncodeBroadHistoneGm12878CtcfStdSig.chr10.bedGraph,data/HiC/Human/wgEncodeUwRepliSeqGm12878WaveSignalRep1.bedGraph data/HiC/Human/wgEncodeUwDnaseK562RawRep2.chr10.bedGraph,data/HiC/Human/wgEncodeBroadHistoneK562CtcfStdSig.chr10.bedGraph,data/HiC/Human/wgEncodeUwRepliSeqK562WaveSignalRep1.bedGraph data/HiC/Human/wgEncodeUwDnaseHuvecRawRep2.chr10.bedGraph,data/HiC/Human/wgEncodeBroadHistoneHuvecCtcfStdSig.chr10.bedGraph,data/HiC/Human/wgEncodeUwRepliSeqHuvecWaveSignalRep1.bedGraph data/HiC/Human/wgEncodeUwDnaseNhekRawRep2.chr10.bedGraph,data/HiC/Human/wgEncodeBroadHistoneNhekCtcfStdSig.chr10.bedGraph,data/HiC/Human/wgEncodeUwRepliSeqNhekWaveSignalRep1.bedGraph -hl DNAse,CTCF,RepliSeq DNAse,CTCF,RepliSeq DNAse,CTCF,RepliSeq DNAse,CTCF,RepliSeq -fhist 0,0,1 0,0,1 0,0,1 0,0,1 -pptd 1 -pcd 1 -pcdf data/HiC/Human/GM12878_Arrowhead_domainlist.bed data/HiC/Human/K562_Arrowhead_domainlist.bed data/HiC/Human/HUVEC_Arrowhead_domainlist.bed data/HiC/Human/NHEK_Arrowhead_domainlist.bed -chr chr10 -high 1 -hf data/HiC/Human/highlight.bed


## Extra 
# #python HiCPlotter.py -f mES.chr11 -n mES -chr chr11 -r 40000 -o HoxB -hist GSM1327219_ChIP-seq_Escells_H3K4me3_density.chr11.bedGraph,GSM1327220_ChIP-seq_Escells_H3K27me3_density.chr11.bedGraph,GSM1334418_4C_Mouse_EScells_Hoxb9_frags.bedGraph,GSM1334417_4C_Mouse_EScells_Hoxb13_frags.bedGraph,GSM747534_ChIPseq_CTCF_ES_rep1.chr11.bedGraph -hl H3K4me3,H3K27me3,Hoxb9,Hoxb13,CTCF -s 2350 -e 2450 -fhist 0,1,1,1,0 -pi 0 -ptr 0 -pcd 1 -pcdf ~/Desktop/HiCplots/HiCPlotter/data/mES_domains_mm9.bed

# python HiCPlotter.py -f data/HiC/Mouse/mES.chr2 -n mES -chr chr2 -r 40000 -o HoxD.3 -hist data/HiC/Mouse/GSM1334415_4C_Mouse_EScells_Hoxd4_smoothed_11windows.bedGraph,data/HiC/Mouse/GSM1334440_4C_Mouse_E9.5TB_Hoxd4_smoothed_11windows.bedGraph,data/HiC/Mouse/GSM1334412_4C_Mouse_EScells_Hoxd13_smoothed_11windows.bedGraph,data/HiC/Mouse/GSM1334437_4C_Mouse_E9.5TB_Hoxd13_smoothed_11windows.bedGraph,data/HiC/Mouse/GSM1334420_4C_Mouse_EScells_CNS39_smoothed_11windows.bedGraph,data/HiC/Mouse/GSM1104572_Andrey_FL_E9_WT_CNS65_smoothed11.bedGraph,data/HiC/Mouse/GSM747534_ChIPseq_CTCF_ES_rep1.chr2.bedGraph -hl Hoxd4-ES,Hoxd4-Tail,Hoxd13-ES,Hoxd13-Tail,CNS39,CNS65,CTCF-ES -s 1825 -e 1900 -fh 0 -ptd 1 -w 8 -tr 10 -pptd 1 -fhist 1,1,1,1,1,1,0 -ptdo 0 -pi 0 -hm 2000,2000,2000,2000,2000,2000,50
# python HiCPlotter.py -f data/HiC/Mouse/mES.chr2 -n mES -chr chr2 -r 40000 -o HoxD -hist data/HiC/Mouse/GSM1327220_ChIP-seq_Escells_H3K27me3_density.chr2.bedGraph,data/HiC/Mouse/GSM1327222_ChIP-seq_E8.5PSM_H3K27me3_density.chr2.bedGraph,data/HiC/Mouse/GSM1334415_4C_Mouse_EScells_Hoxd4_smoothed_11windows.bedGraph,data/HiC/Mouse/GSM1334440_4C_Mouse_E9.5TB_Hoxd4_smoothed_11windows.bedGraph,data/HiC/Mouse/GSM1334412_4C_Mouse_EScells_Hoxd13_smoothed_11windows.bedGraph,data/HiC/Mouse/GSM1334437_4C_Mouse_E9.5TB_Hoxd13_smoothed_11windows.bedGraph,data/HiC/Mouse/GSM1334420_4C_Mouse_EScells_CNS39_smoothed_11windows.bedGraph,data/HiC/Mouse/GSM1104572_Andrey_FL_E9_WT_CNS65_smoothed11.bedGraph,data/HiC/Mouse/GSM747534_ChIPseq_CTCF_ES_rep1.chr2.bedGraph -hl H3K27m3-ES,H3K27m3-Tail,Hoxd4-ES,Hoxd4-Tail,Hoxd13-ES,Hoxd13-Tail,CNS39-ES,CNS65,CTCF-ES -s 1850 -e 1880 -fh 0 -pi 0 -pcd 1 -pcdf data/mES_domains_mm9.bed -fhist 1,1,1,1,1,1,1,1,0
# python HiCPlotter.py -f data/HiC/Mouse/mES.chr6 -n mES -chr chr6 -r 40000 -o HoxA -s 1295 -e 1338 -hist data/HiC/Mouse/GSM1524258_segToFrag_4C_Digits_WT_E12-5_HoxA13_smoothed_11FragsPerWin.bedGraph,data/HiC/Mouse/GSM1524259_segToFrag_4C_GT_WT_E15-5_HoxA13_smoothed_11FragsPerWin.bedGraph -hl Digits,GT -fhist 1,1 -fh 0 -pi 0 -hm 1500,1500 -pcd 1 -pcdf data/mES_domains_mm9.bed -sn 0.4 -t data/HiC/Mouse/primers.bedGraph -tl Enhancers -tt 1
# python ~/Desktop/HiCplots/HiCPlotter/HiCPlotter.py -f mES.chr6 -chr chr6 -fh 0 -r 40000 -n HoxA -o HoxA -pi 0 -hist GSM1212820_ESC_Hoxa10_2_readcounts.bedGraph,GSM1212819_ESC_Hoxa10_1_readcounts.bedGraph,GSM1212787_EedWT_ESC_Hoxa10_5_readcounts.bedGraph,GSM1212786_EedWT_ESC_Hoxa10_4_readcounts.bedGraph,GSM1212785_EedWT_ESC_Hoxa10_3_readcounts.bedGraph,GSM1212784_EedWT_ESC_Hoxa10_2_readcounts.bedGraph,GSM1212783_EedWT_ESC_Hoxa10_1_readcounts.bedGraph,GSM1212764_EedKO_ESC_Hoxa10_3_readcounts.bedGraph,GSM1212763_EedKO_ESC_Hoxa10_2_readcounts.bedGraph,GSM1212762_EedKO_ESC_Hoxa10_1_readcounts.bedGraph,GSM1212901_MEF_Hoxa10_3_readcounts.bedGraph,GSM1212902_MEF_Hoxa10_4_readcounts.bedGraph,GSM1212903_MEF_Hoxa10_5_readcounts.bedGraph,GSM1212937_pre-iPSC_Hoxa10_1_readcounts.bedGraph,GSM1212938_pre-iPSC_Hoxa10_2_readcounts.bedGraph,GSM1212868_iPSC_Hoxa10_6_readcounts.bedGraph,GSM1212867_iPSC_Hoxa10_5_readcounts.bedGraph,GSM1212866_iPSC_Hoxa10_4_readcounts.bedGraph,GSM1212865_iPSC_Hoxa10_3_readcounts.bedGraph,GSM1212864_iPSC_Hoxa10_2_readcounts.bedGraph,GSM1212863_iPSC_Hoxa10_1_readcounts.bedGraph -hl ESC,ESC,EedWT,EedWT,EedWT,EedWT,EedWT,EedKO,EedKO,EedKO,MEF,MEF,MEF,pre-iPSC,pre-iPSC,iPSC,iPSC,iPSC,iPSC,iPSC,iPSC -hm 5000,5000,5000,5000,5000,5000,5000,5000,5000,5000,5000,5000,5000,5000,5000,5000,5000,5000,5000,5000,5000 -s 1250 -e 1500
# python ~/Desktop/HiCplots/HiCPlotter/HiCPlotter.py -f mES.chr18 -n Pcdbh19 -chr chr18 -r 40000 -fh 0 -pi 0 -o Pcdbh19 -hist GSM1212827_ESC_Pcdhb19_1_readcounts.bedGraph,GSM1212828_ESC_Pcdhb19_2_readcounts.bedGraph,GSM1212829_ESC_Pcdhb19_3_readcounts.bedGraph,GSM1212797_EedWT_ESC_Pcdhb19_4_readcounts.bedGraph,GSM1212796_EedWT_ESC_Pcdhb19_3_readcounts.bedGraph,GSM1212795_EedWT_ESC_Pcdhb19_2_readcounts.bedGraph,GSM1212794_EedWT_ESC_Pcdhb19_1_readcounts.bedGraph,GSM1212773_EedKO_ESC_Pcdhb19_3_readcounts.bedGraph,GSM1212772_EedKO_ESC_Pcdhb19_2_readcounts.bedGraph,GSM1212771_EedKO_ESC_Pcdhb19_1_readcounts.bedGraph -hl ESC,ESC,ESC,EedWT,EedWT,EedWT,EedWT,EedKO,EedKO,EedKO -hm 10000,10000,10000,10000,10000,10000,10000,10000,10000,10000 -s 750 -e 1500


gzip data/HiC/Human/*
gzip data/HiC/Mouse/*
gzip data/5C/*

echo 'test run finished successfully'
