#!/bin/bash
# Resize original image to different sizes for gallery
# By: Hoa Nguyen
# Last update: May 18, 2020
# brew install imagemagick

help_txt="
RESIZE IMAGE FOR GALLERY
\nUsage: ./resize_img.sh PATH_TO_LS_FILES
"

echo -e $help_txt
echo

while IFS= read -r line
do
	dir=$(dirname "${line}")
	filename=$(basename -- "$line")
	ext="${filename##*.}"
	filename="${filename%.*}"

	# h=$(magick identify -format "%h" $line)
	# w=$(magick identify -format "%w" $line)
    h=$(identify -format "%h" $line)
	w=$(identify -format "%w" $line)
	delta=$(expr $w - $h)

	if [[ $delta -lt 0 ]]; then
        echo "Resize "$line" in portrait mode"
        convert $line -resize 4000 $dir"/"$filename"-1."$ext
        convert $line -resize 2828 $dir"/"$filename"-2."$ext
        convert $line -resize 1414 $dir"/"$filename"-3."$ext
        convert $line -resize 1999 $dir"/"$filename"-4."$ext
        convert $line -resize 816 $dir"/"$filename"-5."$ext
        # convert $line -thumbnail 4000 $dir"/"$filename"-1."$ext
        # convert $line -thumbnail 2828 $dir"/"$filename"-2."$ext
        # convert $line -thumbnail 1414 $dir"/"$filename"-3."$ext
        # convert $line -thumbnail 1999 $dir"/"$filename"-4."$ext
        # convert $line -thumbnail 816 $dir"/"$filename"-5."$ext
    else
        echo "Resize "$line" in landscape mode"
        convert $line -resize 6000 $dir"/"$filename"-1."$ext
        convert $line -resize 2121 $dir"/"$filename"-2."$ext
        convert $line -resize 2999 $dir"/"$filename"-3."$ext
        convert $line -resize 4242 $dir"/"$filename"-4."$ext
        convert $line -resize 1224 $dir"/"$filename"-5."$ext
        # convert $line -thumbnail 6000 $dir"/"$filename"-1."$ext
        # convert $line -thumbnail 2121 $dir"/"$filename"-2."$ext
        # convert $line -thumbnail 2999 $dir"/"$filename"-3."$ext
        # convert $line -thumbnail 4242 $dir"/"$filename"-4."$ext
        # convert $line -thumbnail 1224 $dir"/"$filename"-5."$ext
    fi

	rm $line
done < "$1"
