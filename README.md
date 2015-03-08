usm-thesis
==========

This is an attempt to create a LaTeX template for Thesis presented at the Universidad Tecnica Federico Santa Maria (or USM or UTFSM).

## Initial Steps ##

This class is based on the standard `book` class of LaTeX, so it accept structure given by `part`s, `chapter`s, `section`s, `subsection`s, `paragraph`s and `subparagraph`s.

### Packages ###

This class was born in the physics department, so it loads many mathematical packages, such as:

- `xparse`
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
    - `mdframed`: uses `tikz`for drawing coloured boxes
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

After generating the title page, as customary in the `book` class, the front-matter can be declared using the command `\frontmatter`.

- For the front matter, page style *special*. That is achieved with the command `\pagestyle{special}`

- In order to generate the *committee page* (where the members of the committee sign the thesis), the class provides the command `\committee` with accepts arguments in the form of a comma separated list, containing the *name* and *affiliation* of each member of the committee.

		\committee{
          {Iv\'an Schmidt}{USM},
          {Jorge Zanelli}{CECS},
		  {Claudio Dib}{USM},
		  {Stanley Kubrick}{Bates}
		}

- There is a `\Dedication` command which takes one argument. It places the dedicatory is placed in the lower part of the page and flushed right.

- The class also provides a command to create a *creative commons* box. The command is `\CC`. By default the box creates a *Creative Commons Attribution-ShareAlike 4.0 Unported License* (`by-sa`) logo.

### Main Matter ###

In this part of the document one should call the `\chapter`s composing the thesis.

- The first command after the `\mainmatter` is `\pagestyle{main}`, which changes the numeration of the pages and the format for the new chapters.
- For the sake of clarity, the plain LaTeX files should be saved in the folder called `Documents`, and to insert their content into the thesis one uses the command `\input{Documents/xxxxxxxx}`, where `xxxxxxxx` is the name of the file. **Note:** since only `tex` files are supposed to be on the folder, no extension is needed. *Example:*

		\input{Documents/ch1}
		\input{Documents/ch2}
		\input{Documents/ch3}

- As in a standard book, appendices can be included after the command `\appendix`. Notice that the chapter numeration changes to *capitalised* alphabet letters. *Example:*

		\appendix
		\input{Documents/ap1}
		\input{Documents/ap2}

### Back Matter ###

The `\backmatter` command denotes the ending of the body of the thesis, and at this stage one should add the **bibliography**.

Since the best way of generating the bibliography is to use `bibtex`, in the `Base.tex` file a line of reference-calling was added.

	\nocite{IAS1,IAS2,Gilmore,...,CY-friends}

Notice that this is for the sake of completeness in the example... Please, remove this line when you start writing your manuscript!!!

The `bibtex` style used by the class is `utphys`, which is compatible with **arXiv** citations and **DOI** hyper-reference.

	\bibliographystyle{utphys}
	\bibliography{References}
	\addcontentsline{toc}{chapter}{\bibname}

- Since `utphys.bst` is not included in the standard LaTeX distribution, it has been included in the bundle of files.
- A (huge) exaple of bibfile called `References.bib` has been included as well. It is highly recommended that you start your own bibfile.
- If you start your new bibfile, and you call it `YYYYYYYY.bib`, then you should change the command `\bibliography{References}` to `\bibliography{YYYYYYYY}`.
