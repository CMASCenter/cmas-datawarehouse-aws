#!/bin/csh -f
#Script to download enough data to run START_DATE 20190522 and END_DATE 20190523 for the 2019 CMAQ Modeling Platform using the CONUS Domain for the cracmm mechanism
## Data is available across two S3 buckets:
## ICBC, surface, and emission files
#https://cmaq-2019-modeling-platform.s3.amazonaws.com/index.html
## Met files
#https://cmas-equates.s3.amazonaws.com/index.html#CMAQ_12US1/INPUT/2019/met/mcip_v51_wrf_v411_noltng/05/
#https://dataverse.unc.edu/dataset.xhtml?persistentId=doi:10.15139/S3/LDTWKH  - need to update
#Requires installing aws command line interface
#https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html#cliv2-linux-install
#Total storage required is ?? G
# test using --dryrun option, example aws --no-sign-request s3 cp --dryrun ...
# Assumes you have a specify the local directory to copy the files.

## Edit the following two lines to specify your local directory
mkdir -p /21dayscratch/scr/l/i/lizadams/CMAQv5.5/openmpi_gcc/data/
setenv DISK /21dayscratch/scr/l/i/lizadams/CMAQv5.5/openmpi_gcc/data/

## Download input files for benchmark test case
aws --no-sign-request s3 cp --recursive --exclude "*" --include "*20190522*" --include "*20190523*" s3://cmas-equates/CMAQ_12US1/INPUT/2019/met/mcip_v51_wrf_v411_noltng/05/ /$DISK/CMAQ_2019_Modeling_Platform/2019_12US1/met/mcip_v51_wrf_v411_noltng/05/
aws --no-sign-request s3 cp --recursive --exclude "*" --include "*201905*" --include "stack_groups_ptnonipm_12US1_WR624_EQ2019_CRACMM.ncf" s3://cmaq-2019-modeling-platform/cmaq-2019-modeling-platform/CMAQv53_TS/2019_12US1/emis/premerged/ptnonipm/ /$DISK/CMAQ_2019_Modeling_Platform/2019_12US1/emis/premerged/ptnonipm/
aws --no-sign-request s3 cp --recursive --exclude "*" --include "*stack_groups*20190522*" --include "*stack_groups*20190523*" --include "*stack_groups_ptegu*" --include "*stack_groups_cmv*" --include "*stack_groups_othpt*" --include "*stack_groups_pt_oilgas*" --include "*stack_groups_ptnonipm*" --include "*stack_groups_pt_other_nonfire*" s3://cmaq-2019-modeling-platform/cmaq-2019-modeling-platform/CMAQv53_TS/2019_12US1/emis/smoke_out/WR624_EQ2019_CRACMM/12US1/cmaq_cracmmv1/ /$DISK/CMAQ_2019_Modeling_Platform/2019_12US1/emis/cracmmv1/
aws --no-sign-request s3 cp --recursive --exclude "*" --include "*20190522*" --include "*20190523*" --include "*othpt_aircraft_20190507*" --include "*aircraft_20190509*" --include "*asphalt_20190509*" s3://cmaq-2019-modeling-platform/cmaq-2019-modeling-platform/CMAQv53_TS/2019_12US1/emis/cracmmv1_20220923/ /$DISK/CMAQ_2019_Modeling_Platform/2019_12US1/emis/cracmmv1_20220923/
aws --no-sign-request s3 cp --recursive  s3://cmaq-2019-modeling-platform/cmaq-2019-modeling-platform/CMAQv53_TS/2019_12US1/emis/smk_dates/ /$DISK/CMAQ_2019_Modeling_Platform/2019_12US1/emis/smk_dates/
aws --no-sign-request s3 cp --recursive --exclude "*" --include "*20190522*" --recursive s3://cmaq-2019-modeling-platform/cmaq-2019-modeling-platform/CMAQv53_TS/2019_12US1/epic /$DISK/CMAQ_2019_Modeling_Platform/2019_12US1/epic
aws --no-sign-request s3 cp --recursive --exclude "*" --include "*20190523*" --recursive s3://cmaq-2019-modeling-platform/cmaq-2019-modeling-platform/CMAQv53_TS/2019_12US1/epic /$DISK/CMAQ_2019_Modeling_Platform/2019_12US1/epic
aws --no-sign-request s3 cp --recursive --exclude "*" --include "*beld4_12US1_2011.nc4*" --include "*beis4_beld6_norm_emis.12US1*" --include "*2019r1_EPIC0509_12US1_soil.nc4*"  --recursive s3://cmaq-2019-modeling-platform/cmaq-2019-modeling-platform/CMAQv53_TS/2019_12US1/epic /$DISK/CMAQ_2019_Modeling_Platform/2019_12US1/epic
aws --no-sign-request s3 cp --recursive s3://cmaq-2019-modeling-platform/cmaq-2019-modeling-platform/CMAQv53_TS/2019_12US1/surface /$DISK/CMAQ_2019_Modeling_Platform/2019_12US1/surface
aws --no-sign-request s3 cp --recursive --exclude "*" --include "*CCTM_CGRID_v54_intel18.0_2019_12US1_20190521.nc*" --include "*BCON_CONC_12US1_CMAQv54_2019_108NHEMI_CRACCM1_FRMEQ_regrid_201905.nc*"  s3://cmaq-2019-modeling-platform/cmaq-2019-modeling-platform/CMAQv53_TS/2019_12US1/icbc /$DISK/CMAQ_2019_Modeling_Platform/2019_12US1/icbc
aws --no-sign-request s3 cp --recursive --exclude "*" --include "*GRIDDESC*" s3://cmaq-2019-modeling-platform/cmaq-2019-modeling-platform/CMAQv53_TS/2019_12US1/ /$DISK/CMAQ_2019_Modeling_Platform/2019_12US1/
aws --no-sign-request s3 cp --recursive --exclude "*" --include "*run_cctm_cracmm_2019_12US1_CRACMM2_EPA2019.csh*" s3://cmaq-2019-modeling-platform/cmaq-2019-modeling-platform/CMAQv53_TS/2019_12US1/ /$DISK/CMAQ_2019_Modeling_Platform/2019_12US1/
aws --no-sign-request  s3 cp --recursive --exclude "*" --include "*DESID*" s3://cmaq-2019-modeling-platform/cmaq-2019-modeling-platform/CMAQv53_TS/2019_12US1/ /$DISK/CMAQ_2019_Modeling_Platform/2019_12US1/
aws --no-sign-request s3 cp --recursive --exclude "*" --include "*20190522*" --include "*20190523*" --include "*LTNG_AllParms_12US1.ncf*" s3://cmaq-2019-modeling-platform/cmaq-2019-modeling-platform/CMAQv53_TS/2019_12US1/LTNG/ /$DISK/CMAQ_2019_Modeling_Platform/2019_12US1/LTNG/
