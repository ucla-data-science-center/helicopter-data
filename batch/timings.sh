#!/bin/bash

BATCH=$(pwd)

cd ../data
if ! ls | grep -qE "truncate_tracts.*csv"; then
    unzip truncate_tracts.zip;
fi

cd $BATCH

echo "Timings for 5k Entries, Batch size of 1000:" > timings.txt
{ time (Rscript elevatr_trial_batch.R 1>/dev/null 2>&1) } 2>> timings.txt
echo "" >> timings.txt
echo "Timing fo 5k Entries, Pure AWS:" >> timings.txt
{ time (Rscript pure_aws_optimization.R 1>/dev/null 2>&1) } 2>> timings.txt
echo "" >> timings.txt

echo "Timings for 10k Entries, Batch size of 5000:" >> timings.txt
{ time (Rscript elevatr_trial_batch.R 10k 1>/dev/null 2>&1) } 2>> timings.txt
echo "" >> timings.txt
echo "Timing fo 10k Entries, Pure AWS:" >> timings.txt
{ time (Rscript pure_aws_optimization.R 10k 1>/dev/null 2>&1) } 2>> timings.txt

echo "Timings for 50k Entries, Batch size of 10000:" >> timings.txt
{ time (Rscript elevatr_trial_batch.R 50k 1>/dev/null 2>&1) } 2>> timings.txt
echo "" >> timings.txt
echo "Timing fo 50k Entries, Pure AWS:" >> timings.txt
{ time (Rscript pure_aws_optimization.R 50k 1>/dev/null 2>&1) } 2>> timings.txt

echo "Timings for 150k Entries, Batch size of 50000:" >> timings.txt
{ time (Rscript elevatr_trial_batch.R 150k 1>/dev/null 2>&1) } 2>> timings.txt
echo "" >> timings.txt
echo "Timing fo 150k Entries, Pure AWS:" >> timings.txt
{ time (Rscript pure_aws_optimization.R 150k 1>/dev/null 2>&1) } 2>> timings.txt
