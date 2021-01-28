all: pdf

foo=main
bar=open

# If on Linux default to evince pdf viewer if not otherwise specified
UNAME := $(shell uname)
ifeq ($(UNAME), Linux)
	bar=evince
endif

pdf: *.tex
	pdflatex $(foo).tex
	$(bar) $(foo).pdf &

bib: *.tex
	pdflatex $(foo).tex
	bibtex $(foo)
	pdflatex $(foo).tex
	pdflatex $(foo).tex
	$(bar) $(foo).pdf &

clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.brf *.tcp *.toc

cleanpdf:
	rm -f *.pdf
