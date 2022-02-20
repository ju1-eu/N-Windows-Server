#!/bin/bash -e
# ju 22-Jul-21
###########################################################################
# Latex
#   \chapter{Kapitel}
#   \input{tex/Kapitel}
###########################################################################

# Variablen
TEXPANDOC="texPandoc"
TEX="tex"
CONTENT="content"
ARCHIV="archiv"
TABELLEN="Tabellen"
BEISPIELE="beispiele"
FILE="inhalt.tex"
INFO="Latex Kapitel erstellen."
INFO2="		Kopiere '$TEXPANDOC/*.tex' nach '$CONTENT/$TEX'" 
INFO3="		'$CONTENT/$TEX' **Handarbeit... für opt. Ergebnisse!**" 
INFO4="		Kopiere 'archiv/inhalt.tex' nach 'content/'"
INFO5="		make -- Latex-PDF erstellen"
TIMESTAMP=$(date +"%d-%h-%Y")
copyright="ju $TIMESTAMP $FILE"
TRENNER="%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n"

###########################################################################

echo "+ $INFO"
echo "	$INFO2"
echo "	$INFO3"
echo "	$INFO4"
echo "	$INFO5"

# File neu anlegen
printf $TRENNER                                        > $ARCHIV/$FILE
printf "\n"                                           >> $ARCHIV/$FILE
printf "%% $INFO \n"                                  >> $ARCHIV/$FILE
printf "%% $INFO2 \n"                                 >> $ARCHIV/$FILE
printf "%% $INFO3 \n"                                 >> $ARCHIV/$FILE
printf "%% $INFO4 \n"                                 >> $ARCHIV/$FILE
printf "%% $INFO5 \n"                                 >> $ARCHIV/$FILE
printf "%% $copyright\n"                              >> $ARCHIV/$FILE
printf "\n"                                           >> $ARCHIV/$FILE
printf $TRENNER                                       >> $ARCHIV/$FILE
printf "\n"                                           >> $ARCHIV/$FILE

# book - print
cd $CONTENT/$TEX
printf "%% $CONTENT/\n\n"                             >> ../../$ARCHIV/$FILE
for i in *.tex; do
	if [ ! "Neu.tex" = "$i" ]; then
		# dateiname ohne Endung
		texname=`basename "$i" .tex`                  >> ../../$ARCHIV/$FILE
		printf "\chapter{$texname}\n"                 >> ../../$ARCHIV/$FILE
		printf "%%\input{$CONTENT/$TEX/$texname}\n"   >> ../../$ARCHIV/$FILE
	fi
done
printf "\n"                                           >> ../../$ARCHIV/$FILE
printf $TRENNER                                       >> ../../$ARCHIV/$FILE
printf "\n"                                           >> ../../$ARCHIV/$FILE
cd ../..

cd $ARCHIV
printf "%% $ARCHIV/\n\n"                              >> ../$ARCHIV/$FILE
for i in *.tex; do
	if [ ! "inhalt.tex" = "$i" ]; then
		# dateiname ohne Endung
		texname=`basename "$i" .tex`                  >> ../$ARCHIV/$FILE	
		printf "%%\chapter{$texname}\n"               >> ../$ARCHIV/$FILE
		printf "%%\input{$ARCHIV/$texname}\n"         >> ../$ARCHIV/$FILE
	fi
done
printf "\n"                                           >> ../$ARCHIV/$FILE
printf $TRENNER                                       >> ../$ARCHIV/$FILE
printf "\n"                                           >> ../$ARCHIV/$FILE
cd ..

cd $TABELLEN
printf "%% $TABELLEN/\n\n"                            >> ../$ARCHIV/$FILE
for i in *.tex; do
	# dateiname ohne Endung
	texname=`basename "$i" .tex`                      >> ../$ARCHIV/$FILE		
	printf "%%\chapter{$texname}\n"                   >> ../$ARCHIV/$FILE
	printf "%%\input{$TABELLEN/$texname}\n"           >> ../$ARCHIV/$FILE
done
printf "\n"                                           >> ../$ARCHIV/$FILE
printf $TRENNER                                       >> ../$ARCHIV/$FILE
printf "\n"                                           >> ../$ARCHIV/$FILE
cd ..

cd $CONTENT/$BEISPIELE/$TEX
printf "%% $CONTENT/$BEISPIELE/$TEX/\n\n"             >> ../../../$ARCHIV/$FILE
for i in *.tex; do
	# dateiname ohne Endung
	texname=`basename "$i" .tex`                      >> ../../../$ARCHIV/$FILE	
	printf "%%\chapter{$texname}\n"                   >> ../../../$ARCHIV/$FILE
	printf "%%\input{$CONTENT/$BEISPIELE/$TEX/$texname}\n"  >> ../../../$ARCHIV/$FILE
done

cd ../../..
     
#echo "fertig"
