#!/bin/bash

# Convert Originals to Web Images
for IMAGE in `find ./orig -name "*.png"`
do
 DEST_IMAGE=./web/`basename $IMAGE`
 if [[ ! -e $DEST_IMAGE || $IMAGE -nt $DEST_IMAGE ]] 
 then
     convert $IMAGE -verbose -compress jpeg \
            -quality 80 -bordercolor None -border 3x3 \
            \( +clone -background black -shadow 80x1+1+1 \) \
            -compose DstOver -composite -compose Over \
            $DEST_IMAGE
 fi
done

exit 0





