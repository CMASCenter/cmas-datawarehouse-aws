This dataset is available as part of the AWS Open Data Program, therefore egress fees are not charged to either the host or the person downloading the data.
Please review the EQUATES_Data_Dictionary_for_CMAS_Data_Warehouses.html for information about the files.

Currently, the CMAQ inputs are available for 2017.

The full 2002-2019 EQUATES data is available on Google Drive:
https://drive.google.com/drive/folders/1G2_LBLy7_n91Ur0ulsLZ9zwGs3luTzn2?usp=sharing

Instructions for downloading the aws command line.
https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

Once you have it installed, you can use it without credentials.

Example commands: 

To query how much data is in a bucket:

```
aws s3 ls --summarize --human-readable --recursive s3://cmas-equates/
```

Output:

```
Total Objects: 915
   Total Size: 4.3 TiB
```


Command to files from the bucket to your local filesystem (the system where you are running the aws cli) and place it under the path that you specify for /your_local_path.

```
aws s3 --no-sign-request cp --recursive aws s3://cmas-equates/CMAQ_12US1// /your_local_path/
``


Please submit any questions or difficulties as a new issue on the CMAS User Forum.
https://forum.cmascenter.org/c/equates/61
