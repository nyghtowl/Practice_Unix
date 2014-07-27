#!/bin/sh
set -e

# FILL ME IN
#exit 0 # THIS breaks the code
number_of_files=501
working_dir=$(pwd)
data_directory=$working_dir/data
data_file=$data_directory/products.txt

products_len=$(wc -l $data_file | cut -d ' ' -f 2)
new_line_count=$(echo $products_len / $number_of_files | bc)

mkdir $data_directory/splits
split -l $new_line_count $data_directory/splits

#tail -n +29737 xaa > sample.txt everything after this line
#head -n +29737 xaa > sample.txt - cut out the last product for sample (get everything up to this line) 
