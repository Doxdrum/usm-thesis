usm-thesis
==========

This is an attempt to create a LaTeX template for Thesis presented at the Universidad Tecnica Federico Santa Maria (or USM or UTFSM), from Chile (and Ecuator)

## Initial Steps ##

This class is based on the standard `book` class of LaTeX, so it accept structure given by `part`s, `chapter`s, `section`s, `subsection`s, `paragraph`s and `subparagraph`s.

### Packages ###

This class was born in the physics department, so it loads many mathematical packages, such as:

- `amsmath`
- `amstext`
- `amsfonts`
- `amssymb`
- `amsthm`
- `mathrsfs`
- `dsfont`
- `stmaryrd`

Additionally, some useful packages are load:

- `graphicx`: allow the inclusion of figures
- `xcolor`: allows the use of colours (even their mixing)
- `hyperref`: allows the use of *hyperlinks*

	Options: `linktocpage,colorlinks=true,urlcolor=blue,linkcolor=blue,citecolor=red`

- `caption`: allows customisation of captions

	Options: `margin=20pt,format=hang,font=small,labelfont=sc,textfont=sl`
	
- `tikz`: useful to draw using code
    - `pgfplots`: allows the creation of scientific plots using `tikz`
    - `pgfplotstable`:allows the creation of tables (with ease) from data files, using `tiks` and `pgfplots`
- `array`: allows the use of extra column behaviours in tables
- `siunitx`: defines commands for   different physical units, numerical quantities and tables.
- `subfigure`
- `titlesec`: Redefines the sectioning typography. It uses `tikz` in the design.

### Title Page ###

For defining the *title page* one uses a couple of commands:

- **In the preamble**: a command called `\definethesis` which accepts two arguments, the *title* and the *author*.

        \definethesis{The title  %Here the title
           }{The Author   %Here the Author
           }

- **In the body**: a command called `\thesistitlepage` which takes three arguments:
    - Name of the advisor,
    - The thesis statement, and
    - the date

            \thesistitlepage{Advisor: Iv\'an Schmidt % Name of the advisor
               }{Trabajo de tesis presentado en cumplimiento parcial de los requisitos para el grado de Magister en Ciencias, menci\'on f\'isica, de la Universidad T\'ecnica Federico Santa Mar\'ia. %The thesis statement
               }{August, 2014 %The date
               }

### Front Matter ###

