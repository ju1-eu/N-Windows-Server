#!/bin/bash -e
# ju 22-Jul-21
###########################################################################
# Erstellt Websiten & \LaTeX-Files mit Markdown und Pandoc.
# sed passt die \LaTeX-Syntax und HTML-Syntax an.
# Fotos optimieren (Web, Latex)
# Versionsverwaltung (Git)
# Backup

# Projekt wurde getestet unter "iMac"

# Erste Schritte
# 
# anpassen
# scripte/sed.sh
#  - codelanguage:    HTML5, Python, Bash, C, C++, TeX
#  - CMS Server Pfad: https://bw-ju.de/#
#  - Bildformat:      pdf, svg, png, jpg, webp

# projekt.sh
#  - Backupverzeichnis

# content/metadata.tex
#  - Datum, Titel, Autor

# $ ./projekt.sh
# $ make
###########################################################################

# ANPASSEN

	THEMA="N-Windows-Server"
	BACKUP_USB="/Volumes/USB-DATEN/meineNotizen/backup/notizen-iMac"    
	ARCHIV_USB="/Volumes/USB-DATEN/meineNotizen/archiv/notizen-iMac"    
	#REPOS_USB="/Volumes/USB-DATEN/meineNotizen/repository/notizen-iMac"    

###########################################################################

# Variable
INFO="+ Erstellt Websiten & \LaTeX PDFs mit Markdown und Pandoc."
SCRIPTE="scripteBash"
MD="md"
HTML="html"
TEXPANDOC="texPandoc"
IMG_OUT="img-out"
CMS_LOKAL="cms-lokal"
CMS_SERVER="cms-server"
ARCHIV="archiv"
CONTENT="content"
FILE="git-log.txt"
FILE2="index.html"
FILE3="inhalt.txt"
#TIMESTAMP_1=$(date +"%Y-%m-%d") # 2020-08-11
#TIMESTAMP_2=$(date +"%d-%h-%y") # 11-Aug-20
TIMESTAMP_3=$(date +"%d%m%y")   # 110820
#TIMESTAMP_4=$(date +"%d.%h.%Y") # 11.Aug.2020
#copyright="ju $TIMESTAMP_2"
TRENNER="###########################################################################"

