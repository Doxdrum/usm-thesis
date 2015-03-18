%% usm-thesis.cls
%% Class for writing thesis for the
%% Universidad Tecnica Federico Santa Maria
%% 2014/08/24 Oscar Castillo-Felisola
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%% Class Structure:
%% ----------------------------- Identification 
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{usm-thesis}[2015/03/08 v1.0b LaTeX package for USM thesis]
\DeclareOption{letterpaper}{\PassOptionsToClass{letterpaper}{book}}
\DeclareOption{10pt}{\PassOptionsToClass{10pt}{book}}
\DeclareOption{11pt}{\PassOptionsToClass{11pt}{book}}
\DeclareOption{12pt}{\PassOptionsToClass{12pt}{book}}
\DeclareOption{oneside}{\PassOptionsToClass{oneside}{book}}
\DeclareOption{twoside}{\PassOptionsToClass{twoside}{book}}
\DeclareOption{draft}{\PassOptionsToClass{draft}{book}}
\DeclareOption{final}{\PassOptionsToClass{final}{book}}
\DeclareOption{openright}{\PassOptionsToClass{openright}{book}}
\DeclareOption{openany}{\PassOptionsToClass{openany}{book}}
\DeclareOption{leqno}{\PassOptionsToClass{leqno}{book}}
\DeclareOption{fleqn}{\PassOptionsToClass{fleqn}{book}}
\DeclareOption*{%
  \ClassWarning{usm-thesis}{Unknown option `\CurrentOption' ignored}%
}
%% \DeclareOption{openbib}{%
%%   \AtEndOfPackage{%
%%    \renewcommand\@openbib@code{%
%%       \advance\leftmargin\bibindent
%%       \itemindent -\bibindent
%%       \listparindent \itemindent
%%       \parsep \z@
%%       }%
%%    \renewcommand\newblock{\par}}%
%% }
\ExecuteOptions{10pt,twoside,onecolumn,final,openright}
\ProcessOptions\relax
%% \input{bk1\@ptsize.clo}

%--------- Based on `book' class
\LoadClass[letterpaper]{book}


%% \providecommand*{\titcomment}{THESIS TITLE}

%% \DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
%% \ProcessOptions\relax


%--------- Include the following packages
\RequirePackage{xparse}
\RequirePackage{ifthen}
\RequirePackage{amsmath} 
\RequirePackage{amstext}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{mathrsfs}
\RequirePackage{dsfont}
\RequirePackage{stmaryrd}
%% \RequirePackage{feyn}
%% \RequirePackage{pdftricks}
\RequirePackage{graphicx}
\RequirePackage[margin=20pt,format=hang,font=small,labelfont=sc,textfont=sl]{caption}
%% \RequirePackage[Lenny]{fncychap}
\RequirePackage{xcolor}
\RequirePackage{subfigure}
\RequirePackage{centernot}
\RequirePackage{array}
\RequirePackage{tikz}
\RequirePackage{pgfplots}
\RequirePackage{pgfplotstable}
\RequirePackage[framemethod=tikz]{mdframed}
\RequirePackage{siunitx}
\RequirePackage{lmodern}
\RequirePackage{etoolbox}
\RequirePackage[textwidth=169mm,textheight=229mm,hmarginratio=1:1,vmarginratio=1:1]{geometry}
\AtEndPreamble{
  \RequirePackage[linktocpage,colorlinks=true,urlcolor=blue,linkcolor=blue,citecolor=red]{hyperref}
}

\newcommand\HRule{\noindent\rule{\linewidth}{1.5pt}}

\renewcommand{\normalsize}{\fontsize{12pt}{14pt}\selectfont}
%\setlength{\textwidth}{14 cm}
%\setlength{\textheight}{20 cm}
\pagenumbering{arabic}

%% Command for defining the title and author in the preamble
\DeclareRobustCommand{\definethesis}[2]{%
  \DeclareRobustCommand{\@thesistitle}{#1}%
  \DeclareRobustCommand{\@thesisauthor}{#2}%
  \author{\@thesisauthor}%
  \title{\@thesistitle}%
  \DeclareRobustCommand{\thetitle}{#1}%
  \DeclareRobustCommand{\theauthor}{#2}%
}





%% Makes a thesis title page
\let\@oldtitlepage\titlepage
\let\@oldendtitlepage\endtitlepage
\DeclareRobustCommand{\titlepage}[3]{%
  \@oldtitlepage%
%%%%%%%%%
  \begin{center}
    \includegraphics[scale=.6]{Pictures/UTFSM-logo.pdf}\\
    {\large Universidad T\'ecnica Federico Santa Mar\'ia.}\\
    {\large Departamento de F\'isica.}
  \end{center}


  \vspace*{\stretch{1}}
  \putline%\HRule
  \begin{center}%
%    \vspace*{\frontmattertitleskip}%
%    \begin{doublespace}%
      {\Huge\bf{\@thesistitle}}%
%    \end{doublespace}%
  \end{center}
  \putline%\HRule
    \vspace*{\stretch{1}}%
    \begin{center}
      {{\Large\bf{\@thesisauthor}} \\ {{#1}}}%	
    \end{center}
            \vspace*{\stretch{2}}%
    \begin{center}
    {\parbox{12cm}{
        \begin{center}
          #2
        \end{center}
      }\vspace{5mm}}\\%
    {#3}
    \end{center}
%  \end{center}%
  \@oldendtitlepage
  %\cleardoublepage%
  { \thispagestyle{empty}\newpage}
  \DeclareRobustCommand{\comentario}{\parbox{14cm}{\begin{center} #2 \end{center}}}
}


%--------- Committee page
\DeclareRobustCommand{\titcomment}{THESIS~TITLE}
\DeclareRobustCommand{\autcomment}{AUTHOR}
\DeclareRobustCommand{\comcomment}{EXAMINATION~COMMITTEE}
\DeclareRobustCommand{\committeename}{Committee}
\DeclareRobustCommand{\titlename}{Front~page}
\AtBeginDocument{
  \@ifpackagewith{babel}{spanish}{%
    \addto\captionsspanish{\renewcommand*\titcomment{T\'ITULO~DE~LA~TESIS}%
      \renewcommand*\autcomment{AUTOR}%
      \renewcommand*\comcomment{COMISI\'ON~EXAMINADORA}%
      \renewcommand*\titlename{Portada}%
      \renewcommand*\committeename{Comit\'e~evaluador}
    }
  }{}
}
\ExplSyntaxOn
\NewDocumentCommand{\committee}{ >{ \SplitList {,} } m } {
  \pdfbookmark{\committeename}{comite}
  \noindent \titcomment :%%\mbox{T\'ITULO DE LA TESIS:}

  \begin{center}
    { \sc \LARGE \thetitle}
  \end{center}

  \vspace{1.5cm}

  \noindent \autcomment :

  \begin{center}
    {\sc \Large \theauthor}
  \end{center}

  \vspace{\stretch{1}}

  \begin{center}
    {\Large \comentario}
  \end{center}

  \vspace{\stretch{2}}
         {\bf \comcomment :}
         \vspace{.8cm}
         \begin{center}
           \begin{tabular}{lcp{7.5cm}}
             \ProcessList{ #1 }{ \__comm_process_argument:n }
           \end{tabular}
         \end{center}
         \vspace{\stretch{1}}
         \begin{flushright}
           \today
         \end{flushright}
}
\cs_new_protected:Nn \__comm_process_argument:n {
  \__comm_name:nn #1 
}
\cs_new_protected:Nn \__comm_name:nn {
  #1 &(#2) & \dotfill \\
  & \vspace{0.8cm} & \\
}
\ExplSyntaxOff

\DeclareRobustCommand{\Dedication}[1]{
  \newpage
  \vspace*{\stretch{5}}
  \begin{flushright}
    {\Large #1}
  \end{flushright}
  \vspace*{\stretch{1}}
}

\DeclareRobustCommand{\CCintro}{This work is licensed under a}
\newcommand{\CClink}[1]{http://creativecommons.org/licenses/#1/4.0/}
\DeclareRobustCommand{\CCcomment}[1]{%
  \ifthenelse{\equal{#1}{by-sa}}{Creative Commons Attribution-ShareAlike 4.0 International License}{}
  \ifthenelse{\equal{#1}{by-nc-sa}}{Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License}{}
}
\definecolor{cccolor}{rgb}{.67,.7,.67}
\DeclareRobustCommand{\CC}[1][by-sa]{
  \newpage
  \vspace*{\stretch{5}}  
  \begin{mdframed}[outerlinecolor=black,outerlinewidth=2pt,linecolor=cccolor,middlelinewidth=3pt,roundcorner=10pt]    
    \begin{center}
      \CCintro~\href{\CClink{#1}}{\CCcomment{#1}}
      
      \includegraphics[scale=2]{Pictures/#1.pdf}
    \end{center}
  \end{mdframed}
  \vspace*{\stretch{1}}
}

%% ---------------- Titlesec 
\RequirePackage[explicit]{titlesec}
\renewpagestyle{plain}[\small\sffamily\scshape]{
  \footrule
  \setfoot{\theauthor}{}{\usepage}}
\newpagestyle{main}[\small\sffamily\scshape]{
  \headrule
  \sethead[\thechapter. \chaptertitle][][]{}{}{\thesection. \sectiontitle}
  \footrule
  \setfoot[\usepage][][]{}{}{\usepage}}
\newpagestyle{special}[\small\sffamily\scshape]{
  \headrule
  \sethead[\chaptertitle][][]{}{}{\sectiontitle}
  \footrule
  \setfoot[\usepage][][]{\theauthor}{}{\usepage}}

\appto\frontmatter{\pagestyle{special}}
\appto\mainmatter{\pagestyle{main}}
%% \appto\backmatter{\pagestyle{}}


%\makeatletter
\def\@makechapterhead#1{%
  \vspace*{10\p@}%
  {\parindent \z@ \raggedleft \reset@font
   \@chapapp{} \thechapter\par\nobreak
            {\Huge \bfseries #1\vadjust{\putline}\par\nobreak}%
   \vspace{40pt}
  }}
%\makeatother
\newcommand{\putline}{%
  \kern10pt %%% <-- adjust here
  \hbox{\tikz \shade[left color=blue!20,right color=blue, shading angle=45] (0,0) rectangle (\textwidth,5pt);}%
}

\DeclareRobustCommand{\thesistitlepage}[3]{\pdfbookmark{\titlename}{portada}\titlepage{#1}{#2}{#3}}
\let\oldtableofcontents=\tableofcontents
\renewcommand\tableofcontents{\cleardoublepage\pdfbookmark{\contentsname}{toc}\oldtableofcontents}
