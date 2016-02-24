######################################################################
# BeamerTemplate Makefile
# By Simon Pratt
# February 15, 2016
######################################################################

MAIN_FILE   = slides

FIGURES     = figures/linux1.png \
			  figures/linux2.png \
			  figures/linux3.png \
			  figures/linux4.png \
			  figures/uvm.png

STYLES_DIR  = styles

STYLES      = Assignment \
              CGAlgorithms \
              HeaderStuff \
              QuestionAnswer \
              TheoremStuff \
			  Presentation

######################################################################
# Modify the following at your own risk
######################################################################

.PHONY: open clean

MAIN_TEX    = ${MAIN_FILE}.tex

PARTS_TEX    = ${addsuffix .tex,${PARTS}}

STYLES_STY  = ${addprefix ${STYLES_DIR}/,${addsuffix .sty,${STYLES}}}

PDF         = ${MAIN_FILE}.pdf

${PDF}: ${MAIN_TEX} ${PARTS_TEX} ${FIGURES} ${STYLES_STY}

# if your open program isn't listed, OR (||) it to the end
open: ${PDF}
	open $< || gnome-open $<

%.pdf: %.tex
	rubber -d $<

# add stuff to delete here
clean:
	rm -f *.log *.aux *.dvi *.blg *.bbl *.nav *.out *.snm *.toc ${PDF}
