makelatex
=========

makelatex simplifies the process of generating PDFs from LaTeX documents on Linux. Newest releases are available for download at  https://github.com/skuhl/makelatex/releases and install information is available in INSTALL.txt

makelatex has a large collection of useful features:

* *Simple installation:* Copy the makelatex script into /usr/bin or put it in the directory with your LaTeX code and make it executable.
* *Focus on PDFs:* makelatex assumes that you don't want to create anything but a PDF. It can use "engines" such as xelatex, lualatex, pdflatex or latex+dvips+ps2pdf to create them. By default, makelatex uses whatever program it can find as an engine. A specific engine be selected with the <i>-e</i> option, by setting the MAKELATEX_ENGINE environment variable, or by specifying it on the first line of a tex file using "% !TEX = engine".
 * *Automatic image conversion:* Converts images from popular formats into the formats expected by the version of LaTeX that you are using. The rules for converting images is stored in the makelatex script and can be easily modified. Conversion can be disabled with <i>--noconvert</i>
   * *Google Drive (or Google Docs) support:* See testdocs/google-drive for an example of how to have makelatex download LaTeX code from Google Drive and compile it into a PDF on your own computer.
 * *Reruns latex as necessary* to resolve any undefined citations or changing labels.
 * *Clean:* All log files are created inside a "makelatex-tmp" subdirectory. The subdirectory is deleted when makelatex finishes (but can be kept with <i>-k</i>). You can erase all of the PDFs and other extra files with <i>-c</i> option.
 * *Quiet:* Hides all log files and messages by default and only prints appropriate warnings/errors. If an error occurs but is not displayed, you can run makelatex with <i>-k</i> and inspect the output inside the makelatex-tmp directory.
 * *Useful information:* The file size, number of pages, and paper size of the PDF is displayed each time makelatex is run.
 * *Dependency checking:* makelatex will only rebuild files if a dependency changes (unless <i>-f</i> forces the rebuild). For example, if a.tex contains \include{b} and b.tex changes, a.pdf will be rebuilt. If a.tex contains \includepdf{b} and b.tex changes, it will build b.pdf first, detect that a.pdf needs to be rebuilt, and will build a.pdf. It detects when any of the following files change: .sty files, .bib files, any images
* *Bibtex/makeindex/makeglossaries support:* Runs appropriate commands as needed. Supports multibib, chapterbib, nomencl packages
 * *Looping:* When <i>-l</i> is used, makelatex will repeatedly build the PDF whenever the file changes.
 * *Multi-threaded:* If multiple PDFs are being built from multiple tex files and the <i>--threads</i> parameter is provided, makelatex will build all of them in parallel.
 * *N-up support:* <i>--nupLand</i> <i>--nupPort</i> and <i>--nupHandout</i> create PDFs with multiple pages per page.
 * *High-quality by default:* makelatex avoids lossy image compression and downsampling when possible.
 * *Screen support:* The <i>--screen</i> enables lossy image compression and downsampling while maintaining enough quality to view it on screen.
 * *PDF optimization:* The <i>-o</i> option enables two things: First, the PDF is run through ps2pdf to (potentially) reduce the file size. Second, the PDF is linearized so that it can be loaded page-by-page when downloaded from a website (this step usually makes files slightly larger).
 * *PDF font checking:* makelatex tries to use embedded fonts in the PDF. It warns when bitmap or unembedded fonts are used.
 * *Automatic file detection:* If no .tex files are provided as an argument, makelatex will build any .tex file that contains \begin{document}.
  * *External scripts:* If prepost.sh exists in your directory, makelatex will run "prepost.sh pre" before running and "prepost.sh post" after running. This enables you to automatically upload the PDF to a website after you create it or to create two versions of a document from one document by making a copy of the original .tex file and changing a variable in it.
 * *Obeys environment variables:* makelatex works with the TEXINPUTS and BIBINPUTS environment variables.
 * *Synctex support:* Synctex support can be enabled with the <i>-s</i> argument.
 * *Supports lint-style programs:* makelatex can run <a href="http://www.ctan.org/tex-archive/support/lacheck">lacheck</a> and <a href="http://baruch.ev-en.org/proj/chktex/">chktex</a> if they are installed to make suggestions.

Example usage
-------------


The following shows a very simple example of how makelatex works (see <a href="https://github.com/skuhl/makelatex/tree/master/testdocs">testdocs</a> directory for more examples!):

<pre>
testdocs/imagebib$ makelatex 
uconvert: subdir/angle-of-decl.pdf (5KiB) <-- subdir/angle-of-decl.svg (20KiB) using inkscape
             example: xelatex
             example: bibtex8
example: Warning--empty author and editor in chicago
             example: xelatex
             example: xelatex
example: Overfull \hbox (215.2359pt too wide) in paragraph at lines 11--14
             example:  1 pg;   76KiB; letter paper; PDFv1.5
</pre>


Similar programs
---------------------

If makelatex isn't right for you, you may be interested one of the following alternatives:

 * <a href="http://www.phys.psu.edu/~collins/software/latexmk-jcc/">latexmk</a> - Perl
 * <a href="https://launchpad.net/rubber">rubber</a> - Python
 * <a href="http://code.google.com/p/latex-makefile/">latex-makefile</a> - GNU Makefile
 * <a href="http://www.acoustics.hut.fi/u/mairas/UltimateLatexMakefile/">Ultimate Latex Makefile</a> - GNU Makefile
 * <a href="http://xpt.sourceforge.net/tools/latexmake/">LatexMake</a> - GNU Makefile
 * <a href="http://docs.miktex.org/manual/texifying.html">texify</a> - part of MiKTeX
 * <a href="http://www.cmake.org/Wiki/CMakeUserUseLATEX">UseLATEX.cmake</a> - CMake
 * <a href="http://majewsky.wordpress.com/category/geek-stuff/programming/lamake/">LaMake</a> - C and Qt based
