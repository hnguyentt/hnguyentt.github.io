#!/bin/bash
# Resize original image to different sizes

while IFS= read -r line
do
	dir=$(dirname "${line}")
	filename=$(basename -- "$line")
	ext="${filename##*.}"
	filename="${filename%.*}"

	case $1 in
		#case 1
		portrait)
		        echo "Resize "$line" in portrait mode"
				convert $line -resize 4000 $dir"/"$filename"-1."$ext
				convert $line -resize 2828 $dir"/"$filename"-2."$ext
				convert $line -resize 1414 $dir"/"$filename"-3."$ext
				convert $line -resize 1999 $dir"/"$filename"-4."$ext
				convert $line -resize 816 $dir"/"$filename"-5."$ext
				;;
		landscape)
		        echo "Resize "$line" in landscape mode"
				convert $line -resize 6000 $dir"/"$filename"-1."$ext
				convert $line -resize 2121 $dir"/"$filename"-2."$ext
				convert $line -resize 2999 $dir"/"$filename"-3."$ext
				convert $line -resize 4242 $dir"/"$filename"-4."$ext
				convert $line -resize 1224 $dir"/"$filename"-5."$ext
				;;
	esac
	rm $line
done < "$2"
