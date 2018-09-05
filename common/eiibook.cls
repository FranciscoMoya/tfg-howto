% -*- coding: utf-8 -*-

% eiibook.cls derived from cedv.cls
%
% Copyright © 2011-2018 Universidad de Castilla-La Mancha
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{eiibook}[2018/07/18 modified book class for EII-UCLM books]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\PassOptionsToClass{a5paper, 10pt, twoside, openright}{book}
\ProcessOptions\relax
\LoadClass{book}

\makeatletter

\setlength{\unitlength}{1mm}

% http://tug.org/mailman/htdig/pstricks/2011/009122.html
\usepackage{etex}

% Codificación UTF8
\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage[spanish, es-tabla]{babel}

% Hipervínculos dentro del documento
\usepackage{hyperref}
\usepackage{bookmark}

% Ubicaciones absolutas
\usepackage{float}

\usepackage{caption}
\captionsetup{
  margin=0pt,
  font={footnotesize,stretch=.85},
  labelfont=bf}

% Encabezado y pie de página
%T% \usepackage{fancyvrb}

%UNUSED% \usepackage{afterpage}

% Elementos centrados en página en plantillas book
% \usepackage{changepage}
\usepackage{chngpage}
% Tipografía del documento
\usepackage{amsmath}
\usepackage{amsfonts}
% \usepackage{bookman}  % bookman | newcent | palatino | times
\usepackage{times}
\usepackage{courier}

% Para la inserción de imágenes
\usepackage{graphics}
% Configuración de página
\usepackage{a4wide}

\usepackage[
  paperwidth=159.175mm,
  paperheight=240.35mm,
  left=24.8mm,right=18.4mm,
  top=25mm, bottom=25mm,
  marginparwidth=1cm, marginparsep=1cm]{geometry}
%

%\usepackage[    <--- Valores originales
%  paperwidth=159.175mm,
%  paperheight=240.35mm,
%  left=19.8mm,right=14.4mm,
%  top=21mm, bottom=21mm,
%  marginparwidth=1cm, marginparsep=1cm]{geometry}

\usepackage[bottom]{footmisc}
\usepackage{ifthen}
\usepackage{colortbl}
\usepackage{captdef}
\usepackage{lettrine}
% \usepackage{shadow}
% \usepackage{mparhack}
\usepackage{tabularx}
\usepackage{booktabs}

%T% \usepackage{authblk}

\usepackage{xspace}  % gentle spacing after a macro

\usepackage{xcolor}
\definecolor{gris30}{gray}{0.30}
\definecolor{gris85}{gray}{0.85}
\definecolor{gris20}{gray}{0.20}
\definecolor{gris50}{gray}{0.50}

\renewcommand{\LettrineFontHook}{\color[gray]{0.4}}
% Para el dibujado de grafos (requiere tener instalado el paquete dot2tex)
\usepackage[outputdir={./dot/},autosize]{dot2texi}
\usepackage{common/cedv-acronym}
\usepackage{common/cedv-tabs-dummy} %-dummy}
\usepackage{common/cedv-book} % -dummy}
\usepackage{common/cedv-listings} %-dummy}
\usepackage{common/cedv-sidecontent} %-dummy}
\usepackage{common/cedv-ui} %-dummy}
\usepackage{common/cedv-admonition} %-dummy}

%% Inserción de imagen como figura %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Uso: \imagenhere{nombreFichero}{Ancho}{Descripcion}{Identificador}

