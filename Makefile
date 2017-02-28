TechnicalBulletin = $(notdir $(CURDIR))
all: clean $(TechnicalBulletin).pdf

pdf: $(TechnicalBulletin).pdf

$(TechnicalBulletin).pdf: $(TechnicalBulletin).tex
	lualatex $(TechnicalBulletin).tex
	latex_count=5 ; \
		    while egrep -s 'Rerun (LaTeX|to get cross-references right)' $(TechnicalBulletin).log && [ $$latex_count -gt 0 ] ;\
		    do \
		    echo "Rerunning latex...." ;\
		    lualatex $(TechnicalBulletin).tex ;\
		    latex_count=`expr $$latex_count - 1` ;\
		    done


clean:
	rm -f *.ps *.dvi *.aux *.toc *.idx *.ind *.ilg *.log *.out $(TechnicalBulletin).pdf

