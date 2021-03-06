#!/bin/bash -e
# ju 10-Aug-20

# Quellcode in Latex speichern
# HTML, Python, Bash, C, C++, TeX

#Programmiersprache C (\autoref{code:hallo}).
#%
#\lstset{language=C}% HTML, Python, Bash, C, C++, TeX
#\lstinputlisting[%% anpassen
#   caption={Programmiersprache C}, label={code:hallo}
#]{code/hallo.c}% html, sh, c, cpp, py, tex

# Variablen
code="code"       # quellcode
file="Quellcode-files.tex"
archiv="archiv"
info="Quellcode 'code/' in Latex speichern." 
info2="'$archiv/$file'"
info3="HTML, Python, Bash, C, C++, TeX"
timestamp=$(date +"%d-%h-%Y")
copyright="ju $timestamp $file"

echo "+ $info"
echo "  $info2"
echo "  $info3"

# File neu anlegen
printf "%% ---------------------------------\n"              >  $archiv/$file
printf "%% $info \n"                                         >> $archiv/$file
printf "%% $info2 \n"                                        >> $archiv/$file
printf "%% $info3 \n"                                        >> $archiv/$file
printf "%% $copyright\n"                                     >> $archiv/$file
printf "%% ---------------------------------\n"              >> $archiv/$file
printf "%%\n\n"                                              >> $archiv/$file

cd $code

# Bash
SPRACHE="Bash"
EXT="sh" 
exist=$(find . -type f -iname "*.$EXT" | wc -l)
n=1 # Code Zaehler ((n+=1))
if [ $exist -ge 1 ]; then
    # vorhanden
    for i in *.$EXT; do
        # Dateiname ohne Endung
        scriptname=`basename "$i" .$EXT` # anpassen
        # latex quellcode
        printf "\section{$scriptname}\n"                              >> ../$archiv/$file
        printf "\n"                                                   >> ../$archiv/$file
        echo "%$i (\autoref{code:$scriptname-$n}).% Referenz"         >> ../$archiv/$file
        printf "%%\n"                                                 >> ../$archiv/$file
        printf "\lstset{language=$SPRACHE}%% HTML, Python, Bash, C, C++, TeX\n"  >> ../$archiv/$file
        printf "\lstinputlisting[%% anpassen\n"                       >> ../$archiv/$file
        printf "    caption={Quellcode in $SPRACHE: $i}, %%label={code:$scriptname-$n}\n" >> ../$archiv/$file
        printf "]{$code/$i}%% file\n\n"                               >> ../$archiv/$file
        echo "\newpage"                                               >> ../$archiv/$file
        ((n+=1))
    done
fi


# HTML
SPRACHE="HTML"
EXT="html" 
exist=$(find . -type f -iname "*.$EXT" | wc -l)
n=1 # Code Zaehler ((n+=1))
if [ $exist -ge 1 ]; then
    # vorhanden
    for i in *.$EXT; do
        # Dateiname ohne Endung
        scriptname=`basename "$i" .$EXT` # anpassen
        # latex quellcode
        printf "\section{$scriptname}\n"                              >> ../$archiv/$file
        printf "\n"                                                   >> ../$archiv/$file
        echo "%$i (\autoref{code:$scriptname-$n}).% Referenz"         >> ../$archiv/$file
        printf "%%\n"                                                 >> ../$archiv/$file
        printf "\lstset{language=$SPRACHE}%% HTML, Python, Bash, C, C++, TeX\n"  >> ../$archiv/$file
        printf "\lstinputlisting[%% anpassen\n"                       >> ../$archiv/$file
        printf "    caption={Quellcode in $SPRACHE: $i}, %%label={code:$scriptname-$n}\n" >> ../$archiv/$file
        printf "]{$code/$i}%% file\n\n"                               >> ../$archiv/$file
        echo "\newpage"                                               >> ../$archiv/$file
        ((n+=1))
    done
fi


