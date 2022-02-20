# ju 18-12-21 
TARGETDIR = "build"
SRC1 = "Spickzettel-Markdown"
SRC2 = "README"
CSS = "../github.css"
BIB_1 = "literatur.bib"
BIB_2 = "literatur-kfz.bib"
BIB_3 = "literatur-sport.bib"
CSL = "zitierstil-number.csl"
HTMLOPTIONS = -s -t html5 --from markdown+smart --bibliography $(BIB_1) --bibliography $(BIB_2) --bibliography $(BIB_3) --citeproc --csl $(CSL) --mathjax --strip-comments --toc -c $(CSS)

all: html docx
	@echo "Alles erledigt!"

html: $(TARGETDIR)
	pandoc $(HTMLOPTIONS) $(SRC1).md -o $(TARGETDIR)/$(SRC1).html
	pandoc $(HTMLOPTIONS) $(SRC2).md -o $(TARGETDIR)/$(SRC2).html

docx: $(TARGETDIR)
	pandoc $(SRC1).md -o $(TARGETDIR)/$(SRC1).docx
	pandoc $(SRC2).md -o $(TARGETDIR)/$(SRC2).docx

.PHONY: clean

clean:
	rm $(TARGETDIR)/$(SRC1).html 
	rm $(TARGETDIR)/$(SRC2).html 	
	rm $(TARGETDIR)/$(SRC1).docx 
	rm $(TARGETDIR)/$(SRC2).docx 	

rebuild: clean all

$(TARGETDIR):
	mkdir build