BASEDIR=$(CURDIR)
INPUTDIR=$(BASEDIR)/source
OUTPUTDIR=$(BASEDIR)/output
TEMPLATEDIR=$(INPUTDIR)/templates
STYLEDIR=$(BASEDIR)/style

BIBFILE=$(INPUTDIR)/references.bib
BIB_ACM_LONG=$(STYLEIDR)/acm-sig-proceedings-long-author-list.csl
BIB_ACM_SHORT=$(STYLEIDR)/acm-sig-proceedings.csl
BIB_IEEE="$(STYLEIDR)/ieee-with-url.csl"

help:
	@echo ' 																	  '
	@echo 'Makefile for the Markdown thesis                                       '
	@echo '                                                                       '
	@echo 'Usage:                                                                 '
	@echo '   make html                        generate a web version             '
	@echo '   make pdf                         generate a PDF file  			  '
	@echo '   make docx	                       generate a Docx file 			  '
	@echo '   make tex	                       generate a Latex file 			  '
	@echo '                                                                       '
	@echo ' 																	  '
	@echo ' 																	  '
	@echo 'get local templates with: pandoc -D latex/html/etc	  				  '
	@echo 'or generic ones from: https://github.com/jgm/pandoc-templates		  '

pdf:
	pandoc "$(INPUTDIR)"/*.md \
	-o "$(OUTPUTDIR)/thesis.pdf" \
	--template="$(STYLEDIR)/template.tex" \
	-H "$(STYLEDIR)/preamble.tex" \
	--csl="$(STYLEDIR)/acm-sig-proceedings.csl" \
	--metadata link-as-notes \
	--bibliography="$(BIBFILE)" 2>"$(OUTPUTDIR)"/pandoc.log \
	-V papersize=a4 \
	-V links-as-notes=true \
	-V documentclass:"$(STYLEDIR)/ociamthesis" \
	--metadata link-citations \
	-V fontsize=11pt \
	--chapters \
	-N \
	--latex-engine=xelatex \
	--verbose

tex:
	pandoc "$(INPUTDIR)"/*.md \
	-o "$(OUTPUTDIR)/thesis.tex" \
  --template="$(STYLEDIR)/template.tex" \
	-H "$(STYLEDIR)/preamble.tex" \
	--csl="$(STYLEDIR)/acm-sig-proceedings.csl" \
	--metadata link-as-notes \
	--bibliography="$(BIBFILE)" 2>"$(OUTPUTDIR)"/pandoc.log \
	-V papersize=a4 \
	-V links-as-notes=true \
	-V documentclass:"$(STYLEDIR)/ociamthesis" \
	--metadata link-citations \
	-V fontsize=11pt \
	--chapters \
	-N

docx:
	pandoc "$(INPUTDIR)"/*.md \
	-o "$(OUTPUTDIR)/thesis.docx" \
  --template="$(STYLEDIR)/template.tex" \
	-H "$(STYLEDIR)/preamble.tex" \
	--csl="$(STYLEDIR)/acm-sig-proceedings.csl" \
	--metadata link-as-notes \
	--bibliography="$(BIBFILE)" 2>"$(OUTPUTDIR)"/pandoc.log \
	-V papersize=a4 \
	-V links-as-notes=true \
	-V documentclass:"$(STYLEDIR)/ociamthesis" \
	--metadata link-citations \
	-V fontsize=11pt \
	--chapters \
	--toc

html:
	pandoc "$(INPUTDIR)"/*.md \
	-o "$(OUTPUTDIR)/thesis.html" \
	--standalone \
	--template="$(STYLEDIR)/template.html" \
	--bibliography="$(BIBFILE)" 2>"$(OUTPUTDIR)"/pandoc.log \
	--csl="$(STYLEDIR)/acm-sig-proceedings.csl" \
	--include-in-header="$(STYLEDIR)/style.css" \
	--toc \
	--number-sections
	rm -rf "$(OUTPUTDIR)/source"
	mkdir "$(OUTPUTDIR)/source"
	cp -r figures "$(OUTPUTDIR)/source/figures"

.PHONY: help pdf docx html tex