# C
SPRACHE="C"
EXT="c"
exist=$(find . -type f -iname "*.$EXT" | wc -l)
n=1 # Code Zaehler ((n+=1))
if [ $exist -ge 1 ]; then
    # vorhanden
    for i in *.$EXT; do
        # Dateiname ohne Endung
        scriptname=`basename "$i" .$EXT` # anpassen
        # latex quellcode
        printf "\section{$scriptname}\n"                              >> ../$archiv/$file
        printf "\n"                                                   >> ../$archiv/$file
        echo "%$i (\autoref{code:$scriptname-$n}).% Referenz"         >> ../$archiv/$file
        printf "%%\n"                                                 >> ../$archiv/$file
        printf "\lstset{language=$SPRACHE}%% HTML, Python, Bash, C, C++, TeX\n"  >> ../$archiv/$file
        printf "\lstinputlisting[%% anpassen\n"                       >> ../$archiv/$file
        printf "    caption={Quellcode in $SPRACHE: $i}, %%label={code:$scriptname-$n}\n" >> ../$archiv/$file
        printf "]{$code/$i}%% file\n\n"                               >> ../$archiv/$file
        echo "\newpage"                                               >> ../$archiv/$file
        ((n+=1))
    done
fi


# C++
SPRACHE="C++"
EXT="cpp" 
exist=$(find . -type f -iname "*.$EXT" | wc -l)
n=1 # Code Zaehler ((n+=1))
if [ $exist -ge 1 ]; then
    # vorhanden
    for i in *.$EXT; do
        # Dateiname ohne Endung
        scriptname=`basename "$i" .$EXT` # anpassen
        # latex quellcode
        printf "\section{$scriptname}\n"                              >> ../$archiv/$file
        printf "\n"                                                   >> ../$archiv/$file
        echo "%$i (\autoref{code:$scriptname-$n}).% Referenz"         >> ../$archiv/$file
        printf "%%\n"                                                 >> ../$archiv/$file
        printf "\lstset{language=$SPRACHE}%% HTML, Python, Bash, C, C++, TeX\n"  >> ../$archiv/$file
        printf "\lstinputlisting[%% anpassen\n"                       >> ../$archiv/$file
        printf "    caption={Quellcode in $SPRACHE: $i}, %%label={code:$scriptname-$n}\n" >> ../$archiv/$file
        printf "]{$code/$i}%% file\n\n"                               >> ../$archiv/$file
        echo "\newpage"                                               >> ../$archiv/$file
        ((n+=1))
    done
fi


# Python
SPRACHE="Python"
EXT="py" 
exist=$(find . -type f -iname "*.$EXT" | wc -l)
n=1 # Code Zaehler ((n+=1))
if [ $exist -ge 1 ]; then
    # vorhanden
    for i in *.$EXT; do
        # Dateiname ohne Endung
        scriptname=`basename "$i" .$EXT` # anpassen
        # latex quellcode
        printf "\section{$scriptname}\n"                              >> ../$archiv/$file
        printf "\n"                                                   >> ../$archiv/$file
        echo "%$i (\autoref{code:$scriptname-$n}).% Referenz"         >> ../$archiv/$file
        printf "%%\n"                                                 >> ../$archiv/$file
        printf "\lstset{language=$SPRACHE}%% HTML, Python, Bash, C, C++, TeX\n"  >> ../$archiv/$file
        printf "\lstinputlisting[%% anpassen\n"                       >> ../$archiv/$file
        printf "    caption={Quellcode in $SPRACHE: $i}, %%label={code:$scriptname-$n}\n" >> ../$archiv/$file
        printf "]{$code/$i}%% file\n\n"                               >> ../$archiv/$file
        echo "\newpage"                                               >> ../$archiv/$file
        ((n+=1))
    done
fi


# TeX
SPRACHE="TeX"
EXT="tex" 
exist=$(find . -type f -iname "*.$EXT" | wc -l)
n=1 # Code Zaehler ((n+=1))
if [ $exist -ge 1 ]; then
    # vorhanden
    for i in *.$EXT; do
        # Dateiname ohne Endung
        scriptname=`basename "$i" .$EXT` # anpassen
        # latex quellcode
        printf "\section{$scriptname}\n"                              >> ../$archiv/$file
        printf "\n"                                                   >> ../$archiv/$file
        echo "%$i (\autoref{code:$scriptname-$n}).% Referenz"         >> ../$archiv/$file
        printf "%%\n"                                                 >> ../$archiv/$file
        printf "\lstset{language=$SPRACHE}%% HTML, Python, Bash, C, C++, TeX\n"  >> ../$archiv/$file
        printf "\lstinputlisting[%% anpassen\n"                       >> ../$archiv/$file
        printf "    caption={Quellcode in $SPRACHE: $i}, %%label={code:$scriptname-$n}\n" >> ../$archiv/$file
        printf "]{$code/$i}%% file\n\n"                               >> ../$archiv/$file
        echo "\newpage"                                               >> ../$archiv/$file
        ((n+=1))
    done
fi

cd ..

#echo "fertig"
