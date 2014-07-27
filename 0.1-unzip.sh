#!/bin/sh
set -e

ls -s

# More abstract if we set *.gz
gunzip products.txt.gz

ls -s # to view both files before and after zip

cd ../code