\def\imagehere#1#2#3#4{
  \begin{figure}[htbp]
    \begin{center}
      \resizebox{#2}{!}{\includegraphics{#1}}
      \ifthenelse{\equal{#3}{}}{}{\caption {#3}}
      \label{#4}
    \end{center}
  \end{figure}
}

%% Letra capital %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Uso: \capital{letra}

\def\capital#1{\lettrine[lines=3, lhang=0.00, loversize=0.04]{#1}{}}

%% Insercion de citas %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Uso: \cita{frase}{autor}

\def\cita#1#2{
  \vspace{0.2cm}
  \begin{quote}
    #1
    \begin{flushright}
      {\it #2}
    \end{flushright}
  \end{quote}
  \normalsize
}

%% Imagen de ancho total %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Uso: \imagenanchototal{path}{caption}{label}
%% http://tex.stackexchange.com/questions/16582/center-figure-that-is-wider-than-textwidth
\usepackage[export]{adjustbox}
\def\imagenanchototal#1#2#3{
%  \afterpage{
%    \clearpage
  \begin{figure}
    \includegraphics[width=\textwidth,outer]{#1}%
    \ifthenelse{\equal{#2}{}}{}{\caption{#2}}
    \ifthenelse{\equal{#3}{}}{}{\label{#3}}
  \end{figure}
%  }
}

\newcommand{\putone}[1]{#1}


% Para crear índices de términos
%\usepackage{makeidx}


% --- Variables del paquete  ---
\author{}

\newcommand{\@bookSubtitle}{}
\newcommand{\bookSubtitle}[1]{%
  \renewcommand{\@bookSubtitle}{#1}}


\newcommand{\softclearpage}{}
\newcommand{\softnewpage}{}


\newcommand{\@chapterauthors}{}
\newcommand{\chapterauthors}[1]{%
  \renewcommand{\@chapterauthors}{#1}}


\newcommand{\frontpage}{%
  \pagestyle{empty}
  \begin{center}

    \vspace*{\stretch{1}}

    \begin{huge}\textbf{\@title}\end{huge}\\[0.4cm]
    \begin{Large}{\it \textbf{\@bookSubtitle}}\end{Large}\\[0.9cm]

    \vspace*{\stretch{1}}

    \includegraphics[width=.2\textwidth]{common/img/escudo-uclm.jpg}

    {\bf Universidad de Castilla-La Mancha}\par
    Escuela de Ingeniería Industrial\\Toledo

    \vspace*{\stretch{1}}
  \end{center}

  \newpage

  \mbox{}
  \vfill

  \noindent
    Escuela de Ingeniería Industrial\\[0.3cm]
    \begin{tabular}{ll}
      {\it e-mail} & {\tt industriales.to@uclm.es} \\[0.1cm]
      {\it Teléfono} & {\tt 926 29 53 00} \\[0.1cm]
      {\it Web} & \url{https://www.uclm.es/toledo/eii}\\[0.1cm]
    \end{tabular}

    \vspace{0.5cm}

    \begin{singlespace}
    \begin{small}
      \noindent
      \copyright~ Los autores del documento. Se permite la copia,
      distribución y/o modificación de este documento bajo los
      términos de la licencia de documentación libre GNU, versión 1.1
      o cualquier versión posterior publicada por la {\em Free
        Software Foundation}, sin secciones invariantes. Puede
      consultar esta licencia en http://www.gnu.org. \\[0.2cm]
      Este documento fue compuesto con \LaTeX{}, y ha sido
      desarrollado a partir de una plantilla de Carlos González
      Morcillo, Sergio García Mondaray y David Villa Alises.
    \end{small}
  \end{singlespace}
}



%------------------ NUEVO (no afecta al contenido previo) -------------------------

\hypersetup{%
  pdfview        = {fitv},
  % backref,                % debug: refs desde la bibliografía
}


\usepackage{enumitem}
\newlist{definitionlist}{description}{1}
\setlist[definitionlist]{
  style   = nextline,
}
\setlist[itemize]{
  topsep = 3pt plus 1pt minus 1pt,
  itemsep   = 3pt plus 1pt minus 1pt,
}

%-- marcado semántico ---
\newcommand{\ecode}[1]{{\texttt{#1}}}     % trozo pequeño de código fuente
\newcommand{\kw}[1]{\texttt{#1}}          % keyword, palabra reservada
\def \token   #1{\texttt{#1}}                 % literal, constante simbólica
\def \command #1{\texttt{#1}}                 % comando
\newcommand{\iface}[1]{\textit{#1}}       % interfaz
\newcommand{\function}[1]{\texttt{#1()}}
\newcommand{\id}[1]{\texttt{#1}}          % identificador
\newcommand{\fg}[1]{\textit{#1}}          % foreign, una palabra en inglés
\newcommand{\email}[1]{~$<$#1$>$}
\newcommand{\gloss}[1]{#1}                % entrada del glosario
\newcommand{\filename}[1]{\texttt{#1}}
\newcommand{\varname}[1]{\texttt{#1}}
\newcommand{\type}[1]{\texttt{#1}}        % tipo de dato o clase

\usepackage{nameref}
\let\oldnameref=\nameref
\renewcommand{\nameref}[1]{«\oldnameref{#1}»}

\def\texcmd#1{\texttt{$\backslash$#1}}

\usepackage{common/cedv-config}

\newcommand{\loremipsum}{%
  \textcolor{gray}{Suspendisse aliquet diam pellentesque lectus posuere eu
    vehicula velit aliquet. Cras iaculis, quam quis venenatis venenatis, nulla leo porta
    mi, lacinia hendrerit arcu lorem et dui.}
  \par
  \textcolor{gray}{
    Nullam varius dui sit amet dui scelerisque consectetur. Nullam tortor est, ullamcorper
    viverra ullamcorper a, convallis et nisl. Phasellus nunc ligula, fermentum quis
    iaculis at, consectetur vel diam. Aliquam tincidunt orci eget ante mollis pulvinar. In
    hac habitasse platea dictumst. Suspendisse id tellus a ante mattis feugiat.}}


\usepackage{multirow}
%% \def\tablename{Tabla}

\usepackage{setspace}
\setstretch{0.97}

\usepackage{dsfont}

\usepackage{alltt}
%T% \DefineVerbatimEnvironment%
%T%  {MiVerbatim}{Verbatim}
%T%  {frame=single, framerule=.3mm, framesep=4mm, samepage=false,
%T%    rulecolor=\color{gris30}, baselinestretch=.8, fontsize=\small,
%T%    numbers=left, numbersep=2mm, xleftmargin=6mm, xrightmargin=3mm}

\newlength{\leftdynmargin}
\newlength{\rightdynmargin}
\newcommand{\calcdynmargins}{
     \ifodd\thepage
       \setlength{\leftdynmargin}{0pt}
       \setlength{\rightdynmargin}{-1.2\marginparwidth}
     \else
       \setlength{\leftdynmargin}{-1.2\marginparwidth}
       \setlength{\rightdynmargin}{0pt}
     \fi
}

\makeatother
