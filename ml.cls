%
%
% ML document class
%
% last revision 2019-09-30 by Pieter-Jan Hoedt
%
%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]

\ProvidesClass{ml}[2007/07/02]

\def\ml@basisclass{article}

\newif\ifbasisclassdefined
\basisclassdefinedfalse

%
% make some common options unavailable
%
\DeclareOption{twocolumn}{\ClassError{ml}{Option `twocolumn' not supported
for ML document class.}{Remove the `twocolumn' option}}

\DeclareOption{notitlepage}{\ClassError{ml}{Option `notitlepage' not supported
for ML document class.}{Remove the `notitlepage' option}}

\DeclareOption{10pt}{\ClassError{ml}{Option `10pt' not supported
for ML document class.}{Remove the `10pt' option}}

\DeclareOption{12pt}{\ClassError{ml}{Option `12pt' not supported
for ML document class.}{Remove the `12pt' option}}

\DeclareOption{a5paper}{\ClassError{ml}{Option `a5paper' not supported
for ML document class.}{Remove the `a5paper' option}}
\DeclareOption{b5paper}{\ClassError{ml}{Option `b5paper' not supported
for ML document class.}{Remove the `b5paper' option}}
\DeclareOption{letterpaper}{\ClassError{ml}{Option `letterpaper' not supported
for ML document class.}{Remove the `letterpaper' option}}
\DeclareOption{legalpaper}{\ClassError{ml}{Option `legalpaper' not supported
for ML document class.}{Remove the `legalpaper' option}}
\DeclareOption{executivepaper}{\ClassError{ml}{Option `executivepaper' not supported
for ML document class.}{Remove the `executivepaper' option}}
\DeclareOption{landscape}{\ClassError{ml}{Option `landscape' not supported
for ML document class.}{Remove the `landscape' option}}

%
% declare options for three basis classes
%
\DeclareOption{article}{%
	\ifbasisclassdefined
		\ClassError{ml}{You may only supply one basis class.}{Remove the `article' option}
	\fi
	\def\ml@basisclass{article}
	\basisclassdefinedtrue
}

\DeclareOption{report}{\ifbasisclassdefined
\ClassError{ml}{You may only supply one basis class.}{Remove the `report' option}
\fi
\def\ml@basisclass{report}\basisclassdefinedtrue}

\DeclareOption{book}{\ifbasisclassdefined
\ClassError{ml}{You may only supply one basis class.}{Remove the `book' option}
\fi
\def\ml@basisclass{book}\basisclassdefinedtrue}

%
% forward all other options to document class article
%
\DeclareOption*{{\ClassError{ml}{Option `\CurrentOption' not supported
for ML document class.}{Remove the `\CurrentOption' option}}}

%
% process options
%
\ProcessOptions\relax

%
% load document class article (always with options a4paper and titlepage)
%
\LoadClass[a4paper,11pt,twoside]{\ml@basisclass}

\typeout{=============================================================}%
\typeout{ML document class loaded with basis class '\ml@basisclass'}%
\typeout{=============================================================}%

% font customizations
\renewcommand{\encodingdefault}{T1}
\renewcommand{\rmdefault}{ptm}
\renewcommand{\sfdefault}{phv}
\renewcommand{\ttdefault}{cmtt}
\fontencoding{T1}\selectfont

% customization of item marks
\renewcommand{\labelitemi}{\rule[0.2ex]{0.8ex}{0.8ex}}
\renewcommand{\labelitemii}{$\m@th\bullet$}

% include of additional packages
\RequirePackage{color}
\RequirePackage{graphicx}
\RequirePackage{ifthen}

% setup of page format
\setlength{\evensidemargin}{-1in}
\setlength{\oddsidemargin}{-1in}
\setlength{\topmargin}{-1in}
\addtolength\evensidemargin{30mm}
\addtolength\oddsidemargin{30mm}
\addtolength\topmargin{28mm}
\setlength{\textwidth}{150mm}
\setlength{\headheight}{12pt}
\setlength{\headsep}{8mm}
\setlength{\textheight}{222mm}

\ifx\pdfoutput\undefined
	\relax
\else
	\setlength{\pdfpagewidth}{21cm}
	\setlength{\pdfpageheight}{29.7cm}
\fi

% setup of customized headings style and listings
\input{ml-\ml@basisclass.tex}

% set page style
\pagestyle{headings}

% adjust parskip
\setlength{\parskip}{5pt plus 2pt minus 1pt}

% define colors and color commands
\definecolor{mltitle}{cmyk}{0, 0, 0, 0}
\definecolor{mlaccent}{cmyk}{1, 0, 0, .35}

% define ML title page commands
\newcommand{\customtitlepage}[2]{%
	\thispagestyle{empty}
	#2
	\vfill
	\noindent\makebox[0pt][l]{%
		\setlength{\unitlength}{1cm}
		\begin{picture}(0,0)(2,2.4)
			%\put(0,25.5){\makebox(0,0)[lb]{\color{bioli}\rule{19cm}{2.2cm}}}
			\put(19,25.5){\makebox(0,0)[rb]{\includegraphics[width=19cm]{ml-bar}}}
			\put(0.3,26.0){\makebox(0,0)[l]{%
				\color{mltitle}\fontfamily{phv}\bfseries\large%
				Institute for Machine Learning, Johannes Kepler University Linz%
			}}
			\put(0.3,26.9){\makebox(0,0)[l]{\color{mltitle}\fontfamily{phv}\bfseries\Huge #1}}
			\put(0,1.6){\makebox(0,0)[lb]{\color{mlaccent}\rule{19cm}{1mm}}}
			\put(0,0){\makebox(0,0)[lb]{\fontfamily{phv}\normalsize%
				\begin{tabular}[b]{l}
					Institute for Machine Learning\\
					Johannes Kepler University Linz\\
					A-4040 Linz, Austria
				\end{tabular}%
			}}
			\put(19,0){\makebox(0,0)[rb]{\fontfamily{phv}\normalsize%
				\begin{tabular}[b]{r}
					https://www.jku.at/iml
				\end{tabular}%
			}}
			%\put(0,24.5){\makebox(0,0)[lt]{\noindent\begin{minipage}{19cm}
				%#2
			%\end{minipage}}}
		\end{picture}
	}
	\newpage
}

\def\ml@number{}
\def\ml@keywords{}
\def\ml@abstract{}
\def\ml@citation{}
\def\ml@affiliation{}

\newcommand{\affiliation}[1]{\def\ml@affiliation{#1}}
\newcommand{\pubnumber}[1]{\def\ml@number{#1}}
\newcommand{\setkeywords}[1]{\def\ml@keywords{#1}}
\newcommand{\setabstract}[1]{\def\ml@abstract{#1}}
\newcommand{\setcitation}[1]{\def\ml@citation{#1}}
\newcommand{\affilmark}[1]{\textsuperscript{\scriptsize #1}}

\newcommand{\doi}[1]{%
	\ifx\href\undefined doi:#1
	\else\href{http://dx.doi.org/#1}{doi:#1}
	\fi
}

\newcommand{\email}[1]{%
	\ifx\href\undefined{\em #1}
	\else\href{mailto:#1}{{\em #1}}
	\fi
}

\newcommand{\reporttitlepage}[1]{%
	\customtitlepage{#1}{%
		\mbox{ }\vfill
		\begin{center}
			\sffamily\bfseries\LARGE\@title
		\end{center}
		\begin{center}
			{\sffamily\bfseries\large\@author}\\[2mm]
			\ifx\@empty\ml@affiliation
				\relax
			\else
				{\sffamily\normalsize\ml@affiliation}
				\end{center}
			\fi
		\vspace{1.5cm}
		\ifthenelse{\equal{}{\ml@abstract}}{
			\relax
		}{%
			\centerline{\rule{15cm}{1pt}}\vspace{2mm}
			\centerline{
				\begin{minipage}[b]{15cm}
					\noindent{\bf Abstract --- } \ml@abstract
				\end{minipage}
			}
			\ifx\@empty\ml@keywords
				\vspace{-1.5mm}\centerline{\rule{15cm}{1pt}}
			\fi
		}
		\ifthenelse{\equal{}{\ml@keywords}}{%
			\relax
		}{%
			\ifx\@empty\ml@abstract
				\centerline{\rule{15cm}{1pt}}\vspace{2mm}
			\else
				\vspace{5mm}
			\fi
			\centerline{
				\begin{minipage}[b]{15cm}
					\noindent{\bf Key words --- } \ml@keywords
				\end{minipage}
			}
			\vspace{-1.5mm}\centerline{\rule{15cm}{1pt}}
		}
		\ifthenelse{\equal{}{\ml@citation}}{%
			\relax
		}{%
			\vspace{2cm}
			\centerline{
				\begin{minipage}[b]{15cm}
					\noindent{\bf Citation: } \ml@citation
				\end{minipage}
			}
		}
		\vfill
	}
}

\newcommand{\researchreporttitlepage}{\reporttitlepage{Research Report \ml@number}}
\newcommand{\techreporttitlepage}{\reporttitlepage{Technical Report \ml@number}}
\newcommand{\preprinttitlepage}{\reporttitlepage{Publication Preprint}{}}
\newcommand{\reprinttitlepage}{\reporttitlepage{Publication Reprint}{}}

\newcommand{\manualtitlepage}[1][]{%
	\customtitlepage{Software Manual}{%
		\mbox{ }\vfill
		\begin{center}
			\sffamily\bfseries\LARGE\@title
		\end{center}
		\ifthenelse{\equal{\@author}{}}{}{
			\begin{center}
				{\sffamily\bfseries\large\@author}\\[2mm]
				\ifx\@empty\ml@affiliation
					\relax
				\else
					{\sffamily\normalsize\ml@affiliation}
					\end{center}
				\fi
		}
		\vspace{1cm}
		\begin{center}
			{\Large\sffamily\bfseries #1}
		\end{center}
		\vfill\mbox{ }
	}
}

\newcommand{\lecturenotestitlepage}[1][]{%
	\customtitlepage{Lecture Notes}{%
		\ifthenelse{\equal{#1}{}}{%
			\vspace*{2cm}
			\begin{center}
				\sffamily\bfseries\huge \@title
			\end{center}
			\vspace{2cm}
			\begin{center}
				\sffamily\bfseries\Large \@author
			\end{center}
			\vfill\mbox{ }
		}{%
			{\LARGE\sffamily\bfseries\mbox{ }
			\vfill
			\begin{center}
				#1
			\end{center}
			\vfill\vfill\mbox{ }}
		}
	}
}

\newcommand{\copyrightpage}[1][]{%
	\thispagestyle{empty}
	\clearpage\mbox{ }\vfill
	\vfill
	\noindent{%
		\large \textcircled{c}
		\ifthenelse{\equal{#1}{}}{\@author}{#1}
	}\\[7mm]
	\noindent This  material,  no  matter  whether  in  printed  or electronic  form, may  be  used  for  personal  and non-commercial educational use only. Any reproduction of this material, no matter whether as a whole or in parts, no matter whether in printed or in electronic form, requires explicit prior acceptance of the authors.
	\vfill\mbox{ }\clearpage
}

\endinput
% end of class
