This dataset is available as part of the AWS Open Data Program, therefore egress fees are not charged to either the host or the person downloading the data.


Instructions for downloading the aws command line.
https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

Once you have it installed, you can use it without credentials.

Example commands: 

To query how much data is in a bucket:

```
aws s3 ls --summarize --human-readable --recursive s3://cmaq-release-benchmark-data-for-easy-download
```

Output:

```
2023-02-27 12:53:51    0 Bytes v5_4/
2023-02-27 12:55:42   10.3 GiB v5_4/CMAQv5.4_2018_12NE3_Benchmark_2Day_Input.tar.gz
2023-02-27 12:55:43   10.6 KiB v5_4/CMAQv5.4_2018_12NE3_Benchmark_2Day_Input.tar.log
2023-02-27 12:55:39   13.9 GiB v5_4/CMAQv5.4_2018_12NE3_Benchmark_2Day_Output.tar.gz
2023-02-27 12:55:42   86.8 KiB v5_4/CMAQv5.4_2018_12NE3_Benchmark_2Day_Output.tar.log

Total Objects: 5
   Total Size: 24.2 GiB

```


Command to files from the bucket to your local filesystem (the system where you are running the aws cli) and place it under the path that you specify for /your_local_path.

```
aws s3 --no-sign-request cp --recursive aws s3://cmaq-release-benchmark-data-for-easy-download/ /your_local_path/
``


Please submit any questions or difficulties as a new issue on the CMAS User Forum.
https://forum.cmascenter.org/c/equates/61
