#!/bin/bash

echo "Timings for 50k" > timings.txt
echo "Timing for Batch (10k per batch):" >> timings.txt
time(Rscript ./batch/lawrence_batch_test.R >& 2>/dev/null) >> timings.txt
echo "Timing for pure AWS:"
time(Rscript ./test.R >& 2>/dev/null) >> timings.txt
