%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Medium Length Professional CV - RESUME CLASS FILE
%
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
%
% This class file defines the structure and design of the template.
%
% Original header:
% Copyright (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved. This file is offered as-is,
% without any warranty.
%
% Created by Trey Hunner and modified by www.LaTeXTemplates.com and Dylan Ashley
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{cv}[2019-11-03 v1.0 CV class]

%----------------------------------------------------------------------------------------
%   CLASS OPTIONS
%----------------------------------------------------------------------------------------

\def \@dateformat {iso}  % set default date format to iso
\def \@papersize {a4paper}  % set default paper size to a4
\newif\if@compact \@compactfalse  % set default compact mode to off

\DeclareOption{dateiso}{\def \@dateformat {iso}}
\DeclareOption{dateus}{\def \@dateformat {us}}
\DeclareOption{dateswiss}{\def \@dateformat {swiss}}
\DeclareOption{dateabbrev}{\def \@dateformat {abbrev}}
\DeclareOption{a4paper}{\def \@papersize {a4paper}}
\DeclareOption{letterpaper}{\def \@papersize {letterpaper}}
\DeclareOption{compact}{\@compacttrue}
\ProcessOptions\relax

\LoadClass[12pt,\@papersize]{article}  % font size and paper type

\usepackage[parfill]{parskip}  % remove paragraph indentation
\usepackage{amsmath}  % required for bold bullet point
\usepackage{array}  % required for boldface (\bf and \bfseries) tabular columns
\usepackage{ebgaramond}  % set font to garamond
\usepackage{microtype}  % required for ligature control
\DisableLigatures[f]{encoding = *, family = *}  % turn the ligatures off as they break a lot of automated systems
\usepackage{fancyhdr}  % required to use a custom footer
\usepackage[left=1in,top=1in,right=1in,bottom=1in]{geometry}  % set margins to 1 inch
\addtolength{\textheight}{-\footskip}  % make bottom margin empty
\PassOptionsToPackage{hidelinks}{hyperref}  % required for hyperlinks
\usepackage[a-1b]{pdfx}  % required for pdf/a compliance
\def\UrlBreaks{\do\.\do\@\do\\\do\/\do\!\do\_\do\|\do\;\do\>\do\]\do\)\do\,\do\?\do\'\do+\do\=\do\#\do-\do\a\do\b\do\c\do\d\do\e\do\f\do\g\do\h\do\i\do\j\do\k\do\l\do\m\do\n\do\o\do\p\do\q\do\r\do\s\do\t\do\u\do\v\do\w\do\x\do\y\do\z\do\A\do\B\do\C\do\D\do\E\do\F\do\G\do\H\do\I\do\J\do\K\do\L\do\M\do\N\do\O\do\P\do\Q\do\R\do\S\do\T\do\U\do\V\do\W\do\X\do\Y\do\Z\do0\do1\do2\do3\do4\do5\do6\do7\do8\do9}  % fix line breaks in urls
\usepackage{ifthen}  % required for ifthenelse statements
\usepackage{lastpage}  % required for the y in page x of y
\fancyhf{}  % clear the header and footer
\renewcommand{\headrulewidth}{0pt}  % don't have a divider line in the header
\cfoot{\thepage\ \ of\ \ \pageref{LastPage}}  % setup a nice footer
\pagestyle{fancy}  % enable the new footer
\usepackage{needspace}  % to prevent orphaned section headers
\usepackage{xstring}  % required for date parsing

%----------------------------------------------------------------------------------------
%   HEADINGS COMMANDS: Commands for printing name and address
%----------------------------------------------------------------------------------------

\def \name#1{\def\@name{#1}}  % defines the \name command to set name
\def \@name {}  % sets \@name to empty by default

\def \addressSep {$\diamond$}  % set default address separator to a diamond

% one, two or three address lines can be specified
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax

