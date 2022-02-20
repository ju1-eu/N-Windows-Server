#!/bin/bash -e
# ju 5-2-22

# Git versionieren

# Variablen
#------------------------------------------------------
	THEMA="N-Windows-Server" # = REPOSITORY
	repos_USB="/Volumes/usb-daten/meineNotizen/repository/notizen-iMac"    
#------------------------------------------------------

info="Git versionieren"
git_file="git-log.txt"
timestamp=$(date +"%d-%h-%Y")  # 11-Aug-2020
copyright="ju $timestamp $git_file"

echo "+ $info"

#----------------------------------------------------------
# Voraussetzung:
# (1) lokales Repository: main
	# anpassen 
	# git config --global init.defaultBranch main
#git init # rm -rf .git
#git add .
#git commit -m "Projekt init"

# (2) Github Repository:  origin/main
git branch -M main
git remote add origin https://github.com/ju1-eu/N-Windows-Server.git
git push -u origin main

# (3) backup Repository:  backupUSB/main
    # anpassen
#repos_USB="/Volumes/usb-daten/meineNotizen/repository/notizen-iMac"    
#REPOSITORY="N-Windows-Server"
#LESEZEICHEN="backupUSB"
#git clone --no-hardlinks --bare . $repos_USB/$REPOSITORY.git 
#git remote add $LESEZEICHEN $repos_USB/$REPOSITORY.git 
#git push --all $LESEZEICHEN
#----------------------------------------------------------

# Git-Version
# lokales Repository: HEAD -> main
#
# usereingabe
read -p "lokales Repository vorhanden? [j/n] " antwort
if [ -z "$antwort" ]; then
	# String ist leer
	echo "Keine Eingabe"
fi
if [ "$antwort" = "j" ]; then
	# lokales Repository: HEAD -> main
	git add .
	git commit -a # editor
	echo "# ------------------------"
	echo $copyright > $git_file
	git log --abbrev-commit --pretty=oneline --graph --decorate >> $git_file  # version anlegen
	echo "# ------------------------"
else
	# beenden
	echo "Ende: $antwort"
fi

# Github Repository: origin/main
#
# usereingabe
read -p "Github Repository vorhanden? [j/n] " antwort
if [ -z "$antwort" ]; then
	# String ist leer
	echo "Keine Eingabe"
fi
if [ "$antwort" = "j" ]; then
	# Github Repository: origin/main
	git push
	echo "# ------------------------"
else
	# beenden
	echo "Ende: $antwort"
fi

# Backup Repository: backupUSB/main
#
# usereingabe
read -p "Backup Repository $repos_USB vorhanden? [j/n] " antwort
if [ -z "$antwort" ]; then
	# Fehler: String ist leer
	echo "Keine Eingabe"
fi
if [ "$antwort" = "j" ]; then
	# Speicher - Laufwerk vorhanden?
	if [ ! -d $repos_USB ]; then
		echo "$repos_USB mounten."
	else
		# Backup Repository
		LESEZEICHEN="backupUSB"
		git push --all $LESEZEICHEN 
		echo "# ------------------------"
	fi
else
	# beenden
	echo "Ende: $antwort"
fi

echo "# ------------------------"
git status
git log --abbrev-commit --pretty=oneline --graph --decorate
echo "# ------------------------"

echo "fertig"
