#!/usr/bin/env python3
# letztes Update: 12-Jul-21
# Quelle: https://www.uweziegenhagen.de/?p=4036
# Aufgaben zum Bruchrechnen erstellen mit LaTeX und Python
# Latex: https://www.grund-wissen.de/informatik/latex/mathematischer-formelsatz.html
import os
import random
from datetime import date  # sudo locale-gen de_DE.UTF-8

# variablen
#########################################################
# Datum
d1 = date.today()
timestamp = d1.strftime('%d-%b-%y') # 16-Jan-20
#print(timestamp) 

anzahl_Aufgaben = 10
# Zufallszahlen_Liste von 1 bis 20
von_Zahl = 1
bis_Zahl = 21 

op = "\cdot" # + - * = \cdot :

thema = "Aufgaben: Bruchrechnen multiplizieren"
# addieren, subtrahieren, multiplizieren, dividieren
file = "Mathe-Brueche-multiplizieren" # dateinamen

# Latex
#########################################################
head = """% letztes Update: """ + timestamp + """
\\documentclass[%
    11pt,paper=a4,fleqn,parskip=half% ohne Absatzeinzug
]{scrartcl}   
\\include{content/praeambel-artikel}   
% Seitenlayout: ohne includeheadfoot
\\usepackage[left=2.0cm,right=2.0cm,top=2.5cm,bottom=2.5cm]{geometry}
%\\setlength{\\headheight}{19.34pt}
% anpassen
% Quelle Literaturverzeichnis oder URL in Fussnote 
%\\newcommand{\\quelle}{MathePeter~\\footnote{\\url{https://champcademy.teachable.com}}}
\\newcommand{\\quelle}{MathePeter siehe~\\footnote{\\fullcite{peter:2021:mathe}}}% Literaturverzeichnis
%\\newcommand{\\quelle}{MathePeter siehe~\\textcite{peter:2021:mathe}}% Literaturverzeichnis
\\newcommand{\\titel}{Mathe und \\LaTeX}
\\newcommand{\\autor}{Jan Unger}
\\newcommand{\\datum}{\\today}
\\newcommand{\\datumHand}{09.07.2021}% ##.##.####
\\newcommand{\\website}{http://bw-ju.de}
\\newcommand{\\websiteKurz}{bw-ju.de}
% Kopfzeile
\\ihead{\\copyright \\enspace $\\the\\year$ \\autor \\vspace{0.4em}}
\\chead{}% ohne Titel
% Datum oder mit Logo & QR-Code????
\\ohead{\\datum}
%\\ohead{\\includegraphics[width=1.0cm]{images/logo.eps}}% Logo
\\ifoot{\\qrcode[hyperlink,level=Q,version=2,height=1.0cm]{\\website}}% QR-Code
\\cfoot{}% ohne Seitenzahl
% Literatur
\\bibliography{content/literatur}
\\bibliography{content/literatur-kfz}
\\bibliography{content/literatur-sport}
\\begin{document}

\\section*{""" + thema + """}
% Aufgaben
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\\begin{enumerate} 
"""
 
foot = """
\\end{enumerate} 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\\includepdf[pages=-]{content/Grundlagen-Rechnen.pdf}    
%\\include{content/Neu} % neu
%\\printbibliography
\\end{document}
"""

# Funktion
#########################################################
def create_bruch_1():
    zahlen_Liste = list(range(von_Zahl,bis_Zahl)) # Zufallszahlen
    zaehler = random.choice(zahlen_Liste)
    zahlen_Liste.remove(zaehler)
    nenner = random.choice(zahlen_Liste)
    return '  \\item $\\frac{'+ str(zaehler) + '}{' + str(nenner) + '} '

def create_bruch_2():
    zahlen_Liste = list(range(von_Zahl,bis_Zahl)) # Zufallszahlen
    zaehler = random.choice(zahlen_Liste)
    zahlen_Liste.remove(zaehler)
    nenner = random.choice(zahlen_Liste)
    return str(op) + ' \\frac{'+ str(zaehler) + '}{' + str(nenner) + '}$ \\vspace{1em} \n'
 
# file.tex erstellen
#########################################################
with open(file + ".tex", "w") as document:
    document.write(head);
    for i in range(anzahl_Aufgaben):
        document.write(create_bruch_1());
        document.write(create_bruch_2());
    document.write(foot);
    document.close();

# PDF erstellen
#########################################################
#os.system("pdflatex " + file + ".tex") # file.tex
#os.system("pdflatex " + file + ".tex") # file.tex
#os.unlink(file + ".bbl")                
#os.unlink(file + ".run.xml")        
os.system("make") # file.tex
os.system("make clean")      