% \address command can be used to set the first, second, and third address (last 2 optional)
\def \address #1{
    \@ifundefined{@addresstwo}{
        \def \@addresstwo {#1}
    }{
        \@ifundefined{@addressthree}{
            \def \@addressthree {#1}
        }{
            \def \@addressone {#1}
        }
    }
}

% \printaddress is used to style an address line (given as input)
\def \printaddress #1{
    \begingroup
        \def \\ {\addressSep\ }
        \centerline{#1}
    \endgroup
    \par
    \if@compact \else \vspace*{1.5em} \fi
}

% \printname is used to print the name as a page header
\def \printname {
    \begingroup
        \if@compact \else \vspace*{1em} \fi
        \hfil{\MakeUppercase{\huge\bf \@name}}\hfil
        \if@compact \vspace*{0.5em} \else \vspace*{1.5em} \fi
        \break
    \endgroup
}

%----------------------------------------------------------------------------------------
%   HEADER
%----------------------------------------------------------------------------------------

\let\ori@document=\document
\renewcommand{\document}{
    \ori@document  % begin document
    \if@compact \else \vspace*{1.5em} \fi
    \printname  % print the name specified with \name
    \@ifundefined{@addressone}{}{  % print the first address if specified
        \printaddress{\@addressone}
    }
    \@ifundefined{@addresstwo}{}{  % print the second address if specified
        \printaddress{\@addresstwo}
    }
    \@ifundefined{@addressthree}{}{  % print the third address if specified
        \printaddress{\@addressthree}
    }
    \if@compact \else \vspace*{0.25em} \fi
}

%----------------------------------------------------------------------------------------
%   SECTION FORMATTING
%----------------------------------------------------------------------------------------

\newenvironment{rSection}[1]{
    \if@compact \smallskip \else \medskip \fi
    \needspace{4\baselineskip}
    \MakeUppercase{\bf #1}
    \medskip
    \hrule
    \begin{list}{}{
        \setlength{\leftmargin}{0.0em}
    }
    \item[]
}{
    \end{list}
}

%----------------------------------------------------------------------------------------
%   SINGLE LINE FORMATTING
%----------------------------------------------------------------------------------------

\newcommand{\rLine}[3]{{\bf #1}, #2 \hfill #3 \vspace{0.2em}}
\newcommand{\rPair}[2]{{\bf #1:} #2 \vspace{0.2em}}
\newcommand{\rPlainLine}[2]{#1 \hfill #2 \vspace{0.2em}}

%----------------------------------------------------------------------------------------
%   DATE FORMATTING
%----------------------------------------------------------------------------------------

\def \@monthname #1{%
    \ifcase#1\or January\or February\or March\or April\or May\or June%
    \or July\or August\or September\or October\or November\or December\fi%
}

\def \@monthabbrev #1{%
    \ifcase#1\or Jan.\or Feb.\or Mar.\or Apr.\or May\or Jun.%
    \or Jul.\or Aug.\or Sep.\or Oct.\or Nov.\or Dec.\fi%
}

\DeclareRobustCommand{\rDate}[1]{%
    \IfSubStr{#1}{-}{%
        \StrBefore{#1}{-}[\@dyear]%
        \StrBetween[1,2]{#1}{-}{-}[\@dmonth]%
        \StrBehind[2]{#1}{-}[\@dday]%
        \ifthenelse{\equal{\@dateformat}{iso}}{%
            #1%
        }{%
            \ifthenelse{\equal{\@dateformat}{swiss}}{%
                \@dday.\@dmonth.\@dyear%
            }{%
                \ifthenelse{\equal{\@dateformat}{abbrev}}{%
                    \@monthabbrev{\@dmonth} \@dyear%
                }{%
                    \@monthname{\@dmonth} \@dday, \@dyear%
                }%
            }%
        }%
    }{%
        #1%
    }%
}

\DeclareRobustCommand{\rDateRange}[2]{%
    \rDate{#1}%
    \kern0.15em--\kern0.15em%
    \def\rDateRangeEnd{#2}%
    \ifx\rDateRangeEnd\empty Present\else\rDate{#2}\fi%
}

%----------------------------------------------------------------------------------------
%   SUBSECTION FORMATTING
%----------------------------------------------------------------------------------------

\newcommand{\rSubsectionHeader}[3]{
    {\bf #1} \hfill {#2}
    \vspace{0.15em} \\
    {\em #3}
    \vspace{0.55em}
}

\newenvironment{rSubsection}[3]{
    \rSubsectionHeader{#1}{#2}{#3}
    \vspace{-0.45em}
    \begin{list}{$\boldsymbol{\cdot}$}{\leftmargin=1.5em \rightmargin=1.5em}
    \itemsep -0.5em \vspace{-0.5em}
}{
    \end{list}
}

%----------------------------------------------------------------------------------------
%   PUBLICATIONS FORMATTING
%----------------------------------------------------------------------------------------

\newcounter{pubnum}
\newenvironment{rPublications}{
    \vspace{0.75em}
    \edef\@savedpubnum{\the\value{pubnum}}
    \begin{list}{[\arabic{pubnum}]}{\usecounter{pubnum}\leftmargin=2.5em\rightmargin=1.5em\itemindent=0em}
    \setcounter{pubnum}{\@savedpubnum}
    \itemsep -0.25em
    \interlinepenalty=10000
}{
    \end{list}
    \nopagebreak\vspace{-0.25em}\nopagebreak
    \hfill $^*$ \footnotesize{equal contribution} \vspace{-0.25em}
}

\newenvironment{rSelectedPublications}{
    \vspace{0.25em}
    \begin{list}{$\boldsymbol{\cdot}$}{\leftmargin=1.5em\rightmargin=1.0em\itemindent=0em}
    \itemsep -0.1em \vspace{-0.5em}
}{
    \end{list}
    \nopagebreak\vspace{-0.25em}\nopagebreak
    \hfill $^*$ \footnotesize{equal contribution} \vspace{-0.25em}
}
