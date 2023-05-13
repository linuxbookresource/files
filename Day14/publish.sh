#!/bin/bash

#count number of images
#
FLCOUNT=$(ls *.[jJgG][pPiI][gGfF] | wc -w)

# Get heading of the page
#
echo "=============================================="
echo "What title do you like to add to your pages?"
echo "The default is My Picture"
read TITLE

if [ "$TITLE" = "" ]
then
	TITLE="MY Picture"
fi

# Set default number of columns/rows per page
# 
COUNT=2

# Calculate number of images per page
#
PERPAGE=$[$COUNT*$COUNT]

#gather all images
#
images=$(ls *.[jJgG][pPiI][gGfF])	


# Remove old images and folder and create a new folder
#
rm -rf c151_images
mkdir c151_images

# Remove old pages
#
rm -f page*.html

#
# Begin making html pages
#

# number of images in current row now
colcount=0

# number of images in current page now
pagecount=0

# current page number
pagenumber=1

# current page name
PAGENAME=page$pagenumber.html

for image in $images
do
	if [ $pagecount -eq 0 ]
	then
            echo "<HTML><HEAD></HEAD>" >> $PAGENAME
		echo "<BODY bgcolor=#FAEBD7>" >> $PAGENAME
		echo "<center><H2>$TITLE</H2></center>" >> $PAGENAME
            echo "<center><table bgcolor=#CCCCC border=2 cellpadding=10 cellspacing=2>" >> $PAGENAME
	fi

	if [ $colcount -eq 0 ]
	then
            echo "<tr>" >> $PAGENAME
	fi

	cp $image c151_images/low-$image
	echo "<td><center><img border=2 src=c151_images/low-$image></center></td>" >> $PAGENAME

      colcount=$[$colcount+1]
	pagecount=$[$pagecount+1]

	if [ $colcount -eq $COUNT ]
      then
      	echo "</tr>" >> $PAGENAME
     		colcount=0
      fi

	if [ $pagecount -eq $PERPAGE ]
      then
		echo "</table></center>" >> $PAGENAME
		echo "</body></html>" >> $PAGENAME
		pagecount=0
		pagenumber=$[$pagenumber+1]
		PAGENAME=page$pagenumber.html
      fi
done

if [ $[$FLCOUNT%$COUNT] -ne 0 ]
then
	echo "</tr>" >> $PAGENAME
fi

if [ $[$FLCOUNT%$PERPAGE] -ne 0 ]
then
	echo "</table></center>" >> $PAGENAME
	echo "</body></html>" >> $PAGENAME
fi
 
#
#change file and image permissions
#
chmod 644 page*.html
chmod 755 c151_images
chmod 644 c151_images/*.*
