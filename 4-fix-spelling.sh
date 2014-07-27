#!/bin/sh
set -e
 
sed .bak 's/cutomer/customer/g' $SPRINT_DIR/data/products.txt