#!/bin/bash -e
# ju 25-Okt-21

# Artikel aus den Ordnern erstellen
#   tex/
#  	archiv/
#	Tabellen/
#	content/beispiele/tex/
#   wird gespeichert in artikel/


# Variable anpassen
tex="tex"
content="content"
archiv="archiv"
tabellen="Tabellen"
beispiele="content/beispiele/tex"
artikel="Artikel"
bsp="Bsp"
info="Artikel aus den Ordnern erstellen
	* '$archiv/'
	* '$tabellen/'
	* '$beispiele/'
	*  wird gespeichert in 'artikel/'"
timestamp=$(date +"%d-%h-%y")
copyright="ju $timestamp"

echo "+ $info"

T1="\documentclass[11pt,paper=a4,fleqn,parskip=half]{scrartcl}   
\include{content/praeambel-artikel}    

\usepackage[left=2.0cm,right=2.0cm,top=2.0cm,bottom=2.3cm]{geometry}% quer: landscape
\usepackage{fancyhdr}
\pagestyle{fancy}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% anpassen
\newcommand{\titel}{\LaTeX}
\newcommand{\name}{Jan Unger}
\newcommand{\datum}{\today}
%\newcommand{\quelle}{\textbf{\copyright \, \name}}% anpassen: (c) oder 
\newcommand{\quelle}{\textbf{Quelle: \, \name}}% anpassen: Quelle:
\newcommand{\logo}{\includegraphics[height=0.8cm]{images/Logo1.pdf}}% anpassen: Logo oder Datum


\lhead{\quelle}
%\rhead{\logo}
\rhead{}
\title{\titel}

% pro Tabelle: farbige Zeilen im wechsel
%\rowcolors{1}{}{grau2}% EIN / AUS: \showrowcolors o. \hiderowcolors

% Literatur
\bibliography{content/literatur}
\bibliography{content/literatur-kfz}
\bibliography{content/literatur-sport}
\begin{document}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\begin{center}
	\textbf{\Large \titel}\\\\%14pt
        \vspace{0.4em}
        \datum
\end{center}

% Zusammenfassung 
\begin{abstract} 
	\textcolor{purple}{>>Zusammenfassung<<}\\\\
	\vspace{0.4em}
	\raggedleft \small{-- Wikipedia}% 10pt
\end{abstract}

% Check anpassen
\begin{itemize}[label=\checkmark] %\itemsep -2pt
       \item Check
\end{itemize}

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
T2="
	% anpassen
	%\input{content/tex/neu}
	%\input{content/tex/Spickzettel-Markdown} 
 	%\input{content/tex/Spickzettel-Latex} 
    %\includepdf[pages=-]{Tabellen/PDF/Zeitrechner.pdf}"
T3="
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Bibliographie
    %\printbibliography
\end{document}"

# tex/
cd $content/$tex
EXT="tex" 
exist=$(find . -type f -iname "*.$EXT" | wc -l)
if [ $exist -ge 1 ]; then
	for i in *.$EXT; do
		# dateiname ohne Endung
		texname=`basename "$i" .$EXT`
		echo "% $copyright"       			 > ../../$artikel/$texname-artikel.tex # file anlegen
		echo "$T1"               			>> ../../$artikel/$texname-artikel.tex
		echo "$T2"               			>> ../../$artikel/$texname-artikel.tex
		echo "	\input{$content/$tex/$i}"   >> ../../$artikel/$texname-artikel.tex
		echo "$T3"               			>> ../../$artikel/$texname-artikel.tex
	done
fi
cd ../..

# archiv/
#cd $archiv
#EXT="tex" 
#exist=$(find . -type f -iname "*.$EXT" | wc -l)
#if [ $exist -ge 1 ]; then
#	for i in *.$EXT; do
#		if [ ! "inhalt.tex" = "$i" ]; then
#			# dateiname ohne Endung
#			texname=`basename "$i" .$EXT`
#			echo "% $copyright"                  > ../$artikel/$bsp/$texname-artikel.tex # file anlegen
#			echo "$T1"               			>> ../$artikel/$bsp/$texname-artikel.tex
#			echo "$T2"               			>> ../$artikel/$bsp/$texname-artikel.tex
#			echo "	\input{$content/$tex/$i}"   >> ../$artikel/$bsp/$texname-artikel.tex
#			echo "$T3"               			>> ../$artikel/$bsp/$texname-artikel.tex
#		fi
#	done
#fi
#cd ..

# tabellen/
cd $tabellen
EXT="tex" 
exist=$(find . -type f -iname "*.$EXT" | wc -l)
if [ $exist -ge 1 ]; then
	for i in *.$EXT; do
		# dateiname ohne Endung
		texname=`basename "$i" .$EXT`
		echo "% $copyright"                  > ../$artikel/$bsp/$texname-artikel.tex # file anlegen
		echo "$T1"               			>> ../$artikel/$bsp/$texname-artikel.tex
		echo "$T2"               			>> ../$artikel/$bsp/$texname-artikel.tex
		echo "	\input{$content/$tex/$i}"   >> ../$artikel/$bsp/$texname-artikel.tex
		echo "$T3"               			>> ../$artikel/$bsp/$texname-artikel.tex
	done
fi
cd ..

# beispiele/
#cd $beispiele
#EXT="tex" 
#exist=$(find . -type f -iname "*.$EXT" | wc -l)
#if [ $exist -ge 1 ]; then
#	for i in *.$EXT; do
#		# dateiname ohne Endung
#		texname=`basename "$i" .$EXT`
#		echo "% $copyright"                  > ../../../$artikel/$bsp/$texname-artikel.tex # file anlegen
#		echo "$T1"               			>> ../../../$artikel/$bsp/$texname-artikel.tex
#		echo "$T2"               			>> ../../../$artikel/$bsp/$texname-artikel.tex
#		echo "	\input{$content/$tex/$i}"   >> ../../../$artikel/$bsp/$texname-artikel.tex
#		echo "$T3"               			>> ../../../$artikel/$bsp/$texname-artikel.tex
#	done
#fi
#cd ../../..

#echo "...fertig."
