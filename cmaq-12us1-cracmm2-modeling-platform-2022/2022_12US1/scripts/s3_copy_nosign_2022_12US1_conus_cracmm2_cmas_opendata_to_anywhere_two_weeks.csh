#!/bin/csh -f
#Script to download enough data to run START_DATE 20211222 and END_DATE 20220102 for 12US1 CONUS Domain
#Requires installing aws command line interface
#https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html#cliv2-linux-install
#Total storage required is xxx G
# test using --dryrun option, example aws --no-sign-request s3 cp --dryrun ...
# Assumes you have a updated to create a directory to copy the files to.

setenv AWS_REGION "us-east-1"
#setenv DISK $cwd
setenv DISK /work/users/l/i/lizadams/CMAQv5.5_2022
mkdir -p $DISK
# Obtain meteorology files
aws --no-sign-request s3 cp --recursive --exclude "*" --include "*.2112*" --include "*.220101*" --include "*.220102*" s3://epa-2022-modeling-platform/MCIP/12US1/ /$DISK/data/CMAQ_Modeling_Platform_2022/2022_12US1/met/mcip/
# Obtain emissions files
aws --no-sign-request s3 cp --recursive --exclude "*" --include "*_2021*" --include "*20220101*" --include "*20220102*"  --include "*20221208*" --include "*20221206*" --include "*2022122*" --include "smk_merge_dates_202201.txt"  --include "smk_merge_dates_202112.txt" s3://cmaq-12us1-cracmm2-modeling-platform-2022/2022_12US1/emis/ /$DISK/data/CMAQ_Modeling_Platform_2022/2022_12US1/emis/
aws --no-sign-request s3 cp --recursive --exclude "*" --include "*stack_groups*" s3://cmaq-12us1-cracmm2-modeling-platform-2022/2022_12US1/emis/ /$DISK/data/CMAQ_Modeling_Platform_2022/2022_12US1/emis/
aws --no-sign-request s3 cp --recursive  s3://cmaq-12us1-cracmm2-modeling-platform-2022/2022_12US1/emis/emis_dates/ /$DISK/data/CMAQ_Modeling_Platform_2022/2022_12US1/emis/emis_dates/
aws --no-sign-request s3 cp --recursive --exclude "*" --include "*202112*" --recursive s3://cmaq-12us1-cracmm2-modeling-platform-2022/2022_12US1/epic/ /$DISK/data/CMAQ_Modeling_Platform_2022/2022_12US1/epic/
aws --no-sign-request s3 cp --recursive --exclude "*" --include "*20220101*" --recursive s3://cmaq-12us1-cracmm2-modeling-platform-2022/2022_12US1/epic/ /$DISK/data/CMAQ_Modeling_Platform_2022/2022_12US1/epic/
aws --no-sign-request s3 cp --recursive --exclude "*" --include "*20220102*" --recursive s3://cmaq-12us1-cracmm2-modeling-platform-2022/2022_12US1/epic/ /$DISK/data/CMAQ_Modeling_Platform_2022/2022_12US1/epic/
aws --no-sign-request s3 cp --recursive s3://cmaq-12us1-cracmm2-modeling-platform-2022/2022_12US1/surface/ /$DISK/data/CMAQ_Modeling_Platform_2022/2022_12US1/surface/
aws --no-sign-request s3 cp --recursive s3://cmaq-12us1-cracmm2-modeling-platform-2022/2022_12US1/misc/ /$DISK/data/CMAQ_Modeling_Platform_2022/2022_12US1/misc/
aws --no-sign-request s3 cp --recursive --exclude "*" --include "*202112*" s3://cmaq-12us1-cracmm2-modeling-platform-2022/2022_12US1/icbc/ /$DISK/data/CMAQ_Modeling_Platform_2022/2022_12US1/icbc/
aws --no-sign-request s3 cp --recursive --exclude "*" --include "*202201*"  s3://cmaq-12us1-cracmm2-modeling-platform-2022/2022_12US1/icbc/CMAQv54_2022_108NHEMI_STAGE_CRACCM2_FROM_CB6R5M/ /$DISK/data/CMAQ_Modeling_Platform_2022/2022_12US1/icbc/CMAQv54_2022_108NHEMI_STAGE_CRACCM2_FROM_CB6R5M/
aws --no-sign-request s3 cp --recursive --exclude "*" --include "*GRIDDESC*" s3://cmaq-12us1-cracmm2-modeling-platform-2022/2022_12US1/ /$DISK/data/CMAQ_Modeling_Platform_2022/2022_12US1/
#aws --no-sign-request s3 cp --recursive --exclude "*" --include "*run_cctm_2018*" s3://cmas-cmaq-modeling-platform-2018/2018_12US1/ /$DISK/data/CMAQ_Modeling_Platform_2018/2018_12US1
#aws --no-sign-request s3 cp --recursive --exclude "*" --include "*20221208*" --include "*20221222*" s3://cmas-cmaq-modeling-platform-2018/2018_12US1/emis/WR705_2018gc2_cracmmv1/ /$DISK/data/CMAQ_Modeling_Platform_2018/2018_12US1/emis/WR705_2018gc2_cracmmv1/
#aws --no-sign-request s3 cp --recursive --exclude "*" --include "*2017*" --include "*201812*" --include "*20180101*" --include "*20180102*" s3://cmas-cmaq-modeling-platform-2018/2018_12US1/emis/WR705_2018gc2_cracmmv1/ /$DISK/data/CMAQ_Modeling_Platform_2018/2018_12US1/emis/WR705_2018gc2_cracmmv1/
aws --no-sign-request s3 cp --recursive --exclude "*" --include "*2021*" --include "*202212*" --include "*202201*" s3://cmaq-12us1-cracmm2-modeling-platform-2022/2022_12US1/wwllns/ /$DISK/data/CMAQ_Modeling_Platform_2022/2022_12US1/wwllns/
aws --no-sign-request s3 cp s3://cmaq-12us1-cracmm2-modeling-platform-2022/2022_12US1/epic/beld4_12US1_2011.nc4 /$DISK/data/CMAQ_Modeling_Platform_2022/2022_12US1/epic/
aws --no-sign-request s3 cp s3://cmaq-12us1-cracmm2-modeling-platform-2022/2022_12US1/epic/2021r1_EPIC0509_12US1_soil.nc4 /$DISK/data/CMAQ_Modeling_Platform_2022/2022_12US1/epic/
aws --no-sign-request s3 cp s3://cmaq-12us1-cracmm2-modeling-platform-2022/2022_12US1/wwllns/LTNG_AllParms_12US1.ncf  /$DISK/data/CMAQ_Modeling_Platform_2022/2022_12US1/wwllns/

20221206
