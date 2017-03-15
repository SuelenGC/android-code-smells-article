FILENAME = article
#DIR_LATEX = /usr/local/texlive/2015/bin/x86_64-darwin/

LATEX     = latex
PDFLATEX  = pdflatex
BIBTEX    = bibtex
MAKEINDEX = makeindex

pdf:$(FILENAME).pdf

ps: $(FILENAME).ps

$(FILENAME).pdf: $(FILENAME).tex 
	$(PDFLATEX) $<
	$(BIBTEX) $(FILENAME) 
	$(MAKEINDEX) $(FILENAME) 
	$(PDFLATEX) $< 
	$(PDFLATEX) $<
	$(PDFLATEX) $<

$(FILENAME).ps: $(FILENAME).tex 
	$(LATEX) $<
	$(BIBTEX) $(FILENAME) 
	$(MAKEINDEX) $(FILENAME) 
	$(LATEX) $< 
	$(LATEX) $<
	$(LATEX) $<
	
rm:
	rm -f $(FILENAME)*.ps $(FILENAME)*.dvi *.log \
	      *.aux *.blg *.toc *.brf *.ilg *.ind \
	      missfont.log $(FILENAME)*.bbl $(FILENAME)*.out \
		  $(FILENAME)*.lof $(FILENAME)*.lot 


# outros

all: clean pdflatex clean view

view:
	open -a Skim $(FILENAME).pdf 

quickbuild:
	$(DIR_LATEX)pdflatex $(FILENAME).tex 
	open $(FILENAME).pdf 

latex:
	$(DIR_LATEX)latex $(FILENAME)
	$(DIR_LATEX)dvips -o $(FILENAME).ps $(FILENAME).dvi
	ps2pdf $(FILENAME).ps $(FILENAME).pdf
	open $(FILENAME).pdf

pdflatex:
	# PdfLaTeX + BibTex + (2x) PdfLaTeX 
	$(DIR_LATEX)pdflatex $(FILENAME).tex 
	$(DIR_LATEX)bibtex $(FILENAME).aux
	$(DIR_LATEX)pdflatex $(FILENAME).tex 
	$(DIR_LATEX)pdflatex $(FILENAME).tex 
	

build:
	# LaTex + BibiTex + (2x) LaTeX + Makeindex + LaTeX + dvips + ps2pdf
	$(DIR_LATEX)latex $(FILENAME).tex
	$(DIR_LATEX)bibtex $(FILENAME).aux
	$(DIR_LATEX)latex $(FILENAME).tex
	$(DIR_LATEX)latex $(FILENAME).tex
	$(DIR_LATEX)makeindex $(FILENAME).tex
	$(DIR_LATEX)latex $(FILENAME).tex
	$(DIR_LATEX)dvips -o $(FILENAME).ps $(FILENAME).dvi
	$(DIR_LATEX)ps2pdf $(FILENAME).ps $(FILENAME).pdf

clean:
	mkdir -p /tmp/trash;
      
	mv *.aux /tmp/trash/ 2> /dev/null; true
	mv *.dvi /tmp/trash/ 2> /dev/null; true
	mv *.ps /tmp/trash/ 2> /dev/null; true
	mv *.idx /tmp/trash/ 2> /dev/null; true
	mv *.loa /tmp/trash/ 2> /dev/null; true
	mv *.lof /tmp/trash/ 2> /dev/null; true
	mv *.log /tmp/trash/ 2> /dev/null; true
	mv *.toc /tmp/trash/ 2> /dev/null; true
	mv *.out /tmp/trash/ 2> /dev/null; true
	mv *.snm /tmp/trash/ 2> /dev/null; true
	mv *.tex~ /tmp/trash/ 2> /dev/null; true
	mv *.ind /tmp/trash/ 2> /dev/null; true
	mv *.bak /tmp/trash/ 2> /dev/null; true
	mv *.bbl /tmp/trash/ 2> /dev/null; true
	mv *.bbl~ /tmp/trash/ 2> /dev/null; true
	mv *.blg /tmp/trash/ 2> /dev/null; true
	mv *.bib~ /tmp/trash/ 2> /dev/null; true
	mv *.brf /tmp/trash/ 2> /dev/null; true
	mv *.ilg /tmp/trash/ 2> /dev/null; true
	mv *.nav /tmp/trash/ 2> /dev/null; true
	mv *.vrb /tmp/trash/ 2> /dev/null; true
	mv *.backup /tmp/trash/ 2> /dev/null; true
      
	chmod -x *.tex 
	chmod +x *.pdf 