###########################################################################
JANEIN=1
while [ "$JANEIN" -eq 1 ]; do
	###clear
	printf "\n $INFO \n"
	printf "\n  0) Projekt aufräumen"
	printf "\n  1) Projekt erstellen"
	printf "\n  2) Markdown in (tex, html5) + sed (Suchen/Ersetzen)"
	printf "\n  3) Kapitel erstellen + Scripte ausführen"
	printf "\n  4) Fotos optimieren (Web, Latex)"
	printf "\n  5) www + index.html"
	printf "\n  6) git init"
	printf "\n  7) git status + git log"
	printf "\n  8) Git-Version erstellen"
	printf "\n  9) Backup + Archiv erstellen"
	printf "\n 10) Beenden?"
	ANTWORT=""
	while [ -z "$ANTWORT" ]; do
		printf "\n\n Eingabe Zahl >_ "
		read ANTWORT
		# Zeichenketten eliminieren ,die Zeichen ausser 0-9  enthalten
		ANTWORT=${ANTWORT##*[^0-9]*}
		if [ -z "$ANTWORT" ]; then
			echo "+ Ungueltige Eingabe"
		fi
	done

	echo $TRENNER
	printf "\n"

    ###########################################################################
	if [ $ANTWORT -eq 0 ]; then
		# Projekt aufräumen

		# löschen  
		if [ -d $TEXPANDOC ]; then rm -rf $TEXPANDOC; fi
		if [ -d $HTML ]; then rm -rf $HTML; fi
		if [ -d $CMS_LOKAL ]; then rm -rf $CMS_LOKAL; fi
		if [ -d $CMS_SERVER ]; then rm -rf $CMS_SERVER; fi
		if [ -d $IMG_OUT ]; then rm -rf $IMG_OUT; fi
		if [ -f $FILE2 ]; then rm -rf $FILE2; fi
		if [ -f $FILE3 ]; then rm -rf $FILE3; fi

		#make clean
		#make distclean

		echo "fertig"

	###########################################################################
	elif [ $ANTWORT -eq 1 ]; then
		# Projekt erstellen
		# Scriptaufruf
		./$SCRIPTE/projekterstellen.sh

	###########################################################################
	elif [ $ANTWORT -eq 2 ]; then
		# Markdown in (tex, html5) - sed (Suchen/Ersetzen)
		# Scriptaufruf
		./$SCRIPTE/markdownLatexHtml.sh
		# FEHLER unter mac!!!!
	    ./$SCRIPTE/sed.sh

    ###########################################################################
	elif [ $ANTWORT -eq 3 ]; then
		# Kapitel erstellen, Scripte ausführen
		# Scriptaufruf
		./$SCRIPTE/inputImgMarkdown.sh
		./$SCRIPTE/inputKapitelLatex.sh
		./$SCRIPTE/inputPdfsLatex.sh
		./$SCRIPTE/projektInhalt.sh
		./$SCRIPTE/codeFiles.sh
		./$SCRIPTE/artikel-anlegen.sh
		./$SCRIPTE/picFiles.sh

	###########################################################################
    elif [ $ANTWORT -eq 4 ]; then
		# Fotos optimieren (Web, Latex)
		# Scriptaufruf
		./$SCRIPTE/jpg-pdf.sh

	###########################################################################
	elif [ $ANTWORT -eq 5 ]; then
		# www & index.html
		# Scriptaufruf
		./$SCRIPTE/www.sh

    ###########################################################################
    elif [ $ANTWORT -eq 6 ]; then
		# git init
		rm -rf .git
		git init
		git add .
		git commit -m"Projekt init"
		git status
		echo $TRENNER
		git log --abbrev-commit --pretty=oneline --graph --decorate
		git log --abbrev-commit --pretty=oneline --graph --decorate > $FILE  # neu anlegen
		echo $TRENNER

	###########################################################################
	elif [ $ANTWORT -eq 7 ]; then
		# git status und git log 
		git status
		echo $TRENNER
		git log --abbrev-commit --pretty=oneline --graph --decorate
		echo $TRENNER

    ###########################################################################
    elif [ $ANTWORT -eq 8 ]; then
		# Git-Version erstellen
		# Scriptaufruf
		./$SCRIPTE/gitversionieren.sh
	
	###########################################################################
    elif [ $ANTWORT -eq 9 ]; then
		echo "+ Backup + Archiv erstellen"

		# Laufwerk vorhanden?
		if [ ! -d $BACKUP_USB ]; then
		    echo "$BACKUP_USB Laufwerk mounten."
		else
		    # backup 
		    rsync -av --delete ./ $BACKUP_USB/$THEMA/
		fi
		
		# archiv
		ID=$(git rev-parse --short HEAD) # git commit (hashwert) = id
		
		tar cvzf $ARCHIV_USB/$TIMESTAMP_3'_'$THEMA'_v_'$ID.tgz .

		#tar cvzf ../$TIMESTAMP_3'_'$THEMA'_v'$ID.tgz .
		#tar cvzf ../$THEMA.tgz .
	    #rm -rf ../$THEMA.zip
	    #zip -r ../$THEMA.zip .
		
		# zip
		if [ ! -f ../$THEMA.zip ]; then
			zip -r ../$THEMA.zip .
		else
		    # backup löschen
		    rm -rf ../$THEMA.zip
			zip -r ../$THEMA.zip .
		fi
		# version erstellen
		tar cvzf ../$TIMESTAMP_3'_'$THEMA'_v'$ID.tgz .
		
		rm -rf $ARCHIV_USB/$THEMA.zip
	    zip -r $ARCHIV_USB/$THEMA.zip .
		
		if [ ! -f $ARCHIV/$CONTENT.zip ]; then
			zip -r $ARCHIV/$CONTENT.zip $CONTENT/
		else
		    # backup löschen
		    rm -rf $ARCHIV/$CONTENT.zip
			zip -r $ARCHIV/$CONTENT.zip $CONTENT/
		fi
		if [ ! -f $ARCHIV/$MD.zip ]; then
			zip -r $ARCHIV/$MD.zip $MD/
		else
		    # backup löschen
		    rm -rf $ARCHIV/$MD.zip
			zip -r $ARCHIV/$MD.zip $MD/
		fi

		echo $TRENNER
	    echo "+ Archiv ($ARCHIV_USB/)"
		echo "+ Backup ($BACKUP_USB/)"
		echo "+ Archiv ($ARCHIV/$CONTENT/)"
		echo "+ Archiv ($ARCHIV/$MD/)"		
		echo $TRENNER

		echo "fertig"
	
	###########################################################################
	else
		echo "Beenden"; break
	fi
done
