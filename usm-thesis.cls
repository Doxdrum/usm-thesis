\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{usm-thesis}[01/08/2010 LaTeX package for USM thesis]


%--------- Based on `book' class
\LoadClass[letterpaper]{book}

%--------- Include the following packages
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
\RequirePackage[Lenny]{fncychap}
\RequirePackage[linktocpage,colorlinks=true,urlcolor=green,linkcolor=blue,citecolor=red]{hyperref}
%% \hypersetup{linktocpage}
\RequirePackage{subfigure}
\RequirePackage{centernot}
%% \RequirePackage{wrapfig}
%% \RequirePackage{fancybox}
\RequirePackage{array}
\RequirePackage{xcolor}
\RequirePackage{tikz}
\RequirePackage{pgfplots}
%% \RequirePackage{bclogo}
%% \RequirePackage[framemethod=tikz]{mdframed}



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
    \includegraphics[scale=.6]{Pict/UTFSM-logo.pdf}\\
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

\DeclareRobustCommand{\committee}[5]{
\noindent T\'ITULO DE LA TESIS:

\begin{center}
  {\bf \sc \LARGE \thetitle}
\end{center}

\vspace{1.5cm}

\noindent AUTOR:

\begin{center}
  {\bf\sc\Large \theauthor}
\end{center}

\vspace{\stretch{1}}

\begin{center}
  {\Large \comentario}
\end{center}
%Trabajo de tesis presentado en cumplimiento parcial de los requisitos para el grado de Magister en Ciencias, mensi\'on f\'isica, de la Universidad T\'ecnica Federico Santa Mar\'ia.
\vspace{\stretch{2}}

{\bf COMISI\'ON EXAMINADORA:}
\vspace{.8cm}
\begin{center}
  \begin{tabular}{lp{7.5cm}}
    #1 & \dotfill \\

    & \vspace{0.8cm}\\
    #2 & \dotfill \\
 
    & \vspace{0.8cm}\\
    #3 &\dotfill  \\
 
    & \vspace{0.8cm}\\
    #4 & \dotfill 
  \end{tabular}
\end{center} 
\vspace{\stretch{1}}


\begin{flushright}
  #5
\end{flushright}
}

\DeclareRobustCommand{\Dedication}[1]{
  \newpage
  \vspace*{\stretch{5}}
  \begin{flushright}
    #1
  \end{flushright}
  \vspace*{\stretch{1}}
}

\definecolor{cccolor}{rgb}{.67,.7,.67}
\DeclareRobustCommand{\CC}{
  \newpage
  \vspace*{\stretch{5}}
  
  \begin{mdframed}[outerlinecolor=black,outerlinewidth=2pt,linecolor=cccolor,middlelinewidth=3pt,roundcorner=10pt]
    
    \begin{center}
      This work is licensed under a \href{http://creativecommons.org/licenses/by-sa/3.0/}{Creative Commons Attribution-ShareAlike 3.0 Unported License}.
      
      \includegraphics[scale=2]{Pict/by-nc-sa.pdf}
    \end{center}
  \end{mdframed}
  \vspace*{\stretch{1}}
}

%---------------- Titlesec 
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

\makeatletter
\def\@makechapterhead#1{%
  \vspace*{10\p@}%
  {\parindent \z@ \raggedleft \reset@font
   \@chapapp{} \thechapter\par\nobreak
   {\Huge \scshape \bfseries #1\vadjust{\putline}\par\nobreak}%
   \vspace{40pt}
  }}
\makeatother
\newcommand{\putline}{%
  \kern10pt %%% <-- adjust here
  \hbox{\tikz \shade[left color=blue!20,right color=blue, shading angle=45] (0,0) rectangle (\textwidth,5pt);}%
}
%\renewcommand{\thechapter}{\Roman{chapter}}
%\titleformat{\chapter}[display]
%   {\normalfont\Large\filcenter\sffamily}
%   {\titlerule[1pt]
%    \vspace{1pt}
%    \titlerule
%    \vspace{1pt}
%    \LARGE\MakeUppercase{\chaptertitlename} \thechapter}
%   {1pc}
%   {\titlerule
%    \vspace{1pc}
%    \Huge}
%\titleformat{\section}
%   {\LARGE\sffamily\slshape}
%   {\thesection}{1em}{}
%\titlespacing{\section}
%   {6pc}{3.5ex plus .1ex minus .2ex}{1.5ex minus .1ex}
%\widenhead{6pc}{0pc}
%\renewpagestyle{plain}{}
%\newpagestyle{special}[\small\sffamily]{
%   \headrule
%   \sethead[\usepage][\textsl{\thechaptertitle}][]
%                  {}{\textsl{\thechaptertitle}}{\usepage}}
%\newpagestyle{main}[\small\sffamily]{
%   \headrule
%   \sethead[\usepage][\textsl{\thechapter.}][]
%                  {}{\textsl{\thechapter. \thesection}}{\usepage}}

%---------------- Geometry (margins... et cetera.)
%\usepackage[letterpaper,includeheadfoot]{geometry}
%\geometry{hmargin={3cm,0.8in},height=6in}
%\geometry{height=8.5in}
\usepackage[paper=letterpaper,textwidth=169mm,textheight=229mm,hmarginratio=1:1,vmarginratio=1:1]{geometry}

\newcommand{\thesistypeout}{\typeout{hepthesis: thesis- prefix commands are deprecated}}
\DeclareRobustCommand{\thesistitlepage}[3]{\thesistypeout\titlepage{#1}{#2}{#3}}
