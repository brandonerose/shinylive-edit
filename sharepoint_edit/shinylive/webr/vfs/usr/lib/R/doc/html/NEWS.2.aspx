<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"><html xmlns="http://www.w3.org/1999/xhtml"><head><title>R: R News</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes" />
<link rel="stylesheet" type="text/css" href="R.css" />
</head><body><div class="container">

<table width="100%" summary="page for NEWS"><tr><td>NEWS</td><td style="text-align: right;">R Documentation</td></tr></table>

<h2> R News</h2>

<h3>LATER NEWS</h3>

<p>News for <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.0.0 and later can be found in file &lsquo;<span class="file">NEWS.Rd</span>&rsquo; in the
<span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> sources and files &lsquo;<span class="file">NEWS</span>&rsquo; and &lsquo;<span class="file">doc/html/NEWS.html</span>&rsquo;
in an <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> build.
</p>


<h3><img class="toplogo" src="../help/figures/../../html/Rlogo.svg" alt="[R logo]" /> CHANGES IN R VERSION 2.15.3</h3>



<h4>NEW FEATURES</h4>


<ul>
<li> <p><code>lgamma(x)</code> for very small <code>x</code> (in the
denormalized range) is no longer <code>Inf</code> with a warning.
</p>
</li>
<li> <p><code>image()</code> now sorts an unsorted <code>breaks</code> vector,
with a warning.
</p>
</li>
<li><p> The internal methods for <code>tar()</code> and <code>untar()</code> do
a slightly more general job for &lsquo;ustar&rsquo;-style handling of
paths of more than 100 bytes.
</p>
</li>
<li><p> Packages <span class="pkg">compiler</span> and <span class="pkg">parallel</span> have been added
to the reference index (&lsquo;<span class="file">refman.pdf</span>&rsquo;).
</p>
</li>
<li> <p><code>untar(tar = "internal")</code> has some support for
<code>pax</code> headers as produced by e.g. <code>gnutar --posix</code>
(which seems prevalent on OpenSUSE 12.2) or
<code>bsdtar --format pax</code>, including long path and link names.
</p>
</li>
<li> <p><code>sQuote()</code> and <code>dQuote()</code> now handle 0-length
inputs.  (Suggestion of Ben Bolker.)
</p>
</li>
<li> <p><code>summaryRprof()</code> returns zero-row data frames rather
than throw an error if no events are recorded, for consistency.
</p>
</li>
<li><p> The included version of PCRE has been updated to 8.32.
</p>
</li>
<li><p> The <span class="pkg">tcltk</span> namespace can now be re-loaded after
unloading.
</p>
<p>The Tcl/Tk event loop is inhibited in a forked child from package
<span class="pkg">parallel</span> (as in e.g. <code>mclapply()</code>).
</p>
</li>
<li> <p><code>parallel::makeCluster()</code> recognizes the value
<span class="samp">random</span> for the environment variable <span class="env">R_PARALLEL_PORT</span>:
this chooses a random value for the port and reduces the chance of
conflicts when multiple users start a cluster at the same time.
</p>
</li></ul>




<h4>UTILITIES</h4>


<ul>
<li><p> The default for <span class="env">TAR</span> on Windows for <code>R CMD
	build</code> has been changed to be <span class="samp">internal</span> if no
<code>tar</code> command is on the path.
</p>
<p>This enables most packages to be built &lsquo;out of the box&rsquo;
without <code>Rtools</code>: the main exceptions are those which need
to be installed to re-build vignettes and need <code>Rtools</code>
for installation (usually because they contain compiled code).
</p>
</li></ul>




<h4>C-LEVEL FACILITIES</h4>


<ul>
<li><p> On a 64-bit Windows platform with enough RAM, <code>R_alloc</code>
can now allocate up to just under 32GB like other 64-bit
platforms.
</p>
</li></ul>




<h4>DEPRECATED AND DEFUNCT</h4>


<ul>
<li><p> Use of <code>col2rgb(0)</code> is deprecated (see the help page
for its limitations).
</p>
</li>
<li><p> The deprecated <code>intensities</code> component returned by
<code>hist()</code> is no longer recognized by the <code>plot()</code> method
and will be removed in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.0.0.
</p>
</li>
<li> <p><code>real()</code>, <code>as.real()</code> and <code>is.real()</code> are now
formally deprecated and give a warning.
</p>
</li>
<li><p> This is formal notice that the non-API EISPACK entry points
in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> will be removed shortly.
</p>
</li></ul>




<h4>INSTALLATION</h4>


<ul>
<li><p> The <code>configure</code> tests for Objective C and Objective
C++ now work on Mac OS 10.8 with Xcode 4.5.2 (<a href="https://bugs.R-project.org/show_bug.cgi?id=15107">PR#15107</a>).
</p>
</li>
<li><p> The cairo-based versions of <code>X11()</code> now work with
current versions of cairographics (e.g., 1.12.10).  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15168">PR#15168</a>)
</p>
<p>A workaround for earlier versions of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> is to use
<code>X11.options(type = "nbcairo")</code>.
</p>
</li>
<li><p> Configuration and <code>R CMD javareconf</code> now come up
with a smaller set of library paths for Java on Oracle-format JDK
(including OpenJDK).  This helps avoid conflicts between libraries
(such as <code>libjpeg</code>) supplied in the JDK and system
libraries.  This can always be overridden if needed: see the
&lsquo;R Installation and Administration&rsquo; manual.
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li> <p><code>beta(a, b)</code> could overflow to infinity in its
calculations when one of <code>a</code> and <code>b</code> was less than one.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=15075">PR#15075</a>)
</p>
</li>
<li> <p><code>lbeta(a, b)</code> no longer gives <code>NaN</code> if <code>a</code> or
<code>b</code> is very small (in the denormalized range).
</p>
</li>
<li> <p><code>bquote()</code> is now able to substitute default arguments in
single-argument functions.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15077">PR#15077</a>)
</p>
</li>
<li> <p><code>browseEnv(html = FALSE)</code> would segfault if called from
<span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> (not <code>R.app</code>) on a CRAN-style Mac OS X build of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>.
</p>
</li>
<li> <p><span class="samp">[[&lt;-</span> for lists (generic vectors) needed to increment
<code>NAMED</code> count when RHS is used more than once. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15098">PR#15098</a>)
</p>
</li>
<li><p> On Windows, warnings about opening a file or pipe with a
non-ASCII description were sometimes output in UTF-8 rather than
in the current locale's character set.
</p>
</li>
<li><p> The <code>call()</code> function did not duplicate its arguments.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=15115">PR#15115</a>)
</p>
</li>
<li> <p><code>TukeyHSD()</code> could give <code>NA</code> results with some
<span class="samp">na.action</span> methods such as <code>na.exclude()</code>.
(Hinted at on R-help by John Fox.)
</p>
</li>
<li><p> The deprecated <code>svd(X, LINPACK = TRUE)</code> could alter
<code>X</code> in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.15.[12].  (Reported by Bill Dunlap.)
</p>
</li>
<li><p> Under Windows, <code>file.link()</code> and <code>file.symlink()</code>
used the link name twice, so would always fail. (Reported
by Rui Barradas/Oliver Soong).
</p>
</li>
<li> <p><code>summaryRprof(memory = "both")</code> mixed up the units of
Vcells and Ncells: it now works in bytes.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15138">PR#15138</a>)
</p>
</li>
<li> <p><code>tools::Rd2HTML()</code> would sometimes delete text. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15134">PR#15134</a>)
</p>
</li>
<li> <p><code>plot()</code> failed for <code>"table"</code> objects containing
just one entry.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15118">PR#15118</a>)
</p>
</li>
<li> <p><code>embedFonts()</code> needed to quote some filepaths.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=15149">PR#15149</a>)
</p>
</li>
<li> <p><code>parallel::mccollect()</code> handled <code>NULL</code> returns
incorrectly (removing the element rather than setting it to
<code>NULL</code>).
</p>
</li>
<li><p> The full reference index (&lsquo;<span class="file">fullrefman.pdf</span>&rsquo;) was missing
packages <span class="pkg">compiler</span> and <span class="pkg">parallel</span>.
</p>
</li>
<li><p> The report for
<code>optim(method = "L-BFGS-B", control = list(trace = 1))</code>
reported the last completed and not the current iteration, unlike
other methods and trace levels.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15103">PR#15103</a>)
</p>
</li>
<li> <p><code>qt(1e-12, 1.2)</code> no longer gives <code>NaN</code>.
</p>
</li>
<li> <p><code>dt(1e160, 1.2, log=TRUE)</code> no longer gives <code>-Inf</code>.
</p>
</li>
<li><p> On Windows the <code>untar()</code> function now quotes the
directory name when using an external <code>tar</code> utility, so
<code>R CMD check</code> will handle pathnames containing spaces.
</p>
</li>
<li><p> The version for Windows 8 and Windows Server 2012 is now
displayed by <code>win.version()</code>.  (Reported by Gabor
Grothendieck.)
</p>
</li>
<li><p> The custom Windows installer target <code>myR</code> in the
installer &lsquo;<span class="file">Makefile</span>&rsquo; did not work in 2.15.2.  (Reported
by Erich Neuwirth.)
</p>
</li>
<li> <p><code>aperm(matrix(1:6, 2, dimnames=list(A={}, B={})), "A")</code>
no longer segfaults.
</p>
</li>
<li><p> Expressions involving user defined operators were not
always deparsed faithfully. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15179">PR#15179</a>)
</p>
</li>
<li><p> The <code>enc2utf8()</code> function converted <code>NA_character_</code>
to <code>"NA"</code> in non-UTF-8 locales. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15201">PR#15201</a>)
</p>
</li>
<li><p> The <code>exclude</code> argument to <code>xtabs()</code> was ignored
for <code>"factor"</code> arguments.
</p>
</li>
<li><p> On Windows, work around an event-timing problem when
the RGui console was closed from the &lsquo;X&rsquo; control and the closure
cancelled. (This would on some 64-bit systems crash <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>, typically
those with a slow GPU relative to the CPU.)
</p>
</li>
<li><p> On unix <code>Rscript</code> will pass the <code>r_arch</code> setting
it was compiled with on to the R process so that the architecture
of <code>Rscript</code> and that of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> will match unless overridden.
</p>
</li>
<li><p> On Windows, <code>basename()</code>, <code>dirname()</code> and
<code>file.choose()</code> have more support for long non-ASCII file
names with 260 or more bytes when expressed in UTF-8.
</p>
</li></ul>




<h3><img class="toplogo" src="../help/figures/../../html/Rlogo.svg" alt="[R logo]" /> CHANGES IN R VERSION 2.15.2</h3>



<h4>NEW FEATURES</h4>


<ul>
<li><p> The <code>X11()</code> window gains an icon: the
latter may be especially useful on Ubuntu's &lsquo;Unity&rsquo;
interface.
</p>
<p>The <code>WM_CLASS</code> should be set in circumstances where the
Window Manager failed to make use of X11 resource settings.
</p>
<p>(Contributed by Philip Johnson.)
</p>
</li>
<li><p> The <code>"Date"</code> and <code>"POSIXt"</code> methods for
<code>cut()</code> will accept an unsorted <code>breaks</code> argument (as
the default method does, although this was undocumented).
(Wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=14961">PR#14961</a>.)
</p>
</li>
<li><p> Reference class methods (in the <span class="pkg">methods</span> package) that
use other methods in an indirect way (e.g., by <code>sapply()</code>)
must tell the code analysis to include that method.  They can now
do so by invoking <code>$usingMethods()</code>. 
</p>
</li>
<li><p> More Polish translations are available: for the
<code>RGui</code> menus and for several recommended packages.
</p>
</li>
<li><p> Multistratum MANOVA works. In fact, it seems to have done so
for years in spite of the help page claiming it did not.
</p>
</li>
<li> <p><code>qqline()</code> has new optional arguments
<code>distribution</code>, <code>probs</code> and <code>qtype</code>, following the
example of <a href="https://CRAN.R-project.org/package=lattice"><span class="pkg">lattice</span></a>'s <code>panel.qqmathline()</code>.
</p>
</li>
<li><p> The handling of single quotes in the <code>en@quot</code>
pseudo-language has been slightly improved.  Double quotes are no
longer converted.
</p>
</li>
<li><p> New functions <code>checkPoFiles()</code> and <code>checkPoFile()</code>
have been added to the <span class="pkg">tools</span> package to check for
consistency of format strings in translation files.
</p>
</li>
<li> <p><code>model.matrix(~1, ...)</code> now also contains the same
rownames that less trivial formulae produce.  (Wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=14992">PR#14992</a>,
changes the output of several packages.)
</p>
</li>
<li><p> Misuse of <code>rep()</code> on undocumented types of objects
(e.g., calls) is now reported as an error.
</p>
</li>
<li><p> The included LAPACK has been updated to 3.4.1, with some
patches from the current SVN sources.  (<em>Inter alia</em>, this
resolves <a href="https://bugs.R-project.org/show_bug.cgi?id=14692">PR#14692</a>.)
</p>
</li>
<li> <p><code>file.copy(recursive = TRUE)</code> has some additional
checks on user error leading to attempted infinite recursion (and on
some platforms to crashing <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>).
</p>
</li>
<li><p> PCRE has been updated to version 8.31, a bug-fix release.
</p>
</li>
<li><p> The included version of <code>liblzma</code> has been updated to
version 5.0.4, a minor bug-fix release.
</p>
</li>
<li><p> New function <code>.bincode()</code>, a &lsquo;bare-bones&rsquo;
version of <code>cut.default(labels = FALSE)</code> for use in packages
with <code>image()</code> methods.
</p>
</li>
<li><p> The HTML manuals now use directional single quotes.
</p>
</li>
<li> <p><code>maintainer()</code> now converts embedded new lines to
spaces.  It no longer gives a non-obvious error for non-installed
packages.
</p>
</li>
<li><p> The <code>X11()</code> device has some protection against
being used with forked processes <em>via</em> package <span class="pkg">parallel</span>.
</p>
</li>
<li><p> Setting the environment variable <span class="env">R_OSX_VALGRIND</span> (to
any value) allows <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> to be run under <code>valgrind</code> on Mac OS
10.6 and 10.7 (<code>valgrind</code> currently has very limited
support for 10.8), provided <code>system()</code> is not used (directly
or indirectly).  This should not be needed for <code>valgrind</code>
&gt;= 3.8.1.
</p>
</li>
<li><p> The <code>model.frame()</code> method for <code>"lm"</code> uses
<code>xlevels</code>: this is safer if <code>data</code> was supplied or
<code>model = FALSE</code> was used and the levels of factors used in
the fit had been re-ordered since fitting.
</p>
<p>Similarly, <code>model.frame(fm, data=&lt;data&gt;)</code> copies across
the variables used for safe prediction from the fit.
</p>
</li>
<li><p> Functions such as <code>parLapply()</code> in package
<span class="pkg">parallel</span> can make use of a default cluster if one is set.
(Reported by Martin Morgan.)
</p>
</li>
<li> <p><code>chol(pivot = TRUE, LINPACK = FALSE)</code> is now available
using LAPACK 3.2 subroutine <code>DPSTRF</code>.
</p>
</li>
<li><p> The functions <code>.C()</code>, <code>.Call()</code>,
<code>.External()</code> and <code>.Fortran()</code> now check that they are
called with an unnamed first argument: the formal arguments were
changed from <code>name=</code> to <code>.NAME=</code> in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.13.0, but some
packages were still using the old name.  This is currently a
warning, but will be an error in future.
</p>
</li>
<li> <p><code>step()</code> no longer tries to improve a model with
AIC of <code>-Inf</code> (a perfect fit).
</p>
</li>
<li> <p><code>spline()</code> and <code>splinefun()</code> gain a new method
<code>"hyman"</code>, an implementation of Hyman's method of
constructing monotonic interpolation splines.  (Based on
contributions of Simon Wood and Rob Hyndman.)
</p>
</li>
<li><p> On Windows, the C stack size has been increased to 64MB (it
has been 10MB since the days of 32MB RAM systems).
</p>
</li></ul>




<h4>PERFORMANCE IMPROVEMENTS</h4>


<ul>
<li> <p><code>array()</code> is now implemented in C code (for speed) when
<code>data</code> is atomic or an unclassed list (so it is known that
<code>as.vector(data)</code> will have no class to be used by <code>rep()</code>).
</p>
</li>
<li> <p><code>rep()</code> is faster and uses less memory,
substantially so in some common cases (e.g., if <code>times</code> is of
length one or <code>length.out</code> is given, and <code>each = 1</code>).
</p>
</li>
<li> <p><code>findInterval()</code>, <code>tabulate()</code>, <code>cut()</code>,
<code>hist()</code> and <code>image.default()</code> all use <code>.Call()</code>
and are more efficient.
</p>
</li>
<li> <p><code>duplicated()</code>, <code>unique()</code> and similar now
support vectors of lengths above <i>2^29</i> on 64-bit
platforms.
</p>
</li>
<li><p> Omitting <code>PACKAGE</code> in <code>.C()</code> etc calls was
supposed to make use of the DLL from the namespace within which
the enclosing function was defined.  It was less successful in
doing so than it might be, and gave no indication it had failed.
</p>
<p>A new search strategy is very successful and gives a warning
when it fails.  In most cases this is because the entry point is
not actually provided by that package (and so <code>PACKAGE</code>
should be used to indicate which package is intended) but in some
the namespace does not have a DLL specified by a
<code>useDynLib()</code> directive so <code>PACKAGE</code> is required.
</p>
</li></ul>




<h4>UTILITIES</h4>


<ul>
<li> <p><code>R CMD check</code> now checks if a package can be loaded
by <code>library(pkgname, lib.loc = "somewhere")</code> without being on
the library search path (unless it is already installed in
<code>.Library</code>, when it always will be).
</p>
</li>
<li> <p><code>R CMD check --as-cran</code> notes &lsquo;hidden&rsquo; files
and directories (with names starting with a dot) that are not
needed for the operation of <code>R CMD INSTALL</code> or <code>R CMD
	build</code>: such files should be excluded from the published tarball.
</p>
</li>
<li> <p><code>R CMD check</code> (if checking subdirectories) checks
that the <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> code in any demos is ASCII and can be parsed, and
warns if not.
</p>
</li>
<li><p> When <code>R CMD Rd2pdf</code> is used with &lsquo;<span class="file">inputenx.sty</span>&rsquo;,
it allows further characters (mainly for Eastern European
languages) by including &lsquo;<span class="file">ix-utf8enc.dfu</span>&rsquo; (if available).
(Wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=14989">PR#14989</a>.)
</p>
</li>
<li> <p><code>R CMD build</code> now omits several types of hidden
files/directories, including &lsquo;<span class="file">inst/doc/.Rinstignore</span>&rsquo;,
&lsquo;<span class="file">vignettes/.Rinstignore</span>&rsquo;, (&lsquo;<span class="file">.Rinstignore</span>&rsquo; should be at
top level), &lsquo;<span class="file">.deps</span>&rsquo; under &lsquo;<span class="file">src</span>&rsquo;, &lsquo;<span class="file">.Renviron</span>&rsquo;,
&lsquo;<span class="file">.Rprofile</span>&rsquo;, &lsquo;<span class="file">.Rproj.user</span>&rsquo;, &lsquo;<span class="file">.backups</span>&rsquo;,
&lsquo;<span class="file">.cvsignore</span>&rsquo;, &lsquo;<span class="file">.cproject</span>&rsquo;, &lsquo;<span class="file">.directory</span>&rsquo;,
&lsquo;<span class="file">.dropbox</span>&rsquo;, &lsquo;<span class="file">.exrc</span>&rsquo;, &lsquo;<span class="file">.gdb.history</span>&rsquo;,
&lsquo;<span class="file">.gitattributes</span>&rsquo;, &lsquo;<span class="file">.gitignore</span>&rsquo;, &lsquo;<span class="file">.gitmodules</span>&rsquo;,
&lsquo;<span class="file">.hgignore</span>&rsquo;, &lsquo;<span class="file">.hgtags</span>&rsquo;, &lsquo;<span class="file">.htaccess</span>&rsquo;,
&lsquo;<span class="file">.latex2html-init</span>&rsquo;, &lsquo;<span class="file">.project</span>&rsquo;, &lsquo;<span class="file">.seed</span>&rsquo;,
&lsquo;<span class="file">.settings</span>&rsquo;, &lsquo;<span class="file">.tm_properties</span>&rsquo; and various leftovers.
</p>
</li>
<li> <p><code>R CMD check</code> now checks for <code>.C()</code>,
<code>.Call()</code>, <code>.External()</code> and <code>.Fortran()</code> calls in
other packages, and gives a warning on those found from <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> itself
(which are not part of the API and change without notice: many
will be changed for <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.0.0).
</p>
</li></ul>




<h4>C-LEVEL FACILITIES</h4>


<ul>
<li><p> The limit for <code>R_alloc</code> on 64-bit platforms has been
raised to just under 32GB (from just under 16GB).
</p>
</li>
<li><p> The misuse of <code>.C("name", ..., PACKAGE = foo)</code> where
<code>foo</code> is an arbitrary <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> object is now an error.
</p>
<p>The misuse <code>.C("name",..., PACKAGE = "")</code> is now warned about
in <code>R CMD check</code>, and will be an error in future.
</p>
</li></ul>




<h4>DEPRECATED AND DEFUNCT</h4>


<ul>
<li><p> Use of <code>array()</code> with a 0-length <code>dim</code> argument is
deprecated with a warning (and was contrary to the documentation).
</p>
</li>
<li><p> Use of <code>tapply()</code> with a 0-length <code>INDEX</code> list is
deprecated with a warning.
</p>
</li>
<li> <p><span class="samp">Translation</span> packages are deprecated.
</p>
</li>
<li><p> Calling <code>rep()</code> or <code>rep.int()</code> on a pairlist is
deprecated and will give a warning.  In any case, <code>rep()</code>
converted a pairlist to a list so you may as well do that
explicitly.
</p>
</li>
<li><p> Entry point <code>rcont2</code> is no longer part of the API, and
will move to package <span class="pkg">stats</span> in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.0.0.
</p>
</li>
<li><p> The &lsquo;internal&rsquo; graphics device invoked by
<code>.Call("R_GD_nullDevice", package = "grDevices")</code> is about to
be removed: use <code>pdf(file = NULL)</code> instead.
</p>
</li>
<li> <p><code>eigen(EISPACK = TRUE)</code>,
<code>chol(pivot = FALSE, LINPACK = TRUE)</code>,
<code>chol2inv(LINPACK = TRUE)</code>, <code>solve(LINPACK = TRUE)</code> and
<code>svd(LINPACK = TRUE)</code> are deprecated and give a warning.
</p>
<p>They were provided for compatibility with <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 1.7.0 (Mar 2003)!
</p>
</li>
<li><p> The &lsquo;internal function&rsquo; <code>kappa.tri()</code> has been
renamed to <code>.kappa_tri()</code> so it is not inadvertently called
as a method for class <code>"tri"</code>.
</p>
</li>
<li><p> Functions <code>sessionData()</code> and <code>browseAll()</code> in
package <span class="pkg">methods</span> are on a help page describing them as
&lsquo;deprecated&rsquo; and are now formally deprecated.
</p>
</li></ul>




<h4>PACKAGE INSTALLATION</h4>


<ul>
<li><p> For a Windows or Mac OS X binary package install,
<code>install.packages()</code> will check if a source package is
available on the same repositories, and report if it is a later
version or there is a source package but no binary package
available.
</p>
<p>This check can be suppressed: see the help page.
</p>
</li>
<li> <p><code>install.packages(type = "both")</code> has been enhanced.
In interactive use it will ask whether to choose the source
version of a package if the binary version is older and contains
compiled code, and also asks if source packages with no binary
version should be installed).
</p>
</li></ul>




<h4>INSTALLATION</h4>


<ul>
<li><p> There is a new <code>configure</code> option
<span class="option">--with-libtiff</span> (mainly in case the system installation
needs to be avoided).
</p>
</li>
<li><p> LAPACK 3.4.1 does use some Fortran 90 features, so
<code>g77</code> no longer suffices.
</p>
</li>
<li><p> If an external LAPACK is used, it must be version 3.2 or later.
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li><p> On Windows, starting <code>Rterm</code> via <code>R.exe</code>
caused Ctrl-C to misbehave.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14948">PR#14948</a>)
</p>
</li>
<li><p> The <code>tools::latexToUtf8()</code> function missed conversions that
were contained within braces.
</p>
</li>
<li><p> Long timezone specifications (such as a file name preceded
by <code>:</code>) could crash <code>as.POSIXlt</code>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14945">PR#14945</a>)
</p>
</li>
<li> <p><code>R CMD build --resave-data</code> could fail if there was no
&lsquo;<span class="file">data</span>&rsquo; directory but there was an &lsquo;<span class="file">R/sysdata.rda</span>&rsquo; file.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=14947">PR#14947</a>)
</p>
</li>
<li> <p><code>is.na()</code> misbehaved on a 0-column data frame.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=14959">PR#14959</a>)
</p>
</li>
<li> <p><code>anova.lmlist()</code> failed if <code>test</code> was
supplied.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14960">PR#14960</a>)
</p>
<p>It was unable to compute Cp tests for object of class <code>"lm"</code>
(it assumed class <code>"glm"</code>).
</p>
</li>
<li><p> The <code>formula</code> method for <code>sunflowerplot()</code> now
allows <code>xlab</code> and <code>ylab</code> to be set.  (Reported by Gerrit
Eichner.)
</p>
</li>
<li><p> The <code>"POSIXt"</code> and <code>"Date"</code> methods for <code>hist()</code>
could fail on Windows where adjustments to the right-hand boundary
crossed a DST transition time.
</p>
</li>
<li><p> On Windows, the code in <code>as.POSIXct()</code> to handle
incorrectly specified <code>isdst</code> fields might have resulted in
<code>NA</code> being returned.
</p>
</li>
<li> <p><code>aov()</code> and <code>manova()</code> gave spurious warning about
singular error model in the multiresponse case.
</p>
</li>
<li><p> In <code>ns()</code> and <code>bs()</code>, specifying <code>knots = NULL</code>
is now equivalent to omitting it, also when <code>df</code> is
specified.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14970">PR#14970</a>)
</p>
</li>
<li> <p><code>sprintf()</code> did not accept numbered arguments ending
in zero.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14975">PR#14975</a>)
</p>
</li>
<li> <p><code>rWishart()</code> could overflow the C stack and maybe crash
the <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> process for dimensions of several hundreds or more.
(Reported by Michael Braun on R-sig-mac.)
</p>
</li>
<li><p> Base package vignettes (e.g., <code>vignette("Sweave")</code>) were
not fully installed in builds of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> from the tarball.
</p>
</li>
<li> <p><code>lchoose()</code> and <code>choose()</code> could overflow the C
stack and crash <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>.
</p>
</li>
<li><p> When given a 0-byte file and asked to keep source
references, <code>parse()</code> read input from <code>stdin()</code>
instead.
</p>
</li>
<li> <p><code>pdf(compress = TRUE)</code> did not delete temporary files
it created until the end of the <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> session.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14991">PR#14991</a>)
</p>
</li>
<li> <p><code>logLik()</code> did not detect the error of applying it
to a multiple-response linear model.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15000">PR#15000</a>)
</p>
</li>
<li> <p><code>file.copy(recursive = TRUE)</code> did not always report
<code>FALSE</code> for a failure two or more directories deep.
</p>
</li>
<li> <p><code>qgeom()</code> could return <code>-1</code> for extremely small
<code>q</code>. (<a href="https://bugs.R-project.org/show_bug.cgi?id=14967">PR#14967</a>)
</p>
</li>
<li> <p><code>smooth.spline()</code> used <code>DUP = FALSE</code> which allowed
its compiled C code to change the function: this was masked by the
default byte-compilation. (<a href="https://bugs.R-project.org/show_bug.cgi?id=14965">PR#14965</a>)
</p>
</li>
<li><p> In Windows, the GUI preferences for foreground color were
not always respected.  (Reported by Benjamin Wells.)
</p>
</li>
<li><p> On OS X, the Quartz versions of the bitmap devices did not
respect <code>antialias = "none"</code>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15006">PR#15006</a>)
</p>
</li>
<li> <p><code>unique()</code> and similar would infinite-loop if called on
a vector of length &gt; <i>2^29</i> (but reported that the
vector was too long for <i>2^30</i> or more).
</p>
</li>
<li> <p><code>parallel::stopCluster()</code> now works with MPI
clusters without <a href="https://CRAN.R-project.org/package=snow"><span class="pkg">snow</span></a> being on the search path.
</p>
</li>
<li> <p><code>terms.formula()</code> could exhaust the stack, and the
stack check did not always catch this before the segfault.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=15013">PR#15013</a>)
</p>
</li>
<li> <p><code>sort.list(method = "radix")</code> could give incorrect
results on certain compilers (seen with <code>clang</code> on Mac OS
10.7 and <code>Xcode 4.4.1</code>).
</p>
</li>
<li> <p><code>backsolve(T, b)</code> gave incorrect results when
<code>nrows(b) &gt; ncols(T)</code> and <code>b</code> had more than one column.
</p>
<p>It could segfault or give nonsense if <code>k</code> was specified as
more than <code>ncols(T)</code>.
</p>
</li>
<li> <p><code>smooth.spline()</code> did not check that a specified
numeric <code>spar</code> was of length 1, and gave corrupt results if
it was of length 0.
</p>
</li>
<li><p> Protection added to <code>do_system</code>. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15025">PR#15025</a>)
</p>
</li>
<li><p> Printing of vectors with names &gt; 1000 characters now works
correctly rather than truncating. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15028">PR#15028</a>)
</p>
</li>
<li> <p><code>qr()</code> for a complex matrix did not pivot the column names.
</p>
</li>
<li> <p><code>--with-blas='-framework vecLib'</code> now also works on OS X 10.8.
</p>
</li>
<li> <p><code>R CMD check</code> no longer fails with an error if
a &lsquo;<span class="file">DESCRIPTION</span>&rsquo; file incorrectly contains a blank line.
(Reported by Bill Dunlap.)
</p>
</li>
<li> <p><code>install.packages(type = "both")</code> could call
<code>chooseCRANmirror()</code> twice.
</p>
</li>
<li> <p><code>lm.wfit()</code> could segfault in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.15.1 if all the
weights were zero. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15044">PR#15044</a>)
</p>
</li>
<li><p> A malformed package name could cause <code>R CMD INSTALL</code>
to write outside the target library.
</p>
</li>
<li><p> Some of the quality control functions
(e.g., <code>tools::checkFF()</code>) were wrongly identifying the source
of S4 methods in a package and so not checking them.
</p>
</li>
<li><p> The default type of display by <code>browseEnv()</code> when using
<code>R.app</code> on Mac OS X has been incorrect for a long time.
</p>
</li>
<li><p> The implementation of <code>importMethodsFrom</code> in a
<code>NAMESPACE</code> file could be confused and fail to find generics
when importing from multiple packages (reported and fixed by
Michael Lawrence).
</p>
</li>
<li><p> The detection of the C stack direction is better protected
against compiler optimization. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15011">PR#15011</a>)
</p>
</li>
<li><p> Long custom line types would sometimes segfault on the
cairographics-based devices. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15055">PR#15055</a>)
</p>
</li>
<li> <p><code>tools::checkPoFile()</code> unprotected too early in its C
code and so segfaulted from time to time.
</p>
</li>
<li><p> The Fortran code underlying <code>nlminb()</code> could
infinite-loop if any of the input functions returned <code>NA</code> or
<code>NaN</code>.  This is now an error for the gradient or Hessian, and
a warning for the function (with the value replaced by
<code>Inf</code>).  (In part, <a href="https://bugs.R-project.org/show_bug.cgi?id=15052">PR#15052</a>.)
</p>
</li>
<li><p> The code for creating <code>coerce()</code> methods could
generate false notes about ambiguous selection; the notes have
been suppressed for this function.
</p>
</li>
<li> <p><code>arima.sim()</code> could give too long an output in some
corner cases (in part, <a href="https://bugs.R-project.org/show_bug.cgi?id=15068">PR#15068</a>).
</p>
</li>
<li> <p><code>anova.glm()</code> with <code>test = "Rao"</code> didn't work when
models included an offset. (Reported by Søren Feodor Nielsen.)
</p>
</li>
<li> <p><code>as.data.frame.matrix()</code> could return invalid data
frame with no <code>row.names</code> attribute for 0-row matrix. (Reported
by Hervé Pagès.)
</p>
</li>
<li><p> Compilation with the <code>vecLib</code> or <code>Accelerate</code>
frameworks on OS X without using that also for LAPACK is more
likely to be successful.
</p>
</li></ul>




<h3><img class="toplogo" src="../help/figures/../../html/Rlogo.svg" alt="[R logo]" /> CHANGES IN R VERSION 2.15.1</h3>



<h4>NEW FEATURES</h4>


<ul>
<li> <p><code>source()</code> now uses <code>withVisible()</code> rather than
<code>.Internal(eval.with.vis)</code>.  This sometimes alters tracebacks
slightly.
</p>
</li>
<li> <p><code>install.packages("pkg_version.tgz")</code> on Mac OS X now
has sanity checks that this is actually a binary package (as
people have tried it with incorrectly named source packages).
</p>
</li>
<li> <p><code>splineDesign()</code> and <code>spline.des()</code> in package
<span class="pkg">splines</span> have a new option <code>sparse</code> which can be used
for efficient construction of a sparse B-spline design matrix
(<em>via</em> <a href="https://CRAN.R-project.org/package=Matrix"><span class="pkg">Matrix</span></a>).
</p>
</li>
<li> <p><code>norm()</code> now allows <code>type = "2"</code> (the
&lsquo;spectral&rsquo; or 2-norm) as well, mainly for didactical
completeness.
</p>
</li>
<li> <p><code>pmin()</code> and <code>pmax())</code> now also work when one of
the inputs is of length zero and others are not, returning a
zero-length vector, analogously to, say, <code>+</code>.
</p>
</li>
<li> <p><code>colorRamp()</code> (and hence <code>colorRampPalette()</code>) now
also works for the boundary case of just one color when the ramp is
flat.
</p>
</li>
<li> <p><code>.C()</code> gains some protection against the misuse of
character vector arguments.  (An all too common error is to pass
<code>character(N)</code>, which initializes the elements to <code>""</code>,
and then attempt to edit the strings in-place, sometimes forgetting
to terminate them.)
</p>
</li>
<li><p> Calls to the new function <code>globalVariables()</code> in
package <span class="pkg">utils</span> declare that functions and other objects in a
package should be treated as globally defined, so that <code>CMD
      check</code> will not note them.
</p>
</li>
<li> <p><code>print(packageDescription(*))</code> trims the <code>Collate</code>
field by default.
</p>
</li>
<li><p> The included copy of <code>zlib</code> has been updated to version
1.2.7.
</p>
</li>
<li><p> A new option <code>"show.error.locations"</code> has been added.
When set to <code>TRUE</code>, error messages will contain the
location of the most recent call containing source reference
information. (Other values are supported as well; see
<code>?options</code>.)
</p>
</li>
<li><p> The NA warning messages from e.g. <code>pchisq()</code> now report
the call to the closure and not that of the <code>.Internal</code>.
</p>
</li>
<li><p> Added Polish translations by Łukasz Daniel.
</p>
</li></ul>




<h4>PERFORMANCE IMPROVEMENTS</h4>


<ul>
<li><p> In package <span class="pkg">parallel</span>, <code>makeForkCluster()</code> and the
multicore-based functions use native byte-order for serialization
(deferred from 2.15.0).
</p>
</li>
<li> <p><code>lm.fit()</code>, <code>lm.wfit()</code>, <code>glm.fit()</code> and
<code>lsfit()</code> do less copying of objects, mainly by using
<code>.Call()</code> rather than <code>.Fortran()</code>.
</p>
</li>
<li> <p><code>.C()</code> and <code>.Fortran()</code> do less copying: arguments
which are raw, logical, integer, real or complex vectors and are
unnamed are not copied before the call, and (named or not) are not
copied after the call.  Lists are no longer copied (they are
supposed to be used read-only in the C code).
</p>
</li>
<li> <p><code>tabulate()</code> makes use of <code>.C(DUP = FALSE)</code> and
hence does not copy <code>bin</code>.  (Suggested by Tim Hesterberg.)
It also avoids making a copy of a factor argument <code>bin</code>.
</p>
</li>
<li><p> Other functions (often or always) doing less copying include
<code>cut()</code>, <code>dist()</code>, the complex case of <code>eigen()</code>,
<code>hclust()</code>, <code>image()</code>, <code>kmeans()</code>, <code>loess()</code>,
<code>stl()</code> and <code>svd(LINPACK = TRUE)</code>.
</p>
</li>
<li><p> There is less copying when using primitive replacement
functions such as <code>names()</code>, <code>attr()</code> and
<code>attributes()</code>.
</p>
</li></ul>




<h4>DEPRECATED AND DEFUNCT</h4>


<ul>
<li><p> The converters for use with <code>.C()</code> (see
<code>?getCConverterDescriptions</code>) are deprecated: use the
<code>.Call()</code> interface instead.  There are no known examples
(they were never fully documented).
</p>
</li></ul>




<h4>UTILITIES</h4>


<ul>
<li><p> For <code>R CMD check</code>, a few people have reported
problems with junctions on Windows (although they were tested on
Windows 7, XP and Server 2008 machines and it is unknown under
what circumstances the problems occur).  Setting the environment
variable <span class="env">R_WIN_NO_JUNCTIONS</span> to a non-empty value (e.g., in
&lsquo;<span class="file">~/.R/check.Renviron</span>&rsquo;) will force copies to be used instead.
</p>
</li></ul>




<h4>INSTALLATION</h4>


<ul>
<li> <p><code>R CMD INSTALL</code> with <span class="env">_R_CHECK_INSTALL_DEPENDS_</span>
set to a true value (as done by <code>R CMD check --as-cran</code>)
now restricts the packages available when lazy-loading as well
as when test-loading (since packages such as <a href="https://CRAN.R-project.org/package=ETLUtils"><span class="pkg">ETLUtils</span></a>
and <a href="https://CRAN.R-project.org/package=agsemisc"><span class="pkg">agsemisc</span></a> had top-level calls to <code>library()</code>
for undeclared packages).
</p>
<p>This check is now also available on Windows.
</p>
</li></ul>




<h4>C-LEVEL FACILITIES</h4>


<ul>
<li><p> C entry points <code>mkChar</code> and <code>mkCharCE</code> now check
that the length of the string they are passed does not exceed
<i>2^31-1</i> bytes: they used to overflow with
unpredictable consequences.
</p>
</li>
<li><p> C entry points <code>R_GetCurrentSrcref</code> and
<code>R_GetSrcFilename</code> have been added to the API to allow
debuggers access to the source references on the stack.
</p>
</li></ul>




<h4>WINDOWS-SPECIFIC CHANGES</h4>


<ul>
<li><p> Windows-specific changes will now be announced in this file
(&lsquo;<span class="file">NEWS</span>&rsquo;).  Changes up and including <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.15.0 remain in the
&lsquo;<span class="file">CHANGES</span>&rsquo; file.
</p>
</li>
<li><p> There are two new environment variables which
control the defaults for command-line options.
</p>
<p>If <span class="env">R_WIN_INTERNET2</span> is set to a non-empty value, it is as if
<span class="option">--internet2</span> was used.
</p>
<p>If <span class="env">R_MAX_MEM_SIZE</span> is set, it gives the default memory limit
if <span class="option">--max-mem-size</span> is not specified: invalid values being
ignored.
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li> <p><code>lsfit()</code> lost the names from the residuals.
</p>
</li>
<li><p> More cases in which <code>merge()</code> could create a data frame
with duplicate column names now give warnings.  Cases where
names specified in <code>by</code> match multiple columns are errors.
</p>
</li>
<li><p> Nonsense uses such as <code>seq(1:50, by = 5)</code> (from package
<a href="https://CRAN.R-project.org/package=plotrix"><span class="pkg">plotrix</span></a>) and <code>seq.int(1:50, by = 5)</code> are now errors.
</p>
</li>
<li><p> The residuals in the 5-number summary printed by
<code>summary()</code> on an <code>"lm"</code> object are now explicitly
labelled as weighted residuals when non-constant weights are
present.  (Wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=14840">PR#14840</a>.)
</p>
</li>
<li> <p><code>tracemem()</code> reported that all objects were copied
by <code>.C()</code> or <code>.Fortran()</code> whereas only some object types
were ever copied.
</p>
<p>It also reported and marked as copies <em>some</em> transformations
such as <code>rexp(n, x)</code>: it no longer does so.
</p>
</li>
<li><p> The <code>plot()</code> method for class <code>"stepfun"</code> only
used the optional <code>xval</code> argument to compute <code>xlim</code> and
not the points at which to plot (as documented).  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14864">PR#14864</a>)
</p>
</li>
<li><p> Names containing characters which need to be escaped were
not deparsed properly.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14846">PR#14846</a>)
</p>
</li>
<li><p> Trying to update (recommended) packages in
&lsquo;<span class="file">R_HOME/library</span>&rsquo; without write access is now dealt with more
gracefully.  Further, such package updates may be skipped (with a
warning), when a newer installed version is already going to be
used from <code>.libPaths()</code>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14866">PR#14866</a>)
</p>
</li>
<li> <p><code>hclust()</code> is now fast again (as up to end of 2003),
with a different fix for the &quot;median&quot;/&quot;centroid&quot; problem.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=4195">PR#4195</a>).
</p>
</li>
<li> <p><code>get_all_vars()</code> failed when the data came entirely
from vectors in the global environment. (<a href="https://bugs.R-project.org/show_bug.cgi?id=14847">PR#14847</a>)
</p>
</li>
<li> <p><code>R CMD check</code> with <span class="env">_R_CHECK_NO_RECOMMENDED_</span>
set to a true value (as done by the <code>--as-cran</code> option)
could issue false errors if there was an indirect dependency
on a recommended package.
</p>
</li>
<li> <p><code>formatC()</code> uses the C entry point <code>str_signif</code>
which could write beyond the length allocated for the output string.
</p>
</li>
<li><p> Missing default argument added to implicit S4 generic for
<code>backsolve()</code>. (<a href="https://bugs.R-project.org/show_bug.cgi?id=14883">PR#14883</a>)
</p>
</li>
<li><p> Some bugs have been fixed in handling load actions that
could fail to export assigned items or generate spurious warnings
in <code>CMD check</code> on loading.
</p>
</li>
<li><p> For <code>tiff(type = "windows")</code>, the numbering of per-page
files except the last was off by one.
</p>
</li>
<li><p> On Windows, loading package <span class="pkg">stats</span> (which is done for
a default session) would switch line endings on &lsquo;<span class="file">stdout</span>&rsquo;
and &lsquo;<span class="file">stderr</span>&rsquo; from CRLF to LF.  This affected
<code>Rterm</code> and <code>R CMD BATCH</code>.
</p>
</li>
<li><p> On Windows, the compatibility function <code>x11()</code> had
not kept up with changes to <code>windows()</code>, and issued
warnings about bad parameters. (<a href="https://bugs.R-project.org/show_bug.cgi?id=14880">PR#14880</a>)
</p>
</li>
<li><p> On Windows, the <code>Sys.glob()</code> function did not handle
UNC paths as it was designed to try to do. (<a href="https://bugs.R-project.org/show_bug.cgi?id=14884">PR#14884</a>)
</p>
</li>
<li><p> In package <span class="pkg">parallel</span>, <code>clusterApply()</code> and similar
failed to handle a (pretty pointless) length-1 argument. (<a href="https://bugs.R-project.org/show_bug.cgi?id=14898">PR#14898</a>)
</p>
</li>
<li><p> Quartz Cocoa display reacted asynchronously to
<code>dev.flush()</code> which means that the redraw could be performed
after the plot has been already modified by subsequent code. The
redraw is now done synchronously in <code>dev.flush()</code> to allow
animations without sleep cycles.
</p>
</li>
<li><p> Source locations reported in <code>traceback()</code> were
incorrect when byte-compiled code was on the stack.
</p>
</li>
<li> <p><code>plogis(x, lower = FALSE, log.p = TRUE)</code> no longer
underflows early for large x (e.g., 800).
</p>
</li>
<li> <p><code>?Arithmetic</code>'s &ldquo;<code>1 ^ y</code> and <code>y ^ 0</code>
are <code>1</code>, <em>always</em>&rdquo; now also applies for <code>integer</code>
vectors <code>y</code>.
</p>
</li>
<li><p> X11-based pixmap devices like <code>png(type = "Xlib")</code> were
trying to set the cursor style, which triggered some warnings and
hangs.
</p>
</li>
<li><p> Code executed by the built-in HTTP server no longer allows
other HTTP clients to re-enter <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> until the current worker
evaluation finishes, to prevent cascades.
</p>
</li>
<li><p> The <code>plot()</code> and <code>Axis()</code> methods for class
<code>"table"</code> now respect graphical parameters such as
<code>cex.axis</code>.  (Reported by Martin Becker.)
</p>
</li>
<li><p> Under some circumstances <code>package.skeleton()</code> would
give out progress reports that could not be translated and so were
displayed by question marks.  Now they are always in English.
(This was seen for CJK locales on Windows, but may have occurred
elsewhere.)
</p>
</li>
<li><p> The evaluator now keeps track of source references outside
of functions, e.g. when <code>source()</code> executes a script.
</p>
</li>
<li><p> The replacement method for <code>window()</code> now works
correctly for multiple time series of class <code>"mts"</code>.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=14925">PR#14925</a>)
</p>
</li>
<li> <p><code>is.unsorted()</code> gave incorrect results on non-atomic
objects such as data frames.  (Reported by Matthew Dowle.)
</p>
</li>
<li><p> The value returned by <code>tools::psnice()</code> for invalid
<code>pid</code> values was not always <code>NA</code> as documented.
</p>
</li>
<li><p> Closing an <code>X11()</code> window while <code>locator()</code> was
active could abort the <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> process.
</p>
</li>
<li> <p><code>getMethod(f, sig)</code> produced an incorrect error message
in some cases when <code>f</code> was not a string).
</p>
</li>
<li><p> Using a string as a &ldquo;call&rdquo; in an error condition
with <code>options(showErrorCalls=TRUE)</code> could cause a segfault.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=14931">PR#14931</a>)
</p>
</li>
<li><p> The string <code>"infinity"</code> allowed by C99 was not accepted
as a numerical string value by e.g. <code>scan()</code> and
<code>as.numeric()</code>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14933">PR#14933</a>)
</p>
</li>
<li><p> In <code>legend()</code>, setting some entries of <code>lwd</code> to
<code>NA</code> was inconsistent (depending on the graphics device) in
whether it would suppress those lines; now it consistently does
so.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14926">PR#14926</a>)
</p>
</li>
<li> <p><code>by()</code> failed for a zero-row data frame.  (Reported by
Weiqiang Qian.)
</p>
</li>
<li><p> The Yates' correction in <code>chisq.test()</code> could be bigger
than the terms it corrected, previously leading to an infinite
test statistic in some corner cases which are now reported as
<code>NaN</code>.
</p>
</li>
<li> <p><code>xgettext()</code> and related functions sometimes returned
items that were not strings for translation. (<a href="https://bugs.R-project.org/show_bug.cgi?id=14935">PR#14935</a>)
</p>
</li>
<li> <p><code>plot(&lt;lm&gt;, which=5)</code> now correctly labels the factor
level combinations for the special case where all
<i>h[i,i]</i> are the same. (<a href="https://bugs.R-project.org/show_bug.cgi?id=14837">PR#14837</a>)
</p>
</li>
<li> <p><code>Sys.glob()</code> caused a segfault if the first element of
<code>path</code> was <code>NA_character</code>. (<a href="https://bugs.R-project.org/show_bug.cgi?id=14990">PR#14990</a>)
</p>
</li></ul>




<h3><img class="toplogo" src="../help/figures/../../html/Rlogo.svg" alt="[R logo]" /> CHANGES IN R VERSION 2.15.0</h3>



<h4>SIGNIFICANT USER-VISIBLE CHANGES</h4>


<ul>
<li><p> The behaviour of <code>unlink(recursive = TRUE)</code> for a
symbolic link to a directory has changed: it now removes the link
rather than the directory contents (just as <code>rm -r</code> does).
</p>
<p>On Windows it no longer follows reparse points (including
junctions and symbolic links).
</p>
</li></ul>




<h4>NEW FEATURES</h4>


<ul>
<li><p> Environment variable <span class="env">RD2DVI_INPUTENC</span> has been renamed
to <span class="env">RD2PDF_INPUTENC</span>.
</p>
</li>
<li> <p><code>.Deprecated()</code> becomes a bit more flexible, getting an
<code>old</code> argument.
</p>
</li>
<li><p> Even data-only packages without <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> code need a namespace and
so may need to be installed under <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.14.0 or later.
</p>
</li>
<li> <p><code>assignInNamespace()</code> has further restrictions on use
apart from at top-level, as its help page has warned.
Expect it to be disabled from programmatic use in the future.
</p>
</li>
<li> <p><code>system()</code> and <code>system2()</code> when capturing output
report a non-zero status in the new <code>"status"</code> attribute.
</p>
</li>
<li> <p><code>kronecker()</code> now has an S4 generic in package
<span class="pkg">methods</span> on which packages can set methods.  It will be
invoked by <code>X %x% Y</code> if either <code>X</code> or <code>Y</code> is an S4
object.
</p>
</li>
<li> <p><code>pdf()</code> accepts forms like <code>file = "|lpr"</code> in the
same way as <code>postscript()</code>.
</p>
</li>
<li> <p><code>pdf()</code> accepts <code>file = NULL</code>.
This means that the device does NOT create a PDF file
(but it can still be queried, e.g., for font metric info).
</p>
</li>
<li> <p><code>format()</code> (and hence <code>print()</code>) on
<code>"bibentry"</code> objects now uses <code>options("width")</code> to
set the output width.
</p>
</li>
<li> <p><code>legend()</code> gains a <code>text.font</code> argument. (Suggested
by Tim Paine, <a href="https://bugs.R-project.org/show_bug.cgi?id=14719">PR#14719</a>.)
</p>
</li>
<li> <p><code>nchar()</code> and <code>nzchar()</code> no longer accept factors
(as integer vectors).  (Wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=6899">PR#6899</a>.)
</p>
</li>
<li> <p><code>summary()</code> behaves slightly differently (or more
precisely, its <code>print()</code> method does).  For numeric inputs, the
number of NAs is printed as an integer and not a real.  For dates
and datetimes, the number of NAs is included in the printed output
(the latter being the wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=14720">PR#14720</a>).
</p>
<p>The <code>"data.frame"</code> method is more consistent with the default
method: in particular it now applies <code>zapsmall()</code> to
numeric/complex summaries.
</p>
</li>
<li><p> The number of items retained with <code>options(warn = 0)</code>
can be set by <code>options(nwarnings=)</code>.
</p>
</li>
<li><p> There is a new function <code>assignInMyNamespace()</code> which
uses the namespace of the function it is called from.
</p>
</li>
<li> <p><code>attach()</code> allows the default name for an attached file
to be overridden.
</p>
</li>
<li> <p><code>bxp()</code>, the work horse of <code>boxplot()</code>, now uses a
more sensible default <code>xlim</code> in the case where <code>at</code> is
specified differently from <code>1:n</code>, see the discussion on R-devel,
<a href="https://stat.ethz.ch/pipermail/r-devel/2011-November/062586.html">https://stat.ethz.ch/pipermail/r-devel/2011-November/062586.html</a>.
</p>
</li>
<li><p> New function <code>paste0()</code>, an efficient version of
<code>paste(*, sep="")</code>, to be used in many places for more
concise (and slightly more efficient) code.
</p>
</li>
<li><p> Function <code>setClass()</code> in package <span class="pkg">methods</span> now
returns, invisibly, a generator function for the new class,
slightly preferred to calling <code>new()</code>, as explained on the
<code>setClass</code> help page.
</p>
</li>
<li><p> The <code>"dendrogram"</code> method of <code>str()</code> now takes
its default for <code>last.str</code> from option <code>str.dendrogram.last</code>.
</p>
</li>
<li><p> New simple <code>fitted()</code> method for <code>"kmeans"</code> objects.
</p>
</li>
<li><p> The <code>traceback()</code> function can now be called with
an integer argument, to display a current stack trace. (Wish of
<a href="https://bugs.R-project.org/show_bug.cgi?id=14770">PR#14770</a>.)
</p>
</li>
<li> <p><code>setGeneric()</code> calls can be simplified when creating
a new generic function by supplying the default method as the
<code>def</code> argument.  See <code>?setGeneric</code>.
</p>
</li>
<li> <p><code>serialize()</code> has a new option <code>xdr = FALSE</code> which
will use the native byte-order for binary serializations.  In
scenarios where only little-endian machines are involved (these
days, close to universal) and (un)serialization takes an
appreciable amount of time this may speed up noticeably
transferring data between systems.
</p>
</li>
<li><p> The internal (un)serialization code is faster for long
vectors, particularly with XDR on some platforms.  (Based on a
suggested patch by Michael Spiegel.)

</p>
</li>
<li><p> For consistency, circles with zero radius are omitted by
<code>points()</code> and <code>grid.circle()</code>.  Previously this was
device-dependent, but they were usually invisible.
</p>
</li>
<li> <p><code>NROW(x)</code> and <code>NCOL(x)</code> now work whenever
<code>dim(x)</code> looks appropriate, e.g., also for more generalized
matrices.
</p>
</li>
<li><p> PCRE has been updated to version 8.30.
</p>
</li>
<li><p> The internal <code>R_Srcref</code> variable is now updated
before the browser stops on entering a function.  (Suggestion of
<a href="https://bugs.R-project.org/show_bug.cgi?id=14818">PR#14818</a>.)
</p>
</li>
<li><p> There are &lsquo;bare-bones&rsquo; functions <code>.colSums()</code>,
<code>.rowSums()</code>, <code>.colMeans()</code> and <code>.rowMeans()</code> for
use in programming where ultimate speed is required.
</p>
</li>
<li><p> The formerly internal function
<code>.package_dependencies()</code> from package <span class="pkg">tools</span> for
calculating (recursive) (reverse) dependencies on package databases
has been renamed to <code>package_dependencies()</code> and is now
exported.
</p>
</li>
<li><p> There is a new function <code>optimHess()</code> to compute the
(approximate) Hessian for an <code>optim()</code> solution if
<code>hessian = TRUE</code> was forgotten.
</p>
</li>
<li> <p><code>.filled.contour()</code> is a &lsquo;bare-bones&rsquo; function to
add a filled-contour rectangular plot to an already prepared plot
region.
</p>
</li>
<li><p> The stepping in debugging and single-step browsing modes has
changed slightly: now left braces at the start of the body are
stepped over for <code>if</code> statements as well as for <code>for</code> and
<code>while</code> statements.  (Wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=14814">PR#14814</a>.)
</p>
</li>
<li> <p><code>library()</code> no longer warns about a conflict with a
function from <code>package:base</code> if the function has the same
code as the base one but with a different environment.  (An
example is <code>Matrix::det()</code>.)
</p>
</li>
<li><p> When deparsing very large language objects,
<code>as.character()</code> now inserts newlines after each line of
approximately 500 bytes, rather than truncating to the first
line.
</p>
</li>
<li><p> New function <code>rWishart()</code> generates Wishart-distributed
random matrices.
</p>
</li>
<li><p> Packages may now specify actions to be taken when the
package is loaded (<code>setLoadActions()</code>).
</p>
</li>
<li> <p><code>options(max.print = Inf)</code> and similar now give an
error (instead of warnings later).
</p>
</li>
<li><p> The <code>"difftime"</code> replacement method of <code>units</code>
tries harder to preserve other attributes of the argument.  (Wish
of <a href="https://bugs.R-project.org/show_bug.cgi?id=14839">PR#14839</a>.)
</p>
</li>
<li> <p><code>poly(raw = TRUE)</code> no longer requires more unique
points than the degree.  (Requested by John Fox.)
</p>
</li></ul>




<h4>PACKAGE parallel</h4>


<ul>
<li><p> There is a new function <code>mcmapply()</code>, a parallel version
of <code>mapply()</code>, and a wrapper <code>mcMap()</code>, a parallel
version of <code>Map()</code>.
</p>
</li>
<li><p> A default cluster can be registered by the new function
<code>setDefaultCluster()</code>: this will be used by default in
functions such as <code>parLapply()</code>.
</p>
</li>
<li> <p><code>clusterMap()</code> has a new argument <code>.scheduling</code> to
allow the use of load-balancing.
</p>
</li>
<li><p> There are new load-balancing functions <code>parLapplyLB()</code>
and <code>parSapplyLB()</code>.
</p>
</li>
<li> <p><code>makePSOCKCluster()</code> has a new option <code>useXDR =
	FALSE</code> which can be used to avoid byte-shuffling for
serialization when all the nodes are known to be little-endian (or
all big-endian).
</p>
</li></ul>




<h4>PACKAGE INSTALLATION</h4>


<ul>
<li><p> Non-ASCII vignettes without a declared encoding are no
longer accepted.
</p>
</li>
<li><p> C/C++ code in packages is now compiled with <code>-NDEBUG</code>
to mitigate against the C/C++ function <code>assert</code> being called
in production use.  Developers can turn this off during package
development with <code>PKG_CPPFLAGS = -UNDEBUG</code>.
</p>
</li>
<li> <p><code>R CMD INSTALL</code> has a new option <span class="option">--dsym</span>
which on Mac OS X (Darwin) dumps the symbols alongside the
&lsquo;<span class="file">.so</span>&rsquo; file: this is helpful when debugging with
<code>valgrind</code> (and especially when installing packages into
&lsquo;<span class="file">R.framework</span>&rsquo;).  [This can also be enabled by setting the
undocumented environment variable <span class="env">PKG_MAKE_DSYM</span>, since <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>
2.12.0.]
</p>
</li>
<li> <p><code>R CMD INSTALL</code> will test loading under all installed
sub-architectures even for packages without compiled code, unless
the flag <span class="option">--no-multiarch</span> is used.  (Pure <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> packages can
do things which are architecture-dependent: in the case which
prompted this, looking for an icon in a Windows <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> executable.)
</p>
</li>
<li><p> There is a new option <code>install.packages(type = "both")</code>
which tries source packages if binary packages are not available,
on those platforms where the latter is the default.
</p>
</li>
<li><p> The meaning of <code>install.packages(dependencies = TRUE)</code>
has changed: it now means to install the essential dependencies of
the named packages plus the <span class="samp">Suggests</span>, but only the
essential dependencies of dependencies.  To get the previous
behaviour, specify <code>dependencies</code> as a character vector.
</p>
</li>
<li> <p><code>R CMD INSTALL --merge-multiarch</code> is now supported
on OS X and other Unix-alikes using multiple sub-architectures.
</p>
</li>
<li> <p><code>R CMD INSTALL --libs-only</code> now by default does a
test load on Unix-alikes as well as on Windows: suppress with
<span class="option">--no-test-load</span>.
</p>
</li></ul>




<h4>UTILITIES</h4>


<ul>
<li> <p><code>R CMD check</code> now gives a warning rather than a
note if it finds inefficiently compressed datasets.  With
<code>bzip2</code> and <code>xz</code> compression having been
available since <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.10.0, it only exceptionally makes sense to
not use them.
</p>
<p>The environment variable <span class="env">_R_CHECK_COMPACT_DATA2_</span> is
no longer consulted: the check is always done if
<span class="env">_R_CHECK_COMPACT_DATA_</span> has a true value (its default).
</p>
</li>
<li><p> Where multiple sub-architectures are to be tested,
<code>R CMD check</code> now runs the examples and tests for all the
sub-architectures even if one fails.
</p>
</li>
<li> <p><code>R CMD check</code> can optionally report timings on
various parts of the check: this is controlled by environment
variable <span class="env">_R_CHECK_TIMINGS_</span> documented in &lsquo;Writing R
Extensions&rsquo;.  Timings (in the style of <code>R CMD BATCH</code>) are
given at the foot of the output files from running each test and
the <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> code in each vignette.
</p>
</li>
<li><p> There are new options for more rigorous testing by
<code>R CMD check</code> selected by environment variables &ndash; see
the &lsquo;Writing R Extensions&rsquo; manual.
</p>
</li>
<li> <p><code>R CMD check</code> now warns (rather than notes) on
undeclared use of other packages in examples and tests:
increasingly people are using the metadata in the
&lsquo;<span class="file">DESCRIPTION</span>&rsquo; file to compute information about packages,
for example reverse dependencies.
</p>
</li>
<li><p> The defaults for some of the options in <code>R CMD
	 check</code> (described in the &lsquo;R Internals&rsquo; manual) have
changed: checks for unsafe and <code>.Internal()</code> calls and
for partial matching of arguments in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> function calls are now
done by default.
</p>
</li>
<li> <p><code>R CMD check</code> has more comprehensive facilities for
checking compiled code and so gives fewer reports on entry points
linked into &lsquo;<span class="file">.so</span>&rsquo;/&lsquo;<span class="file">.dll</span>&rsquo; files from libraries
(including C++ and Fortran runtimes).
</p>
<p>Checking compiled code is now done on FreeBSD (as well as the
existing supported platforms of Linux, Mac OS X, Solaris and
Windows).
</p>
</li>
<li> <p><code>R CMD build</code> has more options for
<span class="option">--compact-vignettes</span>: see <code>R CMD build --help</code>.
</p>
</li>
<li> <p><code>R CMD build</code> has a new option <span class="option">--md5</span> to
add an &lsquo;<span class="file">MD5</span>&rsquo; file (as done by CRAN): this is used by <code>R
	 CMD INSTALL</code> to check the integrity of the distribution.
</p>
<p>If this option is not specified, any existing (and probably
stale) &lsquo;<span class="file">MD5</span>&rsquo; file is removed.
</p>
</li></ul>




<h4>DEPRECATED AND DEFUNCT</h4>


<ul>
<li> <p><code>R CMD Rd2dvi</code> is now defunct: use <code>R CMD Rd2pdf</code>.
</p>
</li>
<li><p> Options such <span class="option">--max-nsize</span>, <span class="option">--max-vsize</span> and
the function <code>mem.limits()</code> are now defunct.  (Options
<span class="option">--min-nsize</span> and <span class="option">--min-vsize</span> remain available.)
</p>
</li>
<li><p> Use of <code>library.dynam()</code> without specifying all the
first three arguments is now disallowed.
</p>
<p>Use of an argument <code>chname</code> in <code>library.dynam()</code>
including the extension &lsquo;<span class="file">.so</span>&rsquo; or &lsquo;<span class="file">.dll</span>&rsquo; (which was never
allowed according to the help page) is defunct.  This also applies
to <code>library.dynam.unload()</code> and to <code>useDynLib</code>
directives in &lsquo;<span class="file">NAMESPACE</span>&rsquo; files.
</p>
</li>
<li><p> The internal functions <code>.readRDS()</code> and
<code>.saveRDS()</code> are now defunct.
</p>
</li>
<li><p> The off-line <code>help()</code> types <span class="samp">"postscript"</span> and
<span class="samp">"ps"</span> are defunct.
</p>
</li>
<li> <p><code>Sys.putenv()</code>, replaced and deprecated in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.5.0, is
finally removed.
</p>
</li>
<li><p> Some functions/objects which have been defunct for five or
more years have been removed completely.  These include
<code>.Alias()</code>, <code>La.chol()</code>, <code>La.chol2inv()</code>,
<code>La.eigen()</code>, <code>Machine()</code>, <code>Platform()</code>,
<code>Version</code>, <code>codes()</code>, <code>delay()</code>,
<code>format.char()</code>, <code>getenv()</code>, <code>httpclient()</code>,
<code>loadURL()</code>, <code>machine()</code>, <code>parse.dcf()</code>,
<code>printNoClass()</code>, <code>provide()</code>, <code>read.table.url()</code>,
<code>restart()</code>, <code>scan.url()</code>, <code>symbol.C()</code>,
<code>symbol.For()</code> and <code>unix()</code>.
</p>
</li>
<li><p> The <code>ENCODING</code> argument to <code>.C()</code> is deprecated.
It was intended to smooth the transition to multi-byte character
strings, but can be replaced by the use of <code>iconv()</code> in the
rare cases where it is still needed.
</p>
</li></ul>




<h4>INSTALLATION</h4>


<ul>
<li><p> Building with a positive value of
<span class="option">--with-valgrind-instrumentation</span> now also instruments logical,
complex and raw vectors.
</p>
</li></ul>




<h4>C-LEVEL FACILITIES</h4>


<ul>
<li><p> Passing <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> objects other than atomic vectors, functions,
lists and environments to <code>.C()</code> is now deprecated and will
give a warning.  Most cases (especially <code>NULL</code>) are actually
coding errors.  <code>NULL</code> will be disallowed in future.
</p>
<p><code>.C()</code> now passes a pairlist as a <code>SEXP</code> to the compiled
code.  This is as was documented, but pairlists were in reality
handled differently as a legacy from the early days of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>.
</p>
</li>
<li> <p><code>call_R</code> and <code>call_S</code> are deprecated.  They still
exist in the headers and as entry points, but are no longer
documented and should not be used for new code.
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li> <p><code>str(x, width)</code> now obeys its <code>width</code>
argument also for function headers and other objects <code>x</code>
where <code>deparse()</code> is applied.
</p>
</li>
<li><p> The convention for <code>x %/% 0L</code> for integer-mode <code>x</code>
has been changed from <code>0L</code> to <code>NA_integer_</code>.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=14754">PR#14754</a>)
</p>
</li>
<li><p> The <code>exportMethods</code> directive in a &lsquo;<span class="file">NAMESPACE</span>&rsquo;
file now exports S4 generics as necessary, as the extensions
manual said it does.  The manual has also been updated to be a
little more informative on this point.
</p>
<p>It is now required that there is an S4 generic (imported or
created in the package) when methods are to be exported.
</p>
</li>
<li><p> Reference methods cannot safely use non-exported entries
in the namespace.  We now do not do so, and warn in the documentation.
</p>
</li>
<li><p> The namespace import code was warning when identical
S4 generic functions were imported more than once, but should
not (reported by Brian Ripley, then Martin Morgan).
</p>
</li>
<li> <p><code>merge()</code> is no longer allowed (in some ways) to create
a data frame with duplicate column names (which confused
<a href="https://bugs.R-project.org/show_bug.cgi?id=14786">PR#14786</a>).
</p>
</li>
<li><p> Fixes for rendering raster images on X11 and Windows devices
when the x-axis or y-axis scale is reversed.
</p>
</li>
<li> <p><code>getAnywhere()</code> found S3 methods as seen from the
<span class="pkg">utils</span> namespace and not from the environment from which it
was called.
</p>
</li>
<li> <p><code>selectMethod(f, sig)</code> would not return inherited group
methods when caching was off (as it is by default).
</p>
</li>
<li> <p><code>dev.copy2pdf(out.type = "cairo")</code> gave an error.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=14827">PR#14827</a>)
</p>
</li>
<li><p> Virtual classes (e.g., class unions) had a <code>NULL</code>
prototype even if that was not a legal subclass.  See
<code>?setClassUnion</code>.
</p>
</li>
<li><p> The C prototypes for <code>zdotc</code> and <code>zdotu</code> in
&lsquo;<span class="file">R_ext/BLAS.h</span>&rsquo; have been changed to the more modern style
rather than that used by <code>f2c</code>.  (Patch by Berwin Turlach.)
</p>
</li>
<li> <p><code>isGeneric()</code> produced an error for primitives that
can not have methods.
</p>
</li>
<li> <p><code>.C()</code> or <code>.Fortran()</code> had a lack-of-protection
error if the registration information resulted in an argument
being coerced to another type.
</p>
</li>
<li> <p><code>boxplot(x=x, at=at)</code> with non finite elements in <code>x</code>
and non integer <code>at</code> could not generate a warning but failed.
</p>
</li>
<li> <p><code>heatmap(x, symm=TRUE, RowSideColors=*)</code> no longer
draws the colors in reversed order.
</p>
</li>
<li> <p><code>predict(&lt;ar&gt;)</code> was incorrect in the multivariate case,
for p &gt;= 2.
</p>
</li>
<li> <p><code>print(x, max=m)</code> is now consistent when <code>x</code> is a
<code>"Date"</code>; also the &ldquo;reached ... max.print ..&rdquo; messages
are now consistently using single brackets.
</p>
</li>
<li><p> Closed the <span class="samp">&lt;li&gt;</span> tag in pages generated by <code>
      Rd2HTML()</code>. (<a href="https://bugs.R-project.org/show_bug.cgi?id=14841">PR#14841</a>)
</p>
</li>
<li><p> Axis tick marks could go out of range when a log scale was
used.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14833">PR#14833</a>)
</p>
</li>
<li><p> Signature objects in methods were not allocated as S4
objects (caused a problem with <code>trace()</code> reported by Martin Morgan).
</p>
</li></ul>




<h3><img class="toplogo" src="../help/figures/../../html/Rlogo.svg" alt="[R logo]" /> CHANGES IN R VERSION 2.14.2</h3>



<h4>NEW FEATURES</h4>


<ul>
<li><p> The internal <code>untar()</code> (as used by default by
<code>R CMD INSTALL</code>) now knows about some <code>pax</code>
headers which <code>bsdtar</code> (e.g., the default <code>tar</code> for
Mac OS &gt;= 10.6) can incorrectly include in <code>tar</code> files,
and will skip them with a warning.
</p>
</li>
<li><p> PCRE has been upgraded to version 8.21: as well as bug fixes
and greater Perl compatibility, this adds a JIT pattern compiler,
about which PCRE's news says
&lsquo;large performance benefits can be had in many situations&rsquo;.
This is supported on most but not all <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> platforms.
</p>
</li>
<li><p> Function <code>compactPDF()</code> in package <span class="pkg">tools</span> now
takes the default for argument <code>gs_quality</code> from environment
variable <span class="env">GS_QUALITY</span>: there is a new value <code>"none"</code>, the
ultimate default, which prevents GhostScript being used in
preference to <code>qpdf</code> just because environment variable
<span class="env">R_GSCMD</span> is set.  If <span class="env">R_GSCMD</span> is unset or set to
<code>""</code>, the function will try to find a suitable GhostScript
executable.
</p>
</li>
<li><p> The included version of zlib has been updated to 1.2.6.
</p>
</li>
<li><p> For consistency with the <code>logLik()</code> method,
<code>nobs()</code> for <code>"nls"</code> files now excludes observations
with zero weight.  (Reported by Berwin Turlach.)
</p>
</li></ul>




<h4>UTILITIES</h4>


<ul>
<li> <p><code>R CMD check</code> now reports by default on licenses not
according to the description in &lsquo;Writing R Extensions&rsquo;.
</p>
</li>
<li> <p><code>R CMD check</code> has a new option <span class="option">--as-cran</span> to
turn on most of the customizations that CRAN uses for its incoming
checks.
</p>
</li></ul>




<h4>PACKAGE INSTALLATION</h4>


<ul>
<li> <p><code>R CMD INSTALL</code> will now no longer install certain
file types from &lsquo;<span class="file">inst/doc</span>&rsquo;: these are almost certainly
mistakes and for some packages are wasting a lot of space.  These
are &lsquo;<span class="file">Makefile</span>&rsquo;, files generated by running LaTeX, and unless
the package uses a &lsquo;<span class="file">vignettes</span>&rsquo; directory, PostScript and
image bitmap files.
</p>
<p>Note that only PDF vignettes have ever been supported: some of
these files come from DVI/PS output from the Sweave defaults prior
to <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.13.0.
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li><p> R configured with <span class="option">--disable-openmp</span> would mistakenly
set <code>HAVE_OPENMP</code> (internal) and <code>SUPPORT_OPENMP</code> (in
&lsquo;<span class="file">Rconfig.h</span>&rsquo;) even though no OpenMP flags were populated.
</p>
</li>
<li><p> The <code>getS3method()</code> implementation had an old
computation to find an S4 default method.
</p>
</li>
<li> <p><code>readLines()</code> could overflow a buffer if the last line
of the file was not terminated.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14766">PR#14766</a>)
</p>
</li>
<li> <p><code>R CMD check</code> could miss undocumented S4 objects in
packages which used S4 classes but did not <span class="samp">Depends: methods</span>
in their &lsquo;<span class="file">DESCRIPTION</span>&rsquo; file.
</p>
</li>
<li><p> The HTML Help Search page had malformed links.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=14769">PR#14769</a>)
</p>
</li>
<li><p> A couple of instances of lack of protection of <code>SEXP</code>s
have been squashed. (<a href="https://bugs.R-project.org/show_bug.cgi?id=14772">PR#14772</a>, <a href="https://bugs.R-project.org/show_bug.cgi?id=14773">PR#14773</a>)
</p>
</li>
<li> <p><code>image(x, useRaster=TRUE)</code> misbehaved on single-column
<code>x</code>. (<a href="https://bugs.R-project.org/show_bug.cgi?id=14774">PR#14774</a>)
</p>
</li>
<li><p> Negative values for <code>options("max.print")</code> or the <code>max</code>
argument to <code>print.default()</code> caused crashes.  Now the former
are ignored and the latter trigger an error.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14779">PR#14779</a>)
</p>
</li>
<li><p> The text of a function body containing more than 4096
bytes was not properly saved by the parser when entered
at the console.
</p>
</li>
<li><p> Forgetting the <code>#endif</code> tag in an Rd file could cause
the parser to go into a loop.  (Reported by Hans-Jorg Bibiko.)
</p>
</li>
<li> <p><code>str(*, ....., strict.width="cut")</code> now also obeys
<code>list.len = n</code>.  (Reported by Sören Vogel.)
</p>
</li>
<li><p> Printing of arrays did not have enough protection (C level),
e.g., in the context of <code>capture.output()</code>.  (Reported by
Hervé Pagès and Martin Morgan.)
</p>
</li>
<li> <p><code>pdf(file = NULL)</code> would produce a spurious file named
&lsquo;<span class="file">NA</span>&rsquo;.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14808">PR#14808</a>)
</p>
</li>
<li> <p><code>list2env()</code> did not check the type of its <code>envir</code>
argument. (<a href="https://bugs.R-project.org/show_bug.cgi?id=14807">PR#14807</a>)
</p>
</li>
<li> <p><code>svg()</code> could segfault if called with a non-existent
file path.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14790">PR#14790</a>)
</p>
</li>
<li> <p><code>make install</code> can install to a path containing
<span class="samp">+</span> characters. (<a href="https://bugs.R-project.org/show_bug.cgi?id=14798">PR#14798</a>)
</p>
</li>
<li><p> The <code>edit()</code> function did not respect the
<code>options("keep.source")</code> setting. (Reported by Cleridy
Lennert.)
</p>
</li>
<li> <p><code>predict.lm(*, type="terms", terms=*, se.fit=TRUE)</code> did
not work.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14817">PR#14817</a>)
</p>
</li>
<li><p> There is a partial workaround for errors in the TRE
regular-expressions engine with named classes and repeat counts of
at least 2 in a MBCS locale (<a href="https://bugs.R-project.org/show_bug.cgi?id=14408">PR#14408</a>): these are avoided when
TRE is in 8-bit mode (e.g., for <code>useBytes = TRUE</code> and when all
the data are ASCII).
</p>
</li>
<li><p> The C function <code>R_ReplDLLdo1()</code> did not call top-level
handlers.
</p>
</li>
<li><p> The Quartz device was unable to detect window sessions on
Mac OS X 10.7 (Lion) and higher and thus it was not used as the
default device on the console.  Since Lion any application can use
window sessions, so Quartz will now be the default device if the
user's window session is active and <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> is not run via
<code>ssh</code> which is at least close to the behavior in prior OS
X versions.
</p>
</li>
<li> <p><code>mclapply()</code> would fail in code assembling the translated
error message if some (but not all) cores encountered an error.
</p>
</li>
<li> <p><code>format.POSIXlt(x)</code> raised an arithmetic exception when
<code>x</code> was an invalid object of class <code>"POSIXlt"</code> and parts
were empty.
</p>
</li>
<li> <p><code>installed.packages()</code> has some more protection against
package installs going on in parallel.
</p>
</li>
<li> <p><code>.Primitive()</code> could be mis-used to call
<code>.Internal()</code> entry points.
</p>
</li></ul>




<h3><img class="toplogo" src="../help/figures/../../html/Rlogo.svg" alt="[R logo]" /> CHANGES IN R VERSION 2.14.1</h3>



<h4>NEW FEATURES</h4>


<ul>
<li> <p><code>parallel::detectCores()</code> is now able to find the
number of physical cores (rather than CPUs) on Sparc Solaris.
</p>
<p>It can also do so on most versions of Windows; however the default
remains <code>detectCores(logical = TRUE)</code> on that platform.
</p>
</li>
<li><p> Reference classes now keep a record of which fields are
locked.  <code>$lock()</code> with no arguments returns the names 
of the locked fields.
</p>
</li>
<li> <p><code>HoltWinters()</code> reports a warning rather than an error
for some optimization failures (where the answer might be a
reasonable one).
</p>
</li>
<li> <p><code>tools::dependsOnPkg()</code> now accepts the shorthand
<code>dependencies = "all"</code>.
</p>
</li>
<li> <p><code>parallel::clusterExport()</code> now allows specification of
an environment from which to export.
</p>
</li>
<li><p> The <code>quartz()</code> device now does tilde expansion on its
<code>file</code> argument.
</p>
</li>
<li> <p><code>tempfile()</code> on a Unix-alike now takes the process ID
into account.  This is needed with <a href="https://CRAN.R-project.org/package=multicore"><span class="pkg">multicore</span></a> (and as part of
<span class="pkg">parallel</span>) because the parent and all the children share a
session temporary directory, and they can share the C random
number stream used to produce the unique part.  Further, two
children can call <code>tempfile()</code> simultaneously.
</p>
</li>
<li><p> Option <code>print</code> in Sweave's <code>RweaveLatex()</code> driver
now emulates auto-printing rather than printing (which can differ
for an S4 object by calling <code>show()</code> rather than
<code>print()</code>).
</p>
</li>
<li> <p><code>filled.contour()</code> now accepts infinite values:
previously it might have generated invalid graphics files
(e.g., containing NaN values).
</p>
</li></ul>




<h4>INSTALLATION</h4>


<ul>
<li><p> On 64-bit Linux systems, <code>configure</code> now only sets
<span class="samp">LIBnn</span> to <code>lib64</code> if &lsquo;<span class="file">/usr/lib64</span>&rsquo; exists.  This
may obviate setting <span class="samp">LIBnn</span> explicitly on Debian-derived
systems.
</p>
<p>It is still necessary to set <span class="samp">LIBnn = lib</span> (or
<span class="samp">lib32</span>) for 32-bit builds of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> on a 64-bit OS on those Linux
distributions capable for supporting that concept.
</p>
</li>
<li> <p><code>configure</code> looks for &lsquo;<span class="file">inconsolata.sty</span>&rsquo;, and if
not found adjusts the default <span class="env">R_RD4PDF</span> to not use it (with a
warning, since it is needed for high-quality rendering of manuals).
</p>
</li></ul>




<h4>PACKAGE INSTALLATION</h4>


<ul>
<li> <p><code>R CMD INSTALL</code> will now do a test load for all
sub-architectures for which code was compiled (rather than just
the primary sub-architecture).
</p>
</li></ul>




<h4>UTILITIES</h4>


<ul>
<li><p> When checking examples under more than one sub-architecture,
<code>R CMD check</code> now uses a separate directory
&lsquo;<span class="file">examples_arch</span>&rsquo; for each sub-architecture, and leaves the
output in file &lsquo;<span class="file">pkgname-Ex_arch.Rout</span>&rsquo;.  Some packages
expect their examples to be run in a clean directory ....
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li> <p><code>stack()</code> now gives an error if no vector column is
selected, rather than returning a 1-column data frame (contrary to
its documentation).
</p>
</li>
<li> <p><code>summary.mlm()</code> did not handle objects where the
formula had been specified by an expression.  (Reported by
Helios de Rosario Martinez).
</p>
</li>
<li> <p><code>tools::deparseLatex(dropBraces=TRUE)</code> could drop
text as well as braces.
</p>
</li>
<li> <p><code>colormodel = "grey"</code> (new in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.14.0))
did not always work in <code>postscript()</code> and <code>pdf()</code>.
</p>
</li>
<li> <p><code>file.append()</code> could return <code>TRUE</code> for failures.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=14727">PR#14727</a>)
</p>
</li>
<li> <p><code>gzcon()</code> connections are no longer subject to garbage
collection: it was possible for this to happen when unintended
(e.g., when calling <code>load()</code>).
</p>
</li>
<li> <p><code>nobs()</code> does not count zero-weight observations for
<code>glm()</code> fits, for consistency with <code>lm()</code>.  This affects
the <code>BIC()</code> values reported for such <code>glm()</code> fits.
(Spotted by Bill Dunlap.)
</p>
</li>
<li> <p><code>options(warn = 0)</code> failed to end a (C-level) context
with more than 50 accumulated warnings.  (Spotted by Jeffrey
Horner.)
</p>
</li>
<li><p> The internal <code>plot.default()</code> code did not do sanity
checks on a <code>cex</code> argument, so invalid input could cause
problems.  (Reported by Ben Bolker.)
</p>
</li>
<li> <p><code>anyDuplicated(&lt;array&gt;, MARGIN=0)</code> no longer fails.
(Reported by Hervé Pagès.)
</p>
</li>
<li> <p><code>read.dcf()</code> removes trailing blanks: unfortunately
on some platforms this included <code>\xa0</code> (non-breaking space)
which is the trailing byte of a UTF-8 character.  It now only
considers ASCII space and tab to be &lsquo;blank&rsquo;.
</p>
</li>
<li><p> There was a sign error in part of the calculations for the
variance returned by <code>KalmanSmooth()</code>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14738">PR#14738</a>)
</p>
</li>
<li> <p><code>pbinom(10, 1e6, 0.01, log.p = TRUE)</code> was <code>NaN</code>
thanks to the buggy fix to <a href="https://bugs.R-project.org/show_bug.cgi?id=14320">PR#14320</a> in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.11.0.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14739">PR#14739</a>)
</p>
</li>
<li> <p><code>RweaveLatex()</code> now emulates auto-printing rather than
printing, by calling <code>methods::show()</code> when auto-printing
would.
</p>
</li>
<li> <p><code>duplicated()</code> ignored <code>fromLast</code> for a
one-column data frame.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14742">PR#14742</a>)
</p>
</li>
<li> <p><code>source()</code> and related functions did not put the correct
timestamp on the source references; <code>srcfilecopy()</code> has gained
a new argument <code>timestamp</code> to support this fix. (<a href="https://bugs.R-project.org/show_bug.cgi?id=14750">PR#14750</a>)
</p>
</li>
<li> <p><code>srcfilecopy()</code> has gained a new argument <code>isFile</code>
and now records the working directory, to allow debuggers to find
the original source file.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14826">PR#14826</a>)
</p>
</li>
<li><p> LaTeX conversion of Rd files did not correctly handle
preformatted backslashes.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14751">PR#14751</a>)
</p>
</li>
<li><p> HTML conversion of Rd files did not handle markup within
tabular cells properly.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14708">PR#14708</a>)
</p>
</li>
<li> <p><code>source()</code> on an empty file with <code>keep.source =
	TRUE</code> tried to read from <code>stdin()</code>, in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.14.0 only.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=14753">PR#14753</a>)
</p>
</li>
<li><p> The code to check Rd files in packages would abort if
duplicate description sections were present.
</p>
</li></ul>




<h3><img class="toplogo" src="../help/figures/../../html/Rlogo.svg" alt="[R logo]" /> CHANGES IN R VERSION 2.14.0</h3>



<h4>SIGNIFICANT USER-VISIBLE CHANGES</h4>


<ul>
<li><p> All packages must have a namespace, and one is created on
installation if not supplied in the sources.  This means that any
package without a namespace must be re-installed under this
version of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> (but previously-installed data-only packages without
<span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> code can still be used).
</p>
</li>
<li><p> The <code>yLineBias</code> of the <code>X11()</code> and
<code>windows()</code> families of devices has been changed from 0.1 to
0.2: this changes slightly the vertical positioning of text in the
margins (including axis annotations).  This is mainly for
consistency with other devices such as <code>quartz()</code> and
<code>pdf()</code>.  (Wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=14538">PR#14538</a>.)
</p>
<p>There is a new graphics parameter <code>"ylbias"</code> which
allows the y-line bias of the graphics device to be tweaked,
including to reproduce output from earlier versions of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>.
</p>
</li>
<li><p> Labeling of the p-values in various anova tables has been
rationalized to be either <code>"Pr(&gt;F)"</code> or <code>"Pr(&gt;Chi)"</code>
(i.e., the <code>"Pr(F)"</code>, <code>"Pr(Chi)"</code> and <code>"P(&gt;|Chi|)"</code>
variants have been eliminated).  Code which extracts the p value
<em>via</em> indexing by name may need adjustment.
</p>
</li>
<li> <p><code>::</code> can now be used for datasets made available for
lazy-loading in packages with namespaces (which makes it consistent
with its use for data-only packages without namespaces in earlier
versions of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>).
</p>
</li>
<li><p> There is a new package <span class="pkg">parallel</span>.
</p>
<p>It incorporates (slightly revised) copies of packages
<a href="https://CRAN.R-project.org/package=multicore"><span class="pkg">multicore</span></a> and <a href="https://CRAN.R-project.org/package=snow"><span class="pkg">snow</span></a> (excluding MPI, PVM and NWS
clusters).  Code written to use the higher-level API functions in
those packages should work unchanged (apart from changing any
references to their namespaces to a reference to <span class="pkg">parallel</span>,
and links explicitly to <a href="https://CRAN.R-project.org/package=multicore"><span class="pkg">multicore</span></a> or <a href="https://CRAN.R-project.org/package=snow"><span class="pkg">snow</span></a> on help
pages).
</p>
<p>It also contains support for multiple RNG streams following
L'Ecuyer <em>et al</em> (2002), with support for both
<code>mclapply</code> and <a href="https://CRAN.R-project.org/package=snow"><span class="pkg">snow</span></a> clusters.  This replaces functions
like <code>clusterSetupRNG()</code> from <a href="https://CRAN.R-project.org/package=snow"><span class="pkg">snow</span></a> (which are not in
<span class="pkg">parallel</span>).
</p>
<p>The version released for <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.14.0 contains base functionality:
higher-level convenience functions are planned (and some are
already available in the &lsquo;R-devel&rsquo; version of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>).
</p>
</li>
<li><p> Building PDF manuals (for <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> itself or packages,
e.g. <em>via</em> <code>R CMD check</code>) by default requires the
LaTeX package <span class="samp">inconsolata</span>: see the section on
&lsquo;Making the manuals&rsquo; in the &lsquo;R Installation and
Administration Manual&rsquo;.
</p>
</li>
<li> <p><code>axTicks(*, log=TRUE)</code> has changed in some cases to
satisfy the documented behavior and be consistent.
</p>
</li></ul>




<h4>NEW FEATURES</h4>


<ul>
<li> <p><code>txtProgressBar()</code> can write to an open connection
instead of the console.
</p>
</li>
<li><p> Non-portable package names ending in &lsquo;<span class="file">.</span>&rsquo; are no longer
allowed.  Nor are single-character package names (<span class="pkg">R</span> was
already disallowed).
</p>
</li>
<li> <p><code>regexpr()</code> and <code>gregexpr()</code> with <code>perl =
	TRUE</code> allows Python-style named captures.  (Wish and
contribution of <a href="https://bugs.R-project.org/show_bug.cgi?id=14518">PR#14518</a>.)
</p>
</li>
<li><p> The placement of &lsquo;plotmath&rsquo; text in the margins of
plots done by base graphics now makes the same vertical adjustment
as ordinary text, so using ordinary and plotmath text on the same
margin line will seem better aligned (but not exactly aligned,
since ordinary text has descenders below the baseline and plotmath
places them on the baseline).  (Related to <a href="https://bugs.R-project.org/show_bug.cgi?id=14537">PR#14537</a>.)
</p>
</li>
<li> <p><code>sunflowerplot()</code> now has a formula interface.
(Wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=14541">PR#14541</a>.)
</p>
</li>
<li> <p><code>iconv()</code> has a new argument <code>toRaw</code> to handle
encodings such as <code>UTF-16</code> with embedded nuls (as was
possible before the <code>CHARSXP</code> cache was introduced).
</p>
<p>It will also accept as input the type of list generated with
<code>toRaw = TRUE</code>.
</p>
</li>
<li><p> Garbage-collecting an unused input text connection no longer
gives a warning (since it &lsquo;connects&rsquo; to nothing outside
<span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>).
</p>
</li>
<li> <p><code>read.table()</code> and <code>scan()</code> have gained a
<code>text</code> argument, to allow reading data from a (possibly
literal) character string.
</p>
</li>
<li> <p><code>optim(*, method = .)</code> now allows <code>method = "Brent"</code>
as an interface to <code>optimize()</code>, for use in cases such as
<code>mle()</code> where <code>optim()</code> is used internally.
</p>
</li>
<li> <p><code>mosaicplot()</code> gains a <code>border</code> argument.
(Wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=14550">PR#14550</a>.)
</p>
</li>
<li> <p><code>smooth.spline()</code> gains a <code>tol</code> argument which
controls how different <code>x</code> values need to be to be treated as
distinct.  The default has been changed to be more reliable for
inputs whose range is small compared to their maximum absolute
value.  (Wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=14452">PR#14452</a>.)
</p>
</li>
<li> <p><code>gl()</code> runs faster by avoiding calling <code>factor()</code>.
</p>
</li>
<li><p> The <code>print()</code> method for <code>object.size()</code> accepts
<span class="samp">B</span> as well as <span class="samp">b</span> as an abbreviation for &lsquo;bytes&rsquo;.
</p>
</li>
<li> <p><code>unlink()</code> gains a <code>force</code> argument to work like
<code>rm -f</code> and if possible override restrictive permissions.
</p>
</li>
<li> <p><code>pbirthday()</code> and <code>qbirthday()</code> now use exact
calculations for <code>coincident = 2</code>.
</p>
</li>
<li> <p><code>unzip()</code> and <code>unz()</code> connections have been
updated with support for more recent Zip64 features (including
large file sizes and <code>bzip2</code> compression, but not UTF-8
file names).
</p>
<p><code>unzip()</code> has a new option to restore file times from those
recorded (in an unknown timezone) in the zip file.
</p>
</li>
<li> <p><code>update.packages()</code> now accepts a character vector of
package names for the <code>oldPkgs</code> argument.  (Suggestion of
Tal Galili.)
</p>
</li>
<li><p> The special reference class fields <code>.self</code> and
<code>.refClassDef</code> are now read-only to prevent corrupting
the object.
</p>
</li>
<li> <p><code>decompose()</code> now returns the original series as part
of its value, so it can be used (rather than reconstructed) when
plotting.  (Suggestion of Rob Hyndman.)
</p>
</li>
<li><p> Rao's efficient score test has been implemented for
<code>glm</code> objects.  Specifically, the <code>add1</code>, <code>drop1</code>,
and <code>anova</code> methods now allow <code>test = "Rao"</code>.
</p>
</li>
<li><p> If a saved workspace (e.g., &lsquo;<span class="file">.RData</span>&rsquo;) contains objects
that cannot be loaded, <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> will now start with an warning message
and an empty workspace, rather than failing to start.
</p>
</li>
<li> <p><code>strptime()</code> now accepts times such as <span class="samp">24:00</span> for
midnight at the end of the day, for although these are disallowed by
POSIX 1003.1-2008, ISO 8601:2004 allows them.
</p>
</li>
<li><p> Assignment of <code>names()</code> to S4 objects now checks for
a corresponding <code>"names"</code> slot, and generates a warning or
an error if that slot is not defined.  See the section on slots
in <code>?Classes</code>.
</p>
</li>
<li><p> The default methods for <code>is.finite()</code>, <code>is.infinite()</code>
and <code>is.nan()</code> now signal an error if their argument is not
an atomic vector.
</p>
</li>
<li><p> The formula method for <code>plot()</code> no longer places
package <span class="pkg">stats</span> on the search path (it loads the namespace
instead).
</p>
</li>
<li><p> There now is a genuine <code>"function"</code> method for
<code>plot()</code> rather than the generic dispatching internally to
<code>graphics::plot.function()</code>.  It is now exported, so can be
called directly as <code>plot.function()</code>.
</p>
</li>
<li><p> The one-sided <code>ks.test()</code> allows <code>exact = TRUE</code> to
be specified in the presence of ties (but the approximate
calculation remains the default: the &lsquo;exact&rsquo; computation
makes assumptions known to be invalid in the presence of ties).
</p>
</li>
<li><p> The behaviour of <code>curve(add = FALSE)</code> has changed: it
now no longer takes the default x limits from the previous plot
(if any): rather they default to <code>c(0, 1)</code> just as the
<code>"function"</code> method for <code>plot()</code>.  To get the previous
behaviour use <code>curve(add = NA)</code>, which also takes the default for
log-scaling of the x-axis from the previous plot.
</p>
</li>
<li><p> Both <code>curve()</code> and the <code>plot()</code> method for
functions have a new argument <code>xname</code> to facilitate plots
such as <code>sin(t)</code> <em>vs</em> <code>t</code>.
</p>
</li>
<li><p> The <code>local</code> argument to <code>source()</code> can specify an
environment as well as <code>TRUE</code> (<code>parent.env()</code>) and
<code>FALSE</code> (<code>.GlobalEnv</code>).  It gives better error messages
for other values, such as <code>NA</code>.
</p>
</li>
<li> <p><code>vcov()</code> gains methods for classes <code>"summary.lm"</code> and
<code>"summary.glm"</code>.
</p>
</li>
<li><p> The <code>plot()</code> method for class <code>"profile.nls"</code>
gains <code>ylab</code> and <code>lty</code> arguments, and passes
<code>...</code> on to <code>plot.default</code>.
</p>
</li>
<li><p> Character-string arguments such as the <code>mode</code> argument
of <code>vector()</code>, <code>as.vector()</code> and <code>is.vector()</code> and
the <code>description</code> argument of <code>file()</code> are required to
be of length exactly one, rather than any further elements being
silently discarded.  This helps catch incorrect usage in
programming.
</p>
</li>
<li><p> The <code>length</code> argument of <code>vector()</code> and its
wrappers such as <code>numeric()</code> is required to be of length
exactly one (other values are now an error rather than giving a
warning as previously).
</p>
</li>
<li> <p><code>vector(len)</code> and <code>length(x) &lt;- len</code> no longer
accept <code>TRUE</code>/<code>FALSE</code> for <code>len</code> (not that they
were ever documented to, but there was special-casing in the C
code).
</p>
</li>
<li><p> There is a new function <code>Sys.setFileTime()</code> to set the
time of a file (including a directory).  See its help for exactly
which times it sets on various OSes.
</p>
</li>
<li><p> The file times reported by <code>file.info()</code> are reported
to sub-second resolution on systems which support it.  (Currently
the POSIX 2008 and FreeBSD/Darwin/NetBSD methods are detected.)
</p>
</li>
<li><p> New function <code>getCall(m)</code> as an abstraction for
<code>m$call</code>, enabling <code>update()</code>'s default method to apply 
more universally.  (NB: this can be masked by existing functions
in packages.)
</p>
</li>
<li> <p><code>Sys.info()</code> gains a <code>euser</code> component to report
the &lsquo;effective&rsquo; user on OSes which have that concept.
</p>
</li>
<li><p> The result returned by <code>try()</code> now contains the
original error condition object as the <code>"condition"</code>
attribute.
</p>
</li>
<li><p> All packages with <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> code are lazy-loaded irrespective of
the <span class="samp">LazyLoad</span> field in the &lsquo;<span class="file">DESCRIPTION</span>&rsquo; file.  A
warning is given if the <span class="samp">LazyLoad</span> field is overridden.
</p>
</li>
<li> <p><code>Rd</code> markup has a new <span class="samp">\figure</span> tag so that
figures can be included in help pages when converted to HTML or
LaTeX.  There are examples on the help pages for <code>par()</code> and
<code>points()</code>.
</p>
</li>
<li><p> The built-in httpd server now allows access to files
in the session temporary directory <code>tempdir()</code>,
addressed as the &lsquo;<span class="file">/session</span>&rsquo; directory on the httpd
server.
</p>
</li>
<li><p> Development versions of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> are no longer referred to by the
number under which they might be released, e.g., in the startup
banner, <code>R --version</code> and <code>sessionUtils()</code>.  The
correct way to refer to a development version of R is
&lsquo;R-devel&rsquo;, preferably with the date and SVN version number.<br />
E.g., <span class="samp">R-devel (2011-07-04 r56266)</span>
</p>
</li>
<li><p> There is a new function <code>texi2pdf()</code> in package
<span class="pkg">tools</span>, currently a convenience wrapper for
<code>texi2dvi(pdf = TRUE)</code>.
</p>
</li>
<li><p> There are two new options for typesetting PDF manuals from
Rd files.  These are <span class="samp">beramono</span> and <span class="samp">inconsolata</span>, and
used the named font for monospaced output. They are intended to
be used in combination with <span class="samp">times</span>, and
<span class="samp">times,inconsolata,hyper</span> is now the default for the
reference manual and package manuals.  If you do not have that
font installed, you can set <span class="env">R_RD4PF</span> to one of the other
options: see the &lsquo;R Installation and Administration Manual&rsquo;.
</p>
</li>
<li><p> Automatic printing for reference classes is now done by
the <code>$show()</code> method.  A method is defined for class 
<span class="samp">envRefClass</span> and may be overridden for user classes (see
the <code>?ReferenceClasses</code> example).  S4 <code>show()</code> methods
should no longer be needed for reference classes.
</p>
</li>
<li> <p><code>tools::Rdiff</code> (by default) and <code>R CMD Rdiff</code>
now ignore differences in pointer values when comparing printed
environments, compiled byte code, etc.
</p>
</li>
<li><p> The <code>"source"</code> attribute on functions created with
<code>keep.source=TRUE</code> has been replaced with a <code>"srcref"</code>
attribute.  The <code>"srcref"</code> attribute references an in-memory
copy of the source file using the <code>"srcfilecopy"</code> class or
the new <code>"srcfilealias"</code> class.
</p>
<p><strong>NB:</strong> This means that functions sourced with
<code>keep.source = TRUE</code> and saved (e.g., by <code>save()</code> or
<code>readRDS()</code>) in earlier versions of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> will no longer show
the original sources (including comments).
</p>
</li>
<li><p> New items <span class="samp">User Manuals</span> and
<a href="http://developer.r-project.org/TechDocs">Technical Papers</a>
have been added to the HTML help main page.  These link to
vignettes in the base and recommended packages and to a
collection of papers about R issues, respectively.
</p>
</li>
<li><p> Documentation and messages have been standardized to
use &ldquo;namespace&rdquo; rather than &ldquo;name space&rdquo;.
</p>
</li>
<li> <p><code>setGeneric()</code> now looks in the default packages for
a non-generic version of a function if called from a package with a
namespace.  (It always did for packages without a namespace.)
</p>
</li>
<li><p> Setting the environment variable
<span class="env">_R_WARN_ON_LOCKED_BINDINGS_</span> will give a warning if an
attempt is made to change a locked binding.
</p>
</li>
<li> <p><code>\SweaveInput</code> is now supported when generating
concordances in <code>Sweave()</code>.
</p>
</li>
<li> <p><code>findLineNum()</code> and <code>setBreakpoint()</code> now allow
the environment to be specified indirectly; the latter gains
a <code>clear</code> argument to allow it to call <code>untrace()</code>.
</p>
</li>
<li><p> The body of a closure can be one of further types of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>
objects, including environments and external pointers.
</p>
</li>
<li><p> The <code>Rd2HTML()</code> function in package <span class="pkg">tools</span> now has
a <code>stylesheet</code> argument, allowing pages to be displayed in
alternate formats.
</p>
</li>
<li><p> New function <code>requireNamespace()</code> analogous to
<code>require()</code>, returning a logical value after attempting to
load a namespace.
</p>
</li>
<li><p> There is a new type of RNG, <code>"L'Ecuyer-CMRG"</code>,
implementing L'Ecuyer (1999)'s &lsquo;combined multiple-recursive
generator&rsquo; <span class="samp">MRG32k3a</span>.  See the comments on <code>?RNG</code>.
</p>
</li>
<li> <p><code>help.search()</code> and <code>??</code> can now display
vignettes and demos as well as help pages.  The new option
<code>"help.search.types"</code> controls the types of documentation
and the order of their display.
</p>
<p>This also applies to HTML searches, which now give results in all
of help pages, vignettes and demos.
</p>
</li>
<li> <p><code>socketConnection()</code> now has a <code>timeout</code> argument.
It is now documented that large values (package <a href="https://CRAN.R-project.org/package=snow"><span class="pkg">snow</span></a> used a
year) do not work on some OSes.
</p>
</li>
<li><p> The initialization of the random-number generator now uses
the process ID as well as the current time, just in case two <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>
processes are launched very rapidly on a machine with
low-resolution wall clock (some have a resolution of a second;
modern systems have microsecond-level resolution).
</p>
</li>
<li><p> New function <code>pskill()</code> in the <span class="pkg">tools</span> package to
send a terminate signal to one or more processes, plus constants
such as <code>SIGTERM</code> to provide a portable way to refer to
signals (since the numeric values are OS-dependent).
</p>
</li>
<li><p> New function <code>psnice()</code> in the <span class="pkg">tools</span> package to
return or change the &lsquo;niceness&rsquo; of a process.  (Refers to
the &lsquo;priority class&rsquo; on Windows.)
</p>
</li>
<li> <p><code>list.dirs()</code> gains a <code>recursive</code> argument.
</p>
</li>
<li><p> An <span class="samp">Authors@R</span> field in a package &lsquo;<span class="file">DESCRIPTION</span>&rsquo;
file can now be used to generate <span class="samp">Author</span> and
<span class="samp">Maintainer</span> fields if needed, and to auto-generate package
citations.
</p>
</li>
<li><p> New utility <code>getElement()</code> for accessing either a list
component or a slot in an S4 object.
</p>
</li>
<li> <p><code>stars()</code> gains a <code>col.lines</code> argument, thanks to
Dustin Sallings. (Wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=14657">PR#14657</a>.)
</p>
</li>
<li><p> New function <code>regmatches()</code> for extracting or replacing
matched or non-matched substrings from match data obtained by
<code>regexpr()</code>, <code>gregexpr()</code> and <code>regexec()</code>.
</p>
</li>
<li> <p><code>help(package = "pkg_name", help_type = "HTML")</code> now
gives HTML help on the package rather than text help.  (This gives
direct access to the HTML version of the package manual shown
<em>via</em> <code>help.start()</code>'s &lsquo;Packages&rsquo; menu.)
</p>
</li>
<li> <p><code>agrep()</code> gains a <code>fixed</code> argument to optionally
allow approximate regular expression matching, and a <code>costs</code>
argument to specify possibly different integer match costs for
insertions, deletions and substitutions.
</p>
</li>
<li> <p><code>read.dcf()</code> and <code>write.dcf()</code> gain a
<code>keep.white</code> argument to indicate fields where whitespace
should be kept as is.
</p>
</li>
<li> <p><code>available.packages()</code> now works around servers that
fail to return an error code when &lsquo;<span class="file">PACKAGES.gz</span>&rsquo; does not
exist.  (Patch submitted by Seth Schommer.)
</p>
</li>
<li> <p><code>readBin()</code> can now read more than
<i>2^31 - 1</i> bytes in a single call (the previously
documented limitation).
</p>
</li>
<li><p> New function <code>regexec()</code> for finding the positions of
matches as well as all substrings corresponding to parenthesized
subexpressions of the given regular expression.
</p>
</li>
<li><p> New function <code>adist()</code> in package <span class="pkg">utils</span> for
computing &lsquo;edit&rsquo; (generalized Levenshtein) distances between
strings.
</p>
</li>
<li><p> Class <code>"raster"</code> gains an <code>is.na</code> method to avoid
confusion from the misuse of the matrix method (such as <a href="https://bugs.R-project.org/show_bug.cgi?id=14618">PR#14618</a>).
</p>
</li>
<li><p> The <code>identical()</code> function gains an
<code>ignore.bytecode</code> argument to control comparison of
compiled functions.
</p>
</li>
<li> <p><code>pmin</code> and <code>pmax</code> now warn if an argument is
partially recycled (wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=14638">PR#14638</a>).
</p>
</li>
<li><p> The default for <code>image(useRaster=)</code> is now taken from
option <code>"preferRaster"</code>: for the small print see <code>?image</code>.
</p>
</li>
<li> <p><code>str()</code> now displays reference class objects and their
fields, rather than treating them as classical S4 classes.
</p>
</li>
<li><p> New function <code>aregexec()</code> in package <span class="pkg">utils</span> for
finding the positions of approximate string matches as well as all
substrings corresponding to parenthesized subexpressions of the
given regular expression.
</p>
</li>
<li> <p><code>download.file()</code> has an <code>extra</code> argument to pass
additional command-line options to the non-default methods using
command-line utilities.
</p>
<p><code>cacheOK = FALSE</code> is now supported for <code>method = "curl"</code>.
</p>
</li>
<li> <p><code>interaction.plot(*, type = .)</code> now also allows type
<code>"o"</code> or <code>"c"</code>.
</p>
</li>
<li> <p><code>axTicks(*, log=TRUE)</code> did sometimes give more values
than the ticks in the corresponding <code>graphics::axis()</code>.  By
default, it now makes use of the new (<span class="pkg">graphics</span>-package
independent) <code>axisTicks()</code> which can make use of a new
utility <code>.axisPars()</code>.  Further, it now returns a decreasing
sequence (as for <code>log=FALSE</code>) when <code>usr</code> is decreasing.
</p>
</li>
<li><p> Using <code>fix()</code> or <code>edit()</code> on a <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> object (except
perhaps a matrix or data frame) writes its temporary file with
extension &lsquo;<span class="file">.R</span>&rsquo; so editors which select their mode based on
the extension will select a suitable mode.
</p>
</li></ul>




<h4>GRAPHICS DEVICES</h4>


<ul>
<li><p> The <code>pdf()</code> device makes use of Flate compression: this
is controlled by the new logical argument <code>compress</code>, and is
enabled by default.
</p>
</li>
<li><p> Devices <code>svg()</code>, <code>cairo_pdf()</code> and
<code>cairo_ps()</code> gain a <code>family</code> argument.
</p>
<p>On a Unix-alike <code>X11()</code> gains a <code>family</code> argument.  This
is one of the <code>x11.options()</code> and so can be passed as an
argument to the <code>bmp()</code>, <code>jpeg()</code>, <code>png()</code> and
<code>tiff()</code> devices.
</p>
<p>Analogous changes have been made on Windows, so all built-in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>
graphics devices now have a <code>family</code> argument except
<code>pictex()</code> (which has no means to change fonts).
</p>
</li>
<li><p> The <code>bmp()</code>, <code>jpeg()</code>, <code>png()</code> and <code>tiff()</code>
devices now make use of the <code>antialias</code> argument for
<code>type = "quartz"</code>.
</p>
</li>
<li><p> There are several new built-in font mappings for
<code>X11(type = "Xlib")</code>: see the help on <code>X11Fonts()</code>.
</p>
</li>
<li><p> There is a new type <code>X11(type = "dbcairo")</code> which
updates the screen less frequently: see its help page.
</p>
</li>
<li><p> The <code>X11()</code> device now makes use of cursors to
distinguish its states.  The normal cursor is an arrow (rather
than a crosshair); the crosshair is used when the locator is in
use, and a watch cursor is shown when plotting computations are
being done.  (These are the standard names for X11 cursors: how
they are actually displayed depends on the window manager.)
</p>
</li>
<li><p> New functions <code>dev.hold()</code> and <code>dev.flush()</code> for
use with graphics devices with buffering.  These are used for most
of the high-level graphics functions such as <code>boxplot()</code>, so
that the plot is only displayed when the page is complete.
</p>
<p>Currently implemented for <code>windows(buffered = TRUE)</code>,
<code>quartz()</code> and the cairographics-based <code>X11()</code> types
with buffering (which are the default on-screen devices).
</p>
</li>
<li><p> New function <code>dev.capture()</code> for capture of bitmap
snapshots of image-based devices (a superset of the functionality
provided by <code>grid.cap()</code> in <code>grid</code>).
</p>
</li>
<li><p> The default <code>colormodel</code> for <code>pdf()</code> and
<code>postscript()</code> is now called <code>"srgb"</code> to more accurately
describe it.  (Instead of <code>"rgb"</code>, and in the case of
<code>postscript()</code> it no longer switches to and from the gray
colorspace, by default.)
</p>
<p>The <code>colormodel</code> for <code>postscript()</code> which does use both
gray and sRGB colorspaces is now called <code>"srgb+gray"</code>.
</p>
<p>Plots which are known to use only black/white/transparent can
advantageously use <code>colormodel = "gray"</code> (just as before, but
there is now slightly more advantage in doing so).
</p>
</li>
<li> <p><code>postscript()</code> with values <code>colormodel = "rgb"</code> and
<code>colormodel = "rgb-nogray"</code> give the behaviour prior to <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>
2.13.0 of uncalibrated RGB, which under some circumstances can be
rendered much faster by a viewer.
</p>
<p><code>pdf(colormodel = "rgb")</code> gives the behaviour prior to <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>
2.13.0 of uncalibrated RGB, which under some circumstances can be
rendered faster by a viewer, and the files will be smaller (by
about 9KB if compression is not used).
</p>
</li>
<li><p> The <code>postscript()</code> device only includes the definition
of the sRGB colorspace in the output file for the colormodels
which use it.
</p>
</li>
<li><p> The <code>postscript()</code> and <code>pdf()</code> devices now output
greyscale raster images (and not RGB) when <code>colormodel = "gray"</code>.
</p>
</li>
<li> <p><code>postscript(colormodel = "gray")</code> now accepts non-grey
colours and uses their luminance (as <code>pdf()</code> long has).
</p>
</li>
<li> <p><code>colormodel = "grey"</code> is allowed as an alternative name
for <code>postscript()</code> and <code>pdf()</code>.
</p>
</li>
<li> <p><code>pdf()</code> in the default sRGB colorspace outputs many
fewer changes of colorspace, which may speed up rendering in some
viewing applications.
</p>
</li>
<li><p> There is a new function <code>dev.capabilities()</code> to query
the capabilities of the current device.  The initial set of
capabilities are support for semi-transparent colours, rendering
and capturing raster images, the locator and for interactive
events.
</p>
</li>
<li><p> For <code>pdf()</code>, <code>maxRasters</code> is increased as needed
so the argument is no longer used.
</p>
</li></ul>




<h4>SWEAVE &amp; VIGNETTES</h4>


<ul>
<li><p> Options <code>keep.source = TRUE, figs.only = FALSE</code>
are now the default.
</p>
</li>
<li><p> The way the type of user-defined options is determined has
changed.  Previously they were all regarded as logical: now the
type is determined by the value given at first use.
</p>
</li>
<li><p> The allowed values of logical options are now precisely
those allowed for character inputs to <code>as.logical()</code>: this
means that <span class="samp">t</span> and <span class="samp">f</span> are no longer allowed (although
<code>T</code> and <code>F</code> still are).
</p>
</li>
<li><p> The preferred location for vignette sources is now the
directory &lsquo;<span class="file">vignettes</span>&rsquo; and not &lsquo;<span class="file">inst/doc</span>&rsquo;: <code>R CMD
      build</code> will now re-build vignettes in directory &lsquo;<span class="file">vignettes</span>&rsquo;
and copy the &lsquo;<span class="file">.Rnw</span>&rsquo; (etc) files and the corresponding PDFs to
&lsquo;<span class="file">inst/doc</span>&rsquo;.  Further files to be copied to &lsquo;<span class="file">inst/doc</span>&rsquo;
can be specified <em>via</em> the file
&lsquo;<span class="file">vignettes/.install_extras</span>&rsquo;.
</p>
</li>
<li> <p><code>R CMD Sweave</code> now supports a <span class="option">--driver</span>
option to select the Sweave driver: the default is equivalent to
<span class="option">--driver=RweaveLatex</span>.
</p>
</li>
<li> <p><code>R CMD Sweave</code> and <code>R CMD Stangle</code> support
options <span class="option">--encoding</span> and <span class="option">--options</span>.
</p>
</li>
<li><p> The <code>Rtangle()</code> driver allows <code>output = "stdout"</code>
or <code>output = "stderr"</code> to select the output or message
connection.  This is convenient for scripting using something like
</p>
<pre>    R CMD Stangle --options='output="stdout"' foo.Rnw &gt; foo2.R</pre>
</li>
<li><p> There is a new option <code>pdf.compress</code> controlling
whether PDF figures are generated using Flate compression (they
are by default).
</p>
</li>
<li> <p><code>R CMD Sweave</code> now has a <span class="option">--pdf</span> option to
produce a PDF version of the processed Sweave document.
</p>
</li>
<li><p> It is no longer allowed to have two vignettes with the
same vignette basename (e.g., &lsquo;<span class="file">vig.Rnw</span>&rsquo; and &lsquo;<span class="file">vig.Snw</span>&rsquo;).
(Previously one vignette hid the other in the <code>vignette()</code>
function.)
</p>
</li></ul>




<h4>C-LEVEL FACILITIES</h4>


<ul>
<li><p> Function <code>R_tmpnam2</code> has been added to the API to allow
a temporary filename to include a specified extension.
</p>
</li></ul>




<h4>PACKAGE INSTALLATION</h4>


<ul>
<li><p> Package &lsquo;<span class="file">DESCRIPTION</span>&rsquo; file field <span class="samp">KeepSource</span>
forces the package to be installed with <code>keep.source =
	TRUE</code> (or <code>FALSE</code>).  (Suggestion of Greg Snow.  Note that
as all packages are lazy-loaded, this is now only relevant at
installation.)
</p>
<p>There are corresponding options <span class="option">--with-keep.source</span> and
<span class="option">--without-keep.source</span> for <code>R CMD INSTALL</code>.
</p>
</li>
<li> <p><code>R CMD INSTALL</code> has a new option
<span class="option">--byte-compile</span> to byte-compile the packages during
installation (since all packages are now lazy-loaded).  This can
be controlled on a per-package basis by the optional field
<span class="samp">ByteCompile</span> in the &lsquo;<span class="file">DESCRIPTION</span>&rsquo; file.
</p>
</li>
<li><p> A package <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> code but without a &lsquo;<span class="file">NAMESPACE</span>&rsquo; file will
have a default one created at <code>R CMD build</code> or <code>R
      CMD INSTALL</code> time, so all packages will be installed with
namespaces.  A consequence of this is that <code>.First.lib()</code>
functions need to be copied to <code>.onLoad()</code> (usually) or
<code>.onAttach()</code>.  For the time being, if there is an
auto-generated &lsquo;<span class="file">NAMESPACE</span>&rsquo; file and no <code>.onLoad()</code> nor
<code>.onAttach()</code> function is found but <code>.First.lib()</code> is,
it will be run as the attach hook (unless the package is one of a
list of known exceptions, when it will be run as the load hook).
</p>
</li>
<li><p> A warning is given if test-loading a package changes a
locked binding in a package other than itself.  It is likely that
this will be disallowed in future releases.  (There are <em>pro
tem</em> some exceptions to the warning.)
</p>
</li>
<li><p> A dependency on SVN revision is allowed for <code>R</code>,
e.g. <code>R (&gt;= r56550)</code>.  This should be used in conjunction with a
version number, e.g. <code>R (&gt;= 2.14.0), R (&gt;= r56550)</code> to
distinguish between R-patched and R-devel versions with the same
SVN revision.
</p>
</li>
<li> <p><code>installed.packages()</code> now hashes the names of its
cache files to avoid very rare problems with excessively long path
names.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14669">PR#14669</a>)
</p>
</li>
<li><p> A top-level &lsquo;<span class="file">COPYING</span>&rsquo; file in a package is no longer
installed (file names &lsquo;<span class="file">LICENSE</span>&rsquo; or &lsquo;<span class="file">LICENCE</span>&rsquo; having long
been preferred).
</p>
</li></ul>




<h4>UTILITIES</h4>


<ul>
<li> <p><code>R CMD check</code> now gives an error if the <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> code in a
vignette fails to run, unless this is caused by a missing package.
</p>
</li>
<li> <p><code>R CMD check</code> now unpacks tarballs in the same way
as <code>R CMD INSTALL</code>, including making use of the
environment variable <span class="env">R_INSTALL_TAR</span> to override the default
behaviour.
</p>
</li>
<li> <p><code>R CMD check</code> performs additional code analysis of
package startup functions, and notifies about incorrect argument
lists and (incorrect) calls to functions which modify the search
path or inappropriately generate messages.
</p>
</li>
<li> <p><code>R CMD check</code> now also checks compiled code for
symbols corresponding to functions which might terminate <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> or
write to &lsquo;<span class="file">stdout</span>&rsquo;/&lsquo;<span class="file">stderr</span>&rsquo; instead of the console.
</p>
</li>
<li> <p><code>R CMD check</code> now uses a <code>pdf()</code> device when
checking examples (rather than <code>postscript()</code>).
</p>
</li>
<li> <p><code>R CMD check</code> now checks line-endings of makefiles
and C/C++/Fortran sources in subdirectories of &lsquo;<span class="file">src</span>&rsquo; as well
as in &lsquo;<span class="file">src</span>&rsquo; itself.
</p>
</li>
<li> <p><code>R CMD check</code> now reports as a NOTE what look like
methods documented with their full names even if there is a
namespace and they are exported.  In almost all cases they are
intended to be used only as methods and should use the
<span class="samp">\method</span> markup.  In the other rare cases the recommended
form is to use a function such as <code>coefHclust</code> which would
not get confused with a method, document that and register it in
the &lsquo;<span class="file">NAMESPACE</span>&rsquo; file by <code>s3method(coef, hclust,
      coefHclust)</code>.
</p>
</li>
<li><p> The default for the environment variable
<span class="env">_R_CHECK_COMPACT_DATA2_</span> is now true: thus if using the newer
forms of compression introduced in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.10.0 would be beneficial
is now checked (by default).
</p>
</li>
<li><p> Reference output for a vignette can be supplied when
checking a package by <code>R CMD check</code>: see &lsquo;Writing R
Extensions&rsquo;.
</p>
</li>
<li> <p><code>R CMD Rd2dvi</code> allows the use of LaTeX package
<span class="samp">inputenx</span> rather than <span class="samp">inputenc</span>: the value of the
environment variable <span class="env">RD2DVI_INPUTENC</span> is used.  (LaTeX package
<span class="samp">inputenx</span> is an optional install which provides greater
coverage of the UTF-8 encoding.)
</p>
</li>
<li> <p><code>Rscript</code> on a Unix-alike now accepts file names
containing spaces (provided these are escaped or quoted in the
shell).
</p>
</li>
<li> <p><code>R CMD build</code> on a Unix-alike (only) now tries to
preserve dates on files it copies from its input directory.  (This
was the undocumented behaviour prior to <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.13.0.)
</p>
</li></ul>




<h4>DEPRECATED AND DEFUNCT</h4>


<ul>
<li> <p><code>require()</code> no longer has a <code>save</code> argument.
</p>
</li>
<li><p> The <code>gamma</code> argument to <code>hsv()</code>,
<code>rainbow()</code>, and <code>rgb2hsv()</code> has been removed.
</p>
</li>
<li><p> The <span class="option">--no-docs</span> option for
<code>R CMD build --binary</code> is defunct: use
<span class="option">--install-args</span> instead.
</p>
</li>
<li><p> The option <span class="option">--unsafe</span> to <code>R CMD INSTALL</code> is
defunct: use the identical option <span class="option">--no-lock</span> instead.
</p>
</li>
<li><p> The entry point <code>pythag</code> formerly in &lsquo;<span class="file">Rmath.h</span>&rsquo; is
defunct: use instead the C99 function <code>hypot</code>.
</p>
</li>
<li> <p><code>R CMD build --binary</code> is formally defunct:
<code>R CMD INSTALL --build</code> has long been the preferred
alternative.
</p>
</li>
<li> <p><code>zip.file.extract()</code> is now defunct: use
<code>unzip()</code> or <code>unz()</code> instead.
</p>
</li>
<li> <p><code>R CMD Rd2dvi</code> without the <span class="option">--pdf</span> option is
now deprecated: only PDF output will be supported in future
releases (since this allows the use of fonts only supported for
PDF), and only <code>R CMD Rd2pdf</code> will be available.
</p>
</li>
<li><p> Options such as <span class="option">--max-nsize</span> and the function
<code>mem.limits()</code> are now deprecated: these limits are nowadays
almost never used, and are reported by <code>gc()</code> when they are
in use.
</p>
</li>
<li><p> Forms like <code>binomial(link = "link")</code> for GLM families
deprecated since <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.4.0 are now defunct.
</p>
</li>
<li><p> The <code>declarativeOnly</code> argument to
<code>loadNamespace()</code> (not relevant since <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.13.0) has been
removed.
</p>
</li>
<li><p> Use of <code>library.dynam()</code> without specifying all the
first three arguments is deprecated.  (It is often called from a
namespace, and the defaults are only appropriate to a package.)
</p>
<p>Use of <code>chname</code> in <code>library.dynam()</code> with the extension
&lsquo;<span class="file">.so</span>&rsquo; or <code>.dll</code> (which is clearly not allowed according
to the help page) is deprecated.  This also applies to
<code>library.dynam.unload()</code> and <code>useDynLib</code> directives in
&lsquo;<span class="file">NAMESPACE</span>&rsquo; files.
</p>
</li>
<li><p> It is deprecated to use <code>mean(x)</code> and <code>sd(x)</code>
directly on data frames (or also matrices, for <code>sd</code>)
<code>x</code>, instead of simply using <code>sapply</code>.
</p>
<p>In the same spirit, <code>median(x)</code> now gives an error for a data
frame <code>x</code> (it often gave nonsensical results).
</p>
</li>
<li><p> The <code>keep.source</code> argument to <code>library()</code> and
<code>require()</code> is deprecated: it was only used for packages
installed without lazy-loading, and now all packages are
lazy-loaded.
</p>
</li>
<li><p> Using a false value for the &lsquo;<span class="file">DESCRIPTION</span>&rsquo; field
<span class="samp">LazyLoad</span> is deprecated.
</p>
</li></ul>




<h4>INSTALLATION</h4>


<ul>
<li><p> The base and recommended packages are now byte-compiled
(equivalent to <code>make bytecode</code> in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.13.x).
</p>
</li>
<li><p> Configure option <span class="option">--with-system-zlib</span> now only makes
use of the basic interface of <code>zlib</code> and not the
C function <span class="samp">gzseek</span> which has shown erroneous behaviour in
<code>zlib</code> 1.2.4 and 1.2.5.
</p>
</li>
<li><p> The <code>zlib</code> in the R sources is now version 1.2.5.
(This is safe even on 32-bit Linux systems because only the basic
interface is now used.)
</p>
</li>
<li><p> The &lsquo;<span class="file">.afm</span>&rsquo; files in package <span class="pkg">grDevices</span> are now
installed as compressed files (as long done on Windows), saving ca
2MB on the installed size.
</p>
</li>
<li><p> The non-screen cairo-based devices are no longer in the X11
module and so can be installed without X11.  (We have never seen a
Unix-alike system with cairographics installed but not X11, but a
user might select <span class="option">--without-x</span>.)
</p>
</li>
<li><p> Configure will try to use <span class="option">-fobjc-exceptions</span> for the
Objective-C compiler (if present) to ensure that even compilers
that do not enable exceptions by default (such as vanilla gcc) can
be used.  (Objective-C is currently only used on Mac OS X.)
</p>
</li>
<li><p> The system call <code>times</code> is required.
</p>
</li>
<li><p> The C99 functions <code>acosh</code>, <code>asinh</code>, <code>atanh</code>,
<code>snprintf</code> and <code>vsnprintf</code> are now required.
</p>
</li>
<li><p> There is no longer support for making DVI manuals <em>via</em>
<code>make dvi</code>, <code>make install-dvi</code> and similar.  Only
PDF manuals are supported (to allow the use of fonts which are
only available for PDF.)
</p>
</li>
<li><p> The &lsquo;<span class="file">configure</span>&rsquo; arguments used during configuration of
<span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> are included as a comment in &lsquo;<span class="file">Makeconf</span>&rsquo; for informative
purposes on Unix-alikes in a form suitable for shell execution.
Note that those are merely command-line arguments, they do not
include environment variables (one more reason to use configure
variables instead) or site configuration settings.
</p>
</li>
<li><p> Framework installation now supports <code>DESTDIR</code>
(Mac OS X only).
</p>
</li>
<li><p> Java detection (<code>R CMD javareconf</code>) works around bogus
<code>java.library.path</code> property in recent Oracle Java binaries.
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li><p> The locale category <span class="samp">LC_MONETARY</span> was only being set on
startup on Windows: that is now done on Unix-alikes where
supported.
</p>
</li>
<li><p> Reference class utilities will detect an attempt to modify
methods or fields in a locked class definition (e.g., in a
namespace) and generate an error.
</p>
</li>
<li><p> The formula methods for <code>lines()</code>, <code>points()</code> and
<code>text()</code> now work even if package <span class="pkg">stats</span> is not on the
search path.
</p>
</li>
<li><p> In principle, S4 classes from different packages could
have the same name.  This has not previously worked.  Changes
have now been installed that should allow such classes and
permit methods to use them.  New functions <code>className()</code>
and <code>multipleClasses()</code> are related tools for programming.
</p>
</li>
<li><p> Work around an issue in Linux (a system <code>select</code> call
resetting <code>tv</code>) which prevented internet operations from
timing out properly.
</p>
</li>
<li><p> Several stack trampling and overflow issues have been fixed
in TRE, triggered by <code>agrep</code> and friends with long patterns.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=14627">PR#14627</a>)
</p>
</li>
<li><p> (&ldquo;design infelicity&rdquo;) Field assignments in reference
classes are now consistent with slots in S4 classes:  the
assigned value must come from the declared class (if any) for the field
or from a subclass.
</p>
</li>
<li><p> The methods objects constructed for <code>"coerce"</code> and
<code>"coerce&lt;-"</code> were lacking some essential information in the
<code>generic</code>, <code>defined</code> and <code>target</code> slots;
<code>as()</code> did not handle duplicate class definitions correctly.
</p>
</li>
<li><p> The parser no longer accepts the digit <code>8</code> in an octal
character code in a string, nor does it accept unterminated
strings in a file.  (Reported by Bill Dunlap.)
</p>
</li>
<li><p> The <code>print()</code> method for class <code>"summary.aov"</code> did
not pass on argument <code>digits</code> when <code>summary()</code> was
called on a single object, and hence used more digits than
documented.
</p>
</li>
<li><p> The <code>X11()</code> device's cairo back-end produced incorrect
capture snapshot images on big-endian machines.
</p>
</li>
<li> <p><code>loglin()</code> gave a spurious error when argument
<code>margin</code> consisted of a single element of length one.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=14690">PR#14690</a>)
</p>
</li>
<li> <p><code>loess()</code> is better protected against misuse,
e.g. zero-length <code>span</code>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14691">PR#14691</a>)
</p>
</li>
<li> <p><code>HoltWinters()</code> checks that the optimization
succeeded. (<a href="https://bugs.R-project.org/show_bug.cgi?id=14694">PR#14694</a>)
</p>
</li>
<li><p> The (undocumented) inclusion of superclass objects in
default initializing of reference classes overwrote explicit
field arguments. The bug is fixed, the feature documented and a
test added.
</p>
</li>
<li> <p><code>round(x, -Inf)</code> now does something sensible (return
zero rather than <code>NA</code>).
</p>
</li>
<li> <p><code>signif(x, -Inf)</code> now behaves as documented
(<code>signif(x, 1)</code>) rather than giving zero.
</p>
</li>
<li><p> The <code>"table"</code> method for <code>Axis()</code> hardcoded
<code>side = 1</code>, hence calls to <code>plot(&lt;vector&gt;, &lt;table&gt;)</code>
labelled the wrong axis. (<a href="https://bugs.R-project.org/show_bug.cgi?id=14699">PR#14699</a>)
</p>
</li>
<li><p> Creating a connection might fail under <code>gctorture(TRUE)</code>.
</p>
</li>
<li> <p><code>stack()</code> and <code>unstack()</code> converted character
columns to factors.
</p>
<p><code>unstack()</code> sometimes produced incorrect results (a list or a
vector) if the factor on which to un-split had only one level.
</p>
</li>
<li><p> On some systems <code>help(".C", help_type = "pdf")</code> and
similar generated file names that TeX was unable to handle.
</p>
</li>
<li><p> Non-blocking listening socket connections continued to
report <code>isIncomplete()</code> as true even when the peer had closed
down and all available input had been read.
</p>
</li>
<li><p> The revised HTML search system now generates better
hyperlinks to help topics found: previously it gave problems with
help pages with names containing e.g. spaces and slashes.
</p>
</li>
<li><p> A late change in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.13.2 broke <span class="samp">\Sexpr</span> expressions
in Rd files.
</p>
</li>
<li><p> The creation of ticks on log axes (including by
<code>axTicks()</code>) sometimes incorrectly omitted a tick at one end
of the range by rounding error in a platform-dependent way.  This
could be seen in the examples for <code>axTicks()</code>, where with
axis limits <code>c(0.2, 88)</code> the tick for <code>0.2</code> was
sometimes omitted.
</p>
</li>
<li> <p><code>qgamma()</code> for small <code>shape</code> underflows to
<code>0</code> rather than sometimes giving <code>NaN</code>.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=8528">PR#8528</a>, <a href="https://bugs.R-project.org/show_bug.cgi?id=14710">PR#14710</a>)
</p>
</li>
<li> <p><code>mapply()</code> now gives an explicit error message (rather
than an obscure one) if inputs of zero and positive length are
mixed.
</p>
</li>
<li><p> Setting a Hershey font family followed by string height
query would crash R.
</p>
</li>
<li> <p><code>R CMD javareconf -e</code> would fail for some shells due to
a shift error. Also the resulting paths will no longer contain
<code>$(JAVA_HOME)</code> as that can result in an unintended
substitution based on &lsquo;<span class="file">Makeconf</span>&rsquo; instead of the shell
setting.
</p>
</li></ul>




<h3><img class="toplogo" src="../help/figures/../../html/Rlogo.svg" alt="[R logo]" /> CHANGES IN R VERSION 2.13.2</h3>



<h4>NEW FEATURES</h4>


<ul>
<li> <p><code>mem.limits()</code> now reports values larger than the
maximum integer (previously documented to be reported as
<code>NA</code>), and allows larger values to be set, including
<code>Inf</code> to remove the limit.
</p>
</li>
<li><p> The <code>print()</code> methods for classes <code>"Date"</code>,
<code>"POSIXct"</code> and <code>"POSIXlt"</code> respect the option
<code>"max.print"</code> and so are much faster for very long datetime
vectors.  (Suggestion of Yohan Chalabi.)
</p>
</li>
<li> <p><code>untar2()</code> now works around errors generated with
<code>tar</code> files that use more than the standard 6 digits for the
checksum. (<a href="https://bugs.R-project.org/show_bug.cgi?id=14654">PR#14654</a>)
</p>
</li>
<li> <p><code>install.packages()</code> with <code>Ncpus &gt; 1</code> guards
against simultaneous installation of indirect dependencies as well
as direct ones.
</p>
</li>
<li><p> Sweave now knows about a few more Windows' encodings
(including <code>cp1250</code> and <code>cp1257</code>) and some
<code>inputenx</code> encodings such as <code>koi8-r</code>.
</p>
</li>
<li> <p><code>postscript(colormodel = "rgb-nogray")</code> no longer sets
the sRGB colorspace for each colour and so some viewers may render
its files much faster than the default <code>colormodel ="rgb"</code>.
</p>
</li>
<li><p> The default for <code>pdf(maxRasters=)</code> has been increased
from 64 to 1000.
</p>
</li>
<li> <p><code>readBin()</code> now warns if <code>signed = FALSE</code> is used
inappropriately (rather than being silently ignored).
</p>
<p>It enforces the documented limit of <i>2^31-1</i> bytes
in a single call.
</p>
</li>
<li><p> PCRE has been updated to version 8.13, a bug-fix release
with updated Unicode tables (version 6.0.0).  An additional patch
(r611 from PCRE 8.20-to-be) has been added to fix a collation
symbol recognition issue.
</p>
</li></ul>




<h4>INSTALLATION</h4>


<ul>
<li><p> It is possible to build in &lsquo;<span class="file">src/extra/xdr</span>&rsquo; on more
platforms.  (Needed since glibc 2.14 hides its RPC implementation.)
</p>
</li>
<li> <p><code>configure</code> will find the Sun TI-RPC implementation
of xdr (in &lsquo;<span class="file">libtirpc</span>&rsquo;) provided its header files are in the
search path: see the &lsquo;R Installation and Administration
Manual&rsquo;.
</p>
</li></ul>




<h4>PACKAGE INSTALLATION</h4>


<ul>
<li><p> Using a broad <code>exportPattern</code> directive in a
&lsquo;<span class="file">NAMESPACE</span>&rsquo; file is no longer allowed to export internal
objects such as <code>.onLoad</code> and <code>.__S3MethodsTable__.</code> .
</p>
<p>These are also excluded from imports, along with <code>.First.lib</code>.
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li> <p><code>fisher.test()</code> had a buglet: If arguments were factors
with unused levels, levels were dropped and you would get an error
saying that there should be at least two levels, inconsistently
with pre-tabulated data.  (Reported by Michael Fay).
</p>
</li>
<li> <p><code>package.skeleton()</code> will no longer dump S4 objects
supplied directly rather than in a code file.  These cannot be
restored correctly from the dumped version.
</p>
</li>
<li><p> Build-time expressions in help files did not have access
to functions in the package being built (with <code>R CMD build</code>).
</p>
</li>
<li><p> Because <code>quote()</code> did not mark its result as being in
use, modification of the result could in some circumstances
modify the original call.
</p>
</li>
<li><p> Plotting <code>pch = '.'</code> now guarantees at least a one-pixel
dot if <code>cex &gt; 0</code>.
</p>
</li>
<li><p> The very-rarely-used command-line option
<span class="option">--max-vsize</span> was incorrectly interpreted as a number of
Vcells and not in bytes as documented.  (Spotted by Christophe
Rhodes.)
</p>
</li>
<li><p> The HTML generated by <code>Rd2HTML()</code> comes closer to
being standards compliant.
</p>
</li>
<li> <p><code>filter(x, recursive = TRUE)</code> gave incorrect results on a
series containing <code>NA</code>s.  (Spotted by Bill Dunlap.)
</p>
</li>
<li><p> Profiling <code>stats::mle()</code> fits with a <code>fixed</code>
parameter was not supported.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14646">PR#14646</a>)
</p>
</li>
<li> <p><code>retracemem()</code> was still using positional matching.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=14650">PR#14650</a>)
</p>
</li>
<li><p> The <code>quantile</code> method for <code>"ecdf"</code> objects now
works and is documented.
</p>
</li>
<li> <p><code>xtabs(~ .., ..., sparse=TRUE)</code> now also works together
with an <code>exclude = ..</code> specification.
</p>
</li>
<li> <p><code>decompose()</code> computed an incorrect seasonal component for
time series with odd frequencies.
</p>
</li>
<li><p> The <code>pdf()</code> device only includes the definition of the
sRGB colorspace in the output file for the <code>"rgb"</code> colormodel
(and not for <code>"gray"</code> nor <code>"cmyk"</code>): this saves ca
9KB in the output file.
</p>
</li>
<li> <p><code>.hasSlot()</code> wrongly gave <code>FALSE</code> in some cases.
</p>
</li>
<li> <p><code>Sweave()</code> with <code>keep.source=TRUE</code> could generate
spurious <code>NA</code> lines when a chunk reference appeared last in
a code chunk.
</p>
</li>
<li> <p><span class="samp">\Sexpr[results=rd]</span> in an &lsquo;<span class="file">.Rd</span>&rsquo; file now first tries
<code>parse_Rd(fragment=FALSE)</code> to allow Rd section-level macros
to be inserted.
</p>
</li>
<li><p> The <code>print()</code> method for class <code>"summary.aov"</code> did
not pass on arguments such as <code>signif.stars</code> when
<code>summary()</code> was called on a single object.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14684">PR#14684</a>)
</p>
</li>
<li><p> In rare cases <code>ks.test()</code> could return a p-value
very slightly less than 0 by rounding error.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14671">PR#14671</a>)
</p>
</li>
<li><p> If <code>trunc()</code> was called on a <code>"POSIXlt"</code> vector
and the result was subsetted, all but the first element was
converted to <code>NA</code>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14679">PR#14679</a>)
</p>
</li>
<li> <p><code>cbind()</code> and <code>rbind()</code> could cause memory
corruption when used on a combination of raw and logical/integer
vectors.
</p>
</li></ul>




<h3><img class="toplogo" src="../help/figures/../../html/Rlogo.svg" alt="[R logo]" /> CHANGES IN R VERSION 2.13.1</h3>



<h4>NEW FEATURES</h4>


<ul>
<li> <p><code>iconv()</code> no longer translates <code>NA</code> strings as
<code>"NA"</code>.
</p>
</li>
<li> <p><code>persp(box = TRUE)</code> now warns if the surface extends
outside the box (since occlusion for the box and axes is computed
assuming the box is a bounding box). (<a href="https://bugs.R-project.org/show_bug.cgi?id=202">PR#202</a>)
</p>
</li>
<li> <p><code>RShowDoc()</code> can now display the licences shipped with
<span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>, e.g. <code>RShowDoc("GPL-3")</code>.
</p>
</li>
<li><p> New wrapper function <code>showNonASCIIfile()</code> in package
<span class="pkg">tools</span>.
</p>
</li>
<li> <p><code>nobs()</code> now has a <code>"mle"</code> method in package
<span class="pkg">stats4</span>.
</p>
</li>
<li> <p><code>trace()</code> now deals correctly with S4 reference classes
and corresponding reference methods (e.g., <code>$trace()</code>)
have been added.
</p>
</li>
<li> <p><code>xz</code> has been updated to 5.0.3 (very minor bugfix
release).
</p>
</li>
<li> <p><code>tools::compactPDF()</code> gets more compression (usually a
little, sometimes a lot) by using the compressed object streams of
PDF 1.5.
</p>
</li>
<li> <p><code>cairo_ps(onefile = TRUE)</code> generates encapsulated EPS
on platforms with cairo &gt;= 1.6.
</p>
</li>
<li><p> Binary reads (e.g., by <code>readChar()</code> and <code>readBin()</code>)
are now supported on clipboard connections.  (Wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=14593">PR#14593</a>.)
</p>
</li>
<li> <p><code>as.POSIXlt.factor()</code> now passes <code>...</code> to the
character method (suggestion of Joshua Ulrich).  [Intended for <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>
2.13.0 but accidentally removed before release.]
</p>
</li>
<li> <p><code>vector()</code> and its wrappers such as <code>integer()</code>
and <code>double()</code> now warn if called with a <code>length</code>
argument of more than one element.  This helps track down user
errors such as calling <code>double(x)</code> instead of
<code>as.double(x)</code>.
</p>
</li></ul>




<h4>INSTALLATION</h4>


<ul>
<li><p> Building the vignette PDFs in packages <span class="pkg">grid</span> and
<span class="pkg">utils</span> is now part of running <code>make</code> from an SVN
checkout on a Unix-alike: a separate <code>make vignettes</code> step
is no longer required.
</p>
<p>These vignettes are now made with <code>keep.source = TRUE</code> and
hence will be laid out differently.
</p>
</li>
<li> <p><code>make install-strip</code> failed under some configuration
options.
</p>
</li>
<li><p> Packages can customize non-standard installation of compiled
code via a <code>src/install.libs.R</code> script. This allows packages that
have architecture-specific binaries (beyond the package's shared
objects/DLLs) to be installed in a multi-architecture setting.
</p>
</li></ul>




<h4>SWEAVE &amp; VIGNETTES</h4>


<ul>
<li> <p><code>Sweave()</code> and <code>Stangle()</code> gain an <code>encoding</code>
argument to specify the encoding of the vignette sources if the
latter do not contain a <span class="samp">\usepackage[]{inputenc}</span> statement
specifying a single input encoding.
</p>
</li>
<li><p> There is a new Sweave option <code>figs.only = TRUE</code> to run
each figure chunk only for each selected graphics device, and not
first using the default graphics device.   This will become the
default in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.14.0.
</p>
</li>
<li><p> Sweave custom graphics devices can have a custom function
<code>foo.off()</code> to shut them down.
</p>
</li>
<li><p> Warnings are issued when non-portable filenames are found
for graphics files (and chunks if <code>split = TRUE</code>).  Portable
names are regarded as alphanumeric plus hyphen, underscore, plus
and hash (periods cause problems with recognizing file
extensions).
</p>
</li>
<li><p> The <code>Rtangle()</code> driver has a new option
<code>show.line.nos</code> which is by default false; if true it
annotates code chunks with a comment giving the line number of the
first line in the sources (the behaviour of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> &gt;= 2.12.0).
</p>
</li>
<li><p> Package installation tangles the vignette sources: this step
now converts the vignette sources from the vignette/package
encoding to the current encoding, and records the encoding (if not
ASCII) in a comment line at the top of the installed &lsquo;<span class="file">.R</span>&rsquo;
file.
</p>
</li></ul>




<h4>LICENCE</h4>


<ul>
<li><p> No parts of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> are now licensed solely under GPL-2.  The
licences for packages <a href="https://CRAN.R-project.org/package=rpart"><span class="pkg">rpart</span></a> and <a href="https://CRAN.R-project.org/package=survival"><span class="pkg">survival</span></a> have been
changed, which means that the licence terms for <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> as distributed
are GPL-2 | GPL-3.
</p>
</li></ul>




<h4>DEPRECATED AND DEFUNCT</h4>


<ul>
<li><p> The internal functions <code>.readRDS()</code> and
<code>.saveRDS()</code> are now deprecated in favour of the public
functions <code>readRDS()</code> and <code>saveRDS()</code> introduced in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>
2.13.0.
</p>
</li>
<li><p> Switching off lazy-loading of code <em>via</em> the
<span class="samp">LazyLoad</span> field of the &lsquo;<span class="file">DESCRIPTION</span>&rsquo; file is now
deprecated.  In future all packages will be lazy-loaded.
</p>
</li>
<li><p> The off-line <code>help()</code> types <span class="samp">"postscript"</span> and
<span class="samp">"ps"</span> are deprecated.
</p>
</li></ul>




<h4>UTILITIES</h4>


<ul>
<li> <p><code>R CMD check</code> on a multi-architecture installation now
skips the user's &lsquo;<span class="file">.Renviron</span>&rsquo; file for the
architecture-specific tests (which do read the
architecture-specific &lsquo;<span class="file">Renviron.site</span>&rsquo; files).  This is
consistent with single-architecture checks, which use
<span class="option">--no-environ</span>.
</p>
</li>
<li> <p><code>R CMD build</code> now looks for &lsquo;<span class="file">DESCRIPTION</span>&rsquo;
fields <span class="samp">BuildResaveData</span> and <span class="samp">BuildKeepEmpty</span> for
per-package overrides.  See &lsquo;Writing R Extensions&rsquo;.
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li> <p><code>plot.lm(which = 5)</code> was intended to order factor
levels in increasing order of mean standardized residual.   It
ordered the factor labels correctly, but could plot the wrong
group of residuals against the label.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14545">PR#14545</a>)
</p>
</li>
<li> <p><code>mosaicplot()</code> could clip the factor labels, and could
overlap them with the cells if a non-default value of
<code>cex.axis</code> was used.  (Related to <a href="https://bugs.R-project.org/show_bug.cgi?id=14550">PR#14550</a>.)
</p>
</li>
<li> <p><code>dataframe[[row,col]]</code> now dispatches on <code>[[</code>
methods for the selected column.  (Spotted by Bill Dunlap).
</p>
</li>
<li> <p><code>sort.int()</code> would strip the class of an object, but
leave its object bit set.  (Reported by Bill Dunlap.)
</p>
</li>
<li> <p><code>pbirthday()</code> and <code>qbirthday()</code> did not implement
the algorithm exactly as given in their reference and so were
unnecessarily inaccurate.
</p>
<p><code>pbirthday()</code> now solves the approximate formula analytically
rather than using <code>uniroot()</code> on a discontinuous function.
</p>
<p>The description of the problem was inaccurate: the probability is
a tail probability (&lsquo;2 <em>or more</em> people share a birthday&rsquo;)
</p>
</li>
<li><p> Complex arithmetic sometimes warned incorrectly about
producing NAs when there were NaNs in the input.
</p>
</li>
<li> <p><code>seek(origin = "current")</code> incorrectly reported it was
not implemented for a <code>gzfile()</code> connection.
</p>
</li>
<li> <p><code>c()</code>, <code>unlist()</code>, <code>cbind()</code> and
<code>rbind()</code> could silently overflow the maximum vector length
and cause a segfault.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14571">PR#14571</a>)
</p>
</li>
<li><p> The <code>fonts</code> argument to <code>X11(type = "Xlib")</code> was
being ignored.
</p>
</li>
<li><p> Reading (e.g., with <code>readBin()</code>) from a raw connection
was not advancing the pointer, so successive reads would read the
same value.  (Spotted by Bill Dunlap.)
</p>
</li>
<li><p> Parsed text containing embedded newlines was printed
incorrectly by <code>as.character.srcref()</code>.  (Reported by Hadley
Wickham.)
</p>
</li>
<li> <p><code>decompose()</code> used with a series of a non-integer
number of periods returned a seasonal component shorter than the
original series.  (Reported by Rob Hyndman.)
</p>
</li>
<li> <p><code>fields = list()</code> failed for <code>setRefClass()</code>.
(Reported by Michael Lawrence.)
</p>
</li>
<li><p> Reference classes could not redefine an inherited field
which had class <code>"ANY"</code>. (Reported by Janko Thyson.)
</p>
</li>
<li><p> Methods that override previously loaded versions will now
be installed and called.  (Reported by Iago Mosqueira.)
</p>
</li>
<li> <p><code>addmargins()</code> called <code>numeric(apos)</code> rather than
<code>numeric(length(apos))</code>.
</p>
</li>
<li><p> The HTML help search sometimes produced bad links.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=14608">PR#14608</a>)
</p>
</li>
<li><p> Command completion will no longer be broken if
<code>tail.default()</code> is redefined by the user. (Problem reported
by Henrik Bengtsson.)
</p>
</li>
<li><p> LaTeX rendering of markup in titles of help pages has been
improved; in particular, <code>\eqn{}</code> may be used there.
</p>
</li>
<li> <p><code>isClass()</code> used its own namespace as the default of
the <code>where</code> argument inadvertently.
</p>
</li>
<li><p> Rd conversion to latex mishandled multi-line titles
(including cases where there was a blank line in the <span class="samp">\title</span>
section).  (It seems this happened only in 2.13.0 patched.)
</p>
</li>
<li> <p><code>postscript()</code> with an sRGB colormodel now uses sRGB
for raster images (in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.13.[01] it used uncalibrated RGB).
</p>
<p>There is no longer an undocumented 21845-pixel limit on raster images.
</p>
</li></ul>




<h3><img class="toplogo" src="../help/figures/../../html/Rlogo.svg" alt="[R logo]" /> CHANGES IN R VERSION 2.13.0</h3>



<h4>SIGNIFICANT USER-VISIBLE CHANGES</h4>


<ul>
<li> <p><code>replicate()</code> (by default) and <code>vapply()</code> (always)
now return a higher-dimensional array instead of a matrix in the case
where the inner function value is an array of dimension &gt;= 2.
</p>
</li>
<li><p> Printing and formatting of floating point numbers is now
using the correct number of digits, where it previously rarely
differed by a few digits. (See &ldquo;scientific&rdquo; entry below.)
This affects <em>many</em> &lsquo;<span class="file">*.Rout.save</span>&rsquo; checks in packages.
</p>
</li></ul>




<h4>NEW FEATURES</h4>


<ul>
<li> <p><code>normalizePath()</code> has been moved to the <span class="pkg">base</span>
package (from <span class="pkg">utils</span>): this is so it can be used by
<code>library()</code> and friends.
</p>
<p>It now does tilde expansion.
</p>
<p>It gains new arguments <code>winslash</code> (to select the separator on
Windows) and <code>mustWork</code> to control the action if a canonical
path cannot be found.
</p>
</li>
<li><p> The previously barely documented limit of 256 bytes on a
symbol name has been raised to 10,000 bytes (a sanity check).
Long symbol names can sometimes occur when deparsing expressions
(for example, in <code>model.frame</code>).
</p>
</li>
<li> <p><code>reformulate()</code> gains a <code>intercept</code> argument.
</p>
</li>
<li> <p><code>cmdscale(add = FALSE)</code> now uses the more common
definition that there is a representation in <code>n-1</code> or less
dimensions, and only dimensions corresponding to positive
eigenvalues are used.  (Avoids confusion such as <a href="https://bugs.R-project.org/show_bug.cgi?id=14397">PR#14397</a>.)
</p>
</li>
<li><p> Names used by <code>c()</code>, <code>unlist()</code>, <code>cbind()</code>
and <code>rbind()</code> are marked with an encoding when this can be
ascertained.
</p>
</li>
<li><p> R colours are now defined to refer to the sRGB color space.
</p>
<p>The PDF, PostScript, and Quartz graphics devices record this fact.
X11 (and cairo) and Windows just assume that your screen conforms.
</p>
</li>
<li> <p><code>system.file()</code> gains a <code>mustWork</code> argument
(suggestion of Bill Dunlap).
</p>
</li>
<li> <p><code>new.env(hash = TRUE)</code> is now the default.
</p>
</li>
<li> <p><code>list2env(envir = NULL)</code> defaults to hashing (with a
suitably sized environment) for lists of more than 100 elements.
</p>
</li>
<li> <p><code>text()</code> gains a formula method.
</p>
</li>
<li> <p><code>IQR()</code> now has a <code>type</code> argument which is passed
to <code>quantile()</code>.
</p>
</li>
<li> <p><code>as.vector()</code>, <code>as.double()</code> etc duplicate less
when they leave the mode unchanged but remove attributes.
</p>
<p><code>as.vector(mode = "any")</code> no longer duplicates when it does
not remove attributes.  This helps memory usage in <code>matrix()</code>
and <code>array()</code>.
</p>
<p><code>matrix()</code> duplicates less if <code>data</code> is an atomic vector
with attributes such as names (but no class).
</p>
<p><code>dim(x) &lt;- NULL</code> duplicates less if <code>x</code> has neither
dimensions nor names (since this operation removes names and
dimnames).
</p>
</li>
<li> <p><code>setRepositories()</code> gains an <code>addURLs</code> argument.
</p>
</li>
<li> <p><code>chisq.test()</code> now also returns a <code>stdres</code>
component, for standardized residuals (which have unit variance,
unlike the Pearson residuals).
</p>
</li>
<li> <p><code>write.table()</code> and friends gain a <code>fileEncoding</code>
argument, to simplify writing files for use on other OSes (e.g., a
spreadsheet intended for Windows or Mac OS X Excel).
</p>
</li>
<li><p> Assignment expressions of the form <code>foo::bar(x) &lt;- y</code>
and <code>foo:::bar(x) &lt;- y</code> now work; the replacement functions
used are <code>foo::`bar&lt;-`</code> and <code>foo:::`bar&lt;-`</code>.
</p>
</li>
<li> <p><code>Sys.getenv()</code> gains a <code>names</code> argument so
<code>Sys.getenv(x, names = FALSE)</code> can replace the common idiom
of <code>as.vector(Sys.getenv())</code>.  The default has been changed
to not name a length-one result.
</p>
</li>
<li><p> Lazy loading of environments now preserves attributes and
locked status. (The locked status of bindings and active bindings
are still not preserved; this may be addressed in the future).
</p>
</li>
<li> <p><code>options("install.lock")</code> may be set to <code>FALSE</code>
so that <code>install.packages()</code> defaults to <span class="option">--no-lock</span>
installs, or (on Windows) to <code>TRUE</code> so that binary installs
implement locking.
</p>
</li>
<li> <p><code>sort(partial = p)</code> for large <code>p</code> now tries
Shellsort if quicksort is not appropriate and so works for
non-numeric atomic vectors.
</p>
</li>
<li> <p><code>sapply()</code> gets a new option <code>simplify = "array"</code>
which returns a &ldquo;higher rank&rdquo; array instead of just a matrix
when <code>FUN()</code> returns a <code>dim()</code> length of two or more.
</p>
<p><code>replicate()</code> has this option set by default, and
<code>vapply()</code> now behaves that way internally.
</p>
</li>
<li> <p><code>aperm()</code> becomes S3 generic and gets a <code>table</code>
method which preserves the class.
</p>
</li>
<li> <p><code>merge()</code> and <code>as.hclust()</code> methods for objects of
class <code>"dendrogram"</code> are now provided.
</p>
</li>
<li><p> The character method of <code>as.POSIXlt()</code> now tries to
find a format that works for all non-<code>NA</code> inputs, not just
the first one.
</p>
</li>
<li> <p><code>str()</code> now has a method for class <code>"Date"</code>
analogous to that for class <code>"POSIXt"</code>.
</p>
</li>
<li><p> New function <code>file.link()</code> to create hard links on
those file systems (POSIX, NTFS but not FAT) that support them.
</p>
</li>
<li><p> New <code>Summary()</code> group method for class <code>"ordered"</code>
implements <code>min()</code>, <code>max()</code> and <code>range()</code> for
ordered factors.
</p>
</li>
<li> <p><code>mostattributes&lt;-()</code> now consults the <code>"dim"</code>
attribute and not the <code>dim()</code> function, making it more useful
for objects (such as data frames) from classes with methods for
<code>dim()</code>.  It also uses <code>attr&lt;-()</code> in preference to the
generics <code>name&lt;-()</code>, <code>dim&lt;-()</code> and <code>dimnames&lt;-()</code>.
(Related to <a href="https://bugs.R-project.org/show_bug.cgi?id=14469">PR#14469</a>.)
</p>
</li>
<li><p> There is a new option <code>"browserNLdisabled"</code> to disable
the use of an empty (e.g., via the &lsquo;Return&rsquo; key) as a synonym
for <code>c</code> in <code>browser()</code> or <code>n</code> under <code>debug()</code>.
(Wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=14472">PR#14472</a>.)
</p>
</li>
<li> <p><code>example()</code> gains optional new arguments
<code>character.only</code> and <code>give.lines</code> enabling programmatic
exploration.
</p>
</li>
<li> <p><code>serialize()</code> and <code>unserialize()</code> are no longer
described as &lsquo;experimental&rsquo;.  The interface is now regarded
as stable, although the serialization format may well change in
future releases.  (<code>serialize()</code> has a new argument
<code>version</code> which would allow the current format to be written
if that happens.)
</p>
<p>New functions <code>saveRDS()</code> and <code>readRDS()</code> are public
versions of the &lsquo;internal&rsquo; functions <code>.saveRDS()</code> and
<code>.readRDS()</code> made available for general use.  The dot-name
versions remain available as several package authors have made use
of them, despite the documentation.  <code>readRDS()</code> no longer
wraps non-file connections in a call to <code>gzcon()</code>, for
efficiency (see its documentation).
</p>
<p><code>saveRDS()</code> supports <code>compress = "xz"</code>.
</p>
</li>
<li><p> Many functions when called with a not-open connection will
now ensure that the connection is left not-open in the event of
error.  These include <code>read.dcf()</code>, <code>dput()</code>,
<code>dump()</code>, <code>load()</code>, <code>parse()</code>, <code>readBin()</code>,
<code>readChar()</code>, <code>readLines()</code>, <code>save()</code>,
<code>writeBin()</code>, <code>writeChar()</code>, <code>writeLines()</code>,
<code>.readRDS()</code>, <code>.saveRDS()</code> and <code>tools::parse_Rd()</code>,
as well as functions calling these.
</p>
</li>
<li><p> Public functions <code>find.package()</code> and <code>path.package()</code>
replace the internal dot-name versions.
</p>
</li>
<li><p> The default method for <code>terms()</code> now looks for a
<code>"terms"</code> attribute if it does not find a <code>"terms"</code>
component, and so works for model frames.
</p>
</li>
<li> <p><code>httpd()</code> handlers receive an additional argument
containing the full request headers as a raw vector (this can be
used to parse cookies, multi-part forms etc.). The recommended
full signature for handlers is therefore <code>function(url,
	query, body, headers, ...)</code>.
</p>
</li>
<li> <p><code>file.edit()</code> gains a <code>fileEncoding</code> argument to
specify the encoding of the file(s).
</p>
</li>
<li><p> The format of the HTML package listings has changed.  If
there is more than one library tree , a table of links to
libraries is provided at the top and bottom of the page.  Where a
library contains more than 100 packages, an alphabetic index is
given at the top of the section for that library.  (As a
consequence, package names are now sorted case-insensitively
whatever the locale.)
</p>
</li>
<li> <p><code>isSeekable()</code> now returns <code>FALSE</code> on connections
which have non-default <code>encoding</code>.  Although documented to
record if &lsquo;in principle&rsquo; the connection supports seeking,
it seems safer to report <code>FALSE</code> when it may not work.
</p>
</li>
<li> <p><code>R CMD REMOVE</code> and <code>remove.packages()</code> now
remove file <code>R.css</code> when removing all remaining packages in a
library tree.  (Related to the wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=14475">PR#14475</a>: note that this
file is no longer installed.)
</p>
</li>
<li> <p><code>unzip()</code> now has a <code>unzip</code> argument like
<code>zip.file.extract()</code>.  This allows an external
<code>unzip</code> program to be used, which can be useful to access
features supported by Info-ZIP's <code>unzip</code> version 6 which
is now becoming more widely available.
</p>
</li>
<li><p> There is a simple <code>zip()</code> function, as wrapper for an
external <code>zip</code> command.
</p>
</li>
<li> <p><code>bzfile()</code> connections can now read from concatenated
<code>bzip2</code> files (including files written with
<code>bzfile(open = "a")</code>) and files created by some other
compressors (such as the example of <a href="https://bugs.R-project.org/show_bug.cgi?id=14479">PR#14479</a>).
</p>
</li>
<li><p> The primitive function <code>c()</code> is now of type BUILTIN.
</p>
</li>
<li> <p><code>plot(&lt;dendrogram&gt;, .., nodePar=*)</code> now obeys an optional
<code>xpd</code> specification (allowing clipping to be turned off
completely).
</p>
</li>
<li> <p><code>nls(algorithm="port")</code> now shares more code with
<code>nlminb()</code>, and is more consistent with the other
<code>nls()</code> algorithms in its return value.
</p>
</li>
<li> <p><code>xz</code> has been updated to 5.0.1 (very minor bugfix
release).
</p>
</li>
<li> <p><code>image()</code> has gained a logical <code>useRaster</code>
argument allowing it to use a bitmap raster for plotting a
regular grid instead of polygons. This can be more efficient, but
may not be supported by all devices. The default is <code>FALSE</code>.
</p>
</li>
<li> <p><code>list.files()</code>/<code>dir()</code> gains a new argument
<code>include.dirs()</code> to include directories in the listing when
<code>recursive = TRUE</code>.
</p>
</li>
<li><p> New function <code>list.dirs()</code> lists all directories,
(even empty ones).
</p>
</li>
<li> <p><code>file.copy()</code> now (by default) copies
read/write/execute permissions on files, moderated by the current
setting of <code>Sys.umask()</code>.
</p>
</li>
<li> <p><code>Sys.umask()</code> now accepts <code>mode = NA</code> and returns
the current <code>umask</code> value (visibly) without changing it.
</p>
</li>
<li><p> There is a <code>!</code> method for classes <code>"octmode"</code> and
<code>"hexmode"</code>: this allows <code>xor(a, b)</code> to work if both
<code>a</code> and <code>b</code> are from one of those classes.
</p>
</li>
<li> <p><code>as.raster()</code> no longer fails for vectors or matrices
containing <code>NA</code>s.
</p>
</li>
<li><p> New hook <code>"before.new.plot"</code> allows functions to be run
just before advancing the frame in <code>plot.new</code>, which is
potentially useful for custom figure layout implementations.
</p>
</li>
<li><p> Package <span class="pkg">tools</span> has a new function <code>compactPDF()</code>
to try to reduce the size of PDF files <em>via</em> <code>qpdf</code>
or <code>gs</code>.
</p>
</li>
<li> <p><code>tar()</code> has a new argument <code>extra_flags</code>.
</p>
</li>
<li> <p><code>dotchart()</code> accepts more general objects <code>x</code> such
as 1D tables which can be coerced by <code>as.numeric()</code> to a
numeric vector, with a warning since that might not be
appropriate.
</p>
</li>
<li><p> The previously internal function <code>create.post()</code> is now
exported from <span class="pkg">utils</span>, and the documentation for
<code>bug.report()</code> and <code>help.request()</code> now refer to that
for <code>create.post()</code>.
</p>
<p>It has a new <code>method = "mailto"</code> on Unix-alikes similar to
that on Windows: it invokes a default mailer via <code>open</code>
(Mac OS X) or <code>xdg-open</code> or the default browser (elsewhere).
</p>
<p>The default for <code>ccaddress</code> is now
<code>getOption("ccaddress")</code> which is by default unset: using the
username as a mailing address nowadays rarely works as expected.
</p>
</li>
<li><p> The default for <code>options("mailer")</code> is now
<code>"mailto"</code> on all platforms.
</p>
</li>
<li> <p><code>unlink()</code> now does tilde-expansion (like most other
file functions).
</p>
</li>
<li> <p><code>file.rename()</code> now allows vector arguments (of the
same length).
</p>
</li>
<li><p> The <code>"glm"</code> method for <code>logLik()</code> now returns an
<code>"nobs"</code> attribute (which <code>stats4::BIC()</code> assumed it
did).
</p>
<p>The <code>"nls"</code> method for <code>logLik()</code> gave incorrect results
for zero weights.
</p>
</li>
<li><p> There is a new generic function <code>nobs()</code> in package
<span class="pkg">stats</span>, to extract from model objects a suitable value for
use in BIC calculations.  An S4 generic derived from it is defined
in package <span class="pkg">stats4</span>.
</p>
</li>
<li><p> Code for S4 reference-class methods is now examined for
possible errors in non-local assignments.
</p>
</li>
<li> <p><code>findClasses</code>, <code>getGeneric</code>, <code>findMethods</code>
and <code>hasMethods</code> are revised to deal consistently with
the <code>package=</code> argument and be consistent with soft namespace
policy for finding objects.
</p>
</li>
<li> <p><code>tools::Rdiff()</code> now has the option to return not only
the status but a character vector of observed differences (which
are still by default sent to &lsquo;<span class="file">stdout</span>&rsquo;).
</p>
</li>
<li><p> The startup environment variables <span class="env">R_ENVIRON_USER</span>,
<span class="env">R_ENVIRON</span>, <span class="env">R_PROFILE_USER</span> and <span class="env">R_PROFILE</span> are now
treated more consistently.  In all cases an empty value is
considered to be set and will stop the default being used, and for
the last two tilde expansion is performed on the file name.  (Note
that setting an empty value is probably impossible on Windows.)
</p>
</li>
<li><p> Using <code>R --no-environ CMD</code>, <code>R
	--no-site-file CMD</code> or <code>R --no-init-file CMD</code> sets
environment variables so these settings are passed on to child <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>
processes, notably those run by <code>INSTALL</code>, <code>check</code> and
<code>build</code>. <code>R --vanilla CMD</code> sets these three options
(but not <span class="option">--no-restore</span>).
</p>
</li>
<li> <p><code>smooth.spline()</code> is somewhat faster.  With
<code>cv=NA</code> it allows some leverage computations to be skipped,
</p>
</li>
<li><p> The internal (C) function <span class="samp">scientific()</span>, at the heart
of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>'s <code>format.info(x)</code>, <code>format(x)</code>, <code>print(x)</code>,
etc, for numeric <code>x</code>, has been re-written in order to provide
slightly more correct results, fixing <a href="https://bugs.R-project.org/show_bug.cgi?id=14491">PR#14491</a>, notably in
border cases including when <code>digits &gt;= 16</code>, thanks to
substantial contributions (code and experiments) from Petr
Savicky.  This affects a noticeable amount of numeric output from
<span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>.
</p>
</li>
<li><p> A new function <code>grepRaw()</code> has been introduced for
finding subsets of raw vectors. It supports both literal searches
and regular expressions.
</p>
</li>
<li><p> Package <span class="pkg">compiler</span> is now provided as a standard
package.  See <code>?compiler::compile</code> for information on how to
use the compiler.  This package implements a byte code compiler
for <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>: by default the compiler is not used in this release.  See
the &lsquo;R Installation and Administration Manual&rsquo; for how to
compile the base and recommended packages.
</p>
</li>
<li><p> Providing an <code>exportPattern</code> directive in a NAMESPACE
file now causes classes to be exported according to the same
pattern, for example the default from <code>package.skeleton()</code>
to specify all names starting with a letter.  An explicit
directive to <code>exportClassPattern</code> will still over-ride.
</p>
</li>
<li><p> There is an additional marked encoding <code>"bytes"</code> for
character strings.  This is intended to be used for non-ASCII
strings which should be treated as a set of bytes, and never
re-encoded as if they were in the encoding of the current locale:
<code>useBytes = TRUE</code> is automatically selected in functions such
as <code>writeBin()</code>, <code>writeLines()</code>, <code>grep()</code> and
<code>strsplit()</code>.
</p>
<p>Only a few character operations are supported (such as <code>substr()</code>).
</p>
<p>Printing, <code>format()</code> and <code>cat()</code> will represent non-ASCII
bytes in such strings by a <span class="samp">\xab</span> escape.
</p>
</li>
<li><p> The new function <code>removeSource()</code> removes the internally
stored source from a function.
</p>
</li>
<li> <p><code>"srcref"</code> attributes now include two additional
line number values, recording the line numbers in the order they
were parsed.
</p>
</li>
<li><p> New functions have been added for source reference access:
<code>getSrcFilename()</code>, <code>getSrcDirectory()</code>,
<code>getSrcLocation()</code> and <code>getSrcref()</code>.
</p>
</li>
<li> <p><code>Sys.chmod()</code> has an extra argument <code>use_umask</code>
which defaults to true and restricts the file mode by the current
setting of <code>umask</code>.  This means that all the <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> functions
which manipulate file/directory permissions by default respect
<code>umask</code>, notably <code>R CMD INSTALL</code>.
</p>
</li>
<li> <p><code>tempfile()</code> has an extra argument <code>fileext</code> to
create a temporary filename with a specified extension.
(Suggestion and initial implementation by Dirk Eddelbuettel.)
</p>
<p>There are improvements in the way <code>Sweave()</code> and
<code>Stangle()</code> handle non-ASCII vignette sources, especially in
a UTF-8 locale: see &lsquo;Writing R Extensions&rsquo; which now has a
subsection on this topic.
</p>
</li>
<li> <p><code>factanal()</code> now returns the rotation matrix if a
rotation such as <code>"promax"</code> is used, and hence factor
correlations are displayed.  (Wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=12754">PR#12754</a>.)
</p>
</li>
<li><p> The <code>gctorture2()</code> function provides a more refined
interface to the GC torture process.  Environment variables
<span class="env">R_GCTORTURE</span>, <span class="env">R_GCTORTURE_WAIT</span>, and
<span class="env">R_GCTORTURE_INHIBIT_RELEASE</span> can also be used to control the
GC torture process.
</p>
</li>
<li> <p><code>file.copy(from, to)</code> no longer regards it as an error
to supply a zero-length <code>from</code>: it now simply does nothing.
</p>
</li>
<li> <p><code>rstandard.glm()</code> gains a <code>type</code> argument which can
be used to request standardized Pearson residuals.
</p>
</li>
<li><p> A start on a Turkish translation, thanks to Murat Alkan.
</p>
</li>
<li> <p><code>.libPaths()</code> calls <code>normalizePath(winslash = "/")</code>
on the paths: this helps (usually) to present them in a
user-friendly form and should detect duplicate paths accessed via
different symbolic links.
</p>
</li>
<li> <p><code>download.file()</code> can be now used with external methods
even if there are spaces in the URL or the target filename.
</p>
</li>
<li><p> The first formal argument of <code>.C()</code>, <code>.Fortran()</code>,
<code>.Call()</code> and <code>.External()</code> is now referred to a
<code>.NAME</code> rather than <code>name</code>: however actual calls should
have an unnamed first argument.
</p>
</li></ul>




<h4>SWEAVE CHANGES</h4>


<ul>
<li> <p><code>Sweave()</code> has options to produce PNG and JPEG figures,
and to use a custom function to open a graphics device (see
<code>?RweaveLatex</code>).<br />
(Based in part on the contribution of <a href="https://bugs.R-project.org/show_bug.cgi?id=14418">PR#14418</a>.)
</p>
</li>
<li><p> The default for <code>Sweave()</code> is to produce only PDF
figures (rather than both EPS and PDF).
</p>
</li>
<li><p> Environment variable <span class="env">SWEAVE_OPTIONS</span> can be used to
supply defaults for existing or new options to be applied after
the Sweave driver setup has been run.
</p>
</li>
<li><p> The Sweave manual is now included as a vignette in the
<span class="pkg">utils</span> package.
</p>
</li>
<li> <p><code>Sweave()</code> handles <code>keep.source=TRUE</code> much better:
it could duplicate some lines and omit comments. (Reported by John
Maindonald and others.)
</p>
</li></ul>




<h4>C-LEVEL FACILITIES</h4>


<ul>
<li><p> Because they use a C99 interface which a C++ compiler is not
required to support, <code>Rvprintf</code> and <code>REvprintf</code> are only
defined by &lsquo;<span class="file">R_ext/Print.h</span>&rsquo; in C++ code if the macro
<code>R_USE_C99_IN_CXX</code> is defined when it is included.
</p>
</li>
<li> <p><code>pythag</code> duplicated the C99 function <code>hypot</code>.  It
is no longer provided, but is used as a substitute for <code>hypot</code>
in the very unlikely event that the latter is not available.
</p>
</li>
<li> <p><code>R_inspect(obj)</code> and <code>R_inspect3(obj, deep, pvec)</code>
are (hidden) C-level entry points to the internal <code>inspect</code>
function and can be used for C-level debugging (e.g., in conjunction
with the <code>p</code> command in <code>gdb</code>).
</p>
</li>
<li><p> Compiling R with <span class="option">--enable-strict-barrier</span> now also
enables additional checking for use of unprotected objects. In
combination with <code>gctorture()</code> or <code>gctorture2()</code> and a
C-level debugger this can be useful for tracking down memory
protection issues.
</p>
</li></ul>




<h4>UTILITIES</h4>


<ul>
<li> <p><code>R CMD Rdiff</code> is now implemented in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> on
Unix-alikes (as it has been on Windows since <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.12.0).
</p>
</li>
<li> <p><code>R CMD build</code> no longer does any cleaning in the
supplied package directory: all the cleaning is done in the copy.
</p>
<p>It has a new option <span class="option">--install-args</span> to pass arguments to
<code>R CMD INSTALL</code> for <span class="option">--build</span> (but not when
installing to rebuild vignettes).
</p>
<p>There is new option, <span class="option">--resave-data</span>, to call
<code>tools::resaveRdaFiles()</code> on the &lsquo;<span class="file">data</span>&rsquo; directory, to
compress tabular files (&lsquo;<span class="file">.tab</span>&rsquo;, &lsquo;<span class="file">.csv</span>&rsquo; etc) and to
convert &lsquo;<span class="file">.R</span>&rsquo; files to &lsquo;<span class="file">.rda</span>&rsquo; files.  The default,
<span class="option">--resave-data=gzip</span>, is to do so in a way compatible even
with years-old versions of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>, but better compression is given by
<span class="option">--resave-data=best</span>, requiring <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> &gt;= 2.10.0.
</p>
<p>It now adds a &lsquo;<span class="file">datalist</span>&rsquo; file for &lsquo;<span class="file">data</span>&rsquo; directories of
more than 1Mb.
</p>
<p>Patterns in &lsquo;<span class="file">.Rbuildignore</span>&rsquo; are now also matched against all
directory names (including those of empty directories).
</p>
<p>There is a new option, <span class="option">--compact-vignettes</span>, to try
reducing the size of PDF files in the &lsquo;<span class="file">inst/doc</span>&rsquo; directory.
Currently this tries <code>qpdf</code>: other options may be used in
future.
</p>
<p>When re-building vignettes and a &lsquo;<span class="file">inst/doc/Makefile</span>&rsquo; file is
found, <code>make clean</code> is run if the makefile has a
<code>clean:</code> target.
</p>
<p>After re-building vignettes the default clean-up operation will
remove any directories (and not just files) created during the
process: e.g., one package created a &lsquo;<span class="file">.R_cache</span>&rsquo; directory.
</p>
<p>Empty directories are now removed unless the option
<span class="option">--keep-empty-dirs</span> is given (and a few packages do
deliberately include empty directories).
</p>
<p>If there is a field <code>BuildVignettes</code> in the package
&lsquo;<span class="file">DESCRIPTION</span>&rsquo; file with a false value, re-building the
vignettes is skipped.
</p>
</li>
<li> <p><code>R CMD check</code> now also checks for filenames that are
case-insensitive matches to Windows' reserved file names with
extensions, such as &lsquo;<span class="file">nul.Rd</span>&rsquo;, as these have caused problems
on some Windows systems.
</p>
<p>It checks for inefficiently saved &lsquo;<span class="file">data/*.rda</span>&rsquo; and
&lsquo;<span class="file">data/*.RData</span>&rsquo; files, and reports on those large than 100Kb.
A more complete check (including of the type of compression, but
potentially much slower) can be switched on by setting environment
variable <span class="env">_R_CHECK_COMPACT_DATA2_</span> to <span class="samp">TRUE</span>.
</p>
<p>The types of files in the &lsquo;<span class="file">data</span>&rsquo; directory are now checked,
as packages are <em>still</em> misusing it for non-<span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> data files.
</p>
<p>It now extracts and runs the <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> code for each vignette in a
separate directory and <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> process: this is done in the package's
declared encoding.  Rather than call
<code>tools::checkVignettes()</code>, it calls
<code>tools::buildVignettes()</code> to see if the vignettes can be
re-built as they would be by <code>R CMD build</code>.  Option
<span class="option">--use-valgrind</span> now applies only to these runs, and not
when running code to rebuild the vignettes.  This version does a
much better job of suppressing output from successful vignette
tests.
</p>
<p>The &lsquo;<span class="file">00check.log</span>&rsquo; file is a more complete record of what is
output to &lsquo;<span class="file">stdout</span>&rsquo;: in particular contains more details of
the tests.
</p>
<p>It now checks all syntactically valid Rd usage entries, and warns
about assignments (unless these give the usage of replacement
functions).
</p>
<p>&lsquo;<span class="file">.tar.xz</span>&rsquo; compressed tarballs are now allowed, if
<code>tar</code> supports them (and setting environment variable
<span class="env">TAR</span> to <span class="samp">internal</span> ensures so on all platforms).
</p>
</li>
<li> <p><code>R CMD check</code> now warns if it finds
&lsquo;<span class="file">inst/doc/makefile</span>&rsquo;, and <code>R CMD build</code> renames such a
file to &lsquo;<span class="file">inst/doc/Makefile</span>&rsquo;.
</p>
</li></ul>




<h4>INSTALLATION</h4>


<ul>
<li><p> Installing <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> no longer tries to find <code>perl</code>, and
<code>R CMD</code> no longer tries to substitute a full path for
<code>awk</code> nor <code>perl</code> &ndash; this was a legacy from the
days when they were used by <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> itself.  Because a couple of
packages do use <code>awk</code>, it is set as the <code>make</code>
(rather than environment) variable <span class="env">AWK</span>.
</p>
</li>
<li> <p><code>make check</code> will now fail if there are differences
from the reference output when testing package examples and if
environment variable <span class="env">R_STRICT_PACKAGE_CHECK</span> is set to a true
value.
</p>
</li>
<li><p> The C99 double complex type is now required.
</p>
<p>The C99 complex trigonometric functions (such as <span class="samp">csin</span>) are
not currently required (FreeBSD lacks most of them): substitutes
are used if they are missing.
</p>
</li>
<li><p> The C99 system call <span class="samp">va_copy</span> is now required.
</p>
</li>
<li><p> If environment variable <span class="env">R_LD_LIBRARY_PATH</span> is set
during configuration (for example in &lsquo;<span class="file">config.site</span>&rsquo;) it is
used unchanged in file &lsquo;<span class="file">etc/ldpaths</span>&rsquo; rather than being
appended to.
</p>
</li>
<li> <p><code>configure</code> looks for support for OpenMP and if
found compiles <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> with appropriate flags and also makes them
available for use in packages: see &lsquo;Writing R Extensions&rsquo;.
</p>
<p>This is currently experimental, and is only used in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> with a
single thread for <code>colSums()</code> and <code>colMeans()</code>.  Expect
it to be more widely used in later versions of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>.
</p>
<p>This can be disabled by the <span class="option">--disable-openmp</span> flag.
</p>
</li></ul>




<h4>PACKAGE INSTALLATION</h4>


<ul>
<li> <p><code>R CMD INSTALL --clean</code> now removes copies of a
&lsquo;<span class="file">src</span>&rsquo; directory which are created when multiple
sub-architectures are in use.  (Following a comment from
Berwin Turlach.)
</p>
</li>
<li><p> File &lsquo;<span class="file">R.css</span>&rsquo; is now installed on a per-package basis
(in the package's &lsquo;<span class="file">html</span>&rsquo; directory) rather than in each
library tree, and this is used for all the HTML pages in the
package.  This helps when installing packages with static HTML
pages for use on a webserver.  It will also allow future versions
of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> to use different stylesheets for the packages they install.
</p>
</li>
<li><p> A top-level file &lsquo;<span class="file">.Rinstignore</span>&rsquo; in the package sources
can list (in the same way as &lsquo;<span class="file">.Rbuildignore</span>&rsquo;) files under
<code>inst</code> that should not be installed.  (Why should there be any
such files?  Because all the files needed to re-build vignettes
need to be under <code>inst/doc</code>, but they may not need to be
installed.)
</p>
</li>
<li> <p><code>R CMD INSTALL</code> has a new option
<span class="option">--compact-docs</span> to compact any PDFs under the
&lsquo;<span class="file">inst/doc</span>&rsquo; directory.  Currently this uses <code>qpdf</code>,
which must be installed (see &lsquo;Writing R Extensions&rsquo;).
</p>
</li>
<li><p> There is a new option <span class="option">--lock</span> which can be used to
cancel the effect of <span class="option">--no-lock</span> or <span class="option">--pkglock</span> earlier
on the command line.
</p>
</li>
<li><p> Option <span class="option">--pkglock</span> can now be used with more than one
package, and is now the default if only one package is specified.
</p>
</li>
<li><p> Argument <code>lock</code> of <code>install.packages()</code> can now be
use for Mac binary installs as well as for Windows ones.  The
value <code>"pkglock"</code> is now accepted, as well as <code>TRUE</code> and
<code>FALSE</code> (the default).
</p>
</li>
<li><p> There is a new option <span class="option">--no-clean-on-error</span> for
<code>R CMD INSTALL</code> to retain a partially installed package for
forensic analysis.
</p>
</li>
<li><p> Packages with names ending in &lsquo;<span class="file">.</span>&rsquo; are not portable
since Windows does not work correctly with such directory names.
This is now warned about in <code>R CMD check</code>, and will not be
allowed in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.14.x.
</p>
</li>
<li><p> The vignette indices are more comprehensive (in the style of
<code>browseVignetttes()</code>).
</p>
</li></ul>




<h4>DEPRECATED &amp; DEFUNCT</h4>


<ul>
<li> <p><code>require(save = TRUE)</code> is defunct, and use of the
<code>save</code> argument is deprecated.
</p>
</li>
<li> <p><code>R CMD check --no-latex</code> is defunct: use
<span class="option">--no-manual</span> instead.
</p>
</li>
<li> <p><code>R CMD Sd2Rd</code> is defunct.
</p>
</li>
<li><p> The <code>gamma</code> argument to <code>hsv()</code>,
<code>rainbow()</code>, and <code>rgb2hsv()</code> is deprecated
and no longer has any effect.
</p>
</li>
<li><p> The previous options for <code>R CMD build --binary</code>
(<span class="option">--auto-zip</span>, <span class="option">--use-zip-data</span> and
<span class="option">--no-docs</span>) are deprecated (or defunct):
use the new option <span class="option">--install-args</span> instead.
</p>
</li>
<li><p> When a character value is used for the <code>EXPR</code>
argument in <code>switch()</code>, only a single unnamed alternative
value is now allowed.
</p>
</li>
<li><p> The wrapper <code>utils::link.html.help()</code> is no longer
available.
</p>
</li>
<li><p> Zip-ing data sets in packages (and hence <code>R CMD
	INSTALL</code> options <span class="option">--use-zip-data</span> and <span class="option">--auto-zip</span>, as
well as the <span class="samp">ZipData: yes</span> field in a <code>DESCRIPTION</code> file)
is defunct.
</p>
<p>Installed packages with zip-ed data sets can still be used, but a
warning that they should be re-installed will be given.
</p>
</li>
<li><p> The &lsquo;experimental&rsquo; alternative specification of a
namespace via <code>.Export()</code> etc is now defunct.
</p>
</li>
<li><p> The option <span class="option">--unsafe</span> to <code>R CMD INSTALL</code> is
deprecated: use the identical option <span class="option">--no-lock</span> instead.
</p>
</li>
<li><p> The entry point <code>pythag</code> in &lsquo;<span class="file">Rmath.h</span>&rsquo; is deprecated
in favour of the C99 function <code>hypot</code>.  A wrapper for
<code>hypot</code> is provided for <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.13.x only.
</p>
</li>
<li><p> Direct access to the <code>"source"</code> attribute of functions
is deprecated; use <code>deparse(fn, control="useSource")</code> to access
it, and <code>removeSource(fn)</code> to remove it.
</p>
</li>
<li> <p><code>R CMD build --binary</code> is now formally deprecated:
<code>R CMD INSTALL --build</code> has long been the preferred
alternative.
</p>
</li>
<li><p> Single-character package names are deprecated (and <span class="pkg">R</span>
is already disallowed to avoid confusion in <span class="samp">Depends:</span>
fields).
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li> <p><code>drop.terms</code> and the <code>[</code> method for class
<code>"terms"</code> no longer add back an intercept.  (Reported by
Niels Hansen.)
</p>
</li>
<li> <p><code>aggregate</code> preserves the class of a column (e.g., a
date) under some circumstances where it discarded the class
previously.
</p>
</li>
<li> <p><code>p.adjust()</code> now always returns a vector result, as
documented.  In previous versions it copied attributes (such as
dimensions) from the <code>p</code> argument: now it only copies names.
</p>
</li>
<li><p> On PDF and PostScript devices, a line width of zero was
recorded verbatim and this caused problems for some viewers
(a very thin line combined with a non-solid line dash pattern
could also cause a problem).  On these devices, the line width is
now limited at 0.01 and for very thin lines with complex dash
patterns the device may force the line dash pattern to be solid.
(Reported by Jari Oksanen.)
</p>
</li>
<li><p> The <code>str()</code> method for class <code>"POSIXt"</code> now gives
sensible output for 0-length input.
</p>
</li>
<li><p> The one- and two-argument complex maths functions failed to
warn if NAs were generated (as their numeric analogues do).
</p>
</li>
<li><p> Added <code>.requireCachedGenerics</code> to the <code>dont.mind</code>
list for <code>library()</code> to avoid warnings about duplicates.
</p>
</li>
<li> <p><code>$&lt;-.data.frame</code> messed with the class attribute,
breaking any S4 subclass.  The S4 <code>data.frame</code> class now has its own
<code>$&lt;-</code> method, and turns dispatch on for this primitive.
</p>
</li>
<li> <p><code>Map()</code> did not look up a character argument <code>f</code>
in the correct frame, thanks to lazy evaluation.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14495">PR#14495</a>)
</p>
</li>
<li> <p><code>file.copy()</code> did not tilde-expand <code>from</code> and <code>to</code>
when <code>to</code> was a directory.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14507">PR#14507</a>)
</p>
</li>
<li><p> It was possible (but very rare) for the loading test in
<code>R CMD INSTALL</code> to crash a child <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> process and so leave
around a lock directory and a partially installed package.  That
test is now done in a separate process.
</p>
</li>
<li> <p><code>plot(&lt;formula&gt;, data=&lt;matrix&gt;,..)</code> now works in more
cases; similarly for <code>points()</code>, <code>lines()</code> and
<code>text()</code>.
</p>
</li>
<li> <p><code>edit.default()</code> contained a manual dispatch for matrices
(the <code>"matrix"</code> class didn't really exist when it was written).
This caused an infinite recursion in the no-GUI case and has now
been removed.
</p>
</li>
<li> <p><code>data.frame(check.rows = TRUE)</code> sometimes worked when
it should have detected an error.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14530">PR#14530</a>)
</p>
</li>
<li> <p><code>scan(sep= , strip.white=TRUE)</code> sometimes stripped
trailing spaces from within quoted strings.  (The real bug in
<a href="https://bugs.R-project.org/show_bug.cgi?id=14522">PR#14522</a>.)
</p>
</li>
<li><p> The rank-correlation methods for <code>cor()</code> and
<code>cov()</code> with <code>use = "complete.obs"</code> computed the ranks
before removing missing values, whereas the documentation implied
incomplete cases were removed first.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14488">PR#14488</a>)
</p>
<p>They also failed for 1-row matrices.
</p>
</li>
<li><p> The perpendicular adjustment used in placing text and
expressions in the margins of plots was not scaled by
<code>par("mex")</code>. (Part of <a href="https://bugs.R-project.org/show_bug.cgi?id=14532">PR#14532</a>.)
</p>
</li>
<li><p> Quartz Cocoa device now catches any Cocoa exceptions that
occur during the creation of the device window to prevent crashes.
It also imposes a limit of 144 ft^2 on the area used by a window
to catch user errors (unit misinterpretation) early.
</p>
</li>
<li><p> The browser (invoked by <code>debug()</code>, <code>browser()</code>
or otherwise) would display attributes such as <code>"wholeSrcref"</code>
that were intended for internal use only.
</p>
</li>
<li><p> R's internal filename completion now properly handles
filenames with spaces in them even when the readline library is
used.  This resolves <a href="https://bugs.R-project.org/show_bug.cgi?id=14452">PR#14452</a> provided the internal filename
completion is used (e.g., by setting <code>rc.settings(files =
	TRUE)</code>).
</p>
</li>
<li><p> Inside <code>uniroot(f, ...)</code>, <code>-Inf</code> function values
are now replaced by a maximally <b>negative</b> value.
</p>
</li>
<li> <p><code>rowsum()</code> could silently over/underflow on integer
inputs (reported by Bill Dunlap).
</p>
</li>
<li> <p><code>as.matrix()</code> did not handle <code>"dist"</code> objects with
zero rows.
</p>
</li></ul>




<h3><img class="toplogo" src="../help/figures/../../html/Rlogo.svg" alt="[R logo]" /> CHANGES IN R VERSION 2.12.2 patched</h3>



<h4>NEW FEATURES</h4>


<ul>
<li> <p><code>max()</code> and <code>min()</code> work harder to ensure that
<code>NA</code> has precedence over <code>NaN</code>,
so e.g. <code>min(NaN, NA)</code> is <code>NA</code>.
(This was not previously documented except
for within a single numeric vector, where compiler optimizations
often defeated the code.)
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li><p> A change to the C function <span class="samp">R_tryEval</span> had broken error
messages in S4 method selection; the error message is now printed.
</p>
</li>
<li><p> PDF output with a non-RGB color model used RGB for the line
stroke color.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14511">PR#14511</a>)
</p>
</li>
<li> <p><code>stats4::BIC()</code> assumed without checking that an object
of class <code>"logLik"</code> has an <code>"nobs"</code> attribute:
<code>glm()</code> fits did not and so <code>BIC()</code> failed for them.
</p>
</li>
<li><p> In some circumstances a one-sided <code>mantelhaen.test()</code>
reported the p-value for the wrong tail.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14514">PR#14514</a>)
</p>
</li>
<li><p> Passing the invalid value <code>lty = NULL</code> to <code>axis()</code>
sent an invalid value to the graphics device, and might cause the
device to segfault.
</p>
</li>
<li> <p><code>Sweave()</code> with <code>concordance=TRUE</code> could lead to
invalid PDF files; &lsquo;<span class="file">Sweave.sty</span>&rsquo; has been updated to avoid
this.
</p>
</li>
<li><p> Non-ASCII characters in the titles of help pages were
not rendered properly in some locales, and could cause errors
or warnings.
</p>
</li>
<li> <p><code>checkRd()</code> gave a spurious error if the <code>\href</code>
macro was used.
</p>
</li></ul>




<h3><img class="toplogo" src="../help/figures/../../html/Rlogo.svg" alt="[R logo]" /> CHANGES IN R VERSION 2.12.2</h3>



<h4>SIGNIFICANT USER-VISIBLE CHANGES</h4>


<ul>
<li><p> Complex arithmetic (notably <code>z^n</code> for complex <code>z</code>
and integer <code>n</code>) gave incorrect results since <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.10.0 on
platforms without C99 complex support.  This and some
lesser issues in trigonometric functions have been corrected.
</p>
<p>Such platforms were rare (we know of Cygwin and FreeBSD).
However, because of new compiler optimizations in the way complex
arguments are handled, the same code was selected on x86_64 Linux
with <code>gcc 4.5.x</code> at the default <code>-O2</code> optimization
(but not at <code>-O</code>).
</p>
</li>
<li><p> There is a workaround for crashes seen with several packages
on systems using <span class="samp">zlib 1.2.5</span>: see the INSTALLATION section.
</p>
</li></ul>




<h4>NEW FEATURES</h4>


<ul>
<li><p> PCRE has been updated to 8.12 (two bug-fix releases since 8.10).
</p>
</li>
<li> <p><code>rep()</code>, <code>seq()</code>, <code>seq.int()</code> and
<code>seq_len()</code> report more often when the first element is taken
of an argument of incorrect length.
</p>
</li>
<li><p> The Cocoa back-end for the <code>quartz()</code> graphics device
on Mac OS X provides a way to disable event loop processing
temporarily (useful, e.g., for forked instances of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>).
</p>
</li>
<li> <p><code>kernel()</code>'s default for <code>m</code> was not appropriate
if <code>coef</code> was a set of coefficients.  (Reported by Pierre
Chausse.)
</p>
</li>
<li> <p><code>bug.report()</code> has been updated for the current <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> bug
tracker, which does not accept emailed submissions.
</p>
</li>
<li> <p><code>R CMD check</code> now checks for the correct use of
<span class="samp">$(LAPACK_LIBS)</span> (as well as <span class="samp">$(BLAS_LIBS)</span>), since
several CRAN recent submissions have ignored &lsquo;Writing R
Extensions&rsquo;.
</p>
</li></ul>




<h4>INSTALLATION</h4>


<ul>
<li><p> The <span class="samp">zlib</span> sources in the distribution are now built
with all symbols remapped: this is intended to avoid problems seen
with packages such as <a href="https://CRAN.R-project.org/package=XML"><span class="pkg">XML</span></a> and <a href="https://CRAN.R-project.org/package=rggobi"><span class="pkg">rggobi</span></a> which link to
&lsquo;<span class="file">zlib.so.1</span>&rsquo; on systems using <span class="samp">zlib 1.2.5</span>.
</p>
</li>
<li><p> The default for <span class="env">FFLAGS</span> and <span class="env">FCFLAGS</span> with
<code>gfortran</code> on x86_64 Linux has been changed back to <span class="samp">-g
	-O2</span>:  however, setting <span class="samp">-g -O</span> may still be needed for
<code>gfortran 4.3.x</code>.
</p>
</li></ul>




<h4>PACKAGE INSTALLATION</h4>


<ul>
<li><p> A <span class="samp">LazyDataCompression</span> field in the &lsquo;<span class="file">DESCRIPTION</span>&rsquo;
file will be used to set the value for the
<span class="option">--data-compress</span> option of <code>R CMD INSTALL</code>.
</p>
</li>
<li><p> Files &lsquo;<span class="file">R/sysdata.rda</span>&rsquo; of more than 1Mb are now stored
in the lazyload database using <code>xz</code> compression: this for
example halves the installed size of package <a href="https://CRAN.R-project.org/package=Imap"><span class="pkg">Imap</span></a>.
</p>
</li>
<li> <p><code>R CMD INSTALL</code> now ensures that directories
installed from &lsquo;<span class="file">inst</span>&rsquo; have search permission for everyone.
</p>
<p>It no longer installs files &lsquo;<span class="file">inst/doc/Rplots.ps</span>&rsquo; and
&lsquo;<span class="file">inst/doc/Rplots.pdf</span>&rsquo;.  These are almost certainly left-overs
from <code>Sweave</code> runs, and are often large.
</p>
</li></ul>




<h4>DEPRECATED &amp; DEFUNCT</h4>


<ul>
<li><p> The &lsquo;experimental&rsquo; alternative specification of a
namespace via <code>.Export()</code> etc is now deprecated.
</p>
</li>
<li> <p><code>zip.file.extract()</code> is now deprecated.
</p>
</li>
<li><p> Zip-ing data sets in packages (and hence <code>R CMD
	INSTALL --use-zip-data</code> and the <span class="samp">ZipData: yes</span> field in a
<code>DESCRIPTION</code> file) is deprecated: using efficiently
compressed &lsquo;<span class="file">.rda</span>&rsquo; images and lazy-loading of data has
superseded it.
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li> <p><code>identical()</code> could in rare cases generate a warning
about non-pairlist attributes on CHARSXPs.  As these are used for
internal purposes, the attribute check should be skipped.
(Reported by Niels Richard Hansen).
</p>
</li>
<li><p> If the filename extension (usually &lsquo;<span class="file">.Rnw</span>&rsquo;) was not
included in a call to <code>Sweave()</code>, source references would not
work properly and the <code>keep.source</code> option failed.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14459">PR#14459</a>)
</p>
</li>
<li> <p><code>format.data.frame()</code> now keeps zero character column names.
</p>
</li>
<li> <p><code>pretty(x)</code> no longer raises an error when <code>x</code>
contains solely non-finite values. (<a href="https://bugs.R-project.org/show_bug.cgi?id=14468">PR#14468</a>)
</p>
</li>
<li><p> The <code>plot.TukeyHSD()</code> function now uses a line width of
0.5 for its reference lines rather than <span class="samp">lwd = 0</span> (which
caused problems for some PDF and PostScript viewers).
</p>
</li>
<li><p> The <code>big.mark</code> argument to <code>prettyNum()</code>,
<code>format()</code>, etc. was inserted reversed if it was more than
one character long.
</p>
</li>
<li> <p><code>R CMD check</code> failed to check the filenames under
&lsquo;<span class="file">man</span>&rsquo; for Windows' reserved names.
</p>
</li>
<li><p> The <code>"Date"</code> and <code>"POSIXt"</code> methods for
<code>seq()</code> could overshoot when <code>to</code> was supplied and
<code>by</code> was specified in months or years.
</p>
</li>
<li><p> The internal method of <code>untar()</code> now restores hard
links as file copies rather than symbolic links (which did not
work for cross-directory links).
</p>
</li>
<li> <p><code>unzip()</code> did not handle zip files which contained
filepaths with two or more leading directories which were not in
the zipfile and did not already exist.  (It is unclear if such
zipfiles are valid and the third-party C code used did not support
them, but <a href="https://bugs.R-project.org/show_bug.cgi?id=14462">PR#14462</a> created one.)
</p>
</li>
<li> <p><code>combn(n, m)</code> now behaves more regularly for the border
case <i>m = 0</i>. (<a href="https://bugs.R-project.org/show_bug.cgi?id=14473">PR#14473</a>)
</p>
</li>
<li><p> The rendering of numbers in plotmath expressions (e.g.,
<code>expression(10^2)</code>) used the current settings for conversion
to strings rather than setting the defaults, and so could be
affected by what has been done before.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14477">PR#14477</a>)
</p>
</li>
<li><p> The methods of <code>napredict()</code> and <code>naresid()</code> for
<code>na.action = na.exclude</code> fits did not work correctly in the
very rare event that every case had been omitted in the fit.
(Reported by Simon Wood.)
</p>
</li>
<li> <p><code>weighted.residuals(drop0=TRUE)</code> returned a vector when
the residuals were a matrix (e.g., those of class <code>"mlm"</code>).
(Reported by Bill Dunlap.)
</p>
</li>
<li><p> Package HTML index files &lsquo;<span class="file">&lt;pkg&gt;/html/00Index.html</span>&rsquo; were
generated with a stylesheet reference that was not correct for
static browsing in libraries.
</p>
</li>
<li> <p><code>ccf(na.action = na.pass)</code> was not implemented.
</p>
</li>
<li><p> The parser accepted some incorrect numeric constants,
e.g. <code>20x2</code>.  (Reported by Olaf Mersmann.)
</p>
</li>
<li> <p><code>format(*, zero.print)</code> did not always replace the full
zero parts.
</p>
</li>
<li><p> Fixes for subsetting or subassignment of <code>"raster"</code>
objects when not both <code>i</code> and <code>j</code> are specified.
</p>
</li>
<li> <p><code>R CMD INSTALL</code> was not always respecting the
<span class="samp">ZipData: yes</span> field of a &lsquo;<span class="file">DESCRIPTION</span>&rsquo; file (although
this is frequently incorrectly specified for packages with no data
or which specify lazy-loading of data).
</p>
<p><code>R CMD INSTALL --use-zip-data</code> was incorrectly implemented
as <span class="option">--use-zipdata</span> since <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.9.0.
</p>
</li>
<li> <p><code>source(file, echo=TRUE)</code> could fail if the file
contained <span class="samp">#line</span> directives.  It now recovers more gracefully, but
may still display the wrong line if the directive gives incorrect
information.
</p>
</li>
<li> <p><code>atan(1i)</code> returned <code>NaN+Infi</code> (rather than
<code>0+Infi</code>) on platforms without C99 complex support.
</p>
</li>
<li> <p><code>library()</code> failed to cache S4 metadata (unlike
<code>loadNamespace()</code>) causing failures in S4-using packages
without a namespace (e.g., those using reference classes).
</p>
</li>
<li><p> The function <code>qlogis(lp, log.p=TRUE)</code> no longer
prematurely overflows to <code>Inf</code> when exp(lp) is close to 1.
</p>
</li>
<li><p> Updating S4 methods for a group generic function requires
resetting the methods tables for the members of the group (patch
contributed by Martin Morgan).
</p>
</li>
<li><p> In some circumstances (including for package <a href="https://CRAN.R-project.org/package=XML"><span class="pkg">XML</span></a>),
<code>R CMD INSTALL</code> installed version-control directories from
source packages.
</p>
</li>
<li><p> Added <code>PROTECT</code> calls to some constructed expressions
used in C level <code>eval</code> calls.
</p>
</li>
<li> <p><code>utils:::create.post()</code> (used by <code>bug.report()</code>
and <code>help.request()</code>) failed to quote arguments to the
mailer, and so often failed.
</p>
</li>
<li> <p><code>bug.report()</code> was naive about how to extract
maintainer email addresses from package descriptions, so would
often try mailing to incorrect addresses.
</p>
</li>
<li> <p><code>debugger()</code> could fail to read the environment of a
call to a function with a <code>...</code> argument.  (Reported by
Charlie Roosen.)
</p>
</li>
<li> <p><code>prettyNum(c(1i, NA), drop0=TRUE)</code> or
<code>str(NA_complex_)</code> now work correctly.
</p>
</li></ul>




<h3><img class="toplogo" src="../help/figures/../../html/Rlogo.svg" alt="[R logo]" /> CHANGES IN R VERSION 2.12.1</h3>



<h4>NEW FEATURES</h4>


<ul>
<li><p> The DVI/PDF reference manual now includes the help pages for
all the standard packages: <span class="pkg">splines</span>, <span class="pkg">stats4</span> and
<span class="pkg">tcltk</span> were previously omitted (intentionally).
</p>
</li>
<li> <p><a href="http://www.rforge.net">http://www.rforge.net</a> has been added to the default
set of repositories known to <code>setRepositories()</code>.
</p>
</li>
<li><p> xz-utils has been updated to version 5.0.0.
</p>
</li>
<li> <p><code>reshape()</code> now makes use of <code>sep</code> when forming
names during reshaping to wide format.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14435">PR#14435</a>)
</p>
</li>
<li> <p><code>legend()</code> allows the length of lines to be set by the
end user <em>via</em> the new argument <code>seg.len</code>.
</p>
</li>
<li><p> New S4 reference class utility methods <code>copy()</code>,
<code>field()</code>, <code>getRefClass()</code> and <code>getClass()</code> have
been added to package <span class="pkg">methods</span>.
</p>
</li>
<li><p> When a character value is used for the <code>EXPR</code>
argument in <code>switch()</code>, a warning is given if more than
one unnamed alternative value is given.  This will become an
error in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.13.0.
</p>
</li>
<li> <p><code>StructTS(type = "BSM")</code> now allows series with just
two seasons.  (Reported by Birgit Erni.)
</p>
</li></ul>




<h4>INSTALLATION</h4>


<ul>
<li><p> The PDF reference manual is now built as PDF version 1.5
with object compression, which on platforms for which this is not
the default (notably MiKTeX) halves its size.
</p>
</li>
<li><p> Variable <span class="env">FCLIBS</span> can be set during configuration, for
any additional library flags needed when linking a shared object
with the Fortran 9x compiler.  (Needed with Solaris Studio 12.2.)
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li> <p><code>seq.int()</code> no longer sometimes evaluates arguments
twice.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14388">PR#14388</a>)
</p>
</li>
<li><p> The <code>data.frame</code> method of <code>format()</code> failed if a
column name was longer than 256 bytes (the maximum length allowed
for an <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> name).
</p>
</li>
<li> <p><code>predict(&lt;lm object&gt;, type ="terms", ...)</code> failed if
both <code>terms</code> and <code>interval</code> were specified.  (Reported
by Bill Dunlap.)
</p>
<p>Also, if <code>se.fit = TRUE</code> the standard errors were reported
for all terms, not just those selected by a non-null <code>terms</code>.
</p>
</li>
<li><p> The TRE regular expressions engine could terminate <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> rather
than give an error when given certain invalid regular expressions.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=14398">PR#14398</a>)
</p>
</li>
<li> <p><code>cmdscale(eig = TRUE)</code> was documented to return <i>n-1</i>
eigenvalues but in fact only returned <code>k</code>.  It now returns
all <i>n</i> eigenvalues.
</p>
<p><code>cmdscale(add = TRUE)</code> failed to centre the return
configuration and sometimes lost the labels on the points.  Its
return value was described wrongly (it is always a list and
contains component <code>ac</code>).
</p>
</li>
<li> <p><code>promptClass()</code> in package <span class="pkg">methods</span> now works for
reference classes and gives a suitably specialized skeleton of
documentation.
</p>
<p>Also, <code>callSuper()</code> now works via the <code>methods()</code>
invocation as well as for initially specified methods.
</p>
</li>
<li> <p><code>download.file()</code> could leave the destination file open
if the URL was not able to be opened.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14414">PR#14414</a>)
</p>
</li>
<li><p> Assignment of an environment to functions or as an attribute
to other objects now works for S4 subclasses of <code>"environment"</code>.
</p>
</li>
<li><p> Use of <span class="samp">[[&lt;-</span> for S4 subclasses of
<code>"environment"</code> generated an infinite recursion from the
method.  The method has been replaced by internal code.
</p>
</li>
<li><p> In a reference class S4 method, <code>callSuper()</code> now works in
<code>initialize()</code> methods when there is no explicit superclass
method.
</p>
</li>
<li> <p><span class="samp">!</span> dropped attributes such as names and dimensions from a
length-zero argument.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14424">PR#14424</a>)
</p>
</li>
<li><p> When <code>list2env()</code> created an environment it was missing
a <code>PROTECT</code> call and so was vulnerable to garbage collection.
</p>
</li>
<li> <p><code>Sweave()</code> with <code>keep.source=TRUE</code> dropped
comments at the start and end of code chunks.  It could also
fail when <span class="samp">\SweaveInput</span> was combined with named chunks.
</p>
</li>
<li><p> The Fortran code used by <code>nls(algorithm = "port")</code>
could infinite-loop when compiled with high optimization on a
modern version of <code>gcc</code>, and <code>SAFE_FFLAGS</code> is now used
to make this less likely.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14427">PR#14427</a>, seen with 32-bit Windows
using <code>gcc 4.5.0</code> used from <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.12.0.)
</p>
</li>
<li> <p><code>sapply()</code> with default <code>simplify = TRUE</code> and
<code>mapply()</code> with default <code>SIMPLIFY = TRUE</code> wrongly
simplified language-like results, as, e.g., in
<code>mapply(1:2, c(3,7), FUN = function(i,j) call(':',i,j))</code>.
</p>
</li>
<li><p> Backreferences to undefined patterns in
<code>[g]sub(pcre = TRUE)</code> could cause a segfault.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14431">PR#14431</a>)
</p>
</li>
<li><p> The <code>format()</code> (and hence the <code>print()</code>) method
for class <code>"Date"</code> rounded fractional dates towards zero: it
now always rounds them down.
</p>
</li>
<li><p> Reference S4 class creation could generate ambiguous
inheritance patterns under very special circumstances.
</p>
</li>
<li> <p><span class="samp">[[&lt;-</span> turned S4 subclasses of <code>"environment"</code> into
plain environments.
</p>
</li>
<li><p> Long titles for help pages were truncated in package indices
and a few other places.
</p>
</li>
<li><p> Additional utilities now work correctly with S4 subclasses of
<code>"environment"</code> (<code>rm</code>, locking tools and active
bindings).
</p>
</li>
<li> <p><code>spec.ar()</code> now also work for the <code>"ols"</code> method.
(Reported by Hans-Ruedi Kuensch.)
</p>
</li>
<li><p> The initialization of objects from S4 subclasses of
<code>"environment"</code> now allocates a new environment object.
</p>
</li>
<li> <p><code>R CMD check</code> has more protection against (probably
erroneous) example or test output which is invalid in the current
locale.
</p>
</li>
<li> <p><code>qr.X()</code> with column names and pivoting now also pivots
the column names.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14438">PR#14438</a>)
</p>
</li>
<li> <p><code>unit.pmax()</code> and <code>unit.pmin()</code> in package
<span class="pkg">grid</span> gave incorrect results when all inputs were of length 1.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=14443">PR#14443</a>)
</p>
</li>
<li><p> The parser for &lsquo;<span class="file">NAMESPACE</span>&rsquo; files ignored misspelled
directives, rather than signalling an error.  For 2.12.x a warning
will be issued, but this will be correctly reported as an error
in later releases. (Reported by Charles Berry.)
</p>
</li>
<li><p> Fix for subsetting of <code>"raster"</code> objects when only one
of <code>i</code> or <code>j</code> is specified.
</p>
</li>
<li> <p><code>grid.raster()</code> in package <span class="pkg">grid</span> did not accept
<code>"nativeRaster"</code> objects (like <code>rasterImage()</code> does).
</p>
</li>
<li><p> Rendering raster images in PDF output was resetting the
clipping region.
</p>
</li>
<li><p> Rendering of raster images on cairo X11 device was wrong,
particularly when a small image was being scaled up using
interpolation.
</p>
<p>With cairo &lt; 1.6, will be better than before, though still a
little clunky.  With cairo &gt;= 1.6, should be sweet as.
</p>
</li>
<li><p> Several bugs fixed in <code>read.DIF()</code>:  single column
inputs caused errors, cells marked as <code>"character"</code> could
be converted to other types, and (in Windows) copying from the
clipboard failed.
</p>
</li></ul>




<h3><img class="toplogo" src="../help/figures/../../html/Rlogo.svg" alt="[R logo]" /> CHANGES IN R VERSION 2.12.0</h3>



<h4>NEW FEATURES</h4>


<ul>
<li><p> Reading a package's &lsquo;<span class="file">CITATION</span>&rsquo; file now defaults to
ASCII rather than Latin-1: a package with a non-ASCII
&lsquo;<span class="file">CITATION</span>&rsquo; file should declare an encoding in its
&lsquo;<span class="file">DESCRIPTION</span>&rsquo; file and use that encoding for the
&lsquo;<span class="file">CITATION</span>&rsquo; file.
</p>
</li>
<li> <p><code>difftime()</code> now defaults to the <code>"tzone"</code>
attribute of <code>"POSIXlt"</code> objects rather than to the current
timezone as set by the default for the <code>tz</code> argument.  (Wish
of <a href="https://bugs.R-project.org/show_bug.cgi?id=14182">PR#14182</a>.)
</p>
</li>
<li> <p><code>pretty()</code> is now generic, with new methods for
<code>"Date"</code> and <code>"POSIXt"</code> classes (based on code
contributed by Felix Andrews).
</p>
</li>
<li> <p><code>unique()</code> and <code>match()</code> are now faster on
character vectors where all elements are in the global <code>CHARSXP</code>
cache and have unmarked encoding (ASCII).  Thanks to Matthew
Dowle for suggesting improvements to the way the hash code is
generated in &lsquo;<span class="file">unique.c</span>&rsquo;.
</p>
</li>
<li><p> The <code>enquote()</code> utility, in use internally, is exported now.
</p>
</li>
<li> <p><code>.C()</code> and <code>.Fortran()</code> now map non-zero return
values (other than <code>NA_LOGICAL</code>) for logical vectors to
<code>TRUE</code>: it has been an implicit assumption that they are
treated as true.
</p>
</li>
<li><p> The <code>print()</code> methods for <code>"glm"</code> and <code>"lm"</code>
objects now insert linebreaks in long calls in the same way that
the <code>print()</code> methods for <code>"summary.[g]lm"</code> objects
have long done.  This does change the layout of the examples for
a number of packages, e.g. <a href="https://CRAN.R-project.org/package=MASS"><span class="pkg">MASS</span></a>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14250">PR#14250</a>)
</p>
</li>
<li> <p><code>constrOptim()</code> can now be used with method
<code>"SANN"</code>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14245">PR#14245</a>)
</p>
<p>It gains an argument <code>hessian</code> to be passed to
<code>optim()</code>, which allows all the <code>...</code> arguments to be
intended for <code>f()</code> and <code>grad()</code>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14071">PR#14071</a>)
</p>
</li>
<li> <p><code>curve()</code> now allows <code>expr</code> to be an object of
mode <code>"expression"</code> as well as <code>"call"</code> and
<code>"function"</code>.
</p>
</li>
<li><p> The <code>"POSIX[cl]t"</code> methods for <code>Axis()</code> have been
replaced by a single method for <code>"POSIXt"</code>.
</p>
<p>There are no longer separate <code>plot()</code> methods for
<code>"POSIX[cl]t"</code> and <code>"Date"</code>: the default method has
been able to handle those classes for a long time.  This
<em>inter alia</em> allows a single date-time object to be
supplied, the wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=14016">PR#14016</a>.
</p>
<p>The methods had a different default (<code>""</code>) for <code>xlab</code>.
</p>
</li>
<li><p> Classes <code>"POSIXct"</code>, <code>"POSIXlt"</code> and
<code>"difftime"</code> have generators <code>.POSIXct()</code>,
<code>.POSIXlt()</code> and <code>.difftime()</code>.  Package authors are
advised to make use of them (they are available from <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.11.0) to
proof against planned future changes to the classes.
</p>
<p>The ordering of the classes has been changed, so <code>"POSIXt"</code>
is now the second class.  See the document &lsquo;Updating
packages for changes in R 2.12.x&rsquo; on
<a href="http://developer.r-project.org">http://developer.r-project.org</a> for the consequences for a
handful of CRAN packages.
</p>
</li>
<li><p> The <code>"POSIXct"</code> method of <code>as.Date()</code> allows a
timezone to be specified (but still defaults to UTC).
</p>
</li>
<li><p> New <code>list2env()</code> utility function as an inverse of
<code>as.list(&lt;environment&gt;)</code> and for fast multi-<code>assign()</code>
to existing environment.  <code>as.environment()</code> is now generic
and uses <code>list2env()</code> as list method.
</p>
</li>
<li><p> There are several small changes to output which &lsquo;zap&rsquo;
small numbers, e.g. in printing quantiles of residuals in
summaries from <code>"lm"</code> and <code>"glm"</code> fits, and in test
statistics in <code>print.anova()</code>.
</p>
</li>
<li><p> Special names such as <code>"dim"</code>, <code>"names"</code>, etc, are
now allowed as slot names of S4 classes, with <code>"class"</code> the
only remaining exception.
</p>
</li>
<li><p> File &lsquo;<span class="file">.Renviron</span>&rsquo; can have architecture-specific versions
such as &lsquo;<span class="file">.Renviron.i386</span>&rsquo; on systems with sub-architectures.
</p>
</li>
<li> <p><code>installed.packages()</code> has a new argument
<code>subarch</code> to filter on sub-architecture.
</p>
</li>
<li><p> The <code>summary()</code> method for <code>packageStatus()</code> now
has a separate <code>print()</code> method.
</p>
</li>
<li><p> The default <code>summary()</code> method returns an object
inheriting from class <code>"summaryDefault"</code> which has a
separate <code>print()</code> method that calls <code>zapsmall()</code> for
numeric/complex values.
</p>
</li>
<li><p> The startup message now includes the platform and if used,
sub-architecture: this is useful where different
(sub-)architectures run on the same OS.
</p>
</li>
<li><p> The <code>getGraphicsEvent()</code> mechanism now allows multiple windows
to return graphics events, through the new functions
<code>setGraphicsEventHandlers()</code>, <code>setGraphicsEventEnv()</code>, and
<code>getGraphicsEventEnv()</code>.  (Currently implemented in the
<code>windows()</code> and <code>X11()</code> devices.)
</p>
</li>
<li> <p><code>tools::texi2dvi()</code> gains an <code>index</code> argument,
mainly for use by <code>R CMD Rd2pdf</code>.
</p>
<p>It avoids the use of <code>texindy</code> by <code>texinfo</code>'s
<code>texi2dvi &gt;= 1.157</code>, since that does not emulate
'makeindex' well enough to avoid problems with special characters
(such as <span class="samp">(</span>, <span class="samp">{</span>, <span class="samp">!</span>) in indices.
</p>
</li>
<li><p> The ability of <code>readLines()</code> and <code>scan()</code> to
re-encode inputs to marked UTF-8 strings on Windows since <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.7.0
is extended to non-UTF-8 locales on other OSes.
</p>
</li>
<li> <p><code>scan()</code> gains a <code>fileEncoding</code> argument to
match <code>read.table()</code>.
</p>
</li>
<li> <p><code>points()</code> and <code>lines()</code> gain <code>"table"</code>
methods to match <code>plot()</code>.  (Wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=10472">PR#10472</a>.)
</p>
</li>
<li> <p><code>Sys.chmod()</code> allows argument <code>mode</code> to be a
vector, recycled along <code>paths</code>.
</p>
</li>
<li><p> There are <code>|</code>, <code>&amp;</code> and <code>xor()</code> methods for
classes <code>"octmode"</code> and <code>"hexmode"</code>, which work
bitwise.
</p>
</li>
<li><p> Environment variables <span class="env">R_DVIPSCMD</span>, <span class="env">R_LATEXCMD</span>,
<span class="env">R_MAKEINDEXCMD</span>, <span class="env">R_PDFLATEXCMD</span> are no longer used
nor set in an <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> session.  (With the move to
<code>tools::texi2dvi()</code>, the conventional environment variables
<span class="env">LATEX</span>, <span class="env">MAKEINDEX</span> and <span class="env">PDFLATEX</span> will be used.
<code>options("dvipscmd")</code> defaults to the value of <span class="env">DVIPS</span>,
then to <code>"dvips"</code>.)
</p>
</li>
<li><p> New function <code>isatty()</code> to see if terminal connections are
redirected.
</p>
</li>
<li> <p><code>summaryRprof()</code> returns the sampling interval in
component <code>sample.interval</code> and only returns in
<code>by.self</code> data for functions with non-zero self times.
</p>
</li>
<li> <p><code>print(x)</code> and <code>str(x)</code> now indicate if an empty
list <code>x</code> is named.
</p>
</li>
<li> <p><code>install.packages()</code> and <code>remove.packages()</code> with
<code>lib</code> unspecified and multiple libraries in
<code>.libPaths()</code> inform the user of the library location used
with a message rather than a warning.
</p>
</li>
<li><p> There is limited support for multiple compressed streams on a
file: all of <code>[bgx]zfile()</code> allow streams to be appended to an
existing file, but <code>bzfile()</code> reads only the first stream.
</p>
</li>
<li><p> Function <code>person()</code> in package <span class="pkg">utils</span> now uses
a given/family scheme in preference to first/middle/last, is
vectorized to handle an arbitrary number of persons, and gains a
<code>role</code> argument to specify person roles using a controlled
vocabulary (the MARC relator terms).
</p>
</li>
<li><p> Package <span class="pkg">utils</span> adds a new <code>"bibentry"</code> class
for representing and manipulating bibliographic information in
enhanced BibTeX style, unifying and enhancing the previously
existing mechanisms.
</p>
</li>
<li><p> A <code>bibstyle()</code> function has been added to the
<span class="pkg">tools</span> package with default JSS style for rendering
<code>"bibentry"</code> objects, and a mechanism for registering other
rendering styles.
</p>
</li>
<li><p> Several aspects of the display of text help are now
customizable using the new <code>Rd2txt_options()</code> function.
options(<code>"help_text_width"</code>) is no longer used.
</p>
</li>
<li><p> Added <span class="samp">\href</span> tag to the Rd format, to allow
hyperlinks to URLs without displaying the full URL.
</p>
</li>
<li><p> Added <span class="samp">\newcommand</span> and <span class="samp">\renewcommand</span> tags
to the Rd format, to allow user-defined macros.
</p>
</li>
<li><p> New <code>toRd()</code> generic in the <span class="pkg">tools</span> package to
convert objects to fragments of Rd code, and added
<code>"fragment"</code> argument to <code>Rd2txt()</code>, <code>Rd2HTML()</code>,
and <code>Rd2latex()</code> to support it.
</p>
</li>
<li><p> Directory &lsquo;<span class="file">R_HOME/share/texmf</span>&rsquo; now follows the TDS
conventions, so can be set as a <code>texmf</code> tree (&lsquo;root
directory&rsquo; in MiKTeX parlance).
</p>
</li>
<li><p> S3 generic functions now use correct S4 inheritance when
dispatching on an S4 object.  See <code>?Methods</code>, section on
&ldquo;Methods for S3 Generic Functions&rdquo; for recommendations
and details.
</p>
</li>
<li> <p><code>format.pval()</code> gains a <code>...</code> argument to pass
arguments such as <code>nsmall</code> to <code>format()</code>.  (Wish of
<a href="https://bugs.R-project.org/show_bug.cgi?id=9574">PR#9574</a>)
</p>
</li>
<li> <p><code>legend()</code> supports <code>title.adj</code>.  (Wish of
<a href="https://bugs.R-project.org/show_bug.cgi?id=13415">PR#13415</a>)
</p>
</li>
<li><p> Added support for subsetting <code>"raster"</code> objects, plus
assigning to a subset, conversion to a matrix (of colour
strings), and comparisons (<span class="samp">==</span> and <span class="samp">!=</span>).
</p>
</li>
<li><p> Added a new <code>parseLatex()</code> function (and related
functions <code>deparseLatex()</code> and <code>latexToUtf8()</code>) to
support conversion of bibliographic entries for display in R.
</p>
</li>
<li><p> Text rendering of <span class="samp">\itemize</span> in help uses a Unicode
bullet in UTF-8 and most single-byte Windows locales.
</p>
</li>
<li><p> Added support for polygons with holes to the graphics
engine.  This is implemented for the <code>pdf()</code>,
<code>postscript()</code>, <code>x11(type="cairo")</code>, <code>windows()</code>,
and <code>quartz()</code> devices (and associated raster formats),
but not for <code>x11(type="Xlib")</code> or <code>xfig()</code> or
<code>pictex()</code>.  The user-level interface is the
<code>polypath()</code> function in <span class="pkg">graphics</span> and
<code>grid.path()</code> in <span class="pkg">grid</span>.
</p>
</li>
<li><p> File &lsquo;<span class="file">NEWS</span>&rsquo; is now generated at installation with a
slightly different format: it will be in UTF-8 on platforms using
UTF-8, and otherwise in ASCII.  There is also a PDF version,
&lsquo;<span class="file">NEWS.pdf</span>&rsquo;, installed at the top-level of the R distribution.
</p>
</li>
<li> <p><code>kmeans(x, 1)</code> now works.  Further, <code>kmeans</code> now
returns between and total sum of squares.
</p>
</li>
<li> <p><code>arrayInd()</code> and <code>which()</code> gain an argument
<code>useNames</code>.  For <code>arrayInd</code>, the default is now false,
for speed reasons.
</p>
</li>
<li><p> As is done for closures, the default <code>print</code> method for
the formula class now displays the associated environment if it is
not the global environment.
</p>
</li>
<li><p> A new facility has been added for inserting code into a
package without re-installing it, to facilitate testing
changes which can be selectively added and backed out.  See
<code>?insertSource</code>.
</p>
</li>
<li><p> New function <code>readRenviron</code> to (re-)read files in the
format of &lsquo;<span class="file">~/.Renviron</span>&rsquo; and &lsquo;<span class="file">Renviron.site</span>&rsquo;.
</p>
</li>
<li> <p><code>require()</code> will now return <code>FALSE</code> (and not fail)
if loading the package or one of its dependencies fails.
</p>
</li>
<li> <p><code>aperm()</code> now allows argument <code>perm</code> to be a
character vector when the array has named dimnames (as the results
of <code>table()</code> calls do).  Similarly, <code>array()</code> allows
<code>MARGIN</code> to be a character vector.  (Based on suggestions of
Michael Lachmann.)
</p>
</li>
<li><p> Package <span class="pkg">utils</span> now exports and documents functions
<code>aspell_package_Rd_files()</code> and
<code>aspell_package_vignettes()</code> for spell checking package Rd
files and vignettes using Aspell, Ispell or Hunspell.
</p>
</li>
<li><p> Package news can now be given in Rd format, and
<code>news()</code> prefers these &lsquo;<span class="file">inst/NEWS.Rd</span>&rsquo; files to old-style
plain text &lsquo;<span class="file">NEWS</span>&rsquo; or &lsquo;<span class="file">inst/NEWS</span>&rsquo; files.
</p>
</li>
<li><p> New simple function <code>packageVersion()</code>.
</p>
</li>
<li><p> The PCRE library has been updated to version 8.10.
</p>
</li>
<li><p> The standard Unix-alike terminal interface declares its name
to readline as 'R', so that can be used for conditional sections
in &lsquo;<span class="file">~/.inputrc</span>&rsquo; files.
</p>
</li>
<li> <p>&lsquo;Writing R Extensions&rsquo; now stresses that the standard
sections in &lsquo;<span class="file">.Rd</span>&rsquo; files (other than <span class="samp">\alias</span>,
<span class="samp">\keyword</span> and <span class="samp">\note</span>) are intended to be unique, and
the conversion tools now drop duplicates with a warning.
</p>
<p>The &lsquo;<span class="file">.Rd</span>&rsquo; conversion tools also warn about an unrecognized type
in a <span class="samp">\docType</span> section.
</p>
</li>
<li> <p><code>ecdf()</code> objects now have a <code>quantile()</code> method.
</p>
</li>
<li> <p><code>format()</code> methods for date-time objects now attempt to make
use of a <code>"tzone"</code> attribute with <code>"%Z"</code> and
<code>"%z"</code> formats, but it is not always possible.  (Wish of
<a href="https://bugs.R-project.org/show_bug.cgi?id=14358">PR#14358</a>.)
</p>
</li>
<li> <p><code>tools::texi2dvi(file, clean = TRUE)</code> now works in more
cases (e.g., where emulation is used and when &lsquo;<span class="file">file</span>&rsquo; is not in
the current directory).
</p>
</li>
<li><p> New function <code>droplevels()</code> to remove unused factor levels.
</p>
</li>
<li> <p><code>system(command, intern = TRUE)</code> now gives an error on
a Unix-alike (as well as on Windows) if <code>command</code> cannot be
run.  It reports a non-success exit status from running
<code>command</code> as a warning.
</p>
<p>On a Unix-alike an attempt is made to return the actual exit
status of the command in <code>system(intern = FALSE)</code>: previously
this had been system-dependent but on POSIX-compliant systems the
value return was 256 times the status.
</p>
</li>
<li> <p><code>system()</code> has a new argument <code>ignore.stdout</code>
which can be used to (portably) ignore standard output.
</p>
</li>
<li> <p><code>system(intern = TRUE)</code> and <code>pipe()</code> connections
are guaranteed to be available on all builds of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>.
</p>
</li>
<li> <p><code>Sys.which()</code> has been altered to return <code>""</code> if
the command is not found (even on Solaris).
</p>
</li>
<li><p> A facility for defining reference-based S4 classes (in the
OOP style of Java, C++, etc.) has been added experimentally to
package <span class="pkg">methods</span>; see <code>?ReferenceClasses</code>.
</p>
</li>
<li><p> The <code>predict</code> method for <code>"loess"</code> fits gains an
<code>na.action</code> argument which defaults to <code>na.pass</code> rather
than the previous default of <code>na.omit</code>.
</p>
<p>Predictions from <code>"loess"</code> fits are now named from the row
names of <code>newdata</code>.
</p>
</li>
<li><p> Parsing errors detected during <code>Sweave()</code> processing
will now be reported referencing their original location in the
source file.
</p>
</li>
<li><p> New <code>adjustcolor()</code> utility, e.g., for simple
translucent color schemes.
</p>
</li>
<li> <p><code>qr()</code> now has a trivial <code>lm</code> method with a
simple (fast) validity check.
</p>
</li>
<li><p> An experimental new programming model has been added to
package <span class="pkg">methods</span> for reference (OOP-style) classes and
methods.  See <code>?ReferenceClasses</code>.
</p>
</li>
<li><p> bzip2 has been updated to version 1.0.6 (bug-fix release).
<span class="option">--with-system-bzlib</span> now requires at least version 1.0.6.
</p>
</li>
<li><p> R now provides &lsquo;<span class="file">jss.cls</span>&rsquo; and &lsquo;<span class="file">jss.bst</span>&rsquo; (the class
and bib style file for the Journal of Statistical Software) as
well as &lsquo;<span class="file">RJournal.bib</span>&rsquo; and &lsquo;<span class="file">Rnews.bib</span>&rsquo;, and
<code>R CMD</code> ensures that the &lsquo;<span class="file">.bst</span>&rsquo; and &lsquo;<span class="file">.bib</span>&rsquo; files
are found by BibTeX.
</p>
</li>
<li><p> Functions using the <span class="env">TAR</span> environment variable no longer
quote the value when making <code>system</code> calls.  This allows
values such as <span class="samp">tar --force-local</span>, but does require
additional quotes in, e.g., <code>TAR = "'/path with spaces/mytar'"</code>.
</p>
</li></ul>




<h4>DEPRECATED &amp; DEFUNCT</h4>


<ul>
<li><p> Supplying the parser with a character string containing both
octal/hex and Unicode escapes is now an error.
</p>
</li>
<li><p> File extension &lsquo;<span class="file">.C</span>&rsquo; for C++ code files in packages is
now defunct.
</p>
</li>
<li> <p><code>R CMD check</code> no longer supports configuration
files containing Perl configuration variables: use the environment
variables documented in &lsquo;R Internals&rsquo; instead.
</p>
</li>
<li><p> The <code>save</code> argument of <code>require()</code> now defaults to
<code>FALSE</code> and <code>save = TRUE</code> is now deprecated.  (This
facility is very rarely actually used, and was superseded by the
<span class="samp">Depends</span> field of the &lsquo;<span class="file">DESCRIPTION</span>&rsquo; file long ago.)
</p>
</li>
<li> <p><code>R CMD check --no-latex</code> is deprecated in favour of
<span class="option">--no-manual</span>.
</p>
</li>
<li> <p><code>R CMD Sd2Rd</code> is formally deprecated and will be
removed in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.13.0.
</p>
</li></ul>




<h4>PACKAGE INSTALLATION</h4>


<ul>
<li> <p><code>install.packages()</code> has a new argument
<code>libs_only</code> to optionally pass <span class="option">--libs-only</span> to
<code>R CMD INSTALL</code> and works analogously for Windows binary
installs (to add support for 64- or 32-bit Windows).
</p>
</li>
<li><p> When sub-architectures are in use, the installed
architectures are recorded in the <code>Archs</code> field of the
&lsquo;<span class="file">DESCRIPTION</span>&rsquo; file.  There is a new default filter,
<code>"subarch"</code>, in <code>available.packages()</code> to make use of
this.
</p>
<p>Code is compiled in a copy of the &lsquo;<span class="file">src</span>&rsquo; directory when a
package is installed for more than one sub-architecture: this
avoid problems with cleaning the sources between building
sub-architectures.
</p>
</li>
<li> <p><code>R CMD INSTALL --libs-only</code> no longer overrides the
setting of locking, so a previous version of the package will be
restored unless <span class="option">--no-lock</span> is specified.
</p>
</li></ul>




<h4>UTILITIES</h4>


<ul>
<li> <p><code>R CMD Rprof|build|check</code> are now based on <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> rather
than Perl scripts.  The only remaining Perl scripts are the
deprecated <code>R CMD Sd2Rd</code> and <code>install-info.pl</code> (used
only if <code>install-info</code> is not found) as well as some
maintainer-mode-only scripts.
</p>
<p><strong>NB:</strong> because these have been completely rewritten, users
should not expect undocumented details of previous
implementations to have been duplicated.
</p>
<p><code>R CMD</code> no longer manipulates the environment variables
<span class="env">PERL5LIB</span> and <span class="env">PERLLIB</span>.
</p>
</li>
<li> <p><code>R CMD check</code> has a new argument <span class="option">--extra-arch</span>
to confine tests to those needed to check an additional
sub-architecture.
</p>
<p>Its check for &ldquo;Subdirectory 'inst' contains no files&rdquo; is
more thorough: it looks for files, and warns if there are only
empty directories.
</p>
<p>Environment variables such as <span class="env">R_LIBS</span> and those used for
customization can be set for the duration of checking <em>via</em> a file
&lsquo;<span class="file">~/.R/check.Renviron</span>&rsquo; (in the format used by
&lsquo;<span class="file">.Renviron</span>&rsquo;, and with sub-architecture specific versions
such as &lsquo;<span class="file">~/.R/check.Renviron.i386</span>&rsquo; taking precedence).
</p>
<p>There are new options <span class="option">--multiarch</span> to check the package
under all of the installed sub-architectures and
<span class="option">--no-multiarch</span> to confine checking to the
sub-architecture under which <code>check</code> is invoked.  If
neither option is supplied, a test is done of installed
sub-architectures and all those which can be run on the current
OS are used.
</p>
<p>Unless multiple sub-architectures are selected, the install done
by <code>check</code> for testing purposes is only of the current
sub-architecture (<em>via</em> <code>R CMD INSTALL --no-multiarch</code>).
</p>
<p>It will skip the check for non-ascii characters in code or data
if the environment variables <span class="env">_R_CHECK_ASCII_CODE_</span> or
<span class="env">_R_CHECK_ASCII_DATA_</span> are respectively set to <span class="env">FALSE</span>.
(Suggestion of Vince Carey.)
</p>
</li>
<li> <p><code>R CMD build</code> no longer creates an &lsquo;<span class="file">INDEX</span>&rsquo; file
(<code>R CMD INSTALL</code> does so), and <span class="option">--force</span> removes
(rather than overwrites) an existing &lsquo;<span class="file">INDEX</span>&rsquo; file.
</p>
<p>It supports a file &lsquo;<span class="file">~/.R/build.Renviron</span>&rsquo; analogously to
<code>check</code>.
</p>
<p>It now runs build-time <span class="samp">\Sexpr</span> expressions in help files.
</p>
</li>
<li> <p><code>R CMD Rd2dvi</code> makes use of <code>tools::texi2dvi()</code>
to process the package manual.  It is now implemented entirely in
<span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> (rather than partially as a shell script).
</p>
</li>
<li> <p><code>R CMD Rprof</code> now uses <code>utils::summaryRprof()</code>
rather than Perl.  It has new arguments to select one of the
tables and to limit the number of entries printed.
</p>
</li>
<li> <p><code>R CMD Sweave</code> now runs <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> with <span class="option">--vanilla</span> so
the environment setting of <span class="env">R_LIBS</span> will always be used.
</p>
</li></ul>




<h4>C-LEVEL FACILITIES</h4>


<ul>
<li> <p><code>lang5()</code> and <code>lang6()</code> (in addition to
pre-existing <code>lang[1-4]()</code>) convenience functions for easier
construction of <code>eval()</code> calls.  If you have your own
definition, do wrap it inside <code>#ifndef lang5 .... #endif</code>
to keep it working with old and new <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>.
</p>
</li>
<li><p> Header &lsquo;<span class="file">R.h</span>&rsquo; now includes only the C headers it itself needs,
hence no longer includes <code>errno.h</code>.  (This helps avoid problems
when it is included from C++ source files.)
</p>
</li>
<li><p> Headers &lsquo;<span class="file">Rinternals.h</span>&rsquo; and &lsquo;<span class="file">R_ext/Print.h</span>&rsquo; include
the C++ versions of &lsquo;<span class="file">stdio.h</span>&rsquo; and &lsquo;<span class="file">stdarg.h</span>&rsquo;
respectively if included from a C++ source file.
</p>
</li></ul>




<h4>INSTALLATION</h4>


<ul>
<li><p> A C99 compiler is now required, and more C99 language features
will be used in the <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> sources.
</p>
</li>
<li><p> Tcl/Tk &gt;= 8.4 is now required (increased from 8.3).
</p>
</li>
<li><p> System functions <code>access</code>, <code>chdir</code> and
<code>getcwd</code> are now essential to configure <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>.  (In practice
they have been required for some time.)
</p>
</li>
<li> <p><code>make check</code> compares the output of the examples
from several of the base packages to reference output rather than
the previous output (if any).  Expect some differences due to
differences in floating-point computations between platforms.
</p>
</li>
<li><p> File &lsquo;<span class="file">NEWS</span>&rsquo; is no longer in the sources, but generated as
part of the installation.  The primary source for changes is now
&lsquo;<span class="file">doc/NEWS.Rd</span>&rsquo;.
</p>
</li>
<li><p> The <code>popen</code> system call is now required to build <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>.
This ensures the availability of <code>system(intern = TRUE)</code>,
<code>pipe()</code> connections and printing from <code>postscript()</code>.
</p>
</li>
<li><p> The <code>pkg-config</code> file &lsquo;<span class="file">libR.pc</span>&rsquo; now also works
when <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> is installed using a sub-architecture.
</p>
</li>
<li> <p><span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> has always required a BLAS that conforms to IE60559
arithmetic, but after discovery of more real-world problems caused
by a BLAS that did not, this is tested more thoroughly in this
version.
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li><p> Calls to <code>selectMethod()</code> by default no longer cache
inherited methods.  This could previously corrupt methods used by
<code>as()</code>.
</p>
</li>
<li><p> The densities of non-central chi-squared are now more accurate
in some cases in the extreme tails,
e.g. <code>dchisq(2000, 2, 1000)</code>,
as a series expansion was truncated too early.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=14105">PR#14105</a>)
</p>
</li>
<li> <p><code>pt()</code> is more accurate in the left tail for <code>ncp</code>
large, e.g. <code>pt(-1000, 3, 200)</code>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14069">PR#14069</a>)
</p>
</li>
<li><p> The default C function (<code>R_binary</code>) for binary ops now
sets the S4 bit in the result if either argument is an S4 object.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=13209">PR#13209</a>)
</p>
</li>
<li> <p><code>source(echo=TRUE)</code> failed to echo comments that
followed the last statement in a file.
</p>
</li>
<li><p> S4 classes that contained one of <code>"matrix"</code>,
<code>"array"</code> or <code>"ts"</code> and also another class now accept
superclass objects in <code>new()</code>.  Also fixes failure to call
<code>validObject()</code> for these classes.
</p>
</li>
<li><p> Conditional inheritance defined by argument <code>test</code> in
<code>methods::setIs()</code> will no longer be used in S4 method
selection (caching these methods could give incorrect results).
See <code>?setIs</code>.
</p>
</li>
<li><p> The signature of an implicit generic is now used by
<code>setGeneric()</code> when that does not use a definition nor
explicitly set a signature.
</p>
</li>
<li><p> A bug in <code>callNextMethod()</code> for some examples with
<code>"..."</code> in the arguments has been fixed.  See file
&lsquo;<span class="file">src/library/methods/tests/nextWithDots.R</span>&rsquo; in the sources.
</p>
</li>
<li> <p><code>match(x, table)</code> (and hence <code>%in%</code>) now treat
<code>"POSIXlt"</code> consistently with, e.g., <code>"POSIXct"</code>.
</p>
</li>
<li><p> Built-in code dealing with environments (<code>get()</code>,
<code>assign()</code>, <code>parent.env()</code>, <code>is.environment()</code> and
others) now behave consistently to recognize S4 subclasses;
<code>is.name()</code> also recognizes subclasses.
</p>
</li>
<li><p> The <code>abs.tol</code> control parameter to <code>nlminb()</code>
now defaults to <code>0.0</code> to avoid false declarations of
convergence in objective functions that may go negative.
</p>
</li>
<li><p> The standard Unix-alike termination dialog to ask whether to
save the workspace takes a EOF response as <code>n</code> to avoid
problems with a damaged terminal connection.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14332">PR#14332</a>)
</p>
</li>
<li><p> Added <code>warn.unused</code> argument to <code>hist.default()</code>
to allow suppression of spurious warnings about graphical
parameters used with <code>plot=FALSE</code>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14341">PR#14341</a>)
</p>
</li>
<li> <p><code>predict.lm()</code>, <code>summary.lm()</code>, and indeed
<code>lm()</code> itself had issues with residual DF in zero-weighted
cases (the latter two only in connection with empty
models). (Thanks to Bill Dunlap for spotting the
<code>predict()</code> case.)
</p>
</li>
<li> <p><code>aperm()</code> treated <code>resize = NA</code> as <code>resize =
      TRUE</code>.
</p>
</li>
<li> <p><code>constrOptim()</code> now has an improved convergence
criterion, notably for cases where the minimum was (very close to)
zero; further, other tweaks inspired from code proposals by Ravi
Varadhan.
</p>
</li>
<li><p> Rendering of S3 and S4 methods in man pages has been
corrected and made consistent across output formats.
</p>
</li>
<li><p> Simple markup is now allowed in <span class="samp">\title</span> sections
in &lsquo;<span class="file">.Rd</span>&rsquo; files.
</p>
</li>
<li><p> The behaviour of <code>as.logical()</code> on factors (to use the
levels) was lost in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.6.0 and has been restored.
</p>
</li>
<li> <p><code>prompt()</code> did not backquote some default arguments in
the <span class="samp">\usage</span> section.  (Reported by Claudia Beleites.)
</p>
</li>
<li> <p><code>writeBin()</code> disallows attempts to write 2GB or
more in a single call. (<a href="https://bugs.R-project.org/show_bug.cgi?id=14362">PR#14362</a>)
</p>
</li>
<li> <p><code>new()</code> and <code>getClass()</code> will now work if Class
is a subclass of <code>"classRepresentation"</code> and should also be
faster in typical calls.
</p>
</li>
<li><p> The <code>summary()</code> method for data frames makes a better
job of names containing characters invalid in the current locale.
</p>
</li>
<li> <p><code>[[</code> sub-assignment for factors could create an invalid
factor (reported by Bill Dunlap).
</p>
</li>
<li> <p><code>Negate(f)</code> would not evaluate argument <code>f</code>
until first use of returned function (reported by Olaf Mersmann).
</p>
</li>
<li> <p><code>quietly=FALSE</code> is now also an optional argument of
<code>library()</code>, and consequently, <code>quietly</code> is now
propagated also for loading dependent packages, e.g., in
<code>require(*, quietly=TRUE)</code>.
</p>
</li>
<li><p> If the loop variable in a <code>for</code> loop was deleted, it
would be recreated as a global variable.  (Reported by Radford
Neal; the fix includes his optimizations as well.)
</p>
</li>
<li><p> Task callbacks could report the wrong expression when
the task involved parsing new code. (<a href="https://bugs.R-project.org/show_bug.cgi?id=14368">PR#14368</a>)
</p>
</li>
<li> <p><code>getNamespaceVersion()</code> failed; this was an
accidental change in 2.11.0. (<a href="https://bugs.R-project.org/show_bug.cgi?id=14374">PR#14374</a>)
</p>
</li>
<li> <p><code>identical()</code> returned <code>FALSE</code> for external
pointer objects even when the pointer addresses were the same.
</p>
</li>
<li> <p><code>L$a@x[] &lt;- val</code> did not duplicate in a case it should have.
</p>
</li>
<li> <p><code>tempfile()</code> now always gives a random file name (even
if the directory is specified) when called directly after
startup and before the <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> RNG had been used.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14381">PR#14381</a>)
</p>
</li>
<li> <p><code>quantile(type=6)</code> behaved inconsistently.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14383">PR#14383</a>)
</p>
</li>
<li> <p><code>backSpline(.)</code> behaved incorrectly when the knot
sequence was decreasing.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14386">PR#14386</a>)
</p>
</li>
<li><p> The reference BLAS included in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> was assuming that
<code>0*x</code> and <code>x*0</code> were always zero (whereas they could be
<code>NA</code> or <code>NaN</code> in IEC 60559 arithmetic).  This was seen
in results from <code>tcrossprod</code>, and for example that
<code>log(0) %*% 0</code> gave <code>0</code>.
</p>
</li>
<li><p> The calculation of whether text was completely outside
the device region (in which case, you draw nothing)
was wrong for screen devices (which have [0, 0] at top-left).
The symptom was (long) text disappearing when
resizing a screen window (to make it smaller).  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14391">PR#14391</a>)
</p>
</li>
<li> <p><code>model.frame(drop.unused.levels = TRUE)</code> did not
take into account <code>NA</code> values of factors when deciding to
drop levels. (<a href="https://bugs.R-project.org/show_bug.cgi?id=14393">PR#14393</a>)
</p>
</li>
<li> <p><code>library.dynam.unload</code> required an absolute path for
<code>libpath</code>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14385">PR#14385</a>)
</p>
<p>Both <code>library()</code> and <code>loadNamespace()</code> now record
absolute paths for use by <code>searchpaths()</code> and
<code>getNamespaceInfo(ns, "path")</code>.
</p>
</li>
<li><p> The self-starting model <code>NLSstClosestX</code> failed if some
deviation was exactly zero.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14384">PR#14384</a>)
</p>
</li>
<li> <p><code>X11(type = "cairo")</code> (and other devices such as
<code>png</code> using cairographics) and which use Pango font selection
now work around a bug in Pango when very small fonts (those with
sizes between 0 and 1 in Pango's internal units) are requested.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=14369">PR#14369</a>)
</p>
</li>
<li><p> Added workaround for the font problem with <code>X11(type =
      "cairo")</code> and similar on Mac OS X whereby italic and bold styles
were interchanged.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=13463">PR#13463</a> amongst many other reports.)
</p>
</li>
<li> <p><code>source(chdir = TRUE)</code> failed to reset the working
directory if it could not be determined &ndash; that is now an error.
</p>
</li>
<li><p> Fix for crash of <code>example(rasterImage)</code> on
<code>x11(type="Xlib")</code>.
</p>
</li>
<li><p> Force Quartz to bring the on-screen display up-to-date
immediately before the snapshot is taken by <code>grid.cap()</code>
in the Cocoa implementation. (<a href="https://bugs.R-project.org/show_bug.cgi?id=14260">PR#14260</a>)
</p>
</li>
<li> <p><code>model.frame</code> had an unstated 500 byte limit on
variable names.  (Example reported by Terry Therneau.)
</p>
</li>
<li><p> The 256-byte limit on names is now documented.
</p>
</li>
<li><p> Subassignment by <code>[</code>, <code>[[</code> or <code>$</code> on an
expression object with value <code>NULL</code> coerced the object to a
list.
</p>
</li></ul>




<h3><img class="toplogo" src="../help/figures/../../html/Rlogo.svg" alt="[R logo]" /> CHANGES IN R VERSION 2.11.1 patched</h3>



<h4>NEW FEATURES</h4>


<ul>
<li> <p><code>install.packages()</code> has a new optional argument
<code>INSTALL_opts</code> which can be used to pass options to
<code>R CMD INSTALL</code> for source-package installs.
</p>
</li>
<li> <p><code>R CMD check</code> now runs the package-specific tests
with <span class="env">LANGUAGE=en</span> to facilitate comparison to
&lsquo;<span class="file">.Rout.save</span>&rsquo; files.
</p>
</li>
<li> <p><code>sessionInfo()</code> gives more detailed platform
information, including 32/64-bit and the sub-architecture if one
is used.
</p>
</li></ul>




<h4>DEPRECATED &amp; DEFUNCT</h4>


<ul>
<li><p> The use of Perl configuration variables for <code>R CMD
	check</code> (as previously documented in &lsquo;Writing R
Extensions&rsquo;) is deprecated and will be removed in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.12.0.  Use
the environment variables documented in &lsquo;R Internals&rsquo;
instead.
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li> <p><code>R CMD Rd2dvi</code> failed if run from a path containing
space(s).  This also affected <code>R CMD check</code>, which calls
<code>Rd2dvi</code>.
</p>
</li>
<li> <p><code>stripchart()</code> could fail with an empty factor
level.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14317">PR#14317</a>)
</p>
</li>
<li><p> Text help rendering of <span class="samp">\tabular{}</span> has been
improved: under some circumstances leading blank columns were
not rendered.
</p>
</li>
<li> <p><code>strsplit(x, fixed=TRUE)</code> marked UTF-8 strings with the
local encoding when no splits were found.
</p>
</li>
<li> <p><code>weighted.mean(NA, na.rm=TRUE)</code> and similar now returns
<code>NaN</code> again, as it did prior to <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.10.0.
</p>
</li>
<li> <p><code>R CMD</code> had a typo in its detection of whether the
environment variable <span class="env">TEXINPUTS</span> was set (reported by Martin
Morgan).
</p>
</li>
<li><p> The command-line parser could mistake
<span class="option">--file=size...</span> for one of the options for setting limits
for Ncells or Vcells.
</p>
</li>
<li><p> The internal <code>strptime()</code> could corrupt its copy of the
timezone which would then lead to spurious warnings. (<a href="https://bugs.R-project.org/show_bug.cgi?id=14338">PR#14338</a>)
</p>
</li>
<li> <p><code>dir.create(recursive = TRUE)</code> could fail if one of the
components existed but was a directory on a read-only file system.
(Seen on Solaris, where the error code returned is not even listed
as possible on the man page.)
</p>
</li>
<li><p> The <code>postscript()</code> and <code>pdf()</code> devices will now
allow <code>lwd</code> values less than 1 (they used to force such
values to be 1).
</p>
</li>
<li><p> Fixed font face for CID fonts in <code>pdf()</code> graphics output.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=14326">PR#14326</a>)
</p>
</li>
<li> <p><code>GERaster()</code> now checks for width or height of zero and
does nothing in those cases; previously the behaviour was
undefined, probably device-specific, and possibly dangerous.
</p>
</li>
<li> <p><code>wilcox.test(x, y, conf.int = TRUE)</code> failed with an unhelpful
message if <code>x</code> and <code>y</code> were constant vectors, and
similarly in the one-sample case.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14329">PR#14329</a>)
</p>
</li>
<li><p> Improperly calling <code>Recall()</code> from outside a function
could cause a segfault.  (Reported by Robert McGehee.)
</p>
</li>
<li> <p><span class="samp">\Sexpr[result=rd]</span> in an Rd file added a
spurious newline, which was displayed as extra whitespace when
rendered.
</p>
</li>
<li> <p><code>require(save = TRUE)</code> recorded the names of packages
it failed to load.
</p>
</li>
<li> <p><code>packageStatus()</code> could return a data frame with
duplicate row names which could then not be printed.
</p>
</li>
<li> <p><code>txtProgressBar(style = 2)</code> did not work correctly.
</p>
<p><code>txtProgressBar(style = 3)</code> did not display until a
non-minimum value was set.
</p>
</li>
<li> <p><code>contour()</code> did not display dashed line types
properly when contour lines were labelled. (Reported by
David B. Thompson.)
</p>
</li>
<li> <p><code>tools::undoc()</code> again detects undocumented data
objects.  Of course, this also affects <code>R CMD check</code>.
</p>
</li>
<li> <p><code>ksmooth(x,NULL)</code> no longer segfaults.
</p>
</li>
<li> <p><code>approxfun()</code>, <code>approx()</code>, <code>splinefun()</code>
and <code>spline()</code> could be confused by <code>x</code> values that
were different but so close as to print identically.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=14377">PR#14377</a>)
</p>
</li></ul>




<h3><img class="toplogo" src="../help/figures/../../html/Rlogo.svg" alt="[R logo]" /> CHANGES IN R VERSION 2.11.1</h3>



<h4>NEW FEATURES</h4>


<ul>
<li> <p><code>R CMD INSTALL</code> checks if dependent packages are
available early on in the installation of source packages,
thereby giving clearer error messages.
</p>
</li>
<li> <p><code>R CMD INSTALL --build</code> now names the file in the
format used for Mac OS X binary files on that platform.
</p>
</li>
<li> <p><code>BIC()</code> in package <span class="pkg">stats4</span> now also works with
multiple fitted models, analogously to <code>AIC()</code>.
</p>
</li></ul>




<h4>DEPRECATED &amp; DEFUNCT</h4>


<ul>
<li><p> Use of file extension &lsquo;<span class="file">.C</span>&rsquo; for C++ code in packages is now
deprecated: it has caused problems for some <code>make</code>s on
case-insensitive file systems (although it currently works
with the recommended toolkits).
</p>
</li></ul>




<h4>INSTALLATION</h4>


<ul>
<li><p> Command <code>gnutar</code> is preferred to <code>tar</code>
when configure sets <span class="env">TAR</span>.  This is needed on Mac OS 10.6,
where the default <code>tar</code>, <code>bsdtar 2.6.2</code>, has been
reported to produce archives with illegal extensions to tar
(according to the POSIX standard).
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li><p> The C function <code>mkCharLenCE</code> now no longer reads past
<code>len</code> bytes (unlikely to be a problem except in user
code).  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14246">PR#14246</a>)
</p>
</li>
<li><p> On systems without any default <span class="env">LD_LIBRARY_PATH</span> (not
even &lsquo;<span class="file">/usr/local/lib</span>&rsquo;), <span class="env">[DY]LIB_LIBRARY_PATH</span> is now
set without a trailing colon.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=13637">PR#13637</a>)
</p>
</li>
<li><p> More efficient implementation of <code>utf8ToInt()</code> on long
multi-byte strings with many multi-byte characters.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14262">PR#14262</a>)
</p>
</li>
<li> <p><code>aggregate.ts()</code> gave platform-dependent results due to
rounding error for <code>ndeltat != 1</code>.
</p>
</li>
<li> <p><code>package.skeleton()</code> sometimes failed to fix filenames
for &lsquo;<span class="file">.R</span>&rsquo; or &lsquo;<span class="file">.Rd</span>&rsquo; files to start with an alphanumeric.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=14253">PR#14253</a>)
</p>
<p>It also failed when only an S4 class without any methods was
defined.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14280">PR#14280</a>)
</p>
</li>
<li> <p><code>splinefun(method = "monoH.FC")</code> was not
quite monotone in rare cases.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14215">PR#14215</a>)
</p>
</li>
<li> <p><code>Rhttpd</code> no longer crashes due to <code>SIGPIPE</code> when
the client closes the connection prematurely.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14266">PR#14266</a>)
</p>
</li>
<li> <p><code>format.POSIXlt()</code> could cause a stack overflow and
crash when used on very long vectors.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14267">PR#14267</a>)
</p>
</li>
<li> <p><code>Rd2latex()</code> incorrectly escaped special characters in
<span class="samp">\usage</span> sections.
</p>
</li>
<li> <p><code>mcnemar.test()</code> could alter the levels (dropping
unused levels) if passed <code>x</code> and <code>y</code> as factors
(reported by Greg Snow).
</p>
</li>
<li> <p><code>Rd2pdf</code> sometimes needed a further
<code>pdflatex</code> pass to get hyperlinked pages correct.
</p>
</li>
<li> <p><code>interaction()</code> produced malformed results when levels were
duplicated, causing segfaults in <code>split()</code>.
</p>
</li>
<li> <p><code>cut(d, breaks = &lt;n&gt;)</code> now also works for <code>"Date"</code>
or <code>"POSIXt"</code> argument <code>d</code>.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=14288">PR#14288</a>)
</p>
</li>
<li> <p><code>memDecompress()</code> could decompress incompletely rare
<code>xz</code>-compressed input due to incorrect documentation of
<code>xz utils</code>.  (Report and patch from Olaf Mersmann.)
</p>
</li>
<li><p> The S4 <code>initialize()</code> methods for <code>"matrix"</code>,
<code>"array"</code>, and <code>"ts"</code> have been fixed to call
<code>validObject()</code>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14284">PR#14284</a>)
</p>
</li>
<li> <p><code>R CMD INSTALL</code> now behaves the same way with or
without <span class="option">--no-multiarch</span> on platforms with only one
installed architecture.  (It used to clean the &lsquo;<span class="file">src</span>&rsquo;
directory without <span class="option">--no-multiarch</span>.)
</p>
</li>
<li> <p><code>[&lt;-.data.frame</code> was not quite careful enough in
assigning (and potentially deleting) columns
right-to-left.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14263">PR#14263</a>)
</p>
</li>
<li> <p><code>rbeta(n, a, b)</code> no longer occasionally returns
<code>NaN</code> for <code>a &gt;&gt; 1 &gt; b</code>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14291">PR#14291</a>)
</p>
</li>
<li> <p><code>pnorm(x, log.p = TRUE)</code> could return <code>NaN</code> not
<code>-Inf</code> for <code>x</code> near (minus for <code>lower.tail=TRUE</code>)
the largest representable number.
</p>
</li>
<li><p> Compressed data files &lsquo;<span class="file">*.(txt|tab|csv).(gz|bz2|xz)</span>&rsquo;
were not recognized for the list of data topics and hence for
packages using <code>LazyData</code>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14273">PR#14273</a>)
</p>
</li>
<li> <p><code>textConnection()</code> did an unnecessary translation on
strings in a foreign encoding (e.g., UTF-8 strings on Windows) and
so was slower than it could have been on very long input strings.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=14286">PR#14286</a>)
</p>
</li>
<li> <p><code>tools::Rd2txt()</code> did not render poorly written Rd
files consistently with other renderers.
</p>
<p>It computed widths of strings that would be <code>print()</code>ed with
escapes incorrectly, for example in the computation of column
width for <span class="samp">\tabular</span>.
</p>
</li>
<li> <p><code>na.action()</code> did not extract the <code>na.action</code>
component as documented.
</p>
</li>
<li> <p><code>do.call()</code>ing <code>NextMethod</code> in erroneous ways no
longer segfaults. (<a href="https://bugs.R-project.org/show_bug.cgi?id=13487">PR#13487</a>)
</p>
</li></ul>




<h3><img class="toplogo" src="../help/figures/../../html/Rlogo.svg" alt="[R logo]" /> CHANGES IN R VERSION 2.11.0</h3>



<h4>SIGNIFICANT USER-VISIBLE CHANGES</h4>


<ul>
<li><p> Packages must have been installed under <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> &gt;= 2.10.0, as the
current help system is the only one now supported.
</p>
</li>
<li><p> A port to 64-bit Windows is now available as well as binary
package repositories: see the &lsquo;R Administration and
Installation Manual&rsquo;.
</p>
</li>
<li><p> Argument matching for primitive functions is now done in the
same way as for interpreted functions except for the deliberate
exceptions
</p>
<pre>
	 call switch .C .Fortran .Call .External
       </pre>
<p>all of which use positional matching for their first argument,
and also some internal-use-only primitives.
</p>
</li>
<li><p> The default device for command-line <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> at the console on Mac OS X
is now <code>quartz()</code> and not <code>X11()</code>.
</p>
</li></ul>




<h4>NEW FEATURES</h4>


<ul>
<li><p> The <code>open</code> modes for connections are now interpreted
more consistently.  <code>open = "r"</code> is now equivalent to
<code>open = "rt"</code> for all connections.  The default <code>open =
       ""</code> now means <code>"rt"</code> for all connections except the
compressed-file connections <code>gzfile()</code>, <code>bzfile()</code> and
<code>xzfile()</code> for which it means <code>"rb"</code>.
</p>
</li>
<li> <p><code>R CMD INSTALL</code> now uses the internal <code>untar()</code>
function in package <span class="pkg">utils</span>: this ensures that all platforms
can install <code>bzip2</code>- and <code>xz</code>-compressed
tarballs.  In case this causes problems (as it has on some
Windows file systems when run from Cygwin tools) it can be
overridden by the environment variable <span class="env">R_INSTALL_TAR</span>:
setting this to a modern external tar program will speed up
unpacking of large (tens of Mb or more) tarballs.
</p>
</li>
<li> <p><code>help(try.all.packages = TRUE)</code> is much faster
(although the time taken by the OS to find all the packages the
first time it is used can dominate the time).
</p>
</li>
<li> <p><code>R CMD check</code> has a new option <span class="option">--timings</span>
to record per-example timings in file
&lsquo;<span class="file">&lt;pkg&gt;.Rcheck/&lt;pkg&gt;-Ex.timings</span>&rsquo;.
</p>
</li>
<li><p> The TRE library has been updated to version 0.8.0 (minor bugfixes).
</p>
</li>
<li> <p><code>grep[l]</code>, <code>[g]sub</code> and <code>[g]regexpr</code> now work
in bytes in an 8-bit locales if there is no marked UTF-8 input
string: this will be somewhat faster, and for <code>[g]sub()</code>
give the result in the native encoding rather than in UTF-8
(which returns to the behaviour prior to <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.10.0).
</p>
</li>
<li><p> A new argument <code>skipCalls</code> has been added to
<code>browser()</code> so that it can report the original context when
called by other debugging functions.
</p>
</li>
<li><p> More validity checking of UTF-8 and MBCS strings is done by
<code>agrep()</code> and the regular-expression matching functions.
</p>
</li>
<li><p> The undocumented restriction on <code>gregexpr()</code> to
<code>length(text) &gt; 0</code> has been removed.
</p>
</li>
<li><p> Package <span class="pkg">tcltk</span> now sends strings to Tcl in UTF-8: this
means that strings with a marked UTF-8 encoding are supported in
non-UTF-8 locales.
</p>
</li>
<li><p> The graphics engine now supports rendering of raster (bitmap)
images, though not all graphics devices can provide (full)
support.  Packages providing graphics devices (e.g., <code>Cairo</code>,
<code>RSvgDevice</code>, <code>cairoDevice</code>) will need to be reinstalled.
</p>
<p>There is also support in the graphics engine for capturing
raster images from graphics devices (again not supported
on all graphics devices).
</p>
</li>
<li> <p><code>R CMD check</code> now also checks if the package and
namespace can be unloaded: this provides a check of the
<code>.Last.lib()</code> and <code>.onUnload()</code> hook functions (unless
<span class="option">--install=fake</span>).
</p>
</li>
<li> <p><code>prop.table(x)</code> now accepts a one-dimensional table for
<code>x</code>.
</p>
</li>
<li><p> A new function <code>vapply()</code> has been added, based on a
suggestion from Bill Dunlap.  It requires that a template for the
function value be specified, and uses it to determine the output
type and to check for consistency in the function values.
</p>
</li>
<li><p> The main HTML help page now links to a reformatted copy of
this &lsquo;<span class="file">NEWS</span>&rsquo; file.  (Suggested by Henrik Bengtsson.)  Package
index files link to the package &lsquo;<span class="file">DESCRIPTION</span>&rsquo; and
&lsquo;<span class="file">NEWS</span>&rsquo; files and a list of demos when using dynamic help.
</p>
</li>
<li><p> The <code>[</code> method for class <code>"AsIs"</code> allows the next
method to change the underlying class.  (Wish of Jens
Oehlschlägel.)
</p>
</li>
<li> <p><code>write.csv[2]</code> no longer allow argument <code>append</code>
to be changed: as ever, direct calls to <code>write.table()</code> give
more flexibility as well as more room for error.
</p>
</li>
<li><p> The index page for HTML help for a package now collapses
multiple signatures for S4 methods into a single entry.
</p>
</li>
<li><p> The use of <code>.required</code> by <code>require()</code> and
<code>detach()</code> has been replaced by <code>.Depends</code> which is set
from the <code>Depends</code> field of a package (even in packages with
namespaces).  By default <code>detach()</code> prevents such
dependencies from being detached: this can be overridden by the
argument <code>force</code>.
</p>
</li>
<li> <p><code>bquote()</code> has been extended to work on function
definitions.  (Wish of
<a href="https://bugs.R-project.org/show_bug.cgi?id=14031">PR#14031</a>).
</p>
</li>
<li> <p><code>detach()</code> when applied to an object other than a
package returns the environment that has been detached, to
parallel <code>attach()</code>.
</p>
</li>
<li> <p><code>readline()</code> in non-interactive use returns <code>""</code>
and does not attempt to read from the &lsquo;terminal&rsquo;.
</p>
</li>
<li><p> New function <code>file_ext()</code> in package <span class="pkg">tools</span>.
</p>
</li>
<li> <p><code>xtfrm()</code> is now primitive and internally generic, as
this allows S4 methods to be set on it without name-space scoping
issues.
</p>
<p>There are now <code>"AsIs"</code> and <code>"difftime"</code> methods, and
the default method uses <code>unclass(x)</code> if <code>is.numeric(x)</code>
is true (which will be faster but relies on <code>is.numeric()</code>
having been set correctly for the class).
</p>
</li>
<li> <p><code>is.numeric(x)</code> is now false for a <code>"difftime"</code>
object (multiplication and division make no sense for such
objects).
</p>
</li>
<li><p> The default method of <code>weighted.mean(x, w)</code> coerces
<code>w</code> to be numeric (aka double); previously only integer
weights were coerced.  Zero weights are handled specially so an
infinite value with zero weight does not force an <code>NaN</code>
result.
</p>
<p>There is now a <code>"difftime"</code> method.
</p>
</li>
<li> <p><code>bug.report()</code> now has arguments <code>package</code> and
<code>lib.loc</code> to generate bug reports about packages.  When
this is used, it looks for a <code>BugReports</code> field in the
package &lsquo;<span class="file">DESCRIPTION</span>&rsquo; file, which will be assumed to be a
URL at which to submit the report, and otherwise generates an
email to the package maintainer.  (Suggested by Barry
Rowlingson.)
</p>
</li>
<li> <p><code>quantile()</code> now has a method for the date-time class
<code>"POSIXt"</code>, and types 1 and 3 (which never interpolate) work
for Dates and ordered factors.
</p>
</li>
<li> <p><code>length(&lt;POSIXlt&gt;)</code> now returns the length of the
corresponding abstract timedate-vector rather than always 9 (the
length of the underlying list structure).  (Wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=14073">PR#14073</a>
and <a href="https://bugs.R-project.org/show_bug.cgi?id=10507">PR#10507</a>.)
</p>
</li>
<li><p> The <code>readline</code> completion backend no longer sorts
possible completions alphabetically (e.g., function argument
names) if <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> was built with <code>readline &gt;= 6</code>.
</p>
</li>
<li> <p><code>select.list()</code> gains a <code>graphics</code> argument to
allow Windows/Mac users to choose the text interface.  This
changes the behaviour of <code>new.packages(ask=TRUE)</code> to be like
<code>update.packages(ask=TRUE)</code> on those platforms in using a
text menu: use ask=<code>"graphics"</code> for a graphical menu.
</p>
</li>
<li><p> New function <code>chooseBioCmirror()</code> to set the
<code>"BioC_mirror"</code> option.
</p>
</li>
<li><p> The <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> grammar now prevents using the argument <code>name</code>
in signatures of S4 methods for <code>$</code> and <code>$&lt;-</code>, since
they will always be called with a character string value for
<code>name</code>.  The implicit S4 generic functions have been
changed to reflect this: packages which included <code>name</code> in
the signature of their methods need to be updated and
re-installed.
</p>
</li>
<li><p> The handling of the <code>method</code> argument of <code>glm()</code>
has been refined following suggestions by Ioannis Kosmidis and
Heather Turner.
</p>
</li>
<li> <p><code>str()</code> gains a new argument <code>list.len</code> with
default 99, limiting the number of <code>list()</code> items (per
level), thanks to suggestions from David Winsenius.
</p>
</li>
<li><p> Having formal arguments of an S4 method in a different order
from the generic is now an error (the warning having been
ignored by some package maintainers for a long time).
</p>
</li>
<li><p> New functions <code>enc2native()</code> and <code>enc2utf8()</code>
convert character vectors with possibly marked encodings to the
current locale and UTF-8 respectively.
</p>
</li>
<li><p> Unrecognized escapes and embedded nuls in character strings are
now an error, not just a warning.  Thus option <code>"warnEscapes"</code>
is no longer needed.  <code>rawToChar()</code> now removes trailing nuls
silently, but other embedded nuls become errors.
</p>
</li>
<li><p> Informational messages about masked objects displayed when a
package is attached are now more compact, using <code>strwrap()</code>
instead of one object per line.
</p>
</li>
<li> <p><code>print.rle()</code> gains argument <code>prefix</code>.
</p>
</li>
<li> <p><code>download.file()</code> gains a <code>"curl"</code> method, mainly
for use on platforms which have <code>curl</code> but not
<code>wget</code>, but also for some hard-to-access URLs.
</p>
</li>
<li><p> In <code>Rd</code>, <span class="samp">\eqn</span> and <span class="samp">\deqn</span> will render in
HTML (and convert to text) upper- and lower-case Greek letters
(entered as <span class="samp">\alpha</span> ...), <span class="samp">\ldots</span>, <span class="samp">\dots</span>,
<span class="samp">\ge</span> and <span class="samp">\le</span>.
</p>
</li>
<li> <p><code>utf8ToInt()</code> and <code>intToUtf8()</code> now map <code>NA</code> inputs
to <code>NA</code> outputs.
</p>
</li>
<li> <p><code>file()</code> has a new argument <code>raw</code> which may help
if it is used with something other than a regular file, e.g. a
character device.
</p>
</li>
<li><p> New function <code>strtoi()</code>, a wrapper for the C function
<code>strtol</code>.
</p>
</li>
<li> <p><code>as.octmode()</code> and <code>as.hexmode()</code> now allow inputs
of length other than one.
</p>
<p>The <code>format()</code> and <code>print()</code> methods for
<code>"octmode"</code> now preserve names and dimensions (as those for
<code>"hexmode"</code> did).
</p>
<p>The <code>format()</code> methods for classes <code>"octmode"</code> and
<code>"hexmode"</code> gain a <code>width</code> argument.
</p>
</li>
<li> <p><code>seq.int()</code> returns an integer result in some further cases
where <code>seq()</code> does, e.g. <code>seq.int(1L, 9L, by = 2L)</code>.
</p>
</li>
<li><p> Added <span class="samp">\subsection{}{}</span> macro to Rd syntax, for
subsections within sections.
</p>
</li>
<li><p> n-dimensional arrays with dimension names can now be indexed
by an n-column character matrix.  The indices are matched against
the dimension names.  <code>NA</code> indices are propagated to the
result.  Unmatched values and <code>""</code> are not allowed and
result in an error.
</p>
</li>
<li> <p><code>interaction(drop=TRUE)</code> uses less memory (related to
<a href="https://bugs.R-project.org/show_bug.cgi?id=14121">PR#14121</a>).
</p>
</li>
<li> <p><code>summary()</code> methods have been added to the
<code>"srcref"</code> and <code>"srcfile"</code> classes, and various
encoding issues have been cleaned up.
</p>
</li>
<li><p> If option <code>"checkPackageLicense"</code> is set to <code>TRUE</code> (not
currently the default), users will be asked to agree to
non-known-to-be-FOSS package licences at first use.
</p>
</li>
<li><p> Checking <code>setAs(a, b)</code> methods only gives a message
instead of a warning, when one of <code>a</code> or <code>b</code> is
unknown.
</p>
</li>
<li><p> New function <code>norm()</code> to compute a matrix norm.
<code>norm()</code> and also <code>backsolve()</code> and <code>sample()</code>
have implicit S4 generics.
</p>
</li>
<li><p> Files &lsquo;<span class="file">Renviron.site</span>&rsquo; and &lsquo;<span class="file">Rprofile.site</span>&rsquo; can have
architecture-specific versions on systems with sub-architectures.
</p>
</li>
<li> <p><code>R CMD check</code> now (by default) also checks Rd files
for auto-generated content in need of editing, and missing
argument descriptions.
</p>
</li>
<li> <p><code>aggregate()</code> gains a formula method thanks to a
contribution by Arni Magnusson.  The data frame method now allows
summary functions to return arbitrarily many values.
</p>
</li>
<li> <p><code>path.expand()</code> now propagates <code>NA</code> values rather
than converting them to <code>"NA"</code>.
</p>
</li>
<li> <p><code>file.show()</code> now disallows <code>NA</code> values for file names,
headers, and pager.
</p>
</li>
<li><p> The &lsquo;fuzz&rsquo; used by <code>seq()</code> and <code>seq.int()</code> has
been reduced from <code>1e-7</code> to <code>1e-10</code>, which should be
ample for the double-precision calculations used in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>.  It
ensures that the fuzz never comes into play with sequences of
integers (wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=14169">PR#14169</a>).
</p>
</li>
<li><p> The default value of <code>RSiteSearch(restrict=)</code> has been
changed to include vignettes but to exclude R-help.  The R-help
archives available have been split, with a new option of
<code>"Rhelp10"</code> for those from 2010.
</p>
</li>
<li><p> New function <code>rasterImage()</code> in the <code>graphics</code>
package for drawing raster images.
</p>
</li>
<li> <p><code>stats:::extractAIC.coxph()</code> now omits aliased terms
when computing the degrees of freedom (suggestion of Terry
Therneau).
</p>
</li>
<li> <p><code>cor()</code> and <code>cov()</code> now test for misuse with
non-numeric arguments, such as the non-bug report <a href="https://bugs.R-project.org/show_bug.cgi?id=14207">PR#14207</a>.
</p>
</li>
<li> <p><code>pchisq(ncp =, log.p = TRUE)</code> is more accurate for
probabilities near one.  E.g., <code>pchisq(80, 4, ncp=1,
       log.p=TRUE)</code>.  (Maybe what was meant in <a href="https://bugs.R-project.org/show_bug.cgi?id=14216">PR#14216</a>.)
</p>
</li>
<li> <p><code>maintainer()</code> has been added, to give convenient
access to the name of the maintainer of a package (contributed by
David Scott).
</p>
</li>
<li> <p><code>sample()</code> and <code>sample.int()</code> allow zero items to
be sampled from a zero-length input.  <code>sample.int()</code> gains a
default value <code>size=n</code> to be more similar to
<code>sample()</code>.
</p>
</li>
<li> <p><code>switch()</code> returned <code>NULL</code> on error (not
previously documented on the help page): it now does so
invisibly, analogously to if-without-else.
</p>
<p>It is now primitive: this means that argument <code>EXPR</code> is
always matched to the first argument and there is no danger of
partial matching to later named arguments.
</p>
</li>
<li><p> Primitive functions <code>UseMethod()</code>, <code>attr()</code>,
<code>attr&lt;-()</code>, <code>on.exit()</code>, <code>retracemem()</code> and
<code>substitute()</code> now use standard argument matching (rather
than positional matching).  This means that all multi-argument
primitives which are not internal now use standard argument
matching except where positional matching is desirable (as for
<code>switch()</code>, <code>call()</code>, <code>.C()</code> ...).
</p>
</li>
<li><p> All the one-argument primitives now check that any name
supplied for their first argument is a partial match to the
argument name as documented on the help page: this also
applies to replacement functions of two arguments.
</p>
</li>
<li> <p><code>base::which()</code> uses a new <code>.Internal</code> function
when <code>arr.ind</code> is <code>FALSE</code> resulting in a 10x speedup.
Thanks to Patrick Aboyoun for implementation suggestions.
</p>
</li>
<li><p> Help conversion to text now uses the first part of
<span class="samp">\enc{}{}</span> markup if it is representable in the current
output encoding.  On the other hand, conversion to LaTeX with the
default <code>outputEncoding = "ASCII"</code> uses the second part.
</p>
</li>
<li><p> A new class <code>"listOfMethods"</code> has been introduced to
represent the methods in a methods table, to replace the
deprecated class <code>"MethodsList"</code>.
</p>
</li>
<li> <p><code>any()</code> and <code>all()</code> return early if possible.
This may speed up operations on long vectors.
</p>
</li>
<li> <p><code>strptime()</code> now accepts <code>"%z"</code> (for the offset
from UTC in the RFC822 format of <code>+/-hhmm</code>).
</p>
</li>
<li><p> The PCRE library has been updated to version 8.02, a bug-fix
release which also updates tables to Unicode 5.02.
</p>
</li>
<li><p> Functions which may use a graphical <code>select.list()</code>
(including <code>menu()</code> and <code>install.packages()</code>) now check
on a Unix-alike that Tk can be started (and not just
<code>capabilities("tcltk") &amp;&amp; capabilities("X11")</code>).
</p>
</li>
<li><p> The parser no longer marks strings containing octal or hex
escapes as being in UTF-8 when entered in a UTF-8 locale.
</p>
</li>
<li><p> On platforms with cairo but not Pango (notably Mac OS X) the
initial default <code>X11()</code> type is set to <code>"Xlib"</code>: this avoids
several problems with font selection when done by cairo rather
than Pango (at least on Mac OS X).
</p>
</li>
<li><p> New function <code>arrayInd()</code> such that <code>which(x,
       arr.ind = TRUE)</code> for an array 'x' is now equivalent to
<code>arrayInd(which(x), dim(x), dimnames(x))</code>.
</p>
</li></ul>




<h4>DEPRECATED &amp; DEFUNCT</h4>


<ul>
<li><p> Bundles of packages are defunct.
</p>
</li>
<li> <p><code>stats::clearNames()</code> is defunct: use <code>unname()</code>.
</p>
</li>
<li><p> Basic regular expressions are defunct, and
<code>strsplit()</code>, <code>grep()</code>, <code>grepl()</code>, <code>sub()</code>,
<code>gsub()</code>, <code>regexpr()</code> and <code>gregexpr()</code> no longer
have an <code>extended</code> argument.
</p>
</li>
<li> <p><code>methods::trySilent()</code> is defunct.
</p>
</li>
<li> <p><code>index.search()</code> (which was deprecated in 2.10.0) is no
longer exported and has a different argument list.
</p>
</li>
<li><p> Use of multiple arguments to <code>return()</code> is now defunct.
</p>
</li>
<li><p> The use of <code>UseMethod()</code> with more than two arguments
is now defunct.
</p>
</li>
<li><p> In the <span class="pkg">methods</span> package, the <code>"MethodsList"</code>
metadata objects which had been superseded by hash tables
(environments) since <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.8.0 are being phased out.  Objects of
this class are no longer assigned or used as metadata by the
package.
</p>
<p><code>getMethods()</code> is now deprecated, with its internal use replaced
by <code>findMethods()</code> and other changes.  Creating objects from the
<code>"MethodsList"</code> class is also deprecated.
</p>
</li>
<li><p> Parsing strings containing both octal/hex and Unicode escapes
now gives a warning and will become an error in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.12.0.
</p>
</li></ul>




<h4>INSTALLATION</h4>


<ul>
<li><p> UTF-8 is now used for the reference manual and package
manuals.  This requires LaTeX &lsquo;2005/12/01&rsquo; or later.
</p>
</li>
<li> <p><code>configure</code> looks for a POSIX compliant
<code>tr</code>, Solaris's <code>/usr/ucb/tr</code> having been found
to cause <code>Rdiff</code> to malfunction.
</p>
</li>
<li> <p><code>configure</code> is now generated with <code>autoconf
       2.65</code>, which works better on recent systems and on Mac OS X.
</p>
</li></ul>




<h4>PACKAGE INSTALLATION</h4>


<ul>
<li><p> Characters in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> source which are not translatable to the
current locale are now handled more tolerantly:  these will be
converted to hex codes with a warning.  Such characters are
only really portable if they appear in comments.
</p>
</li>
<li> <p><code>R CMD INSTALL</code> now tests that the installed package
can be loaded (and backs out the installation if it cannot): this
can be suppressed by <span class="option">--no-test-load</span>.  This avoids
installing/updating a package that cannot be used: common causes
of failures to load are missing/incompatible external software
and missing/broken dependent packages.
</p>
</li>
<li><p> Package installation on Windows for a package with a
&lsquo;<span class="file">src</span>&rsquo; directory now checks if a DLL is created unless there
is a &lsquo;<span class="file">src/Makefile.win</span>&rsquo; file: this helps catch broken
installations where the toolchain has not reported problems in
building the DLL.  (Note: this can be any DLL, not just one named
&lsquo;<span class="file">&lt;pkg-name&gt;.dll</span>&rsquo;.)
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li><p> Using <code>with()</code>, <code>eval()</code> etc with a list with some
unnamed elements now works.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=14035">PR#14035</a>)
</p>
</li>
<li><p> The <code>"quick"</code> dispatch of S4 methods for primitive
functions was not happening, forcing a search each time.
(Dispatch for closures was not affected.)  A side effect is that
default values for arguments in a method that do not have
defaults in the generic will now be ignored.
</p>
</li>
<li><p> Trying to dispatch S4 methods for primitives during the search
for inherited methods slows that search down and potentially
could cause an infinite recursion.  An internal switch was
added to turn off all such methods from
<code>findInheritedMethods()</code>.
</p>
</li>
<li> <p><span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> framework installation (on Mac OS X) would not work
properly if a rogue <code>Resources</code> directory was present at the
top level.  Such a non-symlink will now be renamed to
<code>Resources.old</code> (and anything previously named
<code>Resources.old</code> removed) as part of the framework
installation process.
</p>
</li>
<li><p> The checks for conforming S4 method arguments could fail
when the signature of the generic function omitted some of the
formal arguments (in addition to <code>...</code>).  Arguments omitted
from the method definition but conforming (per the documentation)
should now be ignored (treated as <code>"ANY"</code>) in dispatching.
</p>
</li>
<li><p> The computations for S4 method evaluation when <code>...</code>
was in the signature could fail, treating <code>...</code> as an
ordinary symbol.  This has been fixed, for the known cases.
</p>
</li>
<li><p> Various <code>ar()</code> fitting methods have more protection for
singular fits.
</p>
</li>
<li> <p><code>callNextMethod</code> now works again with the <code>drop=</code>
argument in <span class="samp">[</span>
</p>
</li>
<li> <p><code>parse()</code> and <code>parse_Rd()</code> miscounted columns when
multibyte UTF-8 characters were present.
</p>
</li>
<li><p> Formatting of help pages has had minor improvements: extra
blank lines have been removed from the text format, and empty
package labels removed from HTML.
</p>
</li>
<li> <p><code>cor(A, B)</code> where <code>A</code> is <i>n x 1</i>
and <code>B</code> a 1-dimensional array segfaulted or gave an internal
error.  (The case <code>cor(B, A)</code> was
<a href="https://bugs.R-project.org/show_bug.cgi?id=7116">PR#7116</a>.)
</p>
</li>
<li> <p><code>cut.POSIXt()</code> applied to a start value after the DST
transition on a DST-change day could give the wrong time for
argument <code>breaks</code> in units of days or longer.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14208">PR#14208</a>)
</p>
</li>
<li> <p><code>do_par()</code> <code>UNPROTECT</code>ed too early  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14214">PR#14214</a>)
</p>
</li>
<li><p> Subassignment <code>x[[....]] &lt;- y</code> didn't check for a
zero-length right hand side, and inserted a rubbish
value.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14217">PR#14217</a>)
</p>
</li>
<li> <p><code>fisher.test()</code> no longer gives a P-value <strong>very</strong>
slightly &gt; 1, in some borderline cases.
</p>
</li>
<li><p> Internal function <code>matchArgs()</code> no longer modifies the
general purpose bits of the <code>SEXP</code>s that make up the formals
list of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> functions.  This fixes an invalid error message that
would occur when a garbage collection triggered a second call to
<code>matchArgs</code> for the same function <em>via</em> a finalizer.
</p>
</li>
<li> <p><code>gsub()</code> in 2.10.x could fail from stack overflow for
extremely long strings due to temporary data being allocated on
the stack.  Also, <code>gsub()</code> with <code>fixed=TRUE</code> is in some
circumstances considerably faster.
</p>
</li>
<li><p> Several primitives, including <code>attributes()</code>,
<code>attr&lt;-()</code> <code>interactive()</code>, <code>nargs()</code> and
<code>proc.time()</code>, did not check that they were called with the
correct number of arguments.
</p>
</li>
<li><p> A potential race condition in <code>list.files()</code> when other
processes are operating on the directory has been fixed; the code
now dynamically allocates memory for file listings in a single
pass instead of making an initial count pass.
</p>
</li>
<li> <p><code>mean(x, trim=, na.rm = FALSE)</code> failed to return <code>NA</code> if
<code>x</code> contained missing values.  (Reported by Bill Dunlap.)
</p>
</li>
<li><p> Extreme tail behavior of, <code>pbeta()</code> {and hence
<code>pf()</code>}, e.g., <code>pbeta(x, 3, 2200, lower.tail=FALSE,
       log.p=TRUE)</code> now returns finite values instead of jumping to
<code>-Inf</code> too early.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14230">PR#14230</a>).
</p>
</li>
<li> <p><code>parse(text=x)</code> misbehaved for objects <code>x</code> that
were not coerced internally to character, notably symbols.
(Reported to R-devel by Bill Dunlap.)
</p>
</li>
<li><p> The internal C function <code>coerceSymbol</code> now handles
coercion to character, and warns if coercion fails (rather than
silently returning <code>NULL</code>).  This allows a name to be given
where a character vector is required in functions which coerce
internally.
</p>
</li>
<li><p> The interpretation by <code>strptime()</code> of <code>"%c"</code> was
non-standard (not that it is ever advisable to use locale- and
system-specific input formats).
</p>
</li>
<li><p> capabilities(<code>"X11"</code>) now works the same way on Mac OS X as on
other platforms (and as documented: it was always true for R
built with <span class="option">--with-aqua</span>, as the CRAN builds are).
</p>
</li>
<li><p> The <code>X11()</code> device with cairo but not Pango (notably Mac OS X)
now checks validity of text strings in UTF-8 locales (since
Pango does but cairo it seems does not).
</p>
</li>
<li> <p><code>read.fwf()</code> misread multi-line records when n was specified.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=14241">PR#14241</a>)
</p>
</li>
<li> <p><code>all.equal(tolerance = e)</code> passes the numeric
tolerance also to the comparison of the attributes.
</p>
</li>
<li> <p><code>pgamma(0, 0)</code>, a boundary case, now returns 0, its
limit from the left, rather than the limit from the right.
</p>
</li>
<li><p> Issuing <code>POST</code> requests to the internal web server could stall
the request under certain circumstances.
</p>
</li>
<li> <p><code>gzcon( &lt;textConnection&gt; )</code>, an error, no longer
damages the connection (in a way to have it
segfault).  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14237">PR#14237</a>)
</p>
</li>
<li><p> All the results from <code>hist()</code> now use the nominal
<code>breaks</code> not those adjusted by the numeric &lsquo;fuzz&rsquo;:
in recent versions the nominal <code>breaks</code> were reported but
the 'density' referred to the intervals used in the calculation
&ndash; which mattered very slightly for one of the extreme bins.
(Based on a report by Martin Becker.)
</p>
</li>
<li><p> If <code>xy[z].coords</code> (used internally by many graphics
functions) are given a list as <code>x</code>, they now check that
the list has suitable names and give a more informative error
message.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=13936">PR#13936</a>)
</p>
</li></ul>




<h3><img class="toplogo" src="../help/figures/../../html/Rlogo.svg" alt="[R logo]" /> CHANGES IN R VERSION 2.10.1 patched</h3>



<h4>NEW FEATURES</h4>


<ul>
<li><p> The handling of line textures in the <code>postscript()</code> and
<code>pdf()</code> devices was set up for round end caps (the only type
which existed at the time): it has now been adjusted for butt
endcaps.
</p>
</li>
<li> <p><code>lchoose(a, k)</code> is now defined as
<code>log(abs(choose(a,k)))</code>, analogously to <code>lfactorial()</code>.
</p>
</li>
<li><p> Although <code>\eqn{}</code> in Rd files is defined as a
&lsquo;verbatim&rsquo; macro, many packages expected <code>\dots</code> and
<code>\ldots</code> to be interpreted there (as was the case in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> &lt;
2.10.0), so this is now done (using an ellipsis in HTML
rendering).
</p>
</li>
<li><p> Escaping of braces in quoted strings in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>-code sections of
Rd files is allowed again.  This had been changed for the new Rd
format in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.10.0 but was only documented on the developer site
and was handled inconsistently by the converters: text and
example conversion removed the escapes but HTML conversion did
not.
</p>
</li>
<li><p> The PCRE library has been updated to version 8.01, a bug-fix
release.
</p>
</li>
<li> <p><code>tools::readNEWS()</code> now accepts a digit as the first
character of a news section.
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li><p> Using <code>read.table(header=TRUE)</code> on a header with an
embedded new line would copy part of the header into the data.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=14103">PR#14103</a>)
</p>
</li>
<li> <p><code>qpois(p = 1, lambda = 0)</code> now gives 0 as for all other
<code>p</code>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14135">PR#14135</a>)
</p>
</li>
<li><p> Functions related to string comparison
(e.g., <code>unique()</code>, <code>match()</code>) could cause crashes when
used with strings not in the native encoding, e.g., UTF-8 strings
on Windows.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14114">PR#14114</a> and <a href="https://bugs.R-project.org/show_bug.cgi?id=14125">PR#14125</a>)
</p>
</li>
<li> <p><code>x[ , drop=TRUE]</code> dropped an <code>NA</code> level even if it
was in use.
</p>
</li>
<li><p> The dynamic HTML help system reported the wrong MIME type
for the style sheet.
</p>
</li>
<li> <p><code>tools::codoc()</code> (used by <code>R CMD check</code>) was
missing cases where the function had no arguments but was
documented to have some.
</p>
</li>
<li><p> Help links containing special characters (e.g., <code>"?"</code>)
were not generated correctly when rendered in
HTML.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14155">PR#14155</a>)
</p>
</li>
<li> <p><code>lchoose(a, k)</code> no longer wrongly gives <code>NaN</code> for
negative <code>a</code>.
</p>
</li>
<li> <p><code>ks.test()</code> could give a p-value that was off by one
observation due to rounding error.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14145">PR#14145</a>)
</p>
</li>
<li> <p><code>readBin()</code>/<code>readChar()</code> when reading millions of
character strings in a single call used excessive amounts of
memory (which also slowed them down).
</p>
</li>
<li> <p><code>R CMD SHLIB</code> could fail if used with paths that
were not alphanumeric, e.g. contained <code>+</code>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14168">PR#14168</a>)
</p>
</li>
<li> <p><code>sprintf()</code> was not re-entrant, which potentially
caused problems if an <code>as.character()</code> method called it.
</p>
</li>
<li><p> The <code>quartz()</code> device did not restore the clipping
region when filling the background for a new page.  This could be
observed in multi-page bitmap output as stale outer regions of
the plot.
</p>
</li>
<li> <p><code>p.adjust(method, n)</code> now works correctly for the
rare case <code>n &gt; length(p)</code>, also when method differs from
<code>"bonferroni"</code> or <code>"none"</code>, thanks to a patch from
Gordon Smyth.
</p>
</li>
<li> <p><code>tools::showNonASCII()</code> failed to detect non-ASCII characters
if <code>iconv()</code> (incorrectly) converted them to different ASCII
characters.  (Seen on Windows only.)
</p>
</li>
<li> <p><code>tcrossprod()</code> wrongly failed in some cases when one of the
arguments was a vector and the other a matrix.
</p>
</li>
<li> <p><code>[cr]bind(..., deparse.level=2)</code> was not always giving
names when documented to do so.  (Discovered whilst investigating
<a href="https://bugs.R-project.org/show_bug.cgi?id=14189">PR#14189</a>.)
</p>
</li>
<li> <p><code>match(incomparables=&lt;non-NULL&gt;)</code> could in rare cases
infinite-loop.
</p>
</li>
<li> <p><code>poisson.test()</code> needed to pass argument
<code>conf.level</code> to <code>binom.test()</code>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14195">PR#14195</a>)
</p>
</li>
<li><p> The <code>"nls"</code> method for <code>df.residual()</code> gave
incorrect results for models fitted with <code>na.action =
       na.exclude</code>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14194">PR#14194</a>)
</p>
</li>
<li><p> A change to <code>options(scipen=)</code> was only implemented
when printing next occurred, even though it should have affected
intervening calls to <code>axis()</code>, <code>contour()</code> and
<code>filledcontour()</code>.
</p>
</li>
<li> <p><code>prettyNum(drop0trailing=TRUE)</code> did not handle signs of
imaginary parts of complex numbers correctly (and this was used
by <code>str()</code>: <a href="https://bugs.R-project.org/show_bug.cgi?id=14201">PR#14201</a>).
</p>
</li>
<li> <p><code>system.time()</code> had the <code>sys.child</code> component
wrong (copied <code>user.child</code> instead) on systems with
<code>HAVE_GETRUSAGE</code>.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=14210">PR#14210</a>)
</p>
</li>
<li><p> Changing both line texture and line cap (end) resulted in the
latter to be omitted form the PDF code.  In addition, line cap
(end) and join are now set explicitly in PDF output to ensure
correct defaults.
</p>
</li>
<li><p> The suppression of auto-rotation in <code>bitmap()</code> and
<code>dev2bitmap()</code> with the <code>"pdfwrite"</code> device was not
working correctly.
</p>
</li>
<li> <p><code>plot(ecdf(), log="x")</code> no longer gives an incorrect
warning.
</p>
</li>
<li> <p><code>read.fwf()</code> works again when argument <code>file</code> is
a connection.
</p>
</li>
<li><p> Startup files will now be found if their paths exceed 255
bytes.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14228">PR#14228</a>)
</p>
</li>
<li> <p><code>contrasts&lt;-</code> (in the <span class="pkg">stats</span> package) no longer has an
undeclared dependence on <span class="pkg">methods</span> (introduced in 2.10.0).
</p>
</li></ul>




<h3><img class="toplogo" src="../help/figures/../../html/Rlogo.svg" alt="[R logo]" /> CHANGES IN R VERSION 2.10.1</h3>



<h4>NEW FEATURES</h4>


<ul>
<li><p> The PCRE library has been updated to version 8.00.
</p>
</li>
<li> <p><code>R CMD INSTALL</code> has new options <span class="option">--no-R</span>,
<span class="option">--no-libs</span>, <span class="option">--no-data</span>, <span class="option">--no-help</span>,
<span class="option">--no-demo</span>, <span class="option">--no-exec</span>, and <span class="option">--no-inst</span> to
suppress installation of the specified part of the package.
These are intended for special purposes (e.g., building a database
of help pages without fully installing all packages).
</p>
</li>
<li><p> The documented line-length limit of 4095 bytes when reading
from the console now also applies also to <code>parse(file="")</code>
(which previously had a limit of around 1024 bytes).
</p>
</li>
<li><p> A Bioconductor mirror can be set for use by
<code>setRepositories()</code> <em>via</em> the option <code>"BioC_mirror"</code>,
e.g. the European mirror can be selected by
<code>options(BioC_mirror="http://bioconductor.statistik.tu-dortmund.de")</code>.
</p>
</li>
<li><p> Double-clicking in a <code>tk_select.list()</code> list box now
selects the item and closes the list box (as happens on the
Windows <code>select.list()</code> widget).
</p>
</li></ul>




<h4>INSTALLATION</h4>


<ul>
<li> <p><code>configure</code> will be able to find a usable
<code>libtiff</code> in some rare circumstances where it did not
previously (where <code>libtiff</code> needed to be linked explicitly against
<code>-ljpeg</code>).
</p>
</li>
<li><p> Making <code>refman.pdf</code> works around a problem with the indexing
with <code>hyperref 6.79d</code> and later.
</p>
</li></ul>




<h4>DEPRECATED &amp; DEFUNCT</h4>


<ul>
<li><p> The <code>extended</code> argument is deprecated in
<code>strsplit()</code>, <code>grep()</code>, <code>grepl()</code>, <code>sub()</code>,
<code>gsub()</code>, <code>regexpr()</code> and <code>gregexpr()</code> (not just
the value <code>extended = FALSE</code>) and will be removed in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>
2.11.0.
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li> <p><code>trigamma(x)</code> and other <code>psigamma(x, n)</code> calls
are now accurate for very large <code>abs(x)</code>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14020">PR#14020</a>)
</p>
</li>
<li> <p><code>[g]sub(perl=FALSE, fixed=FALSE)</code> could use excessive
stack space when used with a very long vector containing some
non-ASCII strings.
</p>
</li>
<li><p> The default method of <code>weighted.mean(na.rm = TRUE)</code>
did not omit weights for <code>NA</code> observations in 2.10.0.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=14032">PR#14032</a>)
</p>
</li>
<li> <p><code>[g]regexpr(pattern, fixed = TRUE)</code> returned match
positions in bytes (not characters) in an MBCS locale if
<code>pattern</code> was a single byte.
</p>
<p><code>[g]sub(fixed = TRUE)</code> with a single-byte pattern could
conceivably have matched part of a multibyte character in a
non-UTF-8 MBCS.
</p>
</li>
<li> <p><code>findLineNum()</code> and <code>setBreakpoint()</code> would
sometimes fail if the specified file was not in the current
directory.
</p>
</li>
<li><p> Package <span class="pkg">tcltk</span>'s <code>demo(tkdensity)</code> was broken in
2.9.0 when <code>demo()</code> was changed to set <code>par(ask = TRUE)</code>.
</p>
</li>
<li> <p><code>gsub()</code> with backrefs could fail on extremely long strings
(hundreds of thousands of characters) due to integer overflow
in a length calculation.
</p>
</li>
<li> <p><code>abline(untf=TRUE)</code> now uses a better x-grid in
log-scale, e.g., for <code>plot(c(1,300), c(1,300), log="xy");
	abline(4,1, untf=TRUE)</code>.
</p>
</li>
<li> <p><code>detach()</code>/<code>unloadNamespace()</code> arrange to flush
the package's lazyload cache of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> objects once the
package/namespace is no longer needed.
</p>
</li>
<li><p> There have been small fixes to the rendering of help,
e.g. <code>\command</code> is now rendered verbatim
(so e.g. <code>--</code> is not interpreted, <a href="https://bugs.R-project.org/show_bug.cgi?id=14045">PR#14045</a>).
</p>
<p>Also, there are many small changes to help files where the new
converters were not rendering them in the same way as before.
</p>
</li>
<li> <p><code>available.packages()</code> would fail when run on a
repository with no packages meeting the filtering conditions.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=14042">PR#14042</a>)
</p>
</li>
<li> <p><code>rep(x, times, each = 2)</code> gave invalid results when the
<code>times</code> argument was a vector longer than <code>x</code>.
Reported by Bill Dunlap.
</p>
</li>
<li><p> An error when <code>unloadNamespace()</code> attempted to run the
<code>.onUnload()</code> function gave an error in the reporting
function and so was not reported properly.
</p>
</li>
<li><p> Text help rendering did not handle very long input lines
properly.
</p>
</li>
<li> <p><code>promptMethods()</code> generated signature documentation
improperly.
</p>
</li>
<li> <p><code>pgamma(x, a, lower.tail=FALSE)</code> and
<code>qgamma(...)</code> are now considerably more accurate in some
regions for very small <code>a</code>.  <code>qgamma()</code> now correctly
returns <code>0</code> instead of <code>NaN</code> in similar extreme cases,
and <code>qgamma()</code> no longer warns in the case of small
<code>a</code>, see (<a href="https://bugs.R-project.org/show_bug.cgi?id=12324">PR#12324</a>).
</p>
</li>
<li> <p><code>unname()</code> now also removes names from a zero length vector.
</p>
</li>
<li><p> Printing results from <code>ls.str()</code> no longer evaluates
unevaluated calls.
</p>
</li>
<li> <p><code>complete.cases()</code> failed on a 0-column data frame
argument.  (Underlies <a href="https://bugs.R-project.org/show_bug.cgi?id=14066">PR#14066</a>.)
</p>
<p>It could return nonsensical results if no input determined the
number of cases (seen in the no-segfault tests).
</p>
</li>
<li><p> An error in <code>nls()</code> with a long formula could cause a
segfault.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14059">PR#14059</a>)
</p>
</li>
<li> <p><code>qchisq(p, df, ncp, lower.tail = FALSE)</code> with
<code>ncp &gt;= 80</code> was inaccurate for small <code>p</code> (as the help page
said): it is now less inaccurate.  (In part,
<a href="https://bugs.R-project.org/show_bug.cgi?id=13999">PR#13999</a>.)
</p>
<p>For <code>ncp</code> less than but close to 80, <code>pchisq()</code> and
<code>qchisq()</code> are more accurate for probabilities very close
to 1 (a series expansion was truncated slightly too early).
</p>
<p><code>pchisq(x, df, ncp)</code> can no longer return values just larger
than one for large values of <code>ncp</code>.
</p>
</li>
<li> <p><code>intToUtf8()</code> could fail when asked to produce 10Mb or more
strings, something it was never intended to do: unfortunately
Windows crashed <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> (other OSes reported a lack of resources).
(<a href="https://bugs.R-project.org/show_bug.cgi?id=14068">PR#14068</a>)
</p>
</li>
<li> <p><code>chisq.test()</code> could fail when given argument
<code>x</code> or <code>y</code> which deparsed to more than one line.
(Reported by Laurent Gauthier.)
</p>
</li>
<li><p> S4 methods are uncached whenever the namespace containing
them is unloaded (by <code>unloadNamespace()</code> as well as by
<code>detach(unload = TRUE))</code>.
</p>
</li>
<li><p> The internal record-keeping by
<code>dyn.load</code>/<code>dyn.unload</code> was incomplete, which could
crash <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> if a DLL that registered <code>.External</code> routines had
earlier been unloaded.
</p>
</li>
<li> <p><code>bessel[JY](x, nu)</code> with <code>nu</code> a negative integer (a
singular case) is now correct, analogously to <code>besselI()</code>,
see <a href="https://bugs.R-project.org/show_bug.cgi?id=13556">PR#13556</a>.
</p>
</li>
<li> <p><code>tools::file_path_as_absolute()</code> doubled the file
separator when applied to a file such as &lsquo;<span class="file">&quot;/vmunix&quot;</span>&rsquo; or (on
Windows) &lsquo;<span class="file">&quot;d:/afile&quot;</span>&rsquo; in a directory for which
<code>getwd()</code> would return a path with a trailing separator
(largely cosmetic, as reasonable file systems handle such a path
correctly).  (Perhaps what was meant by <a href="https://bugs.R-project.org/show_bug.cgi?id=14078">PR#14078</a>.)
</p>
</li>
<li> <p><code>unsplit(drop = TRUE)</code> applied to a data frame failed
to pass <code>drop</code> to the computation of row names.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14084">PR#14084</a>)
</p>
</li>
<li><p> The <code>"difftime"</code> method of <code>mean()</code> ignored its
<code>na.rm</code> argument.
</p>
</li>
<li> <p><code>tcltk::tk_select.list()</code> is now more likely to remove the
widget immediately after selection is complete.
</p>
</li>
<li><p> Adding/subtracting a <code>"difftime"</code> object to/from a
<code>"POSIXt"</code> or <code>"Date"</code> object works again (it was
broken by the addition of <code>Ops.difftime</code>).
</p>
</li>
<li><p> Conversion to latex of an Rd file with no aliases failed.
</p>
</li>
<li> <p><code>wilcox.test(conf.int=TRUE)</code> has achieved.level
corrected and, for <code>exact=FALSE</code>, now returns a
<code>estimate</code> component which does not depend on the
alternative used.
</p>
</li>
<li> <p><code>help.search()</code> failed when the package argument was
specified.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14113">PR#14113</a>)
</p>
</li>
<li> <p><code>switch(EXPR = "A")</code> now returns <code>NULL</code>, as does
<code>switch(1)</code> (which used to signal an error).
</p>
</li></ul>




<h3><img class="toplogo" src="../help/figures/../../html/Rlogo.svg" alt="[R logo]" /> CHANGES IN R VERSION 2.10.0</h3>



<h4>SIGNIFICANT USER-VISIBLE CHANGES</h4>


<ul>
<li><p> Package help is now converted from <code>Rd</code> by the <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>-based
converters that were first introduced in 2.9.0.  This means
</p>

<ul>
<li><p> Packages that were installed by R-devel after 2009-08-09
should not be used with earlier versions of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>, and most
aspects of package help (including the runnable examples)
will be missing if they are so used.
</p>
</li>
<li><p> Text, HTML and latex help and examples for packages
installed under the new system are converted on-demand from
stored parsed Rd files.  (Conversions stored in packages
installed under <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> &lt; 2.10.0 are used if no parsed Rd files
are found.  It is recommended that such packages be
re-installed.)
</p>
</li></ul>

</li>
<li><p> HTML help is now generated dynamically using an HTTP server
running in the <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> process and listening on the loopback
interface.
</p>

<ul>
<li><p> Those worried about security implications of such
a server can disable it by setting the environment variable
<span class="env">R_DISABLE_HTTPD</span> to a non-empty value.  This disables
<code>help.start()</code> and HTML help (so text help is shown
instead).
</p>
</li>
<li><p> The Java/Javascript search engine has been replaced by an
HTML interface to <code>help.search()</code>.  <code>help.start()</code> no
longer has an argument <code>searchEngine</code> as it is no longer
needed.
</p>
</li>
<li><p> The HTML help can now locate cross-references of the form
<code>\link[pkg]{foo}</code> and <code>\link[pkg:foo]{bar}</code>
where <code>foo</code> is an alias in the package, rather than the
documented (basename of a) filename (since the documentation
has been much ignored).
</p>
</li></ul>

</li></ul>




<h4>NEW FEATURES</h4>


<ul>
<li> <p><code>polygon()</code>, <code>pdf()</code> and <code>postscript()</code> now
have an argument <code>fillOddEven</code> (default <code>FALSE</code>),
which controls the mode used for polygon fills of
self-intersecting shapes.
</p>
</li>
<li><p> New <code>debugonce()</code> function; further,
<code>getOption("deparse.max.lines")</code> is now observed when
debugging, from a code suggestion by John Brzustowski.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=13647">PR#13647</a>/8)
</p>
</li>
<li> <p><code>plot()</code> methods for <code>"stepfun"</code> and hence
<code>"ecdf"</code> no longer plot points by default for <code>n &gt;= 1000</code>.
</p>
</li>
<li> <p><code>[g]sub(perl=TRUE)</code> now also supports <code>"\E"</code>
in order to <strong>end</strong> <code>"\U"</code> and <code>"\L"</code> case changes,
thanks to a patch from Bill Dunlap.
</p>
</li>
<li> <p><code>factor()</code>, <code>levels()&lt;-</code>, etc, now ensure that
the resulting factor levels are unique (as was always the implied
intention).  Factors with duplicated levels are still
constructible by low-level means, but are now declared illegal.
</p>
</li>
<li><p> New <code>print()</code> (S3) method for class <code>"function"</code>,
also used for auto-printing.  Further, <code>.Primitive</code>
functions now print and auto-print identically.  The new method
is based on code suggestions by Romain François.
</p>
</li>
<li><p> The <code>print()</code> and <code>toLatex()</code> methods for class
<code>"sessionInfo"</code> now show the locale in a nicer format and
have arguments to suppress locale information.
</p>
</li>
<li><p> In addition to previously only <code>round()</code>, there are
other <code>Math</code> group (S3) methods for <code>"difftime"</code>,
such as <code>floor()</code>, <code>signif()</code>, <code>abs()</code>, etc.
</p>
</li>
<li><p> For completeness, <code>old.packages()</code> and
<code>available.packages()</code> allow arguments <code>type</code> to be
specified (you could always specify arguments <code>available</code>
or <code>contriburl</code>).
</p>
</li>
<li> <p><code>available.packages()</code> by default only returns
information on the latest versions of packages whose version
requirements are satisfied by the currently running <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>.
</p>
</li>
<li> <p><code>tools::write_PACKAGES()</code> has a new argument
<code>latestOnly</code>, which defaults to <code>TRUE</code> when only the
latest versions in the repository will be listed in the index.
</p>
</li>
<li> <p><code>getOption()</code> has a new argument <code>default</code> that
is returned if the specified option is not set.  This simplifies
querying a value and checking whether it is <code>NULL</code> or not.
</p>
</li>
<li> <p><code>parse()</code> now warns if the requested encoding is not supported.
</p>
</li>
<li><p> The <code>"table"</code> method of <code>as.data.frame()</code> gains a
<code>stringsAsFactors</code> argument to allow the classifying
factors to be returned as character vectors rather than the
default factor type.
</p>
</li>
<li><p> If <code>model.frame.default()</code> encounters a character
variable where <code>xlev</code> indicates a factor, it now converts
the variable to a factor (with a warning).
</p>
</li>
<li> <p><code>curve()</code> now returns a list containing the points that
w§ere drawn.
</p>
</li>
<li> <p><code>spineplot()</code> now accepts <code>axes = FALSE</code>, for
consistency with other functions called by <code>plot.factor()</code>.
</p>
</li>
<li><p> The Kendall and Spearman methods of <code>cor.test()</code> can
optionally use continuity correction when not computing exact
p-values.  (The Kendall case is the wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=13691">PR#13691</a>.)
</p>
</li>
<li> <p><span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> now keeps track of line numbers during execution for code
sourced with <code>options(keep.source = TRUE)</code>.  The source
reference is displayed by debugging functions such as
<code>traceback()</code>, <code>browser()</code>, <code>recover()</code>, and
<code>dump.frames()</code>, and is stored as an attribute on each
element returned by <code>sys.calls()</code>.
</p>
</li>
<li><p> More functions now have an implicit (S4) generic definition.
</p>
</li>
<li> <p><code>quantile.default()</code> now disallows factors (wish of
<a href="https://bugs.R-project.org/show_bug.cgi?id=13631">PR#13631</a>) and its help
documents what numeric-like properties its input need to have to
work correctly.
</p>
</li>
<li> <p><code>weighted.mean()</code> is now generic and has <code>"Date"</code>,
<code>"POSIXct"</code> and <code>"POSIXlt"</code> methods.
</p>
</li>
<li><p> Naming subscripts (e.g., <code>x[i=1, j=2]</code>) in
<code>data.frame</code> methods for <code>[</code> and <code>[[</code> now gives a
warning.  (Names are ignored in the default method, but could
have odd semantics for other methods, and do for the data.frame
ones.)
</p>
</li>
<li> <p><code>as.data.frame()</code> has an <code>"aovproj"</code> method.
(Wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=13505">PR#13505</a>)
</p>
</li>
<li> <p><code>as.character(x)</code> for numeric <code>x</code> no longer
produces strings such as <code>"0.30"</code>, i.e., with trailing
zeros.  This change also renders levels construction in
<code>factor()</code> more consistent.
</p>
</li>
<li> <p><code>codocClasses()</code>, which checks consistency of the
documentation of S4 class slots, now does so in considerably more
cases.  The documentation of inherited slots (from superclasses)
is now optional.  This affects <code>R CMD check &lt;pkg&gt;</code> when
the package defines S4 classes.
</p>
</li>
<li> <p><code>codoc()</code> now also checks S4 methods for code/documentation
mismatches.
</p>
</li>
<li> <p><code>for()</code>, <code>while()</code>, and <code>repeat()</code> loops now
always return NULL as their (invisible) value.  This change was
needed to address a reference counting bug without creating
performance penalties for some common use cases.
</p>
</li>
<li><p> The <code>print()</code> method for <code>ls.str()</code> results now
obeys an optional <code>digits</code> argument.
</p>
</li>
<li><p> The <code>method</code> argument of <code>glm()</code> now allows
user-contributed methods.
</p>
</li>
<li><p> More general <code>reorder.default()</code> replaces functionality of
<code>reorder.factor()</code> and <code>reorder.character()</code>.
</p>
</li>
<li><p> The function <code>aspell()</code> has been added to provide an
interface to the <code>Aspell</code> spell-checker.
</p>
</li>
<li><p> Filters <code>RdTextFilter()</code> and <code>SweaveTeXFilter()</code>
have been added to the tools package to provide support for
<code>aspell()</code> or other spell checkers.
</p>
</li>
<li> <p><code>xtabs()</code> with the new argument <code>sparse = TRUE</code>
now returns a sparse Matrix, using package <a href="https://CRAN.R-project.org/package=Matrix"><span class="pkg">Matrix</span></a>.
</p>
</li>
<li> <p><code>contr.sum()</code> etc gain an argument <code>sparse</code>
which allows sparse matrices to be returned.
</p>
<p><code>contrasts()</code> also gains a <code>sparse</code> argument which it
passes to the actual contrast function if that has a formal
argument <code>sparse</code>.
</p>
<p><code>contrasts(f, .) &lt;- val</code> now also works when <code>val</code>
is a sparse Matrix.  It is planned that <code>model.matrix()</code>
will work with such factors <code>f</code> in the future.
</p>
</li>
<li> <p><code>readNEWS()</code> will recognize a UTF-8 byte-order mark
(BOM) in the &lsquo;<span class="file">NEWS</span>&rsquo; file.  However, it is safer to use only
ASCII code there because not all editors recognize BOMs.
</p>
</li>
<li><p> New utility function <code>inheritedSlotNames()</code> for S4
class programming.
</p>
</li>
<li> <p><code>tabulate()</code> now allows NAs to pass through (and be ignored).
</p>
</li>
<li><p> If <code>debug()</code> is called on an S3 generic function then
all methods are debugged as well.
</p>
</li>
<li><p> Outlier symbols drawn by <code>boxplot()</code> now obey the
<code>outlwd</code> argument.  Reported by Jurgen Kluge.
</p>
</li>
<li> <p><code>svd(x)</code> and <code>eigen(x)</code> now behave analogously to
<code>qr(x)</code> in accepting logical matrices <code>x</code>.
</p>
</li>
<li><p> File &lsquo;<span class="file">NEWS</span>&rsquo; is now in UTF-8, and has a BOM (often
invisible) on the first line, and <code>Emacs</code> local variables
set for UTF-8 at the end.  <code>RShowDoc("NEWS")</code> should display
this correctly, given suitable fonts.
</p>
</li>
<li> <p><code>terms.formula(simplify = TRUE)</code> now does not deparse
the LHS and so preserves non-standard responses such as <code>`a:
       b`</code> (requested by Sundar Dorai-Raj).
</p>
</li>
<li><p> New function <code>news()</code> for building and querying <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> or
package news information.
</p>
</li>
<li> <p><code>z^n</code> for integer <code>n</code> and complex <code>z</code> is more
accurate now if <code>|n| &lt;= 65536</code>.
</p>
</li>
<li> <p><code>factor(NULL)</code> now returns the same as
<code>factor(character(0))</code> instead of an error, and
<code>table(NULL)</code> consequently does analogously.
</p>
</li>
<li> <p><code>as.data.frame.vector()</code> (and its copies) is slightly faster
by avoiding a copy if there are no names (following a
suggestion of Tim Hesterberg).
</p>
</li>
<li> <p><code>writeLines()</code>, <code>writeBin()</code> and
<code>writeChar()</code> have a new argument <code>useBytes</code>.  If
false, character strings with marked encodings are translated to
the current locale (as before) but if true they are written
byte-by-byte.
</p>
</li>
<li> <p><code>iconv()</code> has a new argument <code>mark</code> which can be
used (by experts) to suppress the declaration of encodings.
</p>
</li>
<li> <p>&lsquo;<span class="file">DESCRIPTION</span>&rsquo; file's <code>LinkingTo</code> specs are now
recognized as installation dependencies, and included in package
management computations.
</p>
</li>
<li><p> Standardized &lsquo;<span class="file">DESCRIPTION</span>&rsquo; file <code>License</code> specs
are now available for package management computations.
</p>
</li>
<li> <p><code>"\uxxxx"</code> and <code>"\Uxxxxxxxx"</code> escapes can now be
parsed to a UTF-8 encoded string even in non-UTF-8 locales (this
has been implemented on Windows since <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.7.0).  The semantics
have been changed slightly: a string containing such escapes is
always stored in UTF-8 (and hence is suitable for portably
including Unicode text in packages).
</p>
</li>
<li><p> New <code>as.raw()</code> method for <code>"tclObj"</code> objects (wish
of <a href="https://bugs.R-project.org/show_bug.cgi?id=13758">PR#13758</a>).
</p>
</li>
<li> <p><code>Rd.sty</code> now makes a better job of setting email addresses,
including using a monospaced font.
</p>
</li>
<li> <p><code>textConnection()</code> gains an <code>encoding</code> argument
to determine how input strings with marked encodings will be
handled.
</p>
</li>
<li> <p><code>R CMD Rd2pdf</code> is available as a shortcut for
<code>R CMD Rd2dvi --pdf</code>.
</p>
</li>
<li> <p><code>R CMD check</code> now checks links where a package is
specified (<code>\link[pkg]{file}</code> or
<code>\link[pkg:file]{topic}</code>), if the package is available.
It notes if the package is not available, as in many cases this
is an error in the link.
</p>
</li>
<li> <p><code>identical()</code> gains three logical arguments, which
allow for even more differentiation, notably <code>-0</code> and
<code>0</code>.
</p>
</li>
<li> <p><code>legend()</code> now can specify the <code>border</code> color of
filled boxes, thanks to a patch from Frederic Schutz.
</p>
</li>
<li><p> Indexing with a vector index to <code>[[ ]]</code> has now been
extended to all recursive types.
</p>
</li>
<li><p> Pairlists may now be assigned as elements of lists.  (Lists
could always be created with pairlist elements, but <code>[[&lt;-</code>
didn't support assigning them.)
</p>
</li>
<li><p> The parser now supports C-preprocessor-like <code>#line</code>
directives, so error messages and source references may refer to
the original file rather than an intermediate one.
</p>
</li>
<li><p> New functions <code>findLineNum()</code> and
<code>setBreakpoint()</code> work with the source references to find
the location of source lines and set breakpoints (using
<code>trace()</code>) at those lines.
</p>
</li>
<li><p> Namespace importing is more careful about warning on masked
generics, thanks to a patch by Yohan Chalabi.
</p>
</li>
<li> <p><code>detach()</code> now has an argument <code>character.only</code>
with the same meaning as for <code>library()</code> or
<code>require()</code>.
</p>
</li>
<li> <p><code>available.packages()</code> gains a <code>filters</code>
argument for specifying the filtering operations performed on the
packages found in the repositories.  A new built-in
<code>"license/FOSS"</code> filter only retains packages for which
installation can proceed solely based on packages which can be
verified as Free or Open Source Software (FOSS) employing the
available license specifications.
</p>
</li>
<li><p> In registering an S3 class by a call to
<code>setOldClass()</code>, the data part (e.g., the object type)
required for the class can be included as one of the superclasses
in the Classes argument.
</p>
</li>
<li><p> The argument <code>f</code> to <code>showMethods()</code> can be an
expression evaluating to a generic function, allowing methods to
be shown for non-exported generics and other nonstandard cases.
</p>
</li>
<li> <p><code>sprintf()</code> now supports <code>%o</code> for octal
conversions.
</p>
</li>
<li><p> New function <code>Sys.readlink()</code> for information about symbolic
links, including if a file is a symbolic link.
</p>
</li>
<li><p> Package <span class="pkg">tools</span> has new functions
<code>checkRdaFiles()</code> and <code>resaveRdaFiles()</code> to report on
the format of &lsquo;<span class="file">.rda</span>&rsquo;/&lsquo;<span class="file">.RData</span>&rsquo; data files, and to
re-save them in a different compressed format, including choosing
the most compact format available.
</p>
<p>A new <code>INSTALL</code> option, <span class="option">--resave-data</span>, makes use
of this.
</p>
</li>
<li><p> File &lsquo;<span class="file">~/.R/config</span>&rsquo; is used in preference to
&lsquo;<span class="file">~/.Rconfig</span>&rsquo;, and these are now documented in &lsquo;R
Installation and Administration&rsquo;.
</p>
</li>
<li><p> Logic operations with complex numbers now work, as they were always
documented to, and as in S.
</p>
</li>
<li> <p><code>arrows()</code> and <code>segments()</code> allow one of <code>x1</code>
or <code>y1</code> to be omitted to simplify the specification of
vertical or horizontal lines (suggestion of Tim Hesterberg).
</p>
</li>
<li> <p><code>approxfun()</code> is faster by avoiding repeated <code>NA</code>
checks (diagnosis and patch by Karline Soetaert &amp; Thomas
Petzoldt).
</p>
</li>
<li><p> There are the beginnings of a Nynorsk translation by Karl Ove
Hufthammer.
</p>
</li>
<li> <p><code>stripchart()</code> allows <code>par</code> <code>bg</code> to be
passed in for the background colour for <code>pch = 21</code> (wish of
<a href="https://bugs.R-project.org/show_bug.cgi?id=13984">PR#13984</a>).
</p>
</li>
<li><p> New generic function <code>.DollarNames()</code> to enable class authors
to customize completion after the <code>$</code> extractor.
</p>
</li>
<li> <p><code>load()</code>, <code>save()</code>, <code>dput()</code> and
<code>dump()</code> now open a not-yet-open connection in the
appropriate mode (as other functions using connections directly
already did).
</p>
</li></ul>




<h4>REGULAR EXPRESSIONS</h4>


<ul>
<li><p> A different regular expression engine is used for basic and
extended regexps and is also for approximate matching.  This is
based on the TRE library of Ville Laurikari, a modified copy of
which is included in the <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> sources.
</p>
<p>This is often faster, especially in a MBCS locale.
</p>
<p>Some known differences are that it is less tolerant of invalid
inputs in MBCS locales, and in its interpretation of undefined
(extended) regexps such as <code>"^*"</code>.  Also, the interpretation of
ranges such as <code>[W-z]</code> in caseless matching is no longer to map
the range to lower case.
</p>
<p>This engine may in future be used in &lsquo;literal&rsquo; mode for
<code>fixed = TRUE</code>, and there is a compile-time option in
<code>src/main/grep.c</code> to do so.
</p>
</li>
<li><p> The use of repeated boundary regexps in <code>gsub()</code> and
<code>gregexpr()</code> as warned about in the help page does not work
in this engine (it did in the previous one since 2005).
</p>
</li>
<li><p> Extended (and basic) regexps now support same set of options
as for <code>fixed = TRUE</code> and <code>perl = TRUE</code>, including
<code>useBytes</code> and support for UTF-8-encoded strings in
non-UTF-8 locales.
</p>
</li>
<li> <p><code>agrep()</code> now has full support for MBCS locales with a modest
speed penalty.  This enables <code>help.search()</code> to use approximate
matching character-wise rather than byte-wise.
</p>
</li>
<li> <p><code>[g]sub</code> use a single-pass algorithm instead of
matching twice and so is usually faster.
</p>
</li>
<li><p> The <code>perl = TRUE</code> versions now work correctly in a
non-UTF-8 MBCS locale, by translating the inputs to UTF-8.
</p>
</li>
<li> <p><code>useBytes = TRUE</code> now inhibits the translation of inputs with
marked encodings.
</p>
</li>
<li> <p><code>strsplit()</code> gains a <code>useBytes</code> argument.
</p>
</li>
<li><p> The algorithm used by <code>strsplit()</code> has been reordered
to batch by elements of <code>split</code>: this can be much faster for
<code>fixed = FALSE</code> (as multiple compilation of regexps is avoided).
</p>
</li>
<li><p> The help pages, including <code>?regexp</code>, have been updated
and should be consulted for details of the new implementations.
</p>
</li></ul>




<h4>HELP &amp; Rd FILE CHANGES</h4>


<ul>
<li><p> A new dynamic HTML help system is used by default, and may be
controlled using <code>tools::startDynamicHelp()</code>.  With this enabled,
HTML help pages will be generated on request, resolving links
by searching through the current <code>.libPaths()</code>.  The user
may set options(<code>"help.ports"</code>) to control which IP port is used
by the server.
</p>
</li>
<li> <p><code>help.start()</code> no longer sets <code>options(htmlhelp =
       TRUE)</code> (it used to on Unix but not on Windows).  Nor does it on
Unix reset the <code>"browser"</code> option if given an argument of
that name.
</p>
<p>Arguments <code>update</code> and <code>remote</code> are now available
on all platforms: the default is <code>update = FALSE</code> since the
http server will update the package index at first use.
</p>
</li>
<li> <p><code>help()</code> has a new argument <code>help_type</code> (with
default set by the option of that name) to supersede arguments
<code>offline</code>, <code>htmlhelp</code> and <code>chmhelp</code>
(although for now they still work if <code>help_type</code> is
unset).  There is a new type, <code>"PDF"</code> to allow offline PDF
(rather than PostScript).
</p>
<p>A function <code>offline_help_helper()</code> will be used if this exists
in the workspace or further down the search path, otherwise
the function of that name in the <span class="pkg">utils</span> namespace is used.
</p>
</li>
<li><p> Plain text help is now used as the fallback for HTML help (as
it always was for Compiled HTML help on Windows).
</p>
</li>
<li><p> It is possible to ask for static HTML pages to be prebuilt
<em>via</em> the configure option <span class="option">--enable-prebuilt-html</span>.  This
may be useful for those who wish to make HTML help available
outside R, e.g. on a local web site.
</p>
</li>
<li><p> An experimental tag <code>\Sexpr</code> has been added to Rd
files, to evaluate expressions at build, install, or render time.
Currently install time and render time evaluation are supported.
</p>
</li>
<li><p> Tags <code>\if</code>, <code>\ifelse</code> and <code>\out</code> have been
added to allow format-specific (or more general, using
<code>\Sexpr</code>) conditional text in man pages.
</p>
</li>
<li><p> The <code>parse_Rd()</code> parser has been made more tolerant of coding
errors in Rd files:  now all syntax errors are reported as
warnings, and an attempt is made to continue parsing.
</p>
</li>
<li> <p><code>parse_Rd()</code> now has an argument <code>fragment</code>
(default <code>FALSE</code>) to accept small fragments of Rd files (so
that <code>\Sexpr</code> can output Rd code which is then parsed).
</p>
</li>
<li> <p><code>parse_Rd()</code> now always converts its input to UTF-8.
The <code>Rd2*</code> rendering functions have a new argument,
<code>outputEncoding</code>, which controls how their output is
encoded.
</p>
</li>
<li> <p><code>parse_Rd()</code> no longer includes the newline as part of
a <code>"%"</code>-style comment.
</p>
</li>
<li><p> There have been various bug fixes and code reorganization in
the Rd renderers <code>Rd2HTML</code>, <code>Rd2latex</code>, <code>Rd2txt</code>,
and <code>Rd2ex</code>.
</p>
<p>All example files are now created with either ASCII or UTF-8
encoding, and the encoding is only marked in the file if there
is any non-UTF-8 code (previously it was marked if the help
file had non-ASCII contents, possibly in other sections).
</p>
</li>
<li> <p><code>print.Rd()</code> now adds necessary escape characters so that
printing and re-parsing an Rd object should produce an
equivalent object.
</p>
</li>
<li> <p><code>parse_Rd()</code> was incorrectly handling multiple backslashes in
<span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> code strings, converting 4n+3 backslashes to 2n+1 instead
of 2n+2.
</p>
</li>
<li> <p><code>parse_Rd()</code> now recognizes the <code>\var</code> tag within
a quoted string in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>-like text.
</p>
</li>
<li> <p><code>parse_Rd()</code> now treats the argument of
<code>\command</code> as LaTeX-like, rather than verbatim.
</p>
</li></ul>




<h4>COMPRESSION</h4>


<ul>
<li><p> New function <code>untar()</code> to list or unpack tar archives,
possibly compressed.  This uses either an external <code>tar</code>
command or an internal implementation.
</p>
</li>
<li><p> New function <code>tar()</code> to create (possibly compressed)
tar archives.
</p>
</li>
<li><p> New functions <code>memCompress()</code> and
<code>memDecompress()</code> for in-memory compression and
decompression.
</p>
</li>
<li> <p><code>bzfile()</code> has a <code>compress</code> argument to select
the amount of effort put into compression when writing.
</p>
</li>
<li><p> New function <code>xzfile()</code> for use with
<code>xz</code>-compressed files.  (This can also read files
compressed by some versions of <code>lzma</code>.)
</p>
</li>
<li> <p><code>gzfile()</code> looks at the file header and so can now also
read <code>bzip2</code>-ed files and <code>xz</code>-compressed files.
</p>
</li>
<li><p> There are the new options of <code>save(compress = "bzip2")</code>
and <code>"xz"</code> to use <code>bzip2</code> or <code>xz</code>
compression (which will be slower, but can give substantially
smaller files).  Argument <code>compression_level</code> gives finer
control over the space/time tradeoffs.
</p>
<p><code>load()</code> can read such saves (but only as from this version of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>).
</p>
</li>
<li> <p><code>R CMD INSTALL</code>/<code>check</code> and
<code>tools::writePACKAGES</code> accept a wider range of compressed
tar archives.  Precisely how wide depends on the capabilities of
the host system's <code>tar</code> command: they almost always
include <code>.tar.bz2</code> archives, and with modern versions of
<code>tar</code> other forms of compression such as <code>lzma</code>
and <code>xz</code>, and arbitrary extensions.
</p>
</li>
<li> <p><code>R CMD INSTALL</code> has a new option
<span class="option">--data-compress</span> to control the compression used when
lazy-loading data.  New possibilities are
<span class="option">--data-compress=bzip2</span> which will give ca 15% better
compression at the expense of slower installation times, and
<span class="option">--data-compress=xz</span>, often giving even better compression
on large datasets at the expense of much longer installation
times.  (The latter is used for the recommended packages: it is
particularly effective for <a href="https://CRAN.R-project.org/package=survival"><span class="pkg">survival</span></a>.)
</p>
</li>
<li> <p><code>file()</code> for open = <code>""</code>, <code>"r"</code> or
<code>"rt"</code> will automagically detect compressed files (from
<code>gzip</code>, <code>bzip2</code> or <code>xz</code>).  This means
that compressed files can be specified by file name (rather than
<em>via</em> a <code>gzfile()</code> connection) to <code>read.table()</code>,
<code>readlines()</code>, <code>scan()</code> and so on.
</p>
</li>
<li> <p><code>data()</code> can handle compressed text files with extensions
&lsquo;<span class="file">.{txt,tab,csv}.{gz,bz2,xz}</span>&rsquo; .
</p>
</li></ul>




<h4>DEPRECATED &amp; DEFUNCT</h4>


<ul>
<li> <p><code>png(type="cairo1")</code> is defunct: the value is no longer
recognized.
</p>
</li>
<li> <p><code>tools::Rd_parse()</code> is defunct (as this version of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>
uses only Rd version 2).
</p>
</li>
<li><p> Use of file &lsquo;<span class="file">~/.Rconf</span>&rsquo; (which was deprecated in favour
of &lsquo;<span class="file">~/.Rconfig</span>&rsquo; in 2004) has finally been removed.
</p>
</li>
<li><p> Bundles of packages are deprecated.  See &lsquo;Writing R
Extensions&rsquo; for the steps needed to unbundle a bundle.
</p>
</li>
<li> <p><code>help()</code> arguments <code>offline</code>, <code>htmlhelp</code> and
<code>chmhelp</code> are deprecated in favour of <code>help_type</code>.
</p>
</li>
<li> <p><code>clearNames()</code> (in package <span class="pkg">stats</span>) is deprecated
for <code>unname()</code>.
</p>
</li>
<li><p> Basic regular expressions (<code>extended = FALSE</code>) are
deprecated in <code>strsplit</code>, <code>grep</code> and friends.  There is
a precise POSIX standard for them, but it is not what recent RE
engines implement, and it seems that in almost all cases package
authors intended <code>fixed = TRUE</code> when using <code>extended =
       FALSE</code>.
</p>
</li>
<li> <p><code>methods::trySilent()</code> is deprecated in favour of
<code>try(silent=TRUE)</code> or &ndash; more efficiently and flexibly &ndash;
something like <code>tryCatch(error = function(e) e)</code>.
</p>
</li>
<li> <p><code>index.search()</code> is deprecated: there are no longer
directories of types other than <code>help</code>.
</p>
</li></ul>




<h4>INSTALLATION</h4>


<ul>
<li><p> cairo &gt;= 1.2 is now required (1.2.0 was released in July 2006)
for cairo-based graphics devices (which remain optional).
</p>
</li>
<li><p> A suitable <code>iconv()</code> is now required: support for
configure option <span class="option">--without-iconv</span> has been withdrawn (it
was deprecated in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.5.0).
</p>
</li>
<li><p> Perl is no longer &lsquo;essential&rsquo;.  <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> can be built
without it, but scripts <code>R CMD build</code>, <code>check</code>,
<code>Rprof</code> and <code>Sd2d</code> currently require it.
</p>
</li>
<li><p> A system <code>glob</code> function is now essential (a working
<code>Sys.glob()</code> has been assumed since <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.9.0 at least).
</p>
</li>
<li><p> C99 support for MBCS is now required, and configure option
<span class="option">--disable-mbcs</span> has been withdrawn.
</p>
</li>
<li><p> Having a version of <code>tar</code> capable of automagically
detecting compressed archives is useful for
<code>utils::untar()</code>, and so <code>gtar</code> (a common name for
GNU <code>tar</code>) is preferred to <code>tar</code>: set environment
variable <span class="env">TAR</span> to specify a particular <code>tar</code> command.
</p>
</li></ul>




<h4>INTERNATIONALIZATION</h4>


<ul>
<li><p> There is some makefile support for adding/updating translations
in packages: see <code>po/README</code> and &lsquo;Writing R Extensions&rsquo;.
</p>
<p>There is support for the use of <code>dngettext</code> for C-level
translations in packages: see &lsquo;Writing R Extensions&rsquo;.
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li><p> Assigning an extra 0-length column to a data frame by
<code>DF[, "foo"] &lt;- value</code> now works in most cases (by filling
with <code>NA</code>s) or fails.  (It used to give a corrupt data
frame.)
</p>
</li>
<li> <p><code>validObject()</code> avoids an error during evaluation in the case
of various incorrect slot definitions.
</p>
</li>
<li> <p><code>n:m</code> now returns a result of type <code>"integer"</code> in
a few more boundary cases.
</p>
</li>
<li><p> The <code>zap.ind</code> argument to <code>printCoefmat()</code> did
not usually work as other code attempted to ensure that non-zero
values had a non-zero representation.
</p>
</li>
<li> <p><code>printCoefmat()</code> formatted groups of columns together,
not just the <code>cs.ind</code> group but also the <code>zap.ind</code>
group and a residual group.  It now formats all columns except
the <code>cs.ind</code> group separately (and zaps the <code>zap.ind</code>
group column-by-column).  The main effect will be see in the
output from <code>print.anova()</code>, as this grouped SS-like columns
in the <code>zap.ind</code> group.
</p>
</li>
<li> <p><code>R_ReplDLLinit()</code> initializes the top-level jump so
that some embedded applications on Windows no longer crash on
error.
</p>
</li>
<li> <p><code>identical()</code> failed to take the encoding of character
strings into account, so identical byte patterns are not
necessarily identical strings, and similarly Latin-1 and UTF-8
versions of the same string differ in byte pattern.
</p>
</li>
<li> <p><code>methods(f)</code> used to warn unnecessarily for an S4
generic <code>f</code> which had been created based on an existing S3
generic.
</p>
</li>
<li><p> The check for consistent ordering of superclasses was not
ignoring all conditional relations (the symptom was usually
spurious warnings for classes extending <code>"array"</code>).
</p>
</li>
<li><p> Trying to assign into a raw vector with an index vector
containing <code>NA</code>s could cause a segfault.  Reported by Hervé
Pagès.
</p>
</li>
<li> <p><code>Rscript</code> could segfault if (by user error) its
filename argument was missing.  Reported by Martin Morgan.
</p>
</li>
<li> <p><code>getAnywhere()</code> (and functions that use it, including argument
completion in the console) did not handle special built-in
functions.  Reported by Romain Francois.
</p>
</li>
<li> <p><code>order()</code> was missing a <code>PROTECT()</code> call and so
could segfault when called on character data under certain (rare)
circumstances involving marked non-native encodings.
</p>
</li>
<li> <p><code>prettyNum(z, drop0trailing=TRUE)</code> did not work
correctly when <code>z</code> was a complex vector.  Consequently,
<code>str(z, ...)</code> also did not.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=13985">PR#13985</a>)
</p>
</li>
<li> <p><code>make distclean</code> removed too many files in
<code>etc/</code> if builddir = srcdir.
</p>
</li>
<li> <p><code>R CMD</code> replaced <code>TEXINPUTS</code> rather than
appending to it (as documented and intended).
</p>
</li>
<li> <p><code>help.start()</code> no longer fails on unix when
<code>"browser"</code> is a function.
</p>
</li>
<li> <p><code>pbeta(x, ..., log.p = TRUE)</code> is sometimes more accurate,
e.g., for very small <code>x</code>.
</p>
</li>
<li><p> Unserializing a pre-2.8 workspace containing pure ASCII
character objects with a Latin-1 or UTF-8 encoding would corrupt
the <code>CHARSXP</code> cache.
</p>
</li></ul>




<h3>OLDER NEWS</h3>

<p>News for <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.9.2 patched and earlier can be found in files
such as &lsquo;<span class="file">NEWS.2</span>&rsquo; in the &lsquo;<span class="file">doc</span>&rsquo; directory.
</p>


</div></body></html>
