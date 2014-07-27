#!/bin/sh
set -e

# Function to download the HTML of each product

get_videos()
{
	urls_file=data/urls.txt

	if [ ! -d data/html	 ]; then
   		mkdir data/html
	fi

	for line in $(cat $urls_file); do
		asin=$( echo data/$line | cut -d "/"  -f 6 )
		echo $line | xargs -I % curl -L % >> data/html/$asin
	done
}

get_videos