#!/bin/csh -f
#Script to download enough data to run START_DATE 20191222 and END_DATE 20191223 for 12US1 Domain for the  cb6r5hap_ae7 mechanism
#https://dataverse.unc.edu/dataset
#Requires installing aws command line interface
#https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html#cliv2-linux-install
#Total storage required is XX G
# test using --dryrun option, example aws --no-sign-request s3 cp --dryrun ...
# Assumes you have a /shared directory to copy the files to your local disk

setenv AWS_REGION "us-east-1"
mkdir -p /proj/ie/proj/CMAS/CMAQ/2020_12US1/CMAQ_v54+/data
setenv DISK /proj/ie/proj/CMAS/CMAQ/2020_12US1/CMAQ_v54+/data
aws --no-sign-request s3 cp --recursive --exclude "*" --include "*191222*" --include "*191223*" s3://2020platform/2020platform/12US1/mcip/WRFv4.1.1_12US1_2020_35aL_lucor /$DISK/mcip/WRFv4.1.1_12US1_2020_35aL_lucor
aws --no-sign-request s3 cp --recursive --exclude "*" --include "smk_merge_dates_201912.txt" s3://2020platform/2020platform/12US1/smk_dates  /$DISK/smk_dates
aws --no-sign-request s3 cp --recursive --exclude "*" --include "*191222*" --include "*191223*" s3://2020platform/2020platform/12US1/emis/2020ha_cb6_20k/premerged/rwc/  /$DISK/emis/2020ha_cb6_20k/premerged/rwc/
aws  --no-sign-request s3 cp --recursive --exclude "*" --include "*20191222*" --include "*20191223*" s3://2020platform/2020platform/12US1/emis/smoke_out/2020ha2_cb6_20k  /$DISK/emis/smoke_out/2020ha2_cb6_20k
aws  --no-sign-request s3 cp --recursive --exclude "*" --include "*20191222*" --include "*20191223*" --include "*20201208*" --include "*20201209*" s3://2020platform/2020platform/emis/smoke_out/2020ha_cb6_20k  /$DISK/emis/smoke_out/2020ha_cb6_20k/
aws --no-sign-request s3 cp --recursive --exclude "*" --include "*20201207*" s3://2020platform/2020platform/12US1/emis/smoke_out/2020ha_cb6_20k/ /$DISK/emis/smoke_out/2020ha_cb6_20k/
aws --no-sign-request s3 cp --recursive --exclude "*" --include "*inln_mole*20191222*" --include "*inln_mole*20191223*" --include "*inln_mole*20200107*" --include "*stack_groups_20191222*" --include "*stack_groups_20191223*" --include "*stack_groups_20200107*" --include "*stack_groups*" s3://2020platform/2020platform/12US1/emis/smoke_out/2020ha_cb6_20k /$DISK/emis/smoke_out/2020ha_cb6_20k 
aws  --no-sign-request s3 cp --recursive --exclude "*" --include "*20191222*" --include "*2019r1_EPIC0509_12US1_soil.nc4*" --include "*beld4_12US1_2011.nc4*" --recursive s3://2020platform/2020platform/12US1/festc1_4_dev /$DISK/festc1_4_dev
aws --no-sign-request s3 cp --recursive --exclude "*" --include "*20191222*" --recursive s3://2020platform/2020platform/12US1/festc1_4_dev /$DISK/festc1_4_dev
aws --no-sign-request s3 cp --recursive --exclude "*" --include "*beld4_12US1_2011.nc4*" --include "*beis4_beld6_norm_emis.12US1*" --include "*2019r1_EPIC0509_12US1_soil.nc4*"  --recursive s3://2020platform/2020platform/12US1/surface /$DISK/surface
aws  --no-sign-request s3 cp --recursive s3://2020platform/2020platform/12US1/surface /$DISK/surface
aws  --no-sign-request s3 cp --recursive --exclude "*" --include "*timeind" s3://2020platform/2020platform/12US1/icbc_2020_tox_addhr /$DISK/icbc_2020_tox_addhr
aws --no-sign-request s3 cp --recursive --exclude "*" --include "GCv14_CB6_AE7.20191201_0000z.12US1.ICON_hap_benap.timind" s3://2020platform/2020platform/12US1/icbc_2020_tox_addhr /$DISK/icbc_2020_tox_addhr
aws  --no-sign-request s3 cp --recursive --exclude "*" --include "*GCv14_CB6_AE7.20191222_0000z.12US1.BCON_hap_benap.nc*"  s3://2020platform/2020platform/12US1/icbc_2020_tox_addhr /$DISK/icbc_2020_tox_addhr
aws  --no-sign-request s3 cp --recursive --exclude "*" --include "*GCv14_CB6_AE7.20191223_0000z.12US1.BCON_hap_benap.nc*"  s3://2020platform/2020platform/12US1/icbc_2020_tox_addhr /$DISK/icbc_2020_tox_addhr
aws --no-sign-request s3 cp --recursive --exclude "*" --include "*GRIDDESC*" s3://2020platform/2020platform/12US1/ /$DISK/
aws --no-sign-request s3 cp --recursive --exclude "*" --include "*run_cctm_2020*" s3://2020platform/2020platform/12US1/ /$DISK/
aws --no-sign-request s3 cp --recursive s3://2020platform/2020platform/12US1/misc /$DISK/misc
aws --no-sign-request s3 cp --recursive s3://2020platform/2020platform/12US1/nldn /$DISK/nldn
aws --no-sign-request s3 cp --recursive s3://2020platform/2020platform/12US1/omi /$DISK/omi

