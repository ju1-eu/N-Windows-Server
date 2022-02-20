#!/bin/bash -e
# ju 18-12-21

# Tabellen als PDFs in Latex einfügen

# \usepackage{pdfpages}
# alle PDF Seiten im Querformat
#   \includepdf[landscape=true,pages=-]{tabelle.pdf}
# eine Seite pro Seite
#   \includepdf[landscape=true,pages={1}]{tabelle.pdf}
# zwei Seiten pro Seite: nup=<Anzahl der Spalten>x<Anzahl der Zeilen>
#   \includepdf[pages=-,nup= 1x2]{tabelle.pdf}

# Variablen"
TABELLE="Tabellen"
PDF="PDF"
FILE="input-PDFs.txt"
INFO="Tabellen als PDFs in Latex einfügen. 'Tabellen/PDF/*.pdf ?'"
TIMESTAMP=$(date +"%d-%h-%Y")
COPYRIGHT="ju $TIMESTAMP"

echo "+ $INFO"

# File neu anlegen
printf "%% $COPYRIGHT $FILE \n\n" > $TABELLE/$FILE

cd $TABELLE/$PDF
EXT="pdf" 
EXIST=$(find . -type f -iname "*.$EXT" | wc -l)
if [ $EXIST -ge 1 ]; then
    # vorhanden
	printf "\chapter{$PDF}%% book, print anpassen\n\n" >> ../$FILE
	for i in *.$EXT; do
		# Dateiname ohne Endung
		PDFNAME=`basename "$i" .$EXT`
		printf "%% -------\n" >> ../$FILE	
		printf "\section{$PDFNAME}\label{sec:$PDFNAME}\index{$PDFNAME}\n" >> ../$FILE
		printf "\includepdf[pages=-]{$TABELLE/$PDF/$i}\n\n"          >> ../$FILE
	done
fi
cd ../..


#echo "fertig"
