TechnicalBulletin = $(notdir $(CURDIR))
all: clean $(TechnicalBulletin).pdf

pdf: $(TechnicalBulletin).pdf

$(TechnicalBulletin).pdf: $(TechnicalBulletin).tex
	touch $(TechnicalBulletin).pyg
	latexmk -pdf $(TechnicalBulletin).tex

clean:
	latexmk -C
	rm -f *.fls *.texgen *.ps *.dvi *.aux *.toc *.idx *.ind *.ilg *.log *.out $(TechnicalBulletin).pdf

