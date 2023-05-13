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

if [ "$TITLE" == "" ]
	then
	TITLE="MY Picture"
fi

# Set number of columns/rows per page and image size
#
echo ""
echo "==============================================="
echo "What size of thumbnails would you like?"
echo "==============================================="
echo "1. 150 x 150 - Small"
echo "2. 200 x 200 - Medium"
echo "3. 300 x 300 - Large"
echo "==============================================="
read IMGCHOICE

if [ "$IMGCHOICE" == "1" ]
then
	IMAGESIZE="150x150"
	COUNT=4
elif [ "$IMGCHOICE" == "2" ]
then
	IMAGESIZE="200x200"
	COUNT=3
else 
	IMAGESIZE="300x300"
	COUNT=2
fi

# Set number of images per page
#
PERPAGE=$[$COUNT*$COUNT]

# determine the number of pages
#
TLPAGES=$[$FLCOUNT/$PERPAGE]

if [ $[$FLCOUNT%$PERPAGE] -ne 0 ]
then
	TLPAGES=$[$TLPAGES+1]
fi

#gather all images
#
images=$(ls *.[jJgG][pPiI][gGfF])	


# Remove old images and create new folder
#
rm -rf c151_images
mkdir c151_images

# Remove old pages
#
rm -f page*.html

# Start making html pages
#

# number of images in current
colcount=0

# number of images in current page
pagecount=0

# current page number
pagenumber=1

#current page name
PAGENAME=page$pagenumber.html

for image in $images
do
	if [ $pagecount -eq 0 ]
	then
            echo "<HTML><HEAD></HEAD>" >> $PAGENAME
		echo "<BODY bgcolor=#FAEBD7>" >> $PAGENAME
		echo "<center><H2>$TITLE</H2></center>" >> $PAGENAME
            
		if [ $TLPAGES -gt 1 ]
            then
                  echo "<center><font size =5>Page: " >> $PAGENAME
                  x=1
                  
			until [ $x -gt $TLPAGES ]
			do
                          echo "<a href=page$x.html>$x </a>" >> $PAGENAME
                          x=$[$x+1]
                          if [ $x -le $TLPAGES ]
                          then
                             echo " - " >>$PAGENAME
                          fi
                  done
                  
			echo "</font></center><p>" >>$PAGENAME
			echo "<p>" >>$PAGENAME
	       fi

             echo "<center><table bgcolor=#CCCCC border=2 cellpadding=10 cellspacing=2>" >> $PAGENAME
	fi

	if [ $colcount -eq 0 ]
	then
             echo "<tr>" >> $PAGENAME
	fi

	convert -geometry $IMAGESIZE $image c151_images/low-$image
	echo "<td><center><img border=2 src=c151_images/low-$image><br><font color=blue>$image</font></center></td>" >> $PAGENAME

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
