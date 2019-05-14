% Created by Alistair Smith, Sunrise Setting Ltd, 14 June 2004
% KERauth.cls --- Knowledge Engineering Review
%
% CUP Knowledge Engineering Review document class KERauth.CLS
% Copyright 2004 Cambridge University Press
%
% This software may only be used in the preparation of journal articles
% or books or parts of books to be published by Cambridge University Press.
% Any other use constitutes an infringement of copyright.
%
% Based on the original LaTeX ARTICLE DOCUMENT CLASS
% by Leslie Lamport
%
% Changes log

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{kerauth}[2004/06/14 v1.00 The Knowledge Engineering Review]
              
\def\thejournal{The Knowledge Engineering Review}
\def\thedoipream{10.1017/}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass{article}
\RequirePackage{pifont,latexsym,ifthen,theorem,booktabs}
\RequirePackage{amsfonts,amssymb,amsbsy,amsmath,amscd}
\RequirePackage[dvips]{graphicx}
\RequirePackage{rotating}
\RequirePackage[errorshow]{tracefnt}

\renewcommand{\normalsize}{\fontsize{10}{13pt}\selectfont}
\renewcommand{\small}{\fontsize{9}{10.5pt}\selectfont}
\renewcommand{\footnotesize}{\fontsize{8}{9pt}\selectfont}
\renewcommand{\scriptsize}{\fontsize{7}{8pt}\selectfont}
\renewcommand{\tiny}{\fontsize{5}{6pt}\selectfont}
\renewcommand{\large}{\fontsize{12}{14pt}\selectfont}
\renewcommand{\Large}{\fontsize{14}{18pt}\selectfont}
\renewcommand{\LARGE}{\fontsize{17}{22pt}\selectfont}
\renewcommand{\huge}{\fontsize{20}{25pt}\selectfont}
\renewcommand{\Huge}{\fontsize{25}{30pt}\selectfont}

\newcommand{\authorsize}{\fontsize{12}{14pt}\selectfont}
\newcommand{\titlesize}{\fontsize{18}{22pt}\selectfont}
\newcommand{\sectionsize}{\fontsize{10.5}{12pt}\selectfont}
\newcommand{\fakescsize}{\fontsize{8.5}{9.5pt}\selectfont}

%Page and general

\@twosidetrue
\frenchspacing
\flushbottom

\setlength\voffset{-1in}
\setlength\hoffset{-1in}
\setlength\paperheight{297mm}
\setlength\paperwidth{210mm}
\setlength\columnsep{1.5pc}
\textwidth 35pc
\topskip 13pt
\textheight 56pc 
\topmargin 4pc
\setlength\oddsidemargin{30mm}
\setlength\evensidemargin{25mm}

%Needed to set PDF page size
\special{papersize=210mm,297mm}

\parindent 12pt
\headsep 15pt
\headheight 20pt
\footskip 20pt
\hyphenpenalty=800
\doublehyphendemerits=10000
\lefthyphenmin=3 
\hbadness=10000
\vbadness=10000
\brokenpenalty=10000
\displaywidowpenalty=0
\clubpenalty=10000
\widowpenalty=10000
\sloppy
\setlength{\abovedisplayskip}{10\p@ plus2\p@ minus5\p@}
\setlength{\belowdisplayskip}{\abovedisplayskip}
\setlength{\abovedisplayshortskip}{\z@ \@plus3\p@}
\setlength{\belowdisplayshortskip}{6\p@ \@plus3\p@ \@minus3\p@}
\setcounter{topnumber}{5}
\def\topfraction{1}
\setcounter{bottomnumber}{5}
\def\bottomfraction{.8}
\setcounter{totalnumber}{10}
\def\textfraction{0}
\renewcommand{\floatpagefraction}{0.95}
\renewcommand{\dblfloatpagefraction}{0.95}
\renewcommand{\dbltopfraction}{1}

