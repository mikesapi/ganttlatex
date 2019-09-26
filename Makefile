all: pdf

foo=ganttlatex

pdf: *.tex
	pdflatex $(foo).tex
	evince $(foo).pdf &

clean:
	rm -f *.aux *.log

cleanpdf:
	rm *.pdf
