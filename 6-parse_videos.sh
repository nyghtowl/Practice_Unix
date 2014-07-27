#!/bin/sh
set -e

parse_products()
{
	video_directory_file=data/video_filenames.txt
	for line in $(cat $video_directory_file)
	do
		asin=$(echo data/$line | xargs grep -h  ASIN | cut -d ' ' -f 2 )
		title=$(echo data/$line | xargs grep -h  title | cut -d ":"  -f 2- | sed 's/^[\t ]*//g' | tr -s ' ' | tr ' ' '-')
		url=http://www.amazon.com/dp/$asin
		echo $url >> data/urls.txt
	done
}

parse_products