\thinmuskip = 4mu
\medmuskip = 4mu
\thickmuskip = 4mu
\multlinegap = 0pt
\setlength{\jot}{5pt}

\theorembodyfont{\it}
\theoremheaderfont{\bf}
\setlength{\theorempreskipamount}{8pt plus 2pt}
\setlength{\theorempostskipamount}{8pt plus 2pt}

\begingroup \makeatletter
\gdef\th@plain{\normalfont\itshape
  \def\@begintheorem##1##2{%
        \item[\hskip\labelsep\theorem@headerfont ##1\ {##2}\hspace{1em}]}%
\def\@opargbegintheorem##1##2##3{%
   \item[\hskip\labelsep\theorem@headerfont ##1\ ##2\ (##3)\hspace{1em}]}}
\endgroup

\newenvironment{proof}{%
\vspace{\theorempreskipamount}{\noindent\textbf{Proof}}\hspace{1em}\ignorespaces}%
{~{\hfill$\Box$}\vspace{\theorempostskipamount}}

\newenvironment{remarknn}{\vspace{\theorempostskipamount}
\noindent\textbf{Remark}\hspace{1em}\ignorespaces}{\vspace{\theorempostskipamount}}

\def\refname{References}
\def\figurename{Figure}
\def\tablename{Table}
\def\abstractname{Abstract}

% Title page

% print integer as a zero filled 2 digit field
\def\twodigits#1{\ifnum #1 < 10{0#1}\else{#1}\fi}

% print integer as a zero filled 4 digit field
\def\fourdigits#1{\ifnum #1 < 10{000#1}\else
  \ifnum #1 < 100{00#1}\else
    \ifnum #1 < 1000{0#1}\else{#1}\fi
  \fi
\fi}

%\gdef\received#1{\gdef\@myreceive{\emph{Received} #1}}
%\gdef\accepted#1{\gdef\@myaccepted{\emph{Accepted} #1}}
%\gdef\online#1{\gdef\@myonline{\emph{Published online} #1}}
%\gdef\noreceived#1{\gdef\@myreceive{#1}}
%\gdef\noaccepted#1{\gdef\@myaccepted{#1}}
%\gdef\noonline#1{\gdef\@myonline{#1\mbox{}}}

%First page catchline
%KER{first page}{last page}{vol}{issue}{year}{doi}
\def\KER#1#2#3#4#5#6{
\gdef\@mymainhead{\parbox[t]{\textwidth}{%
\noindent\sectionsize{\textit{\thejournal},\ Vol.\ \thevolume:\theissue,\ %
\ifnum \thefirstpage = \thelastpage \thelastpage \else \thefirstpage--\thelastpage\fi.\ %
\copyright\ \theyear,\ Cambridge University Press\\
\noindent DOI: \thedoipream\thedoi}\hspace{1em}Printed in the United Kingdom%
}}
\setcounter{page}{#1}
\def\thefirstpage{#1}
\def\thelastpage{#2}
\def\thevolume{#3}
\def\theissue{#4}
\def\theyear{#5}
\def\thedoi{#6}}

\gdef\@mymainfoot{}

\def\ps@myplain{\let\@mkboth\@gobbletwo
  \def\@oddhead{\parbox[t]{\textwidth}{%\@timestamp\\[42pt]%
  \vspace*{-7pt}
  \@mymainhead}}
  \def\@evenhead{}
  \def\@evenfoot{}
\def\@oddfoot{\@mymainfoot}}

\thispagestyle{myplain}

%Headers and footers for non-title pages

\def\runningheads#1#2{\markboth{\lowercase{#1}}{#2}}

\def\ps@ker{%
\let\@mkboth\@gobbletwo
\def\@evenhead{\parbox[b]{\textwidth}{%\addtocounter{sheetcount}{1}\@timestamp\\[42pt]%
\sectionsize%
\thepage\hfill{\sc\leftmark}\hfill$\phantom{\thepage}$}}
\def\@oddhead{\parbox[b]{\textwidth}{%\addtocounter{sheetcount}{1}\@timestamp\\[42pt]%
\sectionsize%
$\phantom{\thepage}$\hfill\textit{\rightmark}\hfill\thepage}}
\def\@evenfoot{}
\def\@oddfoot{}
}

\pagestyle{ker}

%%%%%%%%%
%Title, author, etc

\def\title#1{%
\vspace*{7pt}
\noindent\titlesize\textsf{#1}\par
\vspace*{10pt}}

\def\author#1{\vspace*{12pt}\noindent\authorsize #1\par\vspace*{6pt}}

\def\address#1{\noindent\footnotesize\textit{#1}\par\normalsize}

\def\abstract{\vspace*{42pt}\section*{\abstractname}\normalsize}%
\def\endabstract{\par\vspace*{12pt}}

\def\keywords#1{\baselineskip 10pt 
\begin{center}{\small\bfseries Keywords:\ #1}
\end{center}\normalsize}

\def\nosections{\vspace{30\p@ plus12\p@ minus12\p@}
\noindent\ignorespaces}

%define section heads etc for style

\def\thesection{\arabic{section}}
\def\thesubsection{\thesection.\arabic{subsection}}
\def\thesubsubsection{\thesubsection.\arabic{subsubsection}}
%\def\theparagraph{\thesubsubsection.\arabic{paragraph}}
%\def\thesubparagraph{\theparagraph.\arabic{subparagraph}}

\def\@seccntformat#1{{\csname the#1\endcsname}\hspace{1em}}

\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-12pt plus -3pt minus -1pt}%
                                   {+6pt plus 3pt minus 1pt}%
                                   {\raggedright\sectionsize\bfseries}}

\def\subsection{
\@startsection
{subsection}%           the name
{2}%                 the level
{\z@}%               the indent
{-3.5ex plus -1ex minus -.2ex}%  the beforeskip
{+6pt plus 3pt minus 1pt}%     the afterskip
{\noindent\sectionsize\itshape}}% the style
%%
%%
\def\subsubsection{
\@startsection
{subsubsection}%           the name
{3}%                 the level
{\z@}%               the indent
{-3.5ex plus -1ex minus -.2ex}%  the beforeskip
{+0.01pt}%     the afterskip
{\noindent\sectionsize\itshape}}% the style
%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\appendix}{\setcounter{section}{0}\renewcommand{\thesection}{\Alph{section}}
\renewcommand{\section}{\makeatletter
\renewcommand{\@seccntformat}[1]{{\appendixname\ \csname thesection\endcsname}\hspace{1ex}}
\makeatother
\@startsection
{section}%                                            the name
{1}%                                                  the level
{0pt}%                                                the indent
{\baselineskip}%                                      the beforeskip
{0.5\baselineskip}%                                   the afterskip
{\centering\sectionsize\bfseries}}%  the style
}

%%
%lists etc

\def\enumerate{\ifnum \@enumdepth >3 \@toodeep\else
      \advance\@enumdepth \@ne 
      \edef\@enumctr{enum\romannumeral\the\@enumdepth}\list
      {\csname label\@enumctr\endcsname}{\usecounter
        {\@enumctr}\parsep=0pt\leftmargin=18pt
\labelsep=4pt\labelwidth=\leftmargin
\advance\labelwidth-\labelsep
\itemsep=0pt\def\makelabel##1{\hbox to\labelwidth{##1\hss}}}\fi}

\let\endenumerate =\endlist

\def\itemize{\ifnum \@itemdepth >3 \@toodeep\else \advance\@itemdepth \@ne
\edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
\list{\csname\@itemitem\endcsname}{\parsep=0pt\leftmargin=18pt
\labelsep=4pt\labelwidth=\leftmargin
\advance\labelwidth-\labelsep
\itemsep=0pt\def\makelabel##1{\hbox to\labelwidth{##1\hss}}}\fi}

\let\enditemize =\endlist

%%%%%%%%%%%%%%%%
%Footnotes
\renewcommand{\thefootnote}{\arabic{footnote}}
\long\def\@makefntext#1{\parindent 1em%
\small\noindent{$\m@th^{\@thefnmark}$}#1}
\renewcommand{\footnoterule}{}

\def\comma{$^{\text{,}}$}

%Figure and tables

%To force more space above graphics
\renewenvironment{figure}{%
\@ifnextchar[%
{\@float{figure}}
{\@float{figure}\vspace*{7pt}}}
{\end@float}

\renewenvironment{figure*}{%
\@ifnextchar[%
{\@float{figure*}}
{\@float{figure*}\vspace*{7pt}}}
{\end@float}

\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{10\p@}
\long\def\@makecaption#1#2{%
  \ifnum\@tempcnta<64\vspace\abovecaptionskip\fi
  \sbox\@tempboxa{\small\textbf{#1}\hspace*{1ex} #2}%
  \ifdim \wd\@tempboxa >\hsize
    \small\textbf{#1}\hspace*{1ex} #2\par
  \else
    \global \@minipagefalse
    %\hbox to\hsize{\hfil\box\@tempboxa\hfil}%centered short line
    \small\textbf{#1}\hspace*{1ex} #2\par
  \fi
  \ifnum\@tempcnta<64\else\vskip\belowcaptionskip\fi}

\long\def\@maketabcaption#1#2{%
  \ifnum\@tempcnta<64\vspace\abovecaptionskip\fi
  \sbox\@tempboxa{\small\textbf{#1}\hspace*{1ex} #2}%
  \ifdim \wd\@tempboxa >\hsize
    \small\textbf{#1}\hspace*{1ex} #2\par
  \else
    \global \@minipagefalse
    \hbox to\hsize{\hfil\box\@tempboxa\hfil}%centered short line
   \fi
  \ifnum\@tempcnta<64\else\vskip\belowcaptionskip\fi}

\renewenvironment{table}{\let\@makecaption\@maketabcaption\@float{table}}
{\end@float}

\heavyrulewidth=1.0pt
\lightrulewidth=0.5pt
\cmidrulewidth=0.3pt

%%%%%%%%%%%%%%%%%%

%Acks
\def\ack{\subsection*{Acknowledgement}}%
\def\acks{\subsection*{Acknowledgements}}

%References

\newenvironment{thereferences}{\section*{\refname}\par
\list{}{\topsep=0\p@\parsep=0\p@
\partopsep=0\p@\itemsep=0\p@\labelsep=0\p@\itemindent=-12\p@
\labelwidth=0\p@\leftmargin=12\p@
}\small\rm
\def\newblock{\ }
\sloppy\clubpenalty4000\widowpenalty4000
\sfcode`\.=1000\relax}{\endlist}

\renewenvironment{thebibliography}{\section*{\refname}\par
\list{}{\topsep=0\p@\parsep=0\p@
\partopsep=0\p@\itemsep=0\p@\labelsep=0\p@\itemindent=-12\p@
\labelwidth=0\p@\leftmargin=12\p@
}\small\rm
\def\newblock{\ }
\sloppy\clubpenalty4000\widowpenalty4000
\sfcode`\.=1000\relax}{\endlist}

\def\affil#1{$^{#1}$}
\def\affilnum#1{$^{#1}$}

\def\email#1{E-mail: {#1}}

%Other macros
\def\proc#1{\medbreak\noindent{\it #1}\hspace{1ex}\ignorespaces}
\def\mb{\medbreak}

\def\endcolumn{\parfillskip=0pt\par\newpage
   \noindent\parfillskip=0pt plus 1fil{}}

\def\doublespacing{\renewcommand{\baselinestretch}{1.66}}

\hyphenation{analy-sis}
\hyphenation{homeo-morphisms}
\hyphenation{homeo-morphism}
\hyphenation{homo-morphisms}
\hyphenation{homo-morphism}
\hyphenation{diffeo-morphisms}
\hyphenation{diffeo-morphism}
