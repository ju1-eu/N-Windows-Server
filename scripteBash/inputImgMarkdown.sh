#!/bin/bash -e
# ju 18-12-21

# Bilder in Markdown einfügen

# Bildname vgl. abb. ![Bildname](images/Logo/Bildname.pdf){width=60%}

# Variable
FILE="input-img.txt"
IMG="images"
SKIZZE="Skizze" # anpassen
LOGO="Logo"     # anpassen
ARCHIV="archiv"
INFO="Alle Abbildungen 'images/' in Markdown speichern.
	* '$ARCHIV/$FILE'"
TIMESTAMP=$(date +"%d-%h-%Y")
COPYRIGHT="ju $TIMESTAMP $FILE"

echo "+ $INFO"

# File neu anlegen
echo "<!-----------------------------------------------"  >  $ARCHIV/$FILE
echo "$INFO"                                              >> $ARCHIV/$FILE
echo "$COPYRIGHT"                                         >> $ARCHIV/$FILE
echo "------------------------------------------------->" >> $ARCHIV/$FILE
printf "\n\n"                                             >> $ARCHIV/$FILE

cd $IMG
for i in *.pdf; do
	# dateiname ohne Endung
	picname=`basename "$i" .pdf`
    printf "<!--$picname vgl. abb.-->\n\n"           >> ../$ARCHIV/$FILE
	echo "![$picname]($IMG/$i){width=60%}"           >> ../$ARCHIV/$FILE
    printf "\n\n"                                    >> ../$ARCHIV/$FILE
done
cd $SKIZZE
for i in *.pdf; do
	# dateiname ohne Endung
	picname=`basename "$i" .pdf`
    printf "<!--$picname vgl. abb.-->\n\n"           >> ../../$ARCHIV/$FILE
	echo "![$picname]($IMG/$SKIZZE/$i){width=60%}"   >> ../../$ARCHIV/$FILE
    printf "\n\n"                                    >> ../../$ARCHIV/$FILE
done
cd ..
cd $LOGO
for i in *.pdf; do
	# dateiname ohne Endung
	picname=`basename "$i" .pdf`
    printf "<!--$picname vgl. abb.-->\n\n"           >> ../../$ARCHIV/$FILE
	echo "![$picname]($IMG/$LOGO/$i){width=60%}"   	 >> ../../$ARCHIV/$FILE
    printf "\n\n"                                    >> ../../$ARCHIV/$FILE
done
cd ../..

#echo "fertig"
