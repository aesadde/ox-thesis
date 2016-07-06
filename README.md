# Oxford thesis template

This repository contains templates to render a thesis with the format required
by Oxford University.

This is an adaptation of the [ociamthesis](https://www.maths.ox.ac.uk/members/it/faqs/latex/thesis-class) class that I use in conjunction with
pandoc-markdown.


## Usage

- Clone the repo

- Change the relevant bits of `metadata.yaml`

- Add your content in markdown inside the `source` dir

- Run:

  * `make tex` if you want a `.tex` file
  * `make pdf` to render the thesis to a `.pdf`
  * `make docx` to render the thesis as a word-document.
  * `make html` to render the thesis as a webpage.
  * `make all` to render all the above at once

- Rendered files will be in the `output` dir.

## Customisation

There is plenty of things you can customise. Most common options are in the yaml
metadata but other things require more tweaking.


### Referencing

I've provided three common referencing styles used in Computer Science, if you
need a different one simply add the relevant file to the `style/citation_styles`
directory and change the relevant `bib_style` variable in the `makefile`.
