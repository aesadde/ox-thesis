## ---------------------------------------------------------------------------
#  -- Global vars ------------------------------------------------------------
## ---------------------------------------------------------------------------
basedir=$(PWD)

inputdir=$(basedir)/source
outputdir=$(basedir)/output
templatedir=$(inputdir)/templates
styledir=$(basedir)/style

# CHANGE: The name of the generated files
out_name = thesis

#  -- Bib Vars --------------------------------------------------------------
# the dir where all the citation styles are
bib_styles    = $(styledir)/citation_styles

# this is your .bib file
bibfile       = $(inputdir)/references.bib

# common citation styles for CS
bib_acm_long  = $(bib_styles)/acm-sig-proceedings-long-author-list.csl
bib_acm_short = $(bib_styles)/acm-sig-proceedings.csl
bib_ieee      = $(bib_styles)/ieee-with-url.csl

# CHANGE: change this to use your custom citation style
bib_style     = $(bib_ieee)
## ---------------------------------------------------------------------------
#  -- Rendering --------------------------------------------------------------
## ---------------------------------------------------------------------------

# pandoc custom command
# Don't change this unless you know what you're doing
# Errors are reported in $(outputdir)/pandoc.log
define pandoc
	pandoc "$(basedir)"/metadata.yaml \
		"$(inputdir)"/*.md \
	-o "$(outputdir)/$(1)" \
	--template="$(styledir)/template.tex" \
	-H "$(styledir)/preamble.tex" \
	--csl="$(bib_style)" \
	--metadata link-as-notes \
	--bibliography="$(bibfile)" 2>"$(outputdir)"/pandoc.log \
	-V papersize=a4 \
	-V links-as-notes=true \
	-V documentclass:"$(styledir)/ociamthesis" \
	--metadata link-citations \
	-V fontsize=11pt \
	--chapters \
	-N \
	--latex-engine=xelatex \
	$(2)

endef

all: pdf tex docx

pdf:
	@echo "Building $(out_name).pdf..."
	@$(call pandoc,"$(out_name).pdf")

tex:
	@echo "Building $(out_name).tex..."
	@$(call pandoc,"$(out_name).tex")

docx:
	@echo "Building $(out_name).docx..."
	@$(call pandoc,"$(out_name).docx","--toc")

html:
	pandoc "$(inputdir)"/*.md \
	-o "$(outputdir)/$(out_name).html" \
	--standalone \
	--template="$(styledir)/template.html" \
	--bibliography="$(bibfile)" 2>"$(outputdir)"/pandoc.log \
	--csl="$(bib_style)" \
	--include-in-header="$(styledir)/style.css" \
	--toc \
	--number-sections
	rm -rf "$(outputdir)/source"
	mkdir "$(outputdir)/source"
	cp -r figures "$(outputdir)/source/figures"

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

.PHONY: help pdf docx html tex
