#!/bin/sh
set -e

#exit 0 # THIS breaks the code
filename=$1 # allows to pass in argument on CLI - 
# $ get passed as an array and you can loop through them

working_dir=$(pwd)
data_directory=$working_dir/data

if [ ! -d $data_directory/products ]; then
   mkdir $data_directory/products
fi

data_file=$data_directory/splits/$filename

cd ./data/products
#number_of_blank_lines=$(grep '^$' $data_file | wc -l)
number_of_blank_lines=$(echo "$(grep -cvE '[^[:space:]]' $data_file) - 2" | bc)
echo $number_of_blank_lines

csplit -f "amazon" -n 4 $data_file /Id:/ {$number_of_blank_lines}
# in linux you can do THIS
#csplit -f "amazon" $data_file /Id:/ {*}

rm "amazon0000"

find $data/products/amazon* -print | xargs grep -l Video >> video_filenames.txt