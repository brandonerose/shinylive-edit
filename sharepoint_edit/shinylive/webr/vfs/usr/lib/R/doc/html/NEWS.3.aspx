<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"><html xmlns="http://www.w3.org/1999/xhtml"><head><title>R: R News</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes" />
<link rel="stylesheet" type="text/css" href="R.css" />
</head><body><div class="container">


<table width="100%" summary="page for NEWS"><tr><td>NEWS</td><td style="text-align: right;">R Documentation</td></tr></table>

<h2>R News</h2>

<h3>LATER NEWS</h3>


<ul>
<li><p> News for <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 4.x.y can be found in HTML format at
<a href="NEWS.html">NEWS.html</a>,
and in text format in file
<a href="../NEWS">NEWS</a>
in the &lsquo;<span class="file">doc</span>&rsquo; directory.
</p>
</li></ul>



<h3><img src="../help/figures/../../html/Rlogo.svg" class="toplogo" alt="[R logo]" /> CHANGES IN R 3.6.3</h3>



<h4>NEW FEATURES</h4>


<ul>
<li><p> The included LAPACK has been updated to version 3.9.0 (for
the included routines, just bug fixes).
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li><p> Fixed a C level integer overflow in <code>rhyper()</code>; reported
by Benjamin Tyner in <a href="https://bugs.R-project.org/show_bug.cgi?id=17694">PR#17694</a>.
</p>
</li>
<li><p> Uses of <code>url(gzcon(.))</code> needing to extend buffer size
have failed (with HTTP/2 servers), reported by Gábor Csárdi.
</p>
</li>
<li> <p><code>predict(loess(..), se=TRUE)</code> now errors out (instead of
seg.faulting etc) for large sample sizes, thanks to a report and
patch by Benjamin Tyner in <a href="https://bugs.R-project.org/show_bug.cgi?id=17121">PR#17121</a>.
</p>
</li>
<li> <p><code>tools:assertCondition(., "error")</code> and hence
<code>assertError()</code> no longer return errors twice (invisibly).
</p>
</li>
<li> <p><code>update(form, new)</code> in the case of a long <code>new</code>
formula sometimes wrongly eliminated the intercept from <code>form</code>,
or (more rarely) added a garbage term (or seg.faulted !); the fix
happened by simplifying the C-level logic of <code>terms.formula()</code>.
Reported by Mathias Ambühl in <a href="https://bugs.R-project.org/show_bug.cgi?id=16326">PR#16326</a>.
</p>
</li>
<li><p> The error message from <code>stopifnot(.., &lt;error producing call&gt;)</code>
again contains the full <code>"stopifnot(.......)"</code> call: Its
attempted suppression did not work consistently. 
</p>
</li>
<li><p> On Windows, <code>download.file(., , "wininet", headers=character())</code>
would fail; reported with patch proposal by Kevin Ushey in <a href="https://bugs.R-project.org/show_bug.cgi?id=17710">PR#17710</a>.
</p>
</li></ul>




<h3><img src="../help/figures/../../html/Rlogo.svg" class="toplogo" alt="[R logo]" /> CHANGES IN R 3.6.2</h3>



<h4>NEW FEATURES</h4>


<ul>
<li> <p><code>runmed(x, *)</code> gains a new option <code>na.action</code>
determining <em>how</em> to handle <code>NaN</code> or <code>NA</code> in <code>x</code>.
</p>
</li>
<li> <p><code>dotchart()</code> gains new options <code>ann</code>, <code>xaxt</code>,
<code>frame.plot</code> and <code>log</code>.
</p>
</li></ul>




<h4>INSTALLATION on a UNIX-ALIKE</h4>


<ul>
<li><p> Detection of the C stack direction has been moved from
run-time to <code>configure</code>: this is safer with LTO builds and
allows the detection to be overridden &ndash; see file
&lsquo;<span class="file">config.site</span>&rsquo;.
</p>
</li>
<li><p> Source-code changes enable installation on platforms using
<code>gcc -fno-common</code> (the expected default for
<code>gcc 10.x</code>).
</p>
</li></ul>




<h4>C-LEVEL FACILITIES</h4>


<ul>
<li> <p><code>installTrChar</code> (which is nowadays is wrapped by
<code>installChar</code>) is defined in &lsquo;<span class="file">Rinternals.h</span>&rsquo;.  (Neither
are part of the API.)
</p>
</li></ul>




<h4>PACKAGE INSTALLATION</h4>


<ul>
<li><p> Header &lsquo;<span class="file">Rconfig.h</span>&rsquo; contains the value of
<code>FC_LEN_T</code> deduced at installation which is used by the
prototypes in headers &lsquo;<span class="file">R_ext/BLAS.h</span>&rsquo; and
&lsquo;<span class="file">R_ext/Lapack.h</span>&rsquo; but to avoid extensive breakage this is
only exposed when <code>USE_FC_LEN_T</code> is defined.
</p>
<p>If a package's C/C++ calls to BLAS/LAPACK allow for the
&lsquo;hidden&rsquo; arguments used by most Fortran compilers to pass
the lengths of Fortran character arguments, define
<code>USE_FC_LEN_T</code> and include &lsquo;<span class="file">Rconfig.h</span>&rsquo; (possibly
<em>via</em> &lsquo;<span class="file">R.h</span>&rsquo;) before including &lsquo;<span class="file">R_ext/BLAS.h</span>&rsquo; or
&lsquo;<span class="file">R_ext/Lapack.h</span>&rsquo;.
</p>
</li>
<li><p> A package with Fortran source code and perhaps C (but not
C++) sources can request for its shared object/DLL to be linked by
the Fortran compiler by including a line <code>USE_FC_TO_LINK=</code> in
&lsquo;<span class="file">src/Makevars[.win]</span>&rsquo; and using <code>$(SHLIB_OPENMP_FFLAGS)</code>
as part of <code>PKG_LIBS</code>.
</p>
<p>The known reason for doing so is a package which uses Fortran
(only) OpenMP on a platform where the Fortran OpenMP runtime is
incompatible with the C one (e.g. <code>gfortran</code> 9.x
with <code>clang</code>).
</p>
</li></ul>




<h4>UTILITIES</h4>


<ul>
<li> <p><code>R CMD check</code> has a new option to mitigate checks
leaving files/directories in &lsquo;<span class="file">/tmp</span>&rsquo;.  See the &lsquo;R
Internals&rsquo; manual &ndash; this is part of <code>--as-cran</code>.
</p>
</li></ul>




<h4>Windows</h4>


<ul>
<li><p> The default standard for C++ in package installation is
C++11 (as it has been on other platforms where available since <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>
3.6.0: the default toolchain on Windows was defaulting to C++98).
</p>
</li></ul>




<h4>DEPRECATED AND DEFUNCT</h4>


<ul>
<li><p> Support for specifying C++98 in package installation is
deprecated.
</p>
</li>
<li><p> Support in <code>R CMD config</code> for <span class="samp">F77</span>,
<span class="samp">FCPIFCPLAGS</span>, <span class="samp">CPP</span>, <span class="samp">CXXCPP</span> and <span class="samp">CXX98</span> and
similar is deprecated.  (<span class="samp">CPP</span> is found from the system
<code>make</code> and may well not be set.)
</p>
<p>Use <span class="samp">$CC -E</span> and <span class="samp">$CXX -E</span> instead of <span class="samp">CPP</span> and
<span class="samp">CXXCPP</span>.
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li> <p><code>runmed(x, *)</code> when <code>x</code> contains missing values
now works consistently for both <code>algorithm="Stuetzle"</code> and
<code>"Turlach"</code>, and no longer segfaults for <code>"Turlach"</code>, as
reported by Hilmar Berger.
</p>
</li>
<li> <p><code>apply(diag(3), 2:3, mean)</code> now gives a helpful error message.
</p>
</li>
<li> <p><code>dgamma(x, shape, log=TRUE)</code> now longer overflows
to <code>Inf</code> for shape &lt; 1 and very small <code>x</code>, fixing
<a href="https://bugs.R-project.org/show_bug.cgi?id=17577">PR#17577</a>, reported by Jonathan Rougier.
</p>
</li>
<li><p> Buffer overflow in building error messages fixed. Reported
by Benjamin Tremblay.
</p>
</li>
<li> <p><code>options(str = .)</code> is correctly initialized at
package <span class="pkg">utils</span> load time, now.  A consequence is that
<code>str()</code> in scripts now is more consistent to interactive use,
e.g., when displaying function(**) argument lists.
</p>
</li>
<li> <p><code>as.numeric(&lt;call&gt;)</code> now gives correct error message.
</p>
</li>
<li><p> Printing <code>ls.str()</code> no longer wrongly shows
<code>"&lt;missing&gt;"</code> in rare cases.
</p>
</li>
<li><p> Auto-printing S4 objects no longer duplicates the object,
for faster speed and reduced memory consumption. Reported by Aaron
Lun.
</p>
</li>
<li> <p><code>pchisq(&lt;LRG&gt;, &lt;LRG&gt;, ncp=100)</code> no longer takes
practically forever in some cases.  Hence ditto for corresponding
<code>qchisq()</code> calls.
</p>
</li>
<li> <p><code>x %% L</code> for finite <code>x</code> no longer returns
<code>NaN</code> when <code>L</code> is infinite, nor suffers from cancellation
for large finite <code>L</code>, thanks to Long Qu's <a href="https://bugs.R-project.org/show_bug.cgi?id=17611">PR#17611</a>.
</p>
<p>Analogously, <code>x %/% L</code> and <code>L %/% x</code> suffer less from
cancellation and return values corresponding to limits for large
<code>L</code>.
</p>
</li>
<li> <p><code>grepl(NA, *)</code> now returns <code>logical</code> as documented.
</p>
</li>
<li> <p><code>options(warn=1e11)</code> is an error now, instead of later
leading to C stack overflow because of infinite recursion.
</p>
</li>
<li> <p><code>R_tryCatch</code> no longer transfers control for all
conditions. Reported and patch provided by Lionel Henry in
<a href="https://bugs.R-project.org/show_bug.cgi?id=17617">PR#17617</a>.
</p>
</li>
<li> <p><code>format(object.size(.), digits=NULL)</code> now works, fixing
<a href="https://bugs.R-project.org/show_bug.cgi?id=17628">PR#17628</a> reported by Jonathan Carroll.
</p>
</li>
<li> <p><code>get_all_vars(f, d)</code> now also works for cases, e.g. where
<code>d</code> contains a matrix.  Reported by Simon Wood in 2009 and patch
provided by Ben Bolker in <a href="https://bugs.R-project.org/show_bug.cgi?id=13624">PR#13624</a>.
</p>
<p>Additionally, it now also works when some variables are data frames,
fixing <a href="https://bugs.R-project.org/show_bug.cgi?id=14905">PR#14905</a>, reported by Patrick Breheny.
</p>
</li>
<li> <p><code>barplot()</code> could get spacings wrong if there were exactly two
bars <a href="https://bugs.R-project.org/show_bug.cgi?id=15522">PR#15522</a>.  Patch by Michael Chirico.
</p>
</li>
<li> <p><code>power.t.test()</code> works in more cases when returning values
of n smaller than 2.
</p>
</li>
<li> <p><code>dotchart(*, pch=., groups=.)</code> now works better.  Reported
by Robert and confirmed by Nic Rochette in <a href="https://bugs.R-project.org/show_bug.cgi?id=16953">PR#16953</a>.
</p>
</li>
<li> <p><code>canCoerce(obj, cl)</code> no longer assumes
<code>length(class(obj)) == 1</code>.
</p>
</li>
<li> <p><code>plot.formula(*, subset = *)</code> now also works in a boundary
case reported by Robert Schlicht (TU Dresden).
</p>
</li>
<li> <p><code>readBin()</code> and <code>writeBin()</code> of a
<code>rawConnection()</code> now also work in large cases, thanks to a
report and proposal by Taeke Harkema in <a href="https://bugs.R-project.org/show_bug.cgi?id=17665">PR#17665</a>.
</p>
</li></ul>




<h3><img src="../help/figures/../../html/Rlogo.svg" class="toplogo" alt="[R logo]" /> CHANGES IN R 3.6.1</h3>



<h4>INSTALLATION on a UNIX-ALIKE</h4>


<ul>
<li><p> The default detection of the shell variable <code>libNN</code> is
overridden for derivatives of Debian Linux, some of which have
started to have a &lsquo;<span class="file">/usr/lib64</span>&rsquo; directory.
(E.g. Ubuntu 19.04.)  As before, it can be specified in
&lsquo;<span class="file">config.site</span>&rsquo;.
</p>
</li></ul>




<h4>UTILITIES</h4>


<ul>
<li> <p><code>R CMD config</code> knows the values of <code>AR</code> and
<code>RANLIB</code>, often set for LTO builds.
</p>
</li></ul>




<h4>DEPRECATED AND DEFUNCT</h4>


<ul>
<li><p> The use of a character vector with <code>.Fortran()</code> is
formally deprecated and gives a non-portability warning.  (It has
long been strongly discouraged in &lsquo;Writing R Extensions&rsquo;.)
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li><p> On Windows, GUI package installation via <code>menuInstallPkgs()</code>
works again, thanks to Len Weil's and Duncan Murdoch's <a href="https://bugs.R-project.org/show_bug.cgi?id=17556">PR#17556</a>.
</p>
</li>
<li> <p><code>R CMD check</code> on <code>data()</code> fixing <a href="https://bugs.R-project.org/show_bug.cgi?id=17558">PR#17558</a>
thanks to Duncan Murdoch.
</p>
</li>
<li> <p><code>quasi(*, variance = list(..))</code> now works more
efficiently, and should work in all cases fixing <a href="https://bugs.R-project.org/show_bug.cgi?id=17560">PR#17560</a>.
Further, <code>quasi(var = mu(1-mu))</code> and <code>quasi(var = "mu ^ 3")</code>
now work, and <code>quasi(variance = "log(mu)")</code> now gives a correct
error message.
</p>
</li>
<li><p> Creation of lazy loading database during package installation is
again robust to Rprofile changing the current working directory
(<a href="https://bugs.R-project.org/show_bug.cgi?id=17559">PR#17559</a>).
</p>
</li>
<li> <p><code>boxplot(y ~ f, horizontal=TRUE)</code> now produces correct x-
and y-labels.
</p>
</li>
<li> <p><code>rbind.data.frame()</code> allows to keep <code>&lt;NA&gt;</code> levels
from factor columns (<a href="https://bugs.R-project.org/show_bug.cgi?id=17562">PR#17562</a>) via new option <code>factor.exclude</code>.
</p>
<p>Additionally, it works in one more case with matrix-columns which
had been reported on 2017-01-16 by Krzysztof Banas.
</p>
</li>
<li><p> Correct messaging in C++ pragma checks in <span class="pkg">tools</span> code for
<code>R CMD check</code>, fixing <a href="https://bugs.R-project.org/show_bug.cgi?id=17566">PR#17566</a> thanks to Xavier Robin.
</p>
</li>
<li><p>print()ing and auto-printing no longer differs for
<code>function</code>s with a user defined <code>print.function</code>, thanks to
Bill Dunlap's report.
</p>
</li>
<li><p> On Windows, <code>writeClipboard(.., format = &lt;n&gt;)</code> now
does correctly pass <code>format</code> to the underlying C code, thanks to
a bug report (with patch) by Jenny Bryan.
</p>
</li>
<li> <p><code>as.data.frame()</code> treats 1D arrays the same as vectors,
<a href="https://bugs.R-project.org/show_bug.cgi?id=17570">PR#17570</a>.
</p>
</li>
<li><p> Improvements in <code>smoothEnds(x, *)</code> working with
<code>NA</code>s (towards <code>runmed()</code> working in that case, in the next
version of R).
</p>
</li>
<li> <p><code>vcov(glm(&lt;quasi&gt;), dispersion = *)</code> works correctly
again, fixing <a href="https://bugs.R-project.org/show_bug.cgi?id=17571">PR#17571</a> thanks to Pavel Krivitsky.
</p>
</li>
<li> <p><code>R CMD INSTALL</code> of binary packages on Windows now
works also with per-directory locking.
</p>
</li>
<li> <p><code>R CMD INSTALL</code> and <code>install.packages()</code> on Windows
are now more robust against a locked file in an earlier installation
of the package to be installed.  The default value of option
<code>install.lock</code> on Windows has been changed to <code>TRUE</code>.
</p>
</li>
<li><p> On Unix alikes (when <code>readline</code> is active), only
expand tilde (<code>~</code>) file names starting with a tilde, instead of
almost all tildes.
</p>
</li>
<li><p> In R documentation (&lsquo;<span class="file">*.Rd</span>&rsquo;) files, <span class="samp">\item [..]</span> is no
longer treated specially when rendered in LaTeX and hence pdf, but
rather shows the brackets in all cases.
</p>
</li></ul>




<h3><img src="../help/figures/../../html/Rlogo.svg" class="toplogo" alt="[R logo]" /> CHANGES IN R 3.6.0</h3>



<h4>SIGNIFICANT USER-VISIBLE CHANGES</h4>


<ul>
<li><p> Serialization format version 3 becomes the default for
serialization and saving of the workspace (<code>save()</code>,
<code>serialize()</code>, <code>saveRDS()</code>, <code>compiler::cmpfile()</code>).
Serialized data in format 3 cannot be read by versions of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> prior
to version 3.5.0.  Serialization format version 2 is still
supported and can be selected by <code>version = 2</code> in the
save/serialization functions.  The default can be changed back for
the whole <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> session by setting environment variables
<span class="env">R_DEFAULT_SAVE_VERSION</span> and <span class="env">R_DEFAULT_SERIALIZE_VERSION</span>
to <code>2</code>.  For maximal back-compatibility, files
&lsquo;<span class="file">vignette.rds</span>&rsquo; and &lsquo;<span class="file">partial.rdb</span>&rsquo; generated by <code>R
	 CMD build</code> are in serialization format version 2, and resave by
default produces files in serialization format version 2 (unless
the original is already in format version 3).
</p>
</li>
<li><p> The default method for generating from a discrete uniform
distribution (used in <code>sample()</code>, for instance) has been
changed.  This addresses the fact, pointed out by Ottoboni and
Stark, that the previous method made <code>sample()</code> noticeably
non-uniform on large populations.  See <a href="https://bugs.R-project.org/show_bug.cgi?id=17494">PR#17494</a> for a
discussion.  The previous method can be requested using
<code>RNGkind()</code> or <code>RNGversion()</code> if necessary for
reproduction of old results.  Thanks to Duncan Murdoch for
contributing the patch and Gabe Becker for further assistance.
</p>
<p>The output of <code>RNGkind()</code> has been changed to also return the
&lsquo;kind&rsquo; used by <code>sample()</code>.
</p>
</li></ul>




<h4>NEW FEATURES</h4>


<ul>
<li> <p><code>Sys.setFileTime()</code> has been vectorized so arguments
<code>path</code> and <code>time</code> of length greater than one are now
supported.
</p>
</li>
<li> <p><code>axis()</code> gets new option <code>gap.axis = NA</code> for
specifying a multiplication factor for the minimal &ldquo;gap&rdquo;
(distance) between axis labels drawn.   Its default is <code>1</code>
for labels <em>parallel</em> to the axis, and <code>0.25</code> for
perpendicular ones.
</p>
<p>Perpendicular labels no longer overlap, fixing bug <a href="https://bugs.R-project.org/show_bug.cgi?id=17384">PR#17384</a>.
</p>
</li>
<li><p> The default method of <code>plot()</code> gains new arguments
<code>xgap.axis = NA</code> and <code>ygap.axis = NA</code> to be passed to
the x&ndash; and y&ndash; <code>axis(.., gap.axis=*)</code> calls.
</p>
</li>
<li> <p><code>removeSource()</code> now works not only for functions but
also for some language objects.
</p>
</li>
<li> <p><code>as.call()</code>, <code>rep.int()</code>, <code>rep_len()</code> and
<code>nchar()</code> dispatch internally.
</p>
</li>
<li> <p><code>is(object, class2)</code> looks for <code>class2</code> in the
calling namespace after looking in the namespace of
<code>class(object)</code>.
</p>
</li>
<li> <p><code>extendrange(.., f)</code> with a length-2 <code>f</code> now
extends separately to the left and the right.
</p>
</li>
<li> <p><code>lengths()</code> dispatches internally to S4 methods.
</p>
</li>
<li> <p><code>download.file()</code> on Windows now uses <code>URLdecode()</code>
to determine the file extension, and uses binary transfer
(<code>mode = "wb"</code>) also for file extension &lsquo;<span class="file">.rds</span>&rsquo;.
</p>
<p>The help page for <code>download.file()</code> now contains the same
information on all platforms.
</p>
</li>
<li><p> Setting <span class="samp">C</span> locale for collation <em>via</em> environment
variables <span class="env">LC_ALL</span> and <span class="env">LC_COLLATE</span> and <em>via</em> a call
to <code>Sys.setlocale()</code> now takes precedence over environment
variable <span class="env">R_ICU_LOCALE</span>.
</p>
</li>
<li><p> There is a new function, <code>nullfile()</code>, to give the file
name of the null system device (e.g., &lsquo;<span class="file">/dev/null</span>&rsquo;) on the
current platform. 
</p>
</li>
<li><p> There are two new options, <code>keep.parse.data</code> and
<code>keep.parse.data.pkgs</code>, which control whether parse data are
included into sources when <code>keep.source</code> or
<code>keep.source.pkgs</code> is <code>TRUE</code>.  By default,
<code>keep.parse.data.pkgs</code> is now <code>FALSE</code>, which changes
previous behavior and significantly reduces space and time overhead
when sources are kept when installing packages.
</p>
</li>
<li><p> In <code>rapply(x, ..)</code>, <code>x</code> can also be
&ldquo;list-like&rdquo; and of length <i>&gt;= 2^{31}</i>.
</p>
</li>
<li> <p><code>trimws()</code> gets new optional <code>whitespace</code>
argument, allowing more extensive definitions of &ldquo;space&rdquo;,
such as including Unicode spaces (as wished in <a href="https://bugs.R-project.org/show_bug.cgi?id=17431">PR#17431</a>).
</p>
</li>
<li> <p><code>weighted.mean()</code> no longer coerces the weights to a
double/numeric vector, since <code>sum()</code> now handles integer
overflow. This makes <code>weighted.mean()</code> more polymorphic and
endomorphic, but be aware that the results are no longer
guaranteed to be a vector of type <span class="samp">double</span>.
</p>
</li>
<li><p> When loading namespaces, S3 method registrations which
overwrite previous registrations are now noted by default (using
<code>packageStartupMessage()</code>).
</p>
</li>
<li> <p><code>compiler::cmpfile()</code> gains a <code>version</code> argument, for
use when the output file should be saved in serialization format 2.
</p>
</li>
<li><p> The axis labeling in the default method of <code>pairs()</code>
may now be toggled by new options <code>horOdd</code> and <code>verOdd</code>.
</p>
</li>
<li><p> (Not Windows nor macOS.) Package <span class="pkg">tcltk</span> now supports an
environment variable <span class="env">R_DONT_USE_TK</span> which if set disables Tk
initialization.  This is intended for use to circumvent errors in
loading the package, e.g. with recent Linux running under
an address sanitizer.
</p>
</li>
<li><p> The <code>numeric</code> method of <code>all.equal()</code> gets
optional arguments <code>countEQ</code> and <code>formatFUN</code>.  If
<code>countEQ</code> is true, the mean error is more sensible when many
entries are <b>eq</b>ual.
</p>
</li>
<li> <p><code>outer(x,y, FUN = "*")</code> is more efficient using
<code>tcrossprod(u,v)</code> instead of <code>u %*% t(v)</code>.
</p>
</li>
<li> <p><code>vcov(&lt;mlm&gt;)</code> is more efficient via new optional
arguments in <code>summary.mlm()</code>.
</p>
</li>
<li><p> The default method of <code>summary()</code> gets an option to
choose the <em>kind</em> of <code>quantile()</code>s to use; wish of
<a href="https://bugs.R-project.org/show_bug.cgi?id=17438">PR#17438</a>.
</p>
</li>
<li><p> Fitting multiple linear models <em>via</em> <code>lm()</code> does
work with <em>matrix</em> offsets, as suggested in <a href="https://bugs.R-project.org/show_bug.cgi?id=17407">PR#17407</a>.
</p>
</li>
<li><p> The new functions <code>mem.maxVSize()</code> and
<code>mem.maxMSize()</code> allow the maximal size of the vector heap
and the maximal number of nodes allowed in the current <code>R</code>
process to be queried and set.
</p>
</li>
<li> <p><code>news()</code> gains support for &lsquo;<span class="file">NEWS.md</span>&rsquo; files.
</p>
</li>
<li><p> An effort has been started to have our reference manuals,
i.e., all help pages. show platform-independent information (rather
than Windows or Unix-alike specifics visible only on that platform).
Consequently, the Windows version of <code>X11()</code> / <code>x11()</code>
got identical formal arguments to the Unix one.
</p>
</li>
<li> <p><code>sessionInfo()$running</code> has been factored out in a new
variable <code>osVersion</code>. 
</p>
</li>
<li> <p><code>slice.index()</code> now also works for multi-dimensional
margins.
</p>
</li>
<li> <p><code>untar()</code> used with an external <code>tar</code> command
assumes this supports decompression including <code>xz</code> and
automagically detecting the compression type.  This has been true
of all mainstream implementations since 2009 (for GNU
<code>tar</code>, since version 1.22): older implementations are
still supported <em>via</em> the new argument
<code>support_old_tars</code> whose default is controlled by environment
variable <span class="env">R_SUPPORT_OLD_TARS</span>.  (It looks like NetBSD and
OpenBSD have &lsquo;older&rsquo; <code>tar</code> commands for this
purpose.)
</p>
</li>
<li><p> The new function <code>asplit()</code> allow splitting an array or
matrix by its margins.
</p>
</li>
<li><p> New functions <code>errorCondition()</code> and
<code>warningCondition()</code> provide a convenient way to create
structured error and warning objects.
</p>
<p><code>.Deprecated()</code> now signals a warning of class
<code>"deprecatedWarning"</code>, and <code>.Defunct()</code> now signals an
error of class <code>"defunctError"</code>.
</p>
</li>
<li><p> Many &lsquo;package not found&rsquo; errors are now signaled as
errors of class <code>"packageNotFoundError"</code>.
</p>
</li>
<li><p> As an experimental feature, when <code>loadNamespace()</code> fails
because the requested package is not available the error is
initially signaled with a <code>retry_loadNamespace</code> restart
available.  This allows a calling handler to try to install the
package and continue.
</p>
</li>
<li> <p><code>S3method()</code> directives in &lsquo;<span class="file">NAMESPACE</span>&rsquo; can now
also be used to perform <em>delayed</em> S3 method registration.
</p>
</li>
<li><p> Experimentally, setting environment variable
<span class="env">_R_CHECK_LENGTH_1_LOGIC2_</span> will lead to warnings (or errors
if the variable is set to a &lsquo;true&rsquo; value) when <code>&amp;&amp;</code> or
<code>||</code> encounter and use arguments of length more than one.
</p>
</li>
<li><p> Added <code>"lines"</code> and <code>"chars"</code> coordinate systems
to <code>grconvertX()</code> and <code>grconvertY()</code>.
</p>
</li>
<li> <p><code>getOption()</code> is more efficient notably for the rare
case when called with two arguments, from several contributors in
<a href="https://bugs.R-project.org/show_bug.cgi?id=17394">PR#17394</a>.
</p>
</li>
<li><p> In <code>.col(dim)</code> and <code>.row(dim)</code>, <code>dim</code> now may
also be an integer-valued <code>"double"</code>.
</p>
</li>
<li> <p><code>sQuote()</code> and <code>dQuote()</code> get an explicit <code>q</code>
argument with obvious default instead of using
<code>getOption("fancyQuotes")</code> implicitly and unconditionally.
</p>
</li>
<li> <p><code>unzip()</code> can list archives with comments and with
spaces in file names even using an external <code>unzip</code> command.
</p>
</li>
<li><p> Command line completion has a new setting
<code>rc.settings(dots = FALSE)</code> to remove <code>...</code> from the
list of possible function arguments.
</p>
</li>
<li> <p><code>library()</code> no longer checks packages with compiled
code match <span class="samp">R.version$platform</span>.  <code>loadNamespace()</code>
never has, and increasingly the &lsquo;canonical name&rsquo; does not
reflect the important characteristics of compiled code.

</p>
</li>
<li><p> The primitive functions <code>drop()</code> and <code>unclass()</code>
now avoid duplicating their data for atomic vectors that are large
enough, by returning <code>ALTREP</code> wrapper objects with adjusted
attributes.  <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>-level assignments to change attributes will also
use wrapper objects to avoid duplicating data for larger atomic
vectors. <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> functions like <code>structure()</code> and <code>unname()</code>
will therefore not duplicate data in these settings.  Generic
vectors as produced by <code>list()</code> are not yet covered by this
optimization but may be in due course.
</p>
</li>
<li><p> In <code>formals()</code>, <code>envir</code> becomes an optional
argument instead of being hardwired.
</p>
</li>
<li><p> Instead of signalling an error for an invalid S4 object
<code>x</code>, <code>str(x)</code> now gives a warning and subsequently still
shows most parts of <code>x</code>, e.g., when slots are missing.
</p>
</li>
<li> <p><code>gamma(x)</code> and <code>lgamma(x)</code> no longer warn when
correctly returning <code>Inf</code> or underflowing to zero.  This
helps maximum likelihood and similar computations.
</p>
</li>
<li> <p><code>convertColor()</code> is now vectorized, so a lot faster for
converting many colours at once.  The new argument
<code>vectorized</code> to <code>colorConverter()</code> ensures that
non-vectorized colour converters still work.  (Thanks to Brodie
Gaslam.)
</p>
</li>
<li> <p><code>download.file()</code> and <code>url()</code> get new argument
<code>headers</code> for custom HTTP headers, e.g., allowing to perform
basic http authentication, thanks to a patch contributed by Gábor
Csárdi.
</p>
</li>
<li><p> File-based connection functions <code>file()</code>,
<code>gzfile()</code>, <code>bzfile()</code> and <code>xzfile()</code> now signal an
error when used on a directory.
</p>
</li>
<li><p> For <code>approx()</code>, <code>splinefun()</code> <em>etc</em>, a new
setting <code>ties = c("ordered", &lt;fun&gt;)</code> allows skipping the
sorting and still treat ties.
</p>
</li>
<li> <p><code>format(x)</code> gives a more user friendly error message in
the case where no method is defined.  A minimal method is provided
in <code>format.default(x)</code> when <code>isS4(x)</code> is true.
</p>
</li>
<li> <p><code>which(x)</code> now also works when <code>x</code> is a long
vector, thanks to Suharto Anggono's <a href="https://bugs.R-project.org/show_bug.cgi?id=17201">PR#17201</a>.  <strong>NB</strong>: this
may return a double result, breaking the previous guarantee of an
integer result.
</p>
</li>
<li> <p><code>seq.default()</code> is more careful to return an
<code>integer</code> (as opposed to <code>double</code>) result when its
arguments are large and/or classed objects; see comment #9 of
Suharto Anggono's <a href="https://bugs.R-project.org/show_bug.cgi?id=17497">PR#17497</a>.
</p>
</li>
<li><p> The <code>plot()</code> method for <code>lm</code> and <code>glm</code> fits,
<code>plot.lm()</code>, gains a new option <code>iter.smooth</code> with a
default of <code>0</code> for binomial fits, no longer down-weighting
when smoothing the residuals.
</p>
</li>
<li> <p><code>zip()</code> passes its list of files <em>via</em> standard
input to the external command when too long for the command line
(on some platforms).
</p>
</li>
<li> <p><code>data()</code> gains an <code>overwrite</code> argument.
</p>
</li>
<li> <p><code>t.test()</code> now also returns the standard error (in
list component <code>stderr</code>).
</p>
</li>
<li> <p><code>model.matrix(*, contrasts.arg = CC)</code> now warns about
invalid <code>contrasts.arg</code>s.
</p>
</li>
<li><p> Performance of <code>substr()</code> and <code>substring()</code> has been
improved.
</p>
</li>
<li> <p><code>stopifnot()</code> has been simplified thanks to Suharto
Anggono's proposals to become considerably faster for cheap
expressions.
</p>
</li>
<li><p> The default &lsquo;user agent&rsquo; has been changed when
accessing <span class="samp">http://</span> and <span class="samp">https://</span> sites using
<span class="samp">libcurl</span>.  (A site was found which caused <span class="samp">libcurl</span> to
infinite-loop with the previous default.)
</p>
</li>
<li> <p><code>sessionInfo()</code> now also contains <code>RNGkind()</code> and
prints it when it differs from the default; based on a proposal and
patch by Gabe Becker in <a href="https://bugs.R-project.org/show_bug.cgi?id=17535">PR#17535</a>.
Also, <code>RNGversion(getRversion())</code> works directly.
</p>
</li>
<li> <p><code>library()</code> and <code>require()</code> now allow more control
over handling search path conflicts when packages are
attached. The policy is controlled by the new
<code>conflicts.policy</code> option.
</p>
</li>
<li> <p><code>barplot()</code> gets a formula method, thanks to a patch
proposal by Arni Magnusson in <a href="https://bugs.R-project.org/show_bug.cgi?id=17521">PR#17521</a>.
</p>
</li>
<li> <p><code>pmax()</code> and <code>pmin(x)</code> now also work for long
vectors, thanks to Suharto Anggono's <a href="https://bugs.R-project.org/show_bug.cgi?id=17533">PR#17533</a>.
</p>
</li>
<li> <p><code>bxp()</code> now warns when omitting duplicated arguments.
</p>
</li>
<li><p> New <code>hcl.colors()</code> function to provide wide range of
HCL-based colour palettes with much better perceptual properties
than the existing RGB/HSV-based palettes like <code>rainbow()</code>.
</p>
<p>Also a new <code>hcl.pals()</code> function to list available palette
names for <code>hcl.colors()</code>.
</p>
<p>Contributed by Achim Zeileis.
</p>
</li>
<li><p> The default colours for <code>image()</code> and
<code>filled.contour()</code> are now based on <code>hcl.colors()</code>.
</p>
</li>
<li><p> The palette-generating functions <code>rainbow()</code>,
<code>gray.colors()</code>, etc. get a new <code>rev</code> argument
to facilitate reversing the order of colors.
</p>
</li>
<li><p> New <code>str2lang()</code> and <code>str2expression()</code> as streamlined
versions of <code>parse(text=., keep.source=FALSE)</code> allow to abstract
typical call constructions, e.g., in <code>formula</code> manipulations.
(Somewhat experimental) 
</p>
</li>
<li><p> Add <code>update_PACKAGES()</code> for incrementally updating a
package repository index, instead of rebuilding the index from
scratch. Thanks to Gabe Becker in <a href="https://bugs.R-project.org/show_bug.cgi?id=17544">PR#17544</a> for the patch, based
on part of his <span class="pkg">switchr</span> package.
</p>
</li></ul>




<h4>INSTALLATION on a UNIX-ALIKE</h4>


<ul>
<li><p> The options selected for the C++ compiler default to the
C++11 standard if supported, otherwise to the C++98 standard.
</p>
</li>
<li><p> Visibility macros such as <span class="samp">C_VISIBILITY</span> can now be
user-set (including to empty), e.g. in &lsquo;<span class="file">config.site</span>&rsquo;.
</p>
</li>
<li><p> Macro <span class="samp">FCLIBS</span>, which has sometimes been needed on
Solaris, has been renamed to <span class="samp">FCLIBS_XTRA</span>.
</p>
</li>
<li><p> Macro <span class="samp">F77</span> is always set to the value of <span class="samp">FC</span>, so
the latter should be set to user-select the Fortran compiler for
both fixed-form and free-form Fortran.  In particular,
<code>gfortran</code> is now the first choice for <span class="samp">F77</span>, not
<code>f95</code>.
</p>
<p>Macros <span class="samp">FFLAGS</span> and <span class="samp">FCFLAGS</span> remain distinct to allow
for a compiler which needs a flag to select free- or fixed-form
Fortran (most use the source-file extension to choose: &lsquo;<span class="file">.f</span>&rsquo;
is fixed-form and &lsquo;<span class="file">.f90</span>&rsquo; and &lsquo;<span class="file">.f95</span>&rsquo; are free-form).
</p>
<p>If only one of them is set, its value is used for both.
</p>
</li>
<li><p> The special-casing of <span class="samp">CFLAGS</span>, <span class="samp">CXXFLAGS</span> and
<span class="samp">FFLAGS</span> for Intel compilers on Linux has been removed: we do
not have recent experience but the generic defaults now chosen are
the same as those previously special-cased for <span class="samp">x86_64</span>.
</p>
<p>If necessary, override the defaults on the <code>configure</code>
command line or in file &lsquo;<span class="file">config.site</span>&rsquo;.
</p>
</li>
<li><p> Long-untested <code>configure</code> support for HP-UX and very
old versions of Linux has been removed.
</p>
</li>
<li> <p><code>configure --with-blas</code> (without specifying a value)
includes OpenBLAS in its search (before ATLAS and a generic
BLAS).  This follows recent versions of the <span class="samp">ax_blas</span>
autoconf macro.
</p>
</li>
<li><p> The <code>configure</code> macro <span class="samp">MAKEINFO</span> has been
updated to <span class="samp">TEXI2ANY</span>.
</p>
</li>
<li><p> Support for <code>make install-strip</code> has been enhanced.
</p>
</li></ul>




<h4>PACKAGE INSTALLATION</h4>


<ul>
<li><p> Source package installation is by default &lsquo;staged&rsquo;:
the package is installed into a temporary location under the final
library directory and moved into place once the installation is
complete.  The benefit is that partially-installed packages are
hidden from other <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> sessions.
</p>
<p>The overall default is set by environment variable
<span class="env">R_INSTALL_STAGED</span>.  <code>R CMD INSTALL</code> has new options
<span class="option">--staged-install</span> and <span class="option">--no-staged-install</span>, and
packages can use the <span class="samp">StagedInstall</span> field in their
&lsquo;<span class="file">DESCRIPTION</span>&rsquo; file to opt out.  (That opt-out is a temporary
measure which may be withdrawn in future.)
</p>
<p>Staged installation requires either <span class="option">--pkglock</span> or
<span class="option">--lock</span>, one of which is used by default.
</p>
</li>
<li><p> The interpretation of source code with extension &lsquo;<span class="file">.f</span>&rsquo;
is changing.  Previously this denoted FORTRAN 77 code, but current
compilers no longer have a FORTRAN 77 mode and interpret it as
&lsquo;fixed-form&rsquo; Fortran 90 (or later where supported) code.
Extensions &lsquo;<span class="file">.f90</span>&rsquo; and &lsquo;<span class="file">.f95</span>&rsquo; continue to indicate
&lsquo;free-form&rsquo; Fortran code.
</p>
<p>Legal FORTRAN 77 code is also legal fixed-form Fortran 9x; however
this change legitimizes the use of later features, in particular
to replace features marked &lsquo;obsolescent&rsquo; in Fortran 90 and
&lsquo;deleted&rsquo; in Fortran 2018 which <code>gfortran</code> 8.x and
later warn about.
</p>
</li>
<li><p> Packages containing files in the &lsquo;<span class="file">src</span>&rsquo; directory with
extensions &lsquo;<span class="file">.f90</span>&rsquo; or &lsquo;<span class="file">.f95</span>&rsquo; are now linked using the C
or C++ compiler rather than the Fortran 9x compiler.  This is
consistent with fixed-form Fortran code and allows mixing of C++
and free-form Fortran on most platforms.
</p>
<p>Consequentially, a package which includes free-form Fortran 9x
code which uses OpenMP should include <span class="samp">SHLIB_OPENMP_CFLAGS</span>
(or the <span class="samp">CXXFLAGS</span> version if they also include C++ code) in
<span class="samp">PKG_LIBS</span> rather than <span class="samp">SHLIB_OPENMP_FCFLAGS</span> &mdash;
fortunately on almost all current platforms they are the same
flag.
</p>
</li>
<li><p> Macro <span class="samp">PKG_FFLAGS</span> will be used for the compilation of
both fixed-form and free-form Fortran code unless
<span class="samp">PKG_FCFLAGS</span> is also set (in &lsquo;<span class="file">src/Makevars</span>&rsquo; or
&lsquo;<span class="file">src/Makevars.win</span>&rsquo;).
</p>
</li>
<li><p> The make macro <span class="samp">F_VISIBILITY</span> is now preferred for
both fixed-form and free-form Fortran, for use in
&lsquo;<span class="file">src/Makevars</span>&rsquo; and similar.
</p>
</li>
<li> <p><code>R CMD INSTALL</code> gains a new option <span class="option">--strip</span>
which (where supported) strips installed shared object(s): this
can also be achieved by setting the environment variable
<span class="env">_R_SHLIB_STRIP_</span> to a true value.
</p>
<p>The new option <span class="option">--strip-lib</span> attempts stripping of
static and shared libraries installed under &lsquo;<span class="file">lib</span>&rsquo;.
</p>
<p>These are most useful on platforms using GNU <code>binutils</code> (such
as Linux) and compiling with <span class="option">-g</span> flags.
</p>
</li>
<li><p> There is more support for installing UTF-8-encoded packages
in a strict Latin-1 locale (and probably for other Latin locales):
non-ASCII comments in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> code (and &lsquo;<span class="file">NAMESPACE</span>&rsquo; files) are
worked around better.
</p>
</li></ul>




<h4>UTILITIES</h4>


<ul>
<li> <p><code>R CMD check</code> now optionally checks makefiles for
correct and portable use of the <span class="samp">SHLIB_OPENMP_*FLAGS</span> macros.
</p>
</li>
<li> <p><code>R CMD check</code> now evaluates <code>\Sexpr{}</code>
expressions (including those in macros) before checking the
contents of &lsquo;<span class="file">Rd</span>&rsquo; files and so detects issues both in
evaluating the expressions and in the expanded contents.
</p>
</li>
<li> <p><code>R CMD check</code> now lists missing packages separated
by commas and with regular quotes such as to be useful as argument
in calling <code>install.packages(c(..))</code>; from a suggestion by
Marcel Ramos.
</p>
</li>
<li> <p><code>tools::Rd2latex()</code> now uses UTF-8 as its default
output encoding.
</p>
</li>
<li> <p><code>R CMD check</code> now checks line endings of files with
extension &lsquo;<span class="file">.hpp</span>&rsquo; and those under &lsquo;<span class="file">inst/include</span>&rsquo;.  The
check now includes that a non-empty file is terminated with a
newline.
</p>
<p><code>R CMD build</code> will correct line endings in such files.
</p>
</li>
<li> <p><code>R CMD check</code> now tries re-building all vignettes
rather than stopping at the first error: whilst doing so it adds
&lsquo;bookmarks&rsquo; to the log.  By default (see the &lsquo;R
Internals&rsquo; manual) it re-builds each vignette in a separate
process.
</p>
<p>It now checks for duplicated vignette titles (also known as
&lsquo;index entries&rsquo;): they are used as hyperlinks on
<acronym><span class="acronym">CRAN</span></acronym> package pages and so do need to be unique.
</p>
</li>
<li> <p><code>R CMD check</code> has more comprehensive checks on the
&lsquo;<span class="file">data</span>&rsquo; directory and the functioning of <code>data()</code> in a
package.
</p>
</li>
<li> <p><code>R CMD check</code> now checks
<code>autoconf</code>-generated &lsquo;<span class="file">configure</span>&rsquo; files have their
corresponding source files, including optionally attempting to
regenerate them on platforms with <code>autoreconf</code>.
</p>
</li>
<li> <p><code>R CMD build</code> has a new option
<span class="option">--compression</span> to select the compression used for the tarball.
</p>
</li>
<li> <p><code>R CMD build</code> now removes &lsquo;<span class="file">src/*.mod</span>&rsquo; files on
all platforms.
</p>
</li></ul>




<h4>C-LEVEL FACILITIES</h4>


<ul>
<li><p> New pointer protection C functions <code>R_PreserveInMSet</code> and
<code>R_ReleaseFromMSet</code> have been introduced to replace
<code>UNPROTECT_PTR</code>, which is not safe to mix with <code>UNPROTECT</code>
(and with <code>PROTECT_WITH_INDEX</code>). Intended for use in parsers
only.
</p>
</li>
<li> <p><code>NAMEDMAX</code> has been raised to 7 to allow further
protection of intermediate results from (usually ill-advised)
assignments in arguments to <code>BUILTIN</code> functions. Properly
written package code should not be affected.
</p>
</li>
<li> <p><code>R_unif_index</code> is now considered to be part of the C API.
</p>
</li>
<li> <p><code>R_GetCurrentEnv()</code> allows C code to retrieve the current
environment.
</p>
</li></ul>




<h4>DEPRECATED AND DEFUNCT</h4>


<ul>
<li><p> Argument <code>compressed</code> of <code>untar()</code> is
deprecated &mdash; it is only used for external <code>tar</code> commands
which increasingly for extraction auto-detect compression and
ignore their <span class="option">zjJ</span> flags.
</p>
</li>
<li> <p><code>var(f)</code> and hence <code>sd(f)</code> now give an error for
<code>factor</code> arguments; they gave a deprecation warning since <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>
3.2.3, <a href="https://bugs.R-project.org/show_bug.cgi?id=16564">PR#16564</a>.
</p>
</li>
<li><p> Package <span class="pkg">tools</span>' <code>vignetteDepends()</code> has been
deprecated (it called a function deprecated since Feb 2016), being
partly replaced by newly exported <code>vignetteInfo()</code>.
</p>
</li>
<li><p> The <code>f77_f2c</code> script has been removed: it
no longer sufficed to compile the &lsquo;<span class="file">.f</span>&rsquo; files in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>.
</p>
</li>
<li><p> The deprecated legacy support of <code>make</code> macros such
as <span class="samp">CXX1X</span> has been removed: use the <span class="samp">CXX11</span> forms
instead.
</p>
</li>
<li><p> Make macro <span class="samp">F77_VISIBILITY</span> is deprecated in favour of
<span class="samp">F_VISIBILITY</span>.
</p>
</li>
<li><p> Make macros <span class="samp">F77</span>, <span class="samp">FCPIFCPLAGS</span> and
<span class="samp">SHLIB_OPENMP_FCFLAGS</span> are deprecated in favour of <span class="samp">FC</span>,
<span class="samp">FPICFLAGS</span> and <span class="samp">SHLIB_OPENMP_FFLAGS</span> respectively.
</p>
</li>
<li> <p><code>$.data.frame</code> had become an expensive version of
the default method, so has been removed. (Thanks to Radford Neal
for picking this up and to Duncan Murdoch for providing a patch.)
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li> <p><code>replayPlot(r)</code> now also works in the same <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> session
when <code>r</code> has been &ldquo;reproduced&rdquo; from serialization,
typically after saving to and reading from an RDS file.
</p>
</li>
<li> <p><code>substr()</code> and <code>substring()</code> now signal an error
when the input is invalid UTF-8.
</p>
</li>
<li> <p><code>file.copy()</code> now works also when its argument <code>to</code>
is of length greater than one.
</p>
</li>
<li> <p><code>mantelhaen.test()</code> no longer suffers from integer
overflow in largish cases, thanks to Ben Bolker's <a href="https://bugs.R-project.org/show_bug.cgi?id=17383">PR#17383</a>.
</p>
</li>
<li><p> Calling <code>setGeneric("foo")</code> in a package no longer
fails when the enclosing environment of the implicit generic
<code>foo()</code> is <code>.GlobalEnv</code>.
</p>
</li>
<li> <p><code>untar(file("&lt;some&gt;.tar.gz"), *)</code> now gives a better
error message, suggesting to use <code>gzfile()</code> instead.
</p>
</li>
<li><p> Method dispatch uses more relevant environments when looking
up class definitions.
</p>
</li>
<li><p> The documentation for <code>identify()</code> incorrectly claimed
that the indices of identified points were returned in the order
that the points were selected.  <code>identify()</code> now has a new
argument <code>order</code> to allow the return value to include the
order in which points were identified; the documentation has been
updated.  Reported by Richard Rowe and Samuel Granjeaud.
</p>
</li>
<li> <p><code>order(...., decreasing=c(TRUE, FALSE))</code> could fail in
some cases. Reported from StackOverflow via Karl Nordström.
</p>
</li>
<li><p> User macros in Rd files now accept empty and multi-line
arguments.
</p>
</li>
<li><p> Changes in <code>print.*()</code>, thanks to Lionel Henry's
patches in <a href="https://bugs.R-project.org/show_bug.cgi?id=17398">PR#17398</a>:
</p>

<ul>
<li><p> Printing lists, pairlists or attributes containing calls
with S3 class no longer evaluate those.
</p>
</li>
<li><p> Printing S4 objects within lists and pairlists dispatches
with <code>show()</code> rather than <code>print()</code>, as with
auto-printing.
</p>
</li>
<li><p> The indexing tags (names or <code>[[&lt;n&gt;]]</code>) of recursive
data structures are now printed correctly in complex cases.
</p>
</li>
<li><p> Arguments supplied to <code>print()</code> are now properly
forwarded to methods when printing lists, pairlists or
attributes containing S3 objects.
</p>
</li>
<li><p> The print parameters are now preserved when printing S3
objects or deparsing symbols and calls.  Previously, printing
lists containing S3 objects or expressions would reset these
parameters.
</p>
</li>
<li><p> Printing lists, pairlists or attributes containing
functions now uses <code>srcref</code> attributes if present.
</p>
</li></ul>

</li>
<li><p> Calling <code>install.packages()</code> with a length zero
<code>pkgs</code> argument now is a no-op (<a href="https://bugs.R-project.org/show_bug.cgi?id=17422">PR#17422</a>).
</p>
</li>
<li> <p><code>unlist(x)</code> now returns a correct <code>factor</code> when
<code>x</code> is a nested list with factor leaves, fixing <a href="https://bugs.R-project.org/show_bug.cgi?id=12572">PR#12572</a>
and <a href="https://bugs.R-project.org/show_bug.cgi?id=17419">PR#17419</a>.
</p>
</li>
<li><p> The documentation <code>help(family)</code> gives more details
about the <code>aic</code> component, thanks to Ben Bolker's prompting.
</p>
</li>
<li><p> The documentation for <code>attributes</code> and
<code>`attributes&lt;-`</code> now gives <code>x</code> as name of the first and
main argument which the implementation has been requiring, fixing
<a href="https://bugs.R-project.org/show_bug.cgi?id=17434">PR#17434</a>.  For consistency, the first argument name is also
changed from <code>obj</code> to <code>x</code> for <code>`mostattributes&lt;-`</code>.
</p>
</li>
<li> <p><code>strwidth()</code> now uses <code>par("font")</code> as default
font face (<a href="https://bugs.R-project.org/show_bug.cgi?id=17352">PR#17352</a>).
</p>
</li>
<li> <p><code>plot(&lt;table&gt;, log="x")</code> no longer warns about <code>log</code>.
</p>
</li>
<li><p> The <code>print()</code> method for <code>"htest"</code> objects now
formats the test statistic and parameter directly and hence no
longer rounds to units <em>before</em> the decimal point.  Consequently,
printing of <code>t.test()</code> results with a small number of digits
now shows non-large <code>df</code>'s to the full precision (<a href="https://bugs.R-project.org/show_bug.cgi?id=17444">PR#17444</a>).
</p>
</li>
<li> <p><code>kruskal.test()</code> and <code>fligner.test()</code> no longer
erroneously insist on numeric <code>g</code> group arguments (<a href="https://bugs.R-project.org/show_bug.cgi?id=16719">PR#16719</a>).
</p>
</li>
<li><p> Printing a news db via the browser now does a much better
job (<a href="https://bugs.R-project.org/show_bug.cgi?id=17433">PR#17433</a>).
</p>
</li>
<li> <p><code>print.aov()</code> missed column names in the multivariate case
due to misspelling (reported by Chris Andrews).
</p>
</li>
<li> <p><code>axis()</code> now creates valid <code>at</code> locations also for
small subnormal number ranges in log scale plots.
</p>
</li>
<li> <p><code>format.POSIXlt()</code> now also recycles the <code>zone</code>
and <code>gmtoff</code> list components to full length when needed,
and its internal C code detects <code>have_zone</code> in more cases.
In some cases, this changes its output to become compatible with
<code>format.POSIXct()</code>.
</p>
</li>
<li><p> On Windows, <code>detectCores()</code> in package <span class="pkg">parallel</span>
now detects processors in all processor groups, not just the group
<span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> is running in (impacts particularly systems with more than 64
logical processors).  Reported by Arunkumar Srinivasan.
</p>
</li>
<li><p> On Windows, <code>socketSelect()</code> would hang with more than
64 sockets, and hence <code>parallel::clusterApplyLB()</code> would hang
with more than 64 workers.  Reported by Arunkumar Srinivasan.
</p>
</li>
<li> <p><code>as(1L, "double")</code> now does coerce (<a href="https://bugs.R-project.org/show_bug.cgi?id=17457">PR#17457</a>).
</p>
</li>
<li> <p><code>lm.influence()</code>, <code>influence.measures()</code>,
<code>rstudent()</code> etc now work (more) correctly for multivariate
models (<code>"mlm"</code>), thanks to (anonymous) stackoverflow remarks.
</p>
</li>
<li> <p><code>sample.int(2.9, *, replace=TRUE)</code> again behaves as
documented and as in R &lt; 3.0.0, namely identically to
<code>sample.int(2, ..)</code>.
</p>
</li>
<li><p> Fixes to <code>convertColor()</code> for chromatic adaptation;
thanks to Brodie Gaslam <a href="https://bugs.R-project.org/show_bug.cgi?id=17473">PR#17473</a>.
</p>
</li>
<li><p> Using <code>\Sexpr[stage=install]{..}</code> to create an
&lsquo;<span class="file">Rd</span>&rsquo; section no longer gives a warning in <code>R CMD
	check</code>; problem originally posted by Gábor Csárdi, then reported
as <a href="https://bugs.R-project.org/show_bug.cgi?id=17479">PR#17479</a> with a partial patch by Duncan Murdoch.
</p>
</li>
<li><p> Parse data now include a special node for equal assignment.
</p>
</li>
<li> <p><code>split.default()</code> no longer relies on <code>[[&lt;-()</code>, so
it behaves as expected when splitting an object by a factor with
the empty string as one of its levels.  Thanks to Brad Friedman for
the report.
</p>
</li>
<li><p> Line numbers in messages about &lsquo;<span class="file">.Rd</span>&rsquo; files are now more
reliable, thanks to a patch from Duncan Murdoch.
</p>
</li>
<li><p> In the <code>numeric</code> method for <code>all.equal()</code>, a
numeric <code>scale</code> argument is now checked to be positive and
allowed to be of length &gt; 1. (The latter worked originally and
with a warning in recent years).
</p>
</li>
<li><p> Deferred string conversions now record the <code>OutDec</code>
option setting when not equal to the default.  Reported by Michael
Sannella.
</p>
</li>
<li><p> When <code>y</code> is numeric and <code>f</code> a <code>factor</code>,
<code>plot(y ~ f)</code> nicely uses &quot;y&quot; and &quot;f&quot; as y- and x-labels.
The more direct <code>boxplot(y ~ f)</code> now does too.  The new
argument <code>ann = FALSE</code> may be used to suppress these.
</p>
</li>
<li><p> Subassignment to no/empty rows of a data frame is more
consistent and typically a no-op in all cases instead of sometimes
an error; part of Emil Bode's <a href="https://bugs.R-project.org/show_bug.cgi?id=17483">PR#17483</a>.
</p>
</li>
<li><p> Calls like <code>formatC(*, zero.print = "&lt; 0.001")</code> no
longer give an error and are further improved via new optional
argument <code>replace.zero</code>.  Reported by David Hugh-Jones.
</p>
</li>
<li> <p><code>methods::formalArgs("&lt;fn&gt;")</code> now finds the same
function as <code>formals("&lt;fn&gt;")</code>, fixing Emil Bode's <a href="https://bugs.R-project.org/show_bug.cgi?id=17499">PR#17499</a>.
</p>
</li>
<li><p> The <span class="pkg">methods</span> package better handles duplicated class
names across packages.
</p>
</li>
<li><p> The default method of <code>seq()</code> now avoids integer
overflow, thanks to the report and &quot;cumsum&quot; patch of Suharto
Anggono's <a href="https://bugs.R-project.org/show_bug.cgi?id=17497">PR#17497</a>.
</p>
</li>
<li> <p><code>sub()</code> no longer loses encodings for non-ASCII
replacements (<a href="https://bugs.R-project.org/show_bug.cgi?id=17509">PR#17509</a>).
</p>
</li>
<li><p> Fix for rotated raster image on X11 device.  (Partial
fix for <a href="https://bugs.R-project.org/show_bug.cgi?id=17148">PR#17148</a>;  thanks to Mikko Korpela).
</p>
</li>
<li> <p><code>formula(model.frame(frml, ..))</code> now returns <code>frml</code>
in all cases, thanks to Bill Dunlap.   The previous behavior is
available as <code>DF2formula(&lt;model.frame&gt;)</code>.
</p>
</li>
<li> <p><code>ar.ols()</code> also returns scalar <code>var.pred</code> in
univariate case (<a href="https://bugs.R-project.org/show_bug.cgi?id=17517">PR#17517</a>).
</p>
</li>
<li> <p><code>normalizePath()</code> now treats <code>NA</code> path as non-existent
and normalizes it to <code>NA</code>.  <code>file.access()</code> treats <code>NA</code>
file name as non-existent.  <code>file.edit()</code> and connection
functions such as <code>file()</code> now treat <code>NA</code> file names as
errors.
</p>
</li>
<li><p> The internal <code>regularize.values()</code> auxiliary of
<code>approx()</code>, <code>splinefun()</code> etc now warns again when there
are ties and the caller did not specify <code>ties</code>.  Further, it no
longer duplicates <code>x</code> and <code>y</code> unnecessarily when <code>x</code>
is already sorted (<a href="https://bugs.R-project.org/show_bug.cgi?id=17515">PR#17515</a>).
</p>
</li>
<li> <p><code>strtoi("", base)</code> now gives <code>NA</code> on all platforms,
following its documentation.  Reported by Michael Chirico.
</p>
</li>
<li><p> In the definition of an S4 class, prototype elements are
checked against the slots of the class, with giving a prototype
for an undefined slot now being an error.  (Reported by Bill
Dunlap.)
</p>
</li>
<li><p> From <code>setClassUnion()</code>, if environment variable
<span class="env">_R_METHODS_SHOW_CHECKSUBCLASSES</span> is set
to true, the internal <code>.checkSubclasses()</code> utility prints
debugging info to see where it is used.
</p>
</li>
<li> <p><code>max.col(m)</code> with an <code>m</code> of zero columns now
returns integer <code>NA</code> (instead of <code>1</code>).
</p>
</li>
<li> <p><code>axTicks()</code> no longer returns small &ldquo;almost zero&rdquo;
numbers (in exponential format) instead of zero, fixing Ilario
Gelmetti's <a href="https://bugs.R-project.org/show_bug.cgi?id=17534">PR#17534</a>.
</p>
</li>
<li> <p><code>isSymmetric(matrix(0, dimnames=list("A","b")))</code> is
<code>FALSE</code> again, as always documented.
</p>
</li>
<li><p> The <code>cairo_pdf</code> graphics device (and other Cairo-based
devices) now clip correctly to the right and bottom border.
</p>
<p>There was an off-by-one-pixel bug, reported by Lee Kelvin.
</p>
</li>
<li> <p><code>as.roman(3) &lt;= 2:4</code> and all other comparisons now work,
as do group <code>"Summary"</code> function calls such as
<code>max(as.roman(sample(20)))</code> and <code>as.roman(NA)</code>.
(Partly reported by Bill Dunlap in <a href="https://bugs.R-project.org/show_bug.cgi?id=17542">PR#17542</a>.)
</p>
</li>
<li> <p><code>reformulate("x", response = "sin(y)")</code> no longer produces
extra back quotes, <a href="https://bugs.R-project.org/show_bug.cgi?id=17359">PR#17359</a>, and gains new optional argument
<code>env</code>.
</p>
</li>
<li><p> When reading console input from &lsquo;<span class="file">stdin</span>&rsquo; with re-encoding
(<code>R --encoding=enc &lt; input</code>) the code on a Unix-alike now
ensures that each converted input line is terminated with a
newline even if re-encoding fails.
</p>
</li>
<li> <p><code>as.matrix.data.frame()</code> now produces better strings from
logicals, thanks to <a href="https://bugs.R-project.org/show_bug.cgi?id=17548">PR#17548</a> from Gabe Becker.
</p>
</li>
<li><p> The S4 generic signature of <code>rowSums()</code>,
<code>rowMeans()</code>, <code>colSums()</code> and <code>colMeans()</code> is
restricted to <code>"x"</code>.
</p>
</li>
<li> <p><code>match(x, tab)</code> now works for long <em>character</em>
vectors <code>x</code>, thanks to <a href="https://bugs.R-project.org/show_bug.cgi?id=17552">PR#17552</a> by Andreas Kersting.
</p>
</li>
<li><p> Class unions are unloaded when their namespace is
unloaded (<a href="https://bugs.R-project.org/show_bug.cgi?id=17531">PR#17531</a>, adapted from a patch by Brodie Gaslam).
</p>
</li>
<li> <p><code>selectMethod()</code> is robust to ANY-truncation of method
signatures (thanks to Herve Pages for the report).
</p>
</li></ul>




<h3><img src="../help/figures/../../html/Rlogo.svg" class="toplogo" alt="[R logo]" /> CHANGES IN R 3.5.3</h3>



<h4>INSTALLATION on a UNIX-ALIKE</h4>


<ul>
<li><p> Detection of flags for C++98/11/14/17 has been improved: in
particular if CXX??STD is set, it is tried first with no
additional flags.
</p>
</li></ul>




<h4>PACKAGE INSTALLATION</h4>


<ul>
<li><p> New macro <span class="samp">F_VISIBILITY</span> as an alternative to
<span class="samp">F77_VISIBILITY</span>.  This will become the preferred form in
<span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.6.0.
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li> <p><code>writeLines(readLines(fnam), fnam)</code> now works as expected,
thanks to Peter Meissner's <a href="https://bugs.R-project.org/show_bug.cgi?id=17528">PR#17528</a>.
</p>
</li>
<li> <p><code>setClassUnion()</code> no longer warns, but uses <code>message()</code>
for now, when encountering &ldquo;non local&rdquo; subclasses of class members.
</p>
</li>
<li> <p><code>stopifnot(exprs = T)</code> no longer fails.
</p>
</li></ul>




<h3><img src="../help/figures/../../html/Rlogo.svg" class="toplogo" alt="[R logo]" /> CHANGES IN R 3.5.2</h3>



<h4>PACKAGE INSTALLATION</h4>


<ul>
<li><p> New macro <span class="samp">CXX_VISIBILITY</span> analogous to
<span class="samp">C_VISIBILITY</span> (which several packages have been misusing for
C++ code) for the default C++ compiler (but not necessarily one used
for non-default C++ dialects like C++14).
</p>
</li></ul>




<h4>TESTING</h4>


<ul>
<li><p> The random number generator tests in
&lsquo;<span class="file">tests/p-r-random-tests.R</span>&rsquo; no longer fail occasionally as
they now randomly sample from &ldquo;certified&rdquo; random seeds.
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li><p> The <code>"glm"</code> method of <code>drop1()</code> miscalculated the
score test (<code>test="Rao"</code>) when the model contained an offset.
</p>
</li>
<li><p> Linear multiple empty models such as <code>lm(y ~ 0)</code>
now have a correctly dimensioned empty coefficient matrix;
reported by Brett Presnell.
</p>
</li>
<li> <p><code>vcov(&lt;empty mlm&gt;)</code> and hence <code>confint()</code> now
work (via a consistency change in <code>summary.lm()</code>).
</p>
</li>
<li> <p><code>confint(&lt;multiple lm()&gt;)</code> now works correctly;
reported on R-devel by Steven Pav.
</p>
</li>
<li> <p><code>quade.test()</code> now also works correctly when its
arguments are not yet sorted along <code>groups</code>, fixing <a href="https://bugs.R-project.org/show_bug.cgi?id=15842">PR#15842</a>.
</p>
</li>
<li><p> Installation on a Unix-alike tries harder to link to the
<span class="samp">pthread</span> library where required (rather than relying on
OpenMP to provide it: configuring with <span class="option">--disable-openmp</span>
was failing on some Linux systems).
</p>
</li>
<li><p> The <code>data.frame</code> method for <code>print(x)</code> is fast now
also for large data frames <code>x</code> and got an optional argument
<code>max</code>, thanks to suggestions by Juan Telleria.
</p>
</li>
<li> <p><code>hist()</code> no longer integer overflows in very rare
cases, fixing <a href="https://bugs.R-project.org/show_bug.cgi?id=17450">PR#17450</a>.
</p>
</li>
<li> <p><code>untar()</code> ignored a character <code>compressed</code>
argument: however many external <code>tar</code> programs ignore
the flags which should have been set and automagically choose the
compression type, and if appropriate <code>gzip</code> or
<code>bzip2</code> compression would have been chosen from the magic
header of the tarball.
</p>
</li>
<li> <p><code>zapsmall(x)</code> now works for more &ldquo;number-like&rdquo; objects.
</p>
</li>
<li><p> The tools-internal function called from <code>R CMD
	INSTALL</code> now gets a <code>warnOption = 1</code> argument and only sets
<code>options(warn = warnOption)</code> when that increases the warning
level (<a href="https://bugs.R-project.org/show_bug.cgi?id=17453">PR#17453</a>).
</p>
</li>
<li><p> Analogously, the tools-internal function called from <code>R CMD
	check</code> gets a <code>warnOption = 1</code> argument and uses the larger
of that and <code>getOption("warn")</code>, also allowing to be run with
increased warning level.
</p>
</li>
<li><p> Parse data now have deterministic parent nodes (<a href="https://bugs.R-project.org/show_bug.cgi?id=16041">PR#16041</a>).
</p>
</li>
<li><p> Calling <code>match()</code> with length one <code>x</code> and POSIXlt
<code>table</code> gave a segfault (<a href="https://bugs.R-project.org/show_bug.cgi?id=17459">PR#17459</a>).
</p>
</li>
<li><p> Fork clusters could hang due to a race condition in cluster
initialization (<code>makeCluster()</code>).
</p>
</li>
<li> <p><code>nextn(n)</code> now also works for larger <code>n</code> and no
longer loops infinitely for e.g, <code>n &lt;- 214e7</code>.
</p>
</li>
<li> <p><code>cooks.distance()</code> and <code>rstandard()</code> now work
correctly for multiple linear models (<code>"mlm"</code>).
</p>
</li>
<li> <p><code>polym()</code> and corresponding <code>lm()</code> prediction now
also work for a boundary &quot;vector&quot; case fixing <a href="https://bugs.R-project.org/show_bug.cgi?id=17474">PR#17474</a>,
reported by Alexandre Courtiol.
</p>
</li>
<li><p> With a very large number of variables <code>terms()</code> could
segfault (<a href="https://bugs.R-project.org/show_bug.cgi?id=17480">PR#17480</a>).
</p>
</li>
<li> <p><code>cut(rep(0, 7))</code> now works, thanks to Joey Reid and
Benjamin Tyner (<a href="https://bugs.R-project.org/show_bug.cgi?id=16802">PR#16802</a>).
</p>
</li>
<li> <p><code>download.file(*, method = "curl", cacheOK = FALSE)</code>
should work now on Windows, thanks to Kevin Ushey's patch in
<a href="https://bugs.R-project.org/show_bug.cgi?id=17323">PR#17323</a>.
</p>
</li>
<li> <p><code>duplicated(&lt;dataframe with 'f'&gt;)</code> now works, too,
thanks to Andreas Kersting's <a href="https://bugs.R-project.org/show_bug.cgi?id=17485">PR#17485</a>; ditto for
<code>anyDuplicated()</code>.
</p>
</li>
<li> <p><code>legend(*, cex = 1:2)</code> now works less badly.
</p>
</li>
<li><p> The <code>print()</code> method for <code>POSIXct</code> and
<code>POSIXlt</code> now correctly obeys <code>getOption("max.print")</code>,
fixing a long-standing typo, and it also gets a corresponding
optional <code>max</code> argument.
</p>
</li>
<li><p> Unserialization of raw vectors serialized in ASCII
representation now works correctly.
</p>
</li>
<li> <p><code>&lt;data frame&gt;[TRUE, &lt;new&gt;] &lt;- list(c1, c2)</code> now works
correctly, thanks to Suharto Anggono's <a href="https://bugs.R-project.org/show_bug.cgi?id=15362">PR#15362</a> and Emil Bode's
patch in <a href="https://bugs.R-project.org/show_bug.cgi?id=17504">PR#17504</a>.
</p>
</li>
<li> <p><code>seq.int(*, by=by, length=n)</code> no longer wrongly
&ldquo;drops fractional parts&rdquo; when <code>by</code> is integer, thanks
to Suharto Anggono's report <a href="https://bugs.R-project.org/show_bug.cgi?id=17506">PR#17506</a>.
</p>
</li>
<li><p> Buffering is disabled for <code>file()</code> connections to
non-regular files (like sockets), as well as <code>fifo()</code> and
<code>pipe()</code> connections.  Fixes <a href="https://bugs.R-project.org/show_bug.cgi?id=17470">PR#17470</a>, reported by Chris
Culnane.
</p>
</li></ul>




<h3><img src="../help/figures/../../html/Rlogo.svg" class="toplogo" alt="[R logo]" /> CHANGES IN R 3.5.1</h3>



<h4>BUG FIXES</h4>


<ul>
<li> <p><code>file("stdin")</code> is no longer considered seekable.
</p>
</li>
<li> <p><code>dput()</code> and <code>dump()</code> are no longer truncating
when <code>options(deparse.max.lines = *)</code> is set.
</p>
</li>
<li><p> Calls with an S3 class are no longer evaluated when printed,
fixing part of <a href="https://bugs.R-project.org/show_bug.cgi?id=17398">PR#17398</a>, thanks to a patch from Lionel Henry.
</p>
</li>
<li><p> Allow <code>file</code> argument of <code>Rscript</code> to include space
even when it is first on the command line.
</p>
</li>
<li> <p><code>callNextMethod()</code> uses the generic from the
environment of the calling method. Reported by Hervé Pagès with
well documented examples.
</p>
</li>
<li><p> Compressed file connections are marked as blocking.
</p>
</li>
<li> <p><code>optim(*, lower = c(-Inf, -Inf))</code> no longer warns (and
switches the method), thanks to a suggestion by John Nash.
</p>
</li>
<li> <p><code>predict(fm, newdata)</code> is now correct also for models
where the formula has terms such as <code>splines::ns(..)</code> or
<code>stats::poly(..)</code>, fixing <a href="https://bugs.R-project.org/show_bug.cgi?id=17414">PR#17414</a>, based on a patch from
Duncan Murdoch.
</p>
</li>
<li> <p><code>simulate.lm(glm(*, gaussian(link = &lt;non-default&gt;)))</code>
has been corrected, fixing <a href="https://bugs.R-project.org/show_bug.cgi?id=17415">PR#17415</a> thanks to Alex Courtiol.
</p>
</li>
<li> <p><code>unlist(x)</code> no longer fails in some cases of nested
empty lists.  Reported by Steven Nydick.
</p>
</li>
<li> <p><code>qr.coef(qr(&lt;all 0, w/ colnames&gt;))</code> now works.
Reported by Kun Ren.
</p>
</li>
<li><p> The radix sort is robust to vectors with &gt;1 billion elements
(but long vectors are still unsupported). Thanks to Matt Dowle for
the fix.
</p>
</li>
<li><p> Terminal connections (e.g., stdin) are no longer
buffered. Fixes <a href="https://bugs.R-project.org/show_bug.cgi?id=17432">PR#17432</a>.
</p>
</li>
<li> <p><code>deparse(x)</code>, <code>dput(x)</code> and <code>dump()</code> now
respect <code>c()</code>'s argument names <code>recursive</code> and
<code>use.names</code>, e.g., for <code>x &lt;- setNames(0, "recursive")</code>,
thanks to Suharto Anggono's <a href="https://bugs.R-project.org/show_bug.cgi?id=17427">PR#17427</a>.
</p>
</li>
<li><p> Unbuffered connections now work with encoding conversion.
Reported by Stephen Berman.
</p>
</li>
<li> <p>&lsquo;<span class="file">.Renviron</span>&rsquo; on Windows with <code>Rgui</code> is again by
default searched for in user documents directory when invoked
<em>via</em> the launcher icon.  Reported by Jeroen Ooms.
</p>
</li>
<li> <p><code>printCoefmat()</code> now also works with explicit
<code>right=TRUE</code>.
</p>
</li>
<li> <p><code>print.noquote()</code> now also works with explicit
<code>quote=FALSE</code>.
</p>
</li>
<li><p> The default method for <code>pairs(.., horInd=*, verInd=*)</code>
now gets the correct order, thanks to reports by Chris Andrews and
Gerrit Eichner.  Additionally, when <code>horInd</code> or <code>verInd</code>
contain only a subset of variables, all the axes are labeled
correctly now.
</p>
</li>
<li> <p><code>agrep("..|..", .., fixed=FALSE)</code> now matches when it
should, thanks to a reminder by Andreas Kolter.
</p>
</li>
<li> <p><code>str(ch)</code> now works for more invalid multibyte strings.
</p>
</li></ul>




<h3><img src="../help/figures/../../html/Rlogo.svg" class="toplogo" alt="[R logo]" /> CHANGES IN R 3.5.0</h3>



<h4>SIGNIFICANT USER-VISIBLE CHANGES</h4>


<ul>
<li><p> All packages are by default byte-compiled on installation.
This makes the installed packages larger (usually marginally so)
and may affect the format of messages and tracebacks (which often
exclude <code>.Call</code> and similar).
</p>
</li></ul>




<h4>NEW FEATURES</h4>


<ul>
<li> <p><code>factor()</code> now uses <code>order()</code> to sort its levels,
rather than <code>sort.list()</code>.  This allows <code>factor()</code> to
support custom vector-like objects if methods for the appropriate
generics are defined.  It has the side effect of making
<code>factor()</code> succeed on empty or length-one non-atomic
vector(-like) types (e.g., <code>"list"</code>), where it failed before.
</p>
</li>
<li> <p><code>diag()</code> gets an optional <code>names</code> argument: this
may require updates to packages defining S4 methods for it.
</p>
</li>
<li> <p><code>chooseCRANmirror()</code> and <code>chooseBioCmirror()</code> no
longer have a <code>useHTTPS</code> argument, not needed now all <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>
builds support <span class="samp">https://</span> downloads.
</p>
</li>
<li><p> New <code>summary()</code> method for <code>warnings()</code> with a
(somewhat experimental) <code>print()</code> method.
</p>
</li>
<li><p> (<span class="pkg">methods</span> package.) <code>.self</code> is now automatically
registered as a global variable when registering a reference class
method.
</p>
</li>
<li> <p><code>tempdir(check = TRUE)</code> recreates the <code>tempdir()</code>
directory if it is no longer valid (e.g. because some
other process has cleaned up the &lsquo;<span class="file">/tmp</span>&rsquo; directory).
</p>
</li>
<li><p> New <code>askYesNo()</code> function and <code>"askYesNo"</code> option
to ask the user binary response questions in a customizable but
consistent way.  (Suggestion of <a href="https://bugs.R-project.org/show_bug.cgi?id=17242">PR#17242</a>.)
</p>
</li>
<li><p> New low level utilities <code>...elt(n)</code> and <code>...length()</code>
for working with <code>...</code> parts inside a function.
</p>
</li>
<li> <p><code>isTRUE()</code> is more tolerant and now true
in  </p>
<pre>   x &lt;- rlnorm(99)
   isTRUE(median(x) == quantile(x)["50%"])</pre>
<p>New function <code>isFALSE()</code> defined analogously to <code>isTRUE()</code>.
</p>
</li>
<li><p> The default symbol table size has been increased from 4119
to 49157; this may improve the performance of symbol resolution
when many packages are loaded.  (Suggested by Jim Hester.)
</p>
</li>
<li> <p><code>line()</code> gets a new option <code>iter = 1</code>.
</p>
</li>
<li><p> Reading from connections in text mode is buffered,
significantly improving the performance of <code>readLines()</code>, as
well as <code>scan()</code> and <code>read.table()</code>, at least when
specifying <code>colClasses</code>.
</p>
</li>
<li> <p><code>order()</code> is smarter about picking a default sort
<code>method</code> when its arguments are objects.
</p>
</li>
<li> <p><code>available.packages()</code> has two new arguments which
control if the values from the per-session repository cache are
used (default true, as before) and if so how old cached values can
be used (default one hour).
</p>
<p>These arguments can be passed from <code>install.packages()</code>,
<code>update.packages()</code> and functions calling that: to enable
this <code>available.packages()</code>, <code>packageStatus()</code> and
<code>download.file()</code> gain a <code>...</code> argument.
</p>
</li>
<li> <p><code>packageStatus()</code>'s <code>upgrade()</code> method no longer
ignores its <code>...</code> argument but passes it to
<code>install.packages()</code>.
</p>
</li>
<li> <p><code>installed.packages()</code> gains a <code>...</code> argument to
allow arguments (including <code>noCache</code>) to be passed from
<code>new.packages()</code>, <code>old.packages()</code>,
<code>update.packages()</code> and <code>packageStatus()</code>.
</p>
</li>
<li> <p><code>factor(x, levels, labels)</code> now allows duplicated
<code>labels</code> (not duplicated <code>levels</code>!).  Hence you can map
different values of <code>x</code> to the same level directly.
</p>
</li>
<li><p> Attempting to use <code>names&lt;-()</code> on an S4 derivative of a
basic type no longer emits a warning.
</p>
</li>
<li><p> The <code>list</code> method of <code>within()</code> gains an option
<code>keepAttrs = FALSE</code> for some speed-up.
</p>
</li>
<li> <p><code>system()</code> and <code>system2()</code> now allow the
specification of a maximum elapsed time (&lsquo;timeout&rsquo;).
</p>
</li>
<li> <p><code>debug()</code> supports debugging of methods on any object
of S4 class <code>"genericFunction"</code>, including group generics.
</p>
</li>
<li><p> Attempting to increase the length of a variable containing
<code>NULL</code> using <code>length()&lt;-</code> still has no effect on the
target variable, but now triggers a warning.
</p>
</li>
<li> <p><code>type.convert()</code> becomes a generic function, with
additional methods that operate recursively over list and
<code>data.frame</code> objects. Courtesy of Arni Magnusson
(<a href="https://bugs.R-project.org/show_bug.cgi?id=17269">PR#17269</a>).
</p>
</li>
<li> <p><code>lower.tri(x)</code> and <code>upper.tri(x)</code> only needing
<code>dim(x)</code> now work via new functions <code>.row()</code> and
<code>.col()</code>, so no longer call <code>as.matrix()</code> by default in
order to work efficiently for all kind of matrix-like objects.
</p>
</li>
<li> <p><code>print()</code> methods for <code>"xgettext"</code> and
<code>"xngettext"</code> now use <code>encodeString()</code> which keeps,
e.g. <code>"\n"</code>, visible.  (Wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=17298">PR#17298</a>.)
</p>
</li>
<li> <p><code>package.skeleton()</code> gains an optional <code>encoding</code>
argument.
</p>
</li>
<li> <p><code>approx()</code>, <code>spline()</code>, <code>splinefun()</code> and
<code>approxfun()</code> also work for long vectors.
</p>

</li>
<li> <p><code>deparse()</code> and <code>dump()</code> are more useful for S4
objects, <code>dput()</code> now using the same internal C code instead
of its previous imperfect workaround R code.  S4 objects now
typically deparse perfectly, i.e., can be recreated identically
from deparsed code.
</p>
<p><code>dput()</code>, <code>deparse()</code> and <code>dump()</code> now print the
<code>names()</code> information only once, using the more readable
<code>(tag = value)</code> syntax, notably for <code>list()</code>s, i.e.,
including data frames.
</p>
<p>These functions gain a new control option <code>"niceNames"</code> (see
<code>.deparseOpts()</code>), which when set (as by default) also uses
the <code>(tag = value)</code> syntax for atomic vectors.  On the other
hand, without deparse options <code>"showAttributes"</code> and
<code>"niceNames"</code>, names are no longer shown also for lists.
<code>as.character(list(  c (one = 1)))</code> now includes the name, as
<code>as.character(list(list(one = 1)))</code> has always done.
</p>
<p><code>m:n</code> now also deparses nicely when <i>m &gt; n</i>.
</p>
<p>The <code>"quoteExpressions"</code> option, also part of <code>"all"</code>,
no longer <code>quote()</code>s formulas as that may not re-parse
identically.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=17378">PR#17378</a>)
</p>
</li>
<li><p> If the option <code>setWidthOnResize</code> is set and <code>TRUE</code>,
<span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> run in a terminal using a recent <code>readline</code> library will
set the <code>width</code> option when the terminal is
resized.  Suggested by Ralf Goertz.
</p>
</li>
<li><p> If multiple <code>on.exit()</code> expressions are set using
<code>add = TRUE</code> then all expressions will now be run even if one
signals an error.
</p>
</li>
<li> <p><code>mclapply()</code> gets an option <code>affinity.list</code> which
allows more efficient execution with heterogeneous processors,
thanks to Helena Kotthaus.
</p>
</li>
<li><p> The <code>character</code> methods for <code>as.Date()</code> and
<code>as.POSIXlt()</code> are more flexible <em>via</em> new arguments
<code>tryFormats</code> and <code>optional</code>: see their help pages.
</p>
</li>
<li> <p><code>on.exit()</code> gains an optional argument <code>after</code>
with default <code>TRUE</code>. Using <code>after = FALSE</code> with
<code>add = TRUE</code> adds an exit expression before any
existing ones. This way the expressions are run in a first-in
last-out fashion. (From Lionel Henry.)
</p>
</li>
<li><p> On Windows, <code>file.rename()</code> internally retries the
operation in case of error to attempt to recover from possible
anti-virus interference.
</p>
</li>
<li><p> Command line completion on <span class="samp">::</span> now also includes
lazy-loaded data.
</p>
</li>
<li><p> If the <span class="env">TZ</span> environment variable is set when date-time
functions are first used, it is recorded as the session default
and so will be used rather than the default deduced from the OS
if <span class="env">TZ</span> is subsequently unset.
</p>
</li>
<li><p> There is now a <code>[</code> method for class <code>"DLLInfoList"</code>.
</p>
</li>
<li> <p><code>glm()</code> and <code>glm.fit</code> get the same
<code>singular.ok = TRUE</code> argument that <code>lm()</code> has had
forever.  As a consequence, in <code>glm(*, method = &lt;your_own&gt;)</code>,
user specified methods need to accept a <code>singular.ok</code>
argument as well.
</p>
</li>
<li> <p><code>aspell()</code> gains a filter for Markdown (&lsquo;<span class="file">.md</span>&rsquo; and
&lsquo;<span class="file">.Rmd</span>&rsquo;) files.
</p>
</li>
<li> <p><code>intToUtf8(multiple = FALSE)</code> gains an argument to
allow surrogate pairs to be interpreted.
</p>
</li>
<li><p> The maximum number of DLLs that can be loaded into R
e.g. <em>via</em> <code>dyn.load()</code> has been increased up to 614
when the OS limit on the number of open files allows.
</p>
</li>
<li> <p><code>Sys.timezone()</code> on a Unix-alike caches the value at
first use in a session: <em>inter alia</em> this means that setting
<span class="env">TZ</span> later in the session affects only the <em>current</em> time
zone and not the <em>system</em> one.
</p>
<p><code>Sys.timezone()</code> is now used to find the system timezone to
pass to the code used when <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> is configured with
<span class="option">--with-internal-tzcode</span>.
</p>
</li>
<li><p> When <code>tar()</code> is used with an external command which is
detected to be GNU <code>tar</code> or libarchive <code>tar</code> (aka
<code>bsdtar</code>), a different command-line is generated to
circumvent line-length limits in the shell.
</p>
</li>
<li> <p><code>system(*, intern = FALSE)</code>, <code>system2()</code> (when not
capturing output), <code>file.edit()</code> and <code>file.show()</code> now
issue a warning when the external command cannot be executed.
</p>
</li>
<li><p> The &ldquo;default&rdquo; (<code>"lm"</code> etc) methods of
<code>vcov()</code> have gained new optional argument <code>complete =
      TRUE</code> which makes the <code>vcov()</code> methods more consistent with
the <code>coef()</code> methods in the case of singular designs.  The
former (back-compatible) behavior is given by <code>vcov(*,
	complete = FALSE)</code>.
</p>
</li>
<li> <p><code>coef()</code> methods (for <code>lm</code> etc) also gain a
<code>complete = TRUE</code> optional argument for consistency with
<code>vcov()</code>. <br />
For <code>"aov"</code>, both <code>coef()</code> and <code>vcov()</code> methods
remain back-compatibly consistent, using the <em>other</em> default,
<code>complete = FALSE</code>.
</p>
</li>
<li> <p><code>attach(*, pos = 1)</code> is now an error instead of a
warning.
</p>
</li>
<li><p> New function <code>getDefaultCluster()</code> in package
<span class="pkg">parallel</span> to get the default cluster set via
<code>setDefaultCluster()</code>.
</p>
</li>
<li> <p><code>str(x)</code> for atomic objects <code>x</code> now treats both
cases of <code>is.vector(x)</code> similarly, and hence much less often
prints <code>"atomic"</code>.  This is a slight non-back-compatible
change producing typically both more informative and shorter
output.
</p>
</li>
<li> <p><code>gc()</code> gets new argument <code>full</code>.
</p>
</li>
<li> <p><code>write.dcf()</code> gets optional argument <code>useBytes</code>.
</p>
</li>
<li><p> New, partly experimental <code>packageDate()</code> which tries to
get a valid <code>"Date"</code> object from a package &lsquo;<span class="file">DESCRIPTION</span>&rsquo;
file, thanks to suggestions in <a href="https://bugs.R-project.org/show_bug.cgi?id=17324">PR#17324</a>.
</p>
</li>
<li> <p><code>tools::resaveRdaFiles()</code> gains a <code>version</code>
argument, for use when packages should remain compatible with
earlier versions of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>.
</p>
</li>
<li> <p><code>ar.yw(x)</code> and hence by default <code>ar(x)</code> now work
when <code>x</code> has <code>NA</code>s, mostly thanks to a patch by Pavel
Krivitsky in <a href="https://bugs.R-project.org/show_bug.cgi?id=17366">PR#17366</a>.   The <code>ar.yw.default()</code>'s AIC
computations have become more efficient by using
<code>determinant()</code>.
</p>
</li>
<li><p> New <code>warnErrList()</code> utility (from package <span class="pkg">nlme</span>,
improved).
</p>
</li>
<li><p> By default the (arbitrary) signs of the loadings from
<code>princomp()</code> are chosen so the first element is non-negative.
</p>
</li>
<li><p> If <span class="option">--default-packages</span> is not used, then
<code>Rscript</code> now checks the environment variable
<span class="env">R_SCRIPT_DEFAULT_PACKAGES</span>. If this is set, then it takes
precedence over <span class="env">R_DEFAULT_PACKAGES</span>. If default packages are
not specified on the command line or by one of these environment
variables, then <code>Rscript</code> now uses the same default
packages as <code>R</code>. For now, the previous behavior of not
including <span class="pkg">methods</span> can be restored by setting the environment
variable <span class="env">R_SCRIPT_LEGACY</span> to <span class="samp">yes</span>.
</p>
</li>
<li><p> When a package is found more than once, the warning from
<code>find.package(*, verbose=TRUE)</code> lists all library locations.
</p>
</li>
<li><p> POSIXt objects can now also be rounded or truncated to month
or year.
</p>
</li>
<li> <p><code>stopifnot()</code> can be used alternatively via new argument
<code>exprs</code> which is nicer and useful when testing several
expressions in one call.
</p>
</li>
<li><p> The environment variable <span class="env">R_MAX_VSIZE</span> can now be used
to specify the maximal vector heap size. On macOS, unless specified
by this environment variable, the maximal vector heap size is set to
the maximum of 16GB and the available physical memory. This is to
avoid having the <code>R</code> process killed when macOS over-commits
memory.
</p>
</li>
<li> <p><code>sum(x)</code> and <code>sum(x1, x2, .., x&lt;N&gt;)</code> with many or
long logical or integer vectors no longer overflows (and returns
<code>NA</code> with a warning), but returns <code>double</code> numbers in
such cases.
</p>
</li>
<li><p> Single components of <code>"POSIXlt"</code> objects can now be
extracted and replaced via <code>[</code> indexing with 2 indices.
</p>
</li>
<li><p> S3 method lookup now searches the namespace registry after
the top level environment of the calling environment.
</p>
</li>
<li><p> Arithmetic sequences created by <code>1:n</code>,
<code>seq_along</code>, and the like now use compact internal
representations via the <code>ALTREP</code> framework.  Coercing integer
and numeric vectors to character also now uses the <code>ALTREP</code>
framework to defer the actual conversion until first use.
</p>
</li>
<li><p> Finalizers are now run with interrupts suspended.
</p>
</li>
<li> <p><code>merge()</code> gains new option <code>no.dups</code> and by
default suffixes the second of two duplicated column names,
thanks to a proposal by Scott Ritchie (and Gabe Becker).
</p>
</li>
<li> <p><code>scale.default(x, center, scale)</code> now also allows
<code>center</code> or <code>scale</code> to be &ldquo;numeric-alike&rdquo;, i.e.,
such that <code>as.numeric(.)</code> coerces them correctly.  This also
eliminates a wrong error message in such cases.
</p>
</li>
<li> <p><code>par*apply</code> and <code>par*applyLB</code> gain an optional
argument <code>chunk.size</code> which allows to specify the granularity of
scheduling.
</p>
</li>
<li><p> Some <code>as.data.frame()</code> methods, notably the
<code>matrix</code> one, are now more careful in not accepting
duplicated or <code>NA</code> row names, and by default produce unique
non-NA row names.  This is based on new function
<code>.rowNamesDF(x, make.names = *) &lt;- rNms</code> where the logical
argument <code>make.names</code> allows to specify <em>how</em> invalid
row names <code>rNms</code> are handled.  <code>.rowNamesDF()</code> is a
&ldquo;workaround&rdquo; compatible default.
</p>
</li>
<li><p> R has new serialization format (version 3) which supports
custom serialization of <code>ALTREP</code> framework objects.  These
objects can still be serialized in format 2, but less efficiently.
Serialization format 3 also records the current native encoding of
unflagged strings and converts them when de-serialized in R
running under different native encoding.  Format 3 comes with new
serialization magic numbers (RDA3, RDB3, RDX3).  Format 3 can be
selected by <code>version = 3</code> in <code>save()</code>,
<code>serialize()</code> and <code>saveRDS()</code>, but format 2 remains the
default for all serialization and saving of the workspace.
Serialized data in format 3 cannot be read by versions of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> prior
to version 3.5.0.
</p>
</li>
<li><p> The <code>"Date"</code> and &ldquo;date-time&rdquo; classes
<code>"POSIXlt"</code> and <code>"POSIXct"</code> now have a working
<code>length&lt;-()</code> method, as wished in <a href="https://bugs.R-project.org/show_bug.cgi?id=17387">PR#17387</a>.
</p>
</li>
<li> <p><code>optim(*, control = list(warn.1d.NelderMead = FALSE))</code>
allows to turn off the warning when applying the default
<code>"Nelder-Mead"</code> method to 1-dimensional problems.
</p>
</li>
<li> <p><code>matplot(.., panel.first = .)</code> etc now work, as
<code>log</code> becomes explicit argument and <code>...</code> is passed to
<code>plot()</code> unevaluated, as suggested by Sebastian Meyer in <a href="https://bugs.R-project.org/show_bug.cgi?id=17386">PR#17386</a>.
</p>
</li>
<li><p> Interrupts can be suspended while evaluating an expression
using <code>suspendInterrupts</code>.  Subexpression can be evaluated
with interrupts enabled using <code>allowInterrupts</code>.  These
functions can be used to make sure cleanup handlers cannot be
interrupted.
</p>
</li>
<li> <p><span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.5.0 includes a framework that allows packages to
provide alternate representations of basic <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> objects
(<code>ALTREP</code>).  The framework is still experimental and may
undergo changes in future <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> releases as more experience is
gained. For now, documentation is provided in
<a href="https://svn.r-project.org/R/branches/ALTREP/ALTREP.html">https://svn.r-project.org/R/branches/ALTREP/ALTREP.html</a>.
</p>
</li></ul>




<h4>UTILITIES</h4>


<ul>
<li> <p><code>install.packages()</code> for source packages now has the
possibility to set a &lsquo;timeout&rsquo; (elapsed-time limit).  For
serial installs this uses the <code>timeout</code> argument of
<code>system2()</code>: for parallel installs it requires the
<code>timeout</code> utility command from GNU <span class="pkg">coreutils</span>.
</p>
</li>
<li><p> It is now possible to set &lsquo;timeouts&rsquo; (elapsed-time
limits) for most parts of <code>R CMD check</code> <em>via</em>
environment variables documented in the &lsquo;R Internals&rsquo;
manual.
</p>
</li>
<li><p> The &lsquo;BioC extra&rsquo; repository which was dropped from
Bioconductor 3.6 and later has been removed from
<code>setRepositories()</code>.  This changes the mapping for 6&ndash;8 used
by <code>setRepositories(ind=)</code>.
</p>
</li>
<li> <p><code>R CMD check</code> now also applies the settings of
environment variables <span class="env">_R_CHECK_SUGGESTS_ONLY_</span> and
<span class="env">_R_CHECK_DEPENDS_ONLY_</span> to the re-building of vignettes.
</p>
</li>
<li> <p><code>R CMD check</code> with environment variable
<span class="env">_R_CHECK_DEPENDS_ONLY_</span> set to a true value makes
test-suite-management packages available and (for the time being)
works around a common omission of <a href="https://CRAN.R-project.org/package=rmarkdown"><span class="pkg">rmarkdown</span></a> from the
<span class="samp">VignetteBuilder</span> field.
</p>
</li></ul>




<h4>INSTALLATION on a UNIX-ALIKE</h4>


<ul>
<li><p> Support for a system Java on macOS has been
removed &mdash; install a fairly recent Oracle Java (see &lsquo;R
Installation and Administration&rsquo; §C.3.2).
</p>
</li>
<li> <p><code>configure</code> works harder to set additional flags in
<span class="samp">SAFE_FFLAGS</span> only where necessary, and to use flags which
have little or no effect on performance.
</p>
<p>In rare circumstances it may be necessary to override the
setting of <span class="samp">SAFE_FFLAGS</span>.
</p>
</li>
<li><p> C99 functions <code>expm1</code>, <code>hypot</code>, <code>log1p</code> and
<code>nearbyint</code> are now required.
</p>
</li>
<li> <p><code>configure</code> sets a <span class="option">-std</span> flag for the C++
compiler for all supported C++ standards (e.g., <span class="option">-std=gnu++11</span>
for the C++11 compiler).   Previously this was not done in a few
cases where the default standard passed the tests made
(e.g. <code>clang 6.0.0</code> for C++11).
</p>
</li></ul>




<h4>C-LEVEL FACILITIES</h4>


<ul>
<li> <p>&lsquo;Writing R Extensions&rsquo; documents macros
<code>MAYBE_REFERENCED</code>, <code>MAYBE_SHARED</code> and
<code>MARK_NOT_MUTABLE</code> that should be used by package <code>C</code>
code instead <code>NAMED</code> or <code>SET_NAMED</code>.
</p>
</li>
<li><p> The object header layout has been changed to support merging
the <code>ALTREP</code> branch. This requires re-installing packages
that use compiled code.
</p>
</li>
<li> <p>&lsquo;Writing R Extensions&rsquo; now documents the
<code>R_tryCatch</code>, <code>R_tryCatchError</code>, and
<code>R_UnwindProtect</code> functions.
</p>
</li>
<li> <p><code>NAMEDMAX</code> has been raised to 3 to allow protection of
intermediate results from (usually ill-advised) assignments in
arguments to <code>BUILTIN</code> functions. Package <code>C</code> code using
<code>SET_NAMED</code> may need to be revised.
</p>
</li></ul>




<h4>DEPRECATED AND DEFUNCT</h4>


<ul>
<li> <p><code>Sys.timezone(location = FALSE)</code> is defunct, and is
ignored (with a warning).
</p>
</li>
<li> <p><code>methods:::bind_activation()</code> is defunct now; it
typically has been unneeded for years.
</p>
<p>The undocumented &lsquo;hidden&rsquo; objects <code>.__H__.cbind</code> and
<code>.__H__.rbind</code> in package <span class="pkg">base</span> are deprecated (in
favour of <code>cbind</code> and <code>rbind</code>).
</p>
</li>
<li><p> The declaration of <code>pythag()</code> in &lsquo;<span class="file">Rmath.h</span>&rsquo; has
been removed &mdash; the entry point has not been provided since <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>
2.14.0.
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li> <p><code>printCoefmat()</code> now also works without column names.
</p>
</li>
<li><p> The S4 methods on <code>Ops()</code> for the <code>"structure"</code> class no
longer cause infinite recursion when the structure is not an S4 object.
</p>
</li>
<li> <p><code>nlm(f, ..)</code> for the case where <code>f()</code> has a
<code>"hessian"</code> attribute now computes
<i>LL' = H + µI</i> correctly.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=17249">PR#17249</a>).
</p>
</li>
<li><p> An S4 method that &ldquo;rematches&rdquo; to its generic and
overrides the default value of a generic formal argument to
<code>NULL</code> no longer drops the argument from its formals.
</p>
</li>
<li> <p><code>Rscript</code> can now accept more than one argument given on
the <span class="samp">#!</span> line of a script. Previously, one could only pass a
single argument on the <span class="samp">#!</span> line in Linux.
</p>
</li>
<li><p> Connections are now written correctly with encoding
<code>"UTF-16LE"</code>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16737">PR#16737</a>).
</p>
</li>
<li><p> Evaluation of <code>..0</code> now signals an error.  When
<code>..1</code> is used and <code>...</code> is empty, the error message is
more appropriate.
</p>
</li>
<li><p> (Windows mainly.)  Unicode code points which require
surrogate pairs in UTF-16 are now handled.  All systems should
properly handle surrogate pairs, even those systems that do not
need to make use of them.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16098">PR#16098</a>)
</p>
</li>
<li> <p><code>stopifnot(e, e2, ...)</code> now evaluates the
expressions sequentially and in case of an error or warning shows
the relevant expression instead of the full <code>stopifnot(..)</code>
call.
</p>
</li>
<li> <p><code>path.expand()</code> on Windows now accepts paths specified as
UTF-8-encoded character strings even if not representable in the
current locale.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=17120">PR#17120</a>)
</p>
</li>
<li> <p><code>line(x, y)</code> now correctly computes the medians of the
left and right group's x-values and in all cases reproduces
straight lines.
</p>
</li>
<li><p> Extending S4 classes with slots corresponding to special
attributes like <code>dim</code> and <code>dimnames</code> now works.
</p>
</li>
<li><p> Fix for <code>legend()</code> when <code>fill</code> has multiple values
the first of which is <code>NA</code> (all colours used to default to
<code>par(fg)</code>).  (<a href="https://bugs.R-project.org/show_bug.cgi?id=17288">PR#17288</a>)
</p>
</li>
<li> <p><code>installed.packages()</code> did not remove the cached value
for a library tree that had been emptied (but would not use the
old value, just waste time checking it).
</p>
</li>
<li><p> The documentation for <code>installed.packages(noCache = TRUE)</code>
incorrectly claimed it would refresh the cache.
</p>
</li>
<li> <p><code>aggregate(&lt;data.frame&gt;)</code> no longer uses spurious names
in some cases.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=17283">PR#17283</a>)
</p>
</li>
<li> <p><code>object.size()</code> now also works for long vectors.
</p>
</li>
<li> <p><code>packageDescription()</code> tries harder to solve
re-encoding issues, notably seen in some Windows locales.  This
fixes the <code>citation()</code> issue in <a href="https://bugs.R-project.org/show_bug.cgi?id=17291">PR#17291</a>.
</p>
</li>
<li> <p><code>poly(&lt;matrix&gt;, 3)</code> now works, thanks to prompting by
Marc Schwartz.
</p>
</li>
<li> <p><code>readLines()</code> no longer segfaults on very large files
with embedded <code>'\0'</code> (aka &lsquo;nul&rsquo;) characters.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=17311">PR#17311</a>)
</p>
</li>
<li> <p><code>ns()</code> (package <span class="pkg">splines</span>) now also works for a
single observation.  <code>interpSpline()</code> gives a more friendly
error message when the number of points is less than four.
</p>
</li>
<li> <p><code>dist(x, method = "canberra")</code> now uses the correct
definition; the result may only differ when <code>x</code> contains
values of differing signs, e.g. not for 0-1 data.
</p>
</li>
<li> <p><code>methods:::cbind()</code> and <code>methods:::rbind()</code> avoid
deep recursion, thanks to Suharto Anggono via <a href="https://bugs.R-project.org/show_bug.cgi?id=17300">PR#17300</a>.
</p>
</li>
<li><p> Arithmetic with zero-column data frames now works more
consistently; issue raised by Bill Dunlap.
</p>
<p>Arithmetic with data frames gives a data frame for <code>^</code> (which
previously gave a numeric matrix).
</p>
</li>
<li> <p><code>pretty(x, n)</code> for large <code>n</code> or large
<code>diff(range(x))</code> now works better (though
it was never meant for large <code>n</code>); internally it uses the
same rounding fuzz (1e-10) as <code>seq.default()</code> &mdash; as it did up
to 2010-02-03 when both were 1e-7.
</p>
</li>
<li><p> Internal C-level <code>R_check_class_and_super()</code> and hence
<code>R_check_class_etc()</code> now also consider non-direct super
classes and hence return a match in more cases.  This e.g., fixes
behaviour of derived classes in package <a href="https://CRAN.R-project.org/package=Matrix"><span class="pkg">Matrix</span></a>.
</p>
</li>
<li><p> Reverted unintended change in behavior of <code>return</code>
calls in <code>on.exit</code> expressions introduced by stack unwinding
changes in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.3.0.
</p>
</li>
<li><p> Attributes on symbols are now detected and prevented; attempt
to add an attribute to a symbol results in an error.
</p>
</li>
<li> <p><code>fisher.test(*, workspace = &lt;n&gt;)</code> now may also increase
the internal stack size which allows larger problem to be solved,
fixing <a href="https://bugs.R-project.org/show_bug.cgi?id=1662">PR#1662</a>.
</p>
</li>
<li><p> The <span class="pkg">methods</span> package no longer directly copies slots
(attributes) into a prototype that is of an &ldquo;abnormal&rdquo;
(reference) type, like a symbol.
</p>
</li>
<li><p> The <span class="pkg">methods</span> package no longer attempts to call
<code>length&lt;-()</code> on <code>NULL</code> (during the bootstrap process).
</p>
</li>
<li><p> The <span class="pkg">methods</span> package correctly shows methods when there
are multiple methods with the same signature for the same generic
(still not fully supported, but at least the user can see them).
</p>
</li>
<li> <p><code>sys.on.exit()</code> is now always evaluated in the right
frame. (From Lionel Henry.)
</p>
</li>
<li> <p><code>seq.POSIXt(*, by = "&lt;n&gt; DSTdays")</code> now should work
correctly in all cases and is faster.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=17342">PR#17342</a>)
</p>
</li>
<li> <p><code>.C()</code> when returning a logical vector now always maps
values other than FALSE and NA to TRUE (as documented).
</p>
</li>
<li><p> Subassignment with zero length vectors now coerces as
documented (<a href="https://bugs.R-project.org/show_bug.cgi?id=17344">PR#17344</a>).<br />
Further, <code>x &lt;- numeric(); x[1] &lt;- character()</code> now signals
an error &lsquo;<code style="white-space: pre;">replacement has length zero</code>&rsquo; (or a
translation of that) instead of doing nothing.
</p>
</li>
<li><p> (Package <span class="pkg">parallel</span>.)  <code>mclapply()</code>, <code>pvec()</code>
and <code>mcparallel()</code> (when <code>mccollect()</code> is used to
collect results) no longer leave zombie processes behind.
</p>
</li>
<li> <p><code>R CMD INSTALL &lt;pkg&gt;</code> now produces the intended error
message when, e.g., the <code>LazyData</code> field is invalid.
</p>
</li>
<li> <p><code>as.matrix(dd)</code> now works when the data frame <code>dd</code>
contains a column which is a data frame or matrix, including a
0-column matrix/d.f. .
</p>
</li>
<li> <p><code>mclapply(X, mc.cores)</code> now follows its documentation
and calls <code>lapply()</code> in case <code>mc.cores = 1</code> also in the
case <code>mc.preschedule</code> is false.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=17373">PR#17373</a>)
</p>
</li>
<li> <p><code>aggregate(&lt;data.frame&gt;, drop=FALSE)</code> no longer calls
the function on &lt;empty&gt; parts but sets corresponding results to
<code>NA</code>.  (Thanks to Suharto Anggono's patches in <a href="https://bugs.R-project.org/show_bug.cgi?id=17280">PR#17280</a>).
</p>
</li>
<li><p> The <code>duplicated()</code> method for data frames is now based
on the <code>list</code> method (instead of string coercion).  Consequently
<code>unique()</code> is better distinguishing data frame rows, fixing
<a href="https://bugs.R-project.org/show_bug.cgi?id=17369">PR#17369</a> and <a href="https://bugs.R-project.org/show_bug.cgi?id=17381">PR#17381</a>.  The methods for matrices and arrays
are changed accordingly.
</p>
</li>
<li><p> Calling <code>names()</code> on an S4 object derived from
<code>"environment"</code> behaves (by default) like calling
<code>names()</code> on an ordinary environment.
</p>
</li>
<li> <p><code>read.table()</code> with a non-default separator now
supports quotes following a non-whitespace character, matching the
behavior of <code>scan()</code>.
</p>
</li>
<li> <p><code>parLapplyLB</code> and <code>parSapplyLB</code> have been fixed to do
load balancing (dynamic scheduling).  This also means that results of
computations depending on random number generators will now really be
non-reproducible, as documented.
</p>
</li>
<li><p> Indexing a list using dollar and empty string (<code>l$""</code>)
returns NULL.
</p>
</li>
<li><p> Using <code> \usage{ data(&lt;name&gt;, package="&lt;pkg&gt;") } </code>
no longer produces <code>R CMD check</code> warnings.
</p>
</li>
<li> <p><code>match.arg()</code> more carefully chooses the environment
for constructing default <code>choices</code>, fixing <a href="https://bugs.R-project.org/show_bug.cgi?id=17401">PR#17401</a> as
proposed by Duncan Murdoch.
</p>
</li>
<li><p> Deparsing of consecutive <code>!</code> calls is now consistent
with deparsing unary <code>-</code> and <code>+</code> calls and creates code
that can be reparsed exactly; thanks to a patch by Lionel Henry in
<a href="https://bugs.R-project.org/show_bug.cgi?id=17397">PR#17397</a>.  (As a side effect, this uses fewer parentheses in
some other deparsing involving <code>!</code> calls.)
</p>
</li></ul>




<h3><img src="../help/figures/../../html/Rlogo.svg" class="toplogo" alt="[R logo]" /> CHANGES IN R 3.4.4</h3>



<h4>NEW FEATURES</h4>


<ul>
<li> <p><code>Sys.timezone()</code> tries more heuristics on Unix-alikes and so
is more likely to succeed (especially on Linux).  For the slowest
method, a warning is given recommending that <span class="env">TZ</span> is set to
avoid the search.
</p>
</li>
<li><p> The version of LAPACK included in the sources has been
updated to 3.8.0 (for the routines used by <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>, a very minor bug-fix
change).
</p>
</li>
<li> <p><code>parallel::detectCores(logical = FALSE)</code> is ignored on
Linux systems, since the information is not available with
virtualized OSes.
</p>
</li></ul>




<h4>INSTALLATION on a UNIX-ALIKE</h4>


<ul>
<li> <p><code>configure</code> will use <code>pkg-config</code> to find the
flags to link to <code>jpeg</code> if available (as it should be for the
recently-released <code>jpeg-9c</code> and <code>libjpeg-turbo</code>).  (This
amends the code added in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.3.0 as the module name in
<code>jpeg-9c</code> is not what that tested for.)
</p>
</li></ul>




<h4>DEPRECATED AND DEFUNCT</h4>


<ul>
<li> <p><code>Sys.timezone(location = FALSE)</code> (which was a stop-gap
measure for Windows long ago) is deprecated.  It no longer returns
the value of environment variable <span class="env">TZ</span> (usually a location).
</p>
</li>
<li><p> Legacy support of <code>make</code> macros such as <span class="samp">CXX1X</span>
is formally deprecated: use the <span class="samp">CXX11</span> forms instead.
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li> <p><code>power.prop.test()</code> now warns when it cannot solve the
problem, typically because of impossible constraints. (<a href="https://bugs.R-project.org/show_bug.cgi?id=17345">PR#17345</a>)
</p>
</li>
<li> <p><code>removeSource()</code> no longer erroneously removes
<code>NULL</code> in certain cases, thanks to Dénes Tóth.
</p>
</li>
<li> <p><code>nls(`NO [mol/l]` ~ f(t))</code> and <code>nls(y ~ a)</code> now
work.  (Partly from <a href="https://bugs.R-project.org/show_bug.cgi?id=17367">PR#17367</a>)
</p>
</li>
<li> <p><code>R CMD build</code> checks for GNU <code>cp</code> rather
than assuming Linux has it.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=17370">PR#17370</a> says &lsquo;Alpine
Linux&rsquo; does not.)
</p>
</li>
<li><p> Non-UTF-8 multibyte character handling fixed more
permanently (<a href="https://bugs.R-project.org/show_bug.cgi?id=16732">PR#16732</a>).
</p>
</li>
<li> <p><code>sum(&lt;large ints&gt;, &lt;stuff&gt;)</code> is more consistent.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=17372">PR#17372</a>)
</p>
</li>
<li> <p><code>rf()</code> and <code>rbeta()</code> now also work correctly when
<code>ncp</code> is not scalar, notably when (partly) <code>NA</code>.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=17375">PR#17375</a>)
</p>
</li>
<li> <p><code>is.na(NULL)</code> no longer warns.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16107">PR#16107</a>)
</p>
</li>
<li> <p><code>R CMD INSTALL</code> now correctly sets C++ compiler flags
when all source files are in sub-directories of &lsquo;<span class="file">src</span>&rsquo;.
</p>
</li></ul>




<h3><img src="../help/figures/../../html/Rlogo.svg" class="toplogo" alt="[R logo]" /> CHANGES IN R 3.4.3</h3>



<h4>INSTALLATION on a UNIX-ALIKE</h4>


<ul>
<li><p> A workaround has been added for the changes in location of
time-zone files in macOS 10.13 &lsquo;High Sierra&rsquo; and
again in 10.13.1, so the default time zone is deduced
correctly from the system setting when <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> is configured with
<span class="option">--with-internal-tzcode</span> (the default on macOS).
</p>
</li>
<li> <p><code>R CMD javareconf</code> has been updated to recognize the
use of a Java 9 SDK on macOS.
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li> <p><code>raw(0) &amp; raw(0)</code> and <code>raw(0) | raw(0)</code>
again return <code>raw(0)</code> (rather than <code>logical(0)</code>).
</p>
</li>
<li> <p><code>intToUtf8()</code> converts integers corresponding to
surrogate code points to <code>NA</code> rather than invalid UTF-8, as
well as values larger than the current Unicode maximum of
<code>0x10FFFF</code>.  (This aligns with the current RFC3629.)
</p>
</li>
<li><p> Fix calling of methods on S4 generics that dispatch on
<code>...</code> when the call contains <code>...</code>.
</p>
</li>
<li><p> Following Unicode &lsquo;Corrigendum 9&rsquo;, the UTF-8
representations of U+FFFE and U+FFFF are now regarded as valid by
<code>utf8ToInt()</code>.
</p>
</li>
<li> <p><code>range(c(TRUE, NA), finite = TRUE)</code> and similar no longer
return <code>NA</code>. (Reported by Lukas Stadler.)
</p>
</li>
<li><p> The self starting function <code>attr(SSlogis, "initial")</code>
now also works when the y values have exact minimum zero and is
slightly changed in general, behaving symmetrically in the y range.
</p>
</li>
<li><p> The printing of named raw vectors is now formatted nicely as
for other such atomic vectors, thanks to Lukas Stadler.
</p>
</li></ul>




<h3><img src="../help/figures/../../html/Rlogo.svg" class="toplogo" alt="[R logo]" /> CHANGES IN R 3.4.2</h3>



<h4>NEW FEATURES</h4>


<ul>
<li><p> Setting the <code>LC_ALL</code> category in <code>Sys.setlocale()</code>
invalidates any cached locale-specific day/month names and the
AM/PM indicator for <code>strptime()</code> (as setting <code>LC_TIME</code>
has since <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.1.0).
</p>
</li>
<li><p> The version of LAPACK included in the sources has been
updated to 3.7.1, a bug-fix release.
</p>
</li>
<li><p> The default for <code>tools::write_PACKAGES(rds_compress=)</code>
has been changed to <code>"xz"</code> to match the compression used by
<acronym><span class="acronym">CRAN</span></acronym>.
</p>
</li>
<li> <p><code>c()</code> and <code>unlist()</code> are now more efficient in
constructing the <code>names(.)</code> of their return value, thanks to
a proposal by Suharto Anggono.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=17284">PR#17284</a>)
</p>
</li></ul>




<h4>UTILITIES</h4>


<ul>
<li> <p><code>R CMD check</code> checks for and <code>R CMD build</code>
corrects CRLF line endings in shell scripts <code>configure</code>
and <code>cleanup</code> (even on Windows).
</p>
</li></ul>




<h4>INSTALLATION on a UNIX-ALIKE</h4>


<ul>
<li><p> The order of selection of OpenMP flags has been changed:
Oracle Developer Studio 12.5 accepts <span class="option">-fopenmp</span> and
<span class="option">-xopenmp</span> but only the latter enables OpenMP so it is now
tried first.
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li> <p><code>within(List, rm(x1, x2))</code> works correctly again,
including when <code>List[["x2"]]</code> is <code>NULL</code>.
</p>
</li>
<li> <p><code>regexec(pattern, text, *)</code> now applies
<code>as.character(.)</code> to its first two arguments, as documented.
</p>
</li>
<li> <p><code>write.table()</code> and related functions,
<code>writeLines()</code>, and perhaps other functions writing text to
connections did not signal errors when the writes failed,
e.g. due to a disk being full.  Errors will now be
signalled if detected during the write, warnings if detected when
the connection is closed.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=17243">PR#17243</a>)
</p>
</li>
<li> <p><code>rt()</code> assumed the <code>ncp</code> parameter was a scalar.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=17306">PR#17306</a>)
</p>
</li>
<li> <p><code>menu(choices)</code> with more than 10 choices which easily
fit into one <code>getOption("width")</code>-line no longer erroneously
repeats choices.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=17312">PR#17312</a>)
</p>
</li>
<li> <p><code>length()&lt;-</code> on a pairlist succeeds.
(<a href="https://stat.ethz.ch/pipermail/r-devel/2017-July/074680.html">https://stat.ethz.ch/pipermail/r-devel/2017-July/074680.html</a>)
</p>
</li>
<li><p> Language objects such as <code>quote(("\n"))</code> or <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>
functions are correctly printed again, where <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.4.1 accidentally
duplicated the backslashes.
</p>
</li>
<li><p> Construction of <code>names()</code> for very large objects in
<code>c()</code> and <code>unlist()</code> now works, thanks to Suharto
Anggono's patch proposals in <a href="https://bugs.R-project.org/show_bug.cgi?id=17292">PR#17292</a>.
</p>
</li>
<li><p> Resource leaks (and similar) reported by Steve Grubb fixed.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=17314">PR#17314</a>, <a href="https://bugs.R-project.org/show_bug.cgi?id=17316">PR#17316</a>, <a href="https://bugs.R-project.org/show_bug.cgi?id=17317">PR#17317</a>, <a href="https://bugs.R-project.org/show_bug.cgi?id=17318">PR#17318</a>, <a href="https://bugs.R-project.org/show_bug.cgi?id=17319">PR#17319</a>, <a href="https://bugs.R-project.org/show_bug.cgi?id=17320">PR#17320</a>)
</p>
</li>
<li> <p><code>model.matrix(~1, mf)</code> now gets the row names from
<code>mf</code> also when they differ from <code>1:nrow(mf)</code>, fixing
<a href="https://bugs.R-project.org/show_bug.cgi?id=14992">PR#14992</a> thanks to the suggestion by Sebastian Meyer.
</p>
</li>
<li> <p><code>sigma(fm)</code> now takes the correct denominator degrees
of freedom for a fitted model with <code>NA</code> coefficients.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=17313">PR#17313</a>)
</p>
</li>
<li> <p><code>hist(x, "FD")</code> no longer &ldquo;dies&rdquo; with a somewhat
cryptic error message when <code>x</code> has extreme outliers or
<code>IQR()</code> zero:  <code>nclass.FD(x)</code> tries harder to find a
robust bin width <i>h</i> in the latter case, and
<code>hist.default(*, breaks)</code> now checks and corrects a too large
<code>breaks</code> number.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=17274">PR#17274</a>)
</p>
</li>
<li> <p><code>callNextMethod()</code> works for <code>...</code> methods.
</p>
</li>
<li> <p><code>qr.coef(qd, y)</code> now has correct names also when
<code>qd</code> is a complex QR or stems from <code>qr(*, LAPACK=TRUE)</code>.
</p>
</li>
<li><p> Setting <code>options(device = *)</code> to an invalid function no
longer segfaults when plotting is initiated.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15883">PR#15883</a>)
</p>
</li>
<li> <p><code>encodeString(&lt;very large string&gt;)</code> no longer
segfaults.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15885">PR#15885</a>)
</p>
</li>
<li><p> It is again possible to use <code>configure
	--enable-maintainer-mode</code> without having installed
<code>notangle</code> (it was required in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.4.[01]).
</p>
</li>
<li><p> S4 method dispatch on <code>...</code> calls the method by name
instead of <code>.Method</code> (for consistency with default dispatch),
and only attempts to pass non-missing arguments from the generic.
</p>
</li>
<li> <p><code>readRDS(textConnection(.))</code> works again.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=17325">PR#17325</a>)
</p>
</li>
<li> <p><code>(1:n)[-n]</code> no longer segfaults for <code>n &lt;- 2.2e9</code>
(on a platform with enough RAM).
</p>
</li>
<li> <p><code>x &lt;- 1:2; tapply(x, list(x, x), function(x) "")[1,2]</code>
now correctly returns <code>NA</code>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=17333">PR#17333</a>)
</p>
</li>
<li><p> Running of finalizers after explicit GC request moved from
the <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> interface <code>do_gc</code> to the <code>C</code> interface
<code>R_gc</code>.  This helps with reclaiming inaccessible connections.
</p>
</li>
<li> <p><code>help.search(topic)</code> and <code>??topic</code> matching topics
in vignettes with multiple file name extensions (e.g.,
&lsquo;<span class="file">*.md.rsp</span>&rsquo; but not &lsquo;<span class="file">*.Rmd</span>&rsquo;) failed with an error
when using <code>options(help_type = "html")</code>.
</p>
</li>
<li><p> The X11 device no longer uses the Xlib backing store (<a href="https://bugs.R-project.org/show_bug.cgi?id=16497">PR#16497</a>).
</p>
</li>
<li> <p><code>array(character(), 1)</code> now gives (a 1D array with)
<code>NA</code> as has been documented for a long time as in the other
cases of zero-length array initialization and also compatibly with
<code>matrix(character(), *)</code>.  As mentioned there, this also
fixes <a href="https://bugs.R-project.org/show_bug.cgi?id=17333">PR#17333</a>.
</p>
</li>
<li> <p><code>splineDesign(.., derivs = 4)</code> no longer segfaults.
</p>
</li>
<li> <p><code>fisher.test(*, hybrid=TRUE)</code> now (again) will use the
hybrid method when Cochran's conditions are met, fixing <a href="https://bugs.R-project.org/show_bug.cgi?id=16654">PR#16654</a>.
</p>
</li></ul>




<h3><img src="../help/figures/../../html/Rlogo.svg" class="toplogo" alt="[R logo]" /> CHANGES IN R 3.4.1</h3>



<h4>INSTALLATION on a UNIX-ALIKE</h4>


<ul>
<li><p> The deprecated support for PCRE versions older than 8.20
has been removed.
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li> <p><code>getParseData()</code> gave incorrect column information when
code contained multi-byte characters.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=17254">PR#17254</a>)
</p>
</li>
<li><p> Asking for help using expressions like <code>?stats::cor()</code>
did not work.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=17250">PR#17250</a>)
</p>
</li>
<li> <p><code>readRDS(url(....))</code> now works.
</p>
</li>
<li> <p><code>R CMD Sweave</code> again returns <span class="samp">status = 0</span> on
successful completion.
</p>
</li>
<li><p> Vignettes listed in &lsquo;<span class="file">.Rbuildignore</span>&rsquo; were not being
ignored properly.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=17246">PR#17246</a>)
</p>
</li>
<li> <p><code>file.mtime()</code> no longer returns NA on Windows when the
file or directory is being used by another process.  This affected
<code>installed.packages()</code>, which is now protected against this.
</p>
</li>
<li> <p><code>R CMD INSTALL</code> Windows .zip file obeys <code>--lock</code>
and <code>--pkglock</code> flags.
</p>
</li>
<li><p> (Windows only)  The <code>choose.files()</code> function could
return incorrect results when called with <code>multi = FALSE</code>.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=17270">PR#17270</a>)
</p>
</li>
<li> <p><code>aggregate(&lt;data.frame&gt;, drop = FALSE)</code> now also works in
case of near-equal numbers in <code>by</code>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16918">PR#16918</a>)
</p>
</li>
<li> <p><code>fourfoldplot()</code> could encounter integer overflow when
calculating the odds ratio. (<a href="https://bugs.R-project.org/show_bug.cgi?id=17286">PR#17286</a>)
</p>
</li>
<li> <p><code>parse()</code> no longer gives spurious warnings when
extracting srcrefs from a file not encoded in the current locale.
</p>
<p>This was seen from <code>R CMD check</code> with &lsquo;<span class="file">inst/doc/*.R</span>&rsquo;
files, and <code>check</code> has some additional protection for such files.
</p>
</li>
<li> <p><code>print.noquote(x)</code> now always returns its argument
<code>x</code> (invisibly).
</p>
</li>
<li><p> Non-UTF-8 multibyte character sets were not handled properly
in source references.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16732">PR#16732</a>)
</p>
</li></ul>




<h3><img src="../help/figures/../../html/Rlogo.svg" class="toplogo" alt="[R logo]" /> CHANGES IN R 3.4.0</h3>



<h4>SIGNIFICANT USER-VISIBLE CHANGES</h4>


<ul>
<li><p> (Unix-alike)
The default methods for <code>download.file()</code> and <code>url()</code>
now choose <code>"libcurl"</code> except for <span class="samp">file://</span>
URLs.  There will be small changes in the format and wording of
messages, including in rare cases if an issue is a warning or an
error.  For example, when HTTP re-direction occurs, some messages
refer to the final URL rather than the specified one.
</p>
<p>Those who use proxies should check that their settings are
compatible (see <code>?download.file</code>: the most commonly used
forms work for both <code>"internal"</code> and <code>"libcurl"</code>).
</p>
</li>
<li> <p><code>table()</code> has been amended to be more internally
consistent and become back compatible to <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> <i>&lt;=</i> 2.7.2
again.  Consequently, <code>table(1:2, exclude = NULL)</code> no longer
contains a zero count for <code>&lt;NA&gt;</code>, but <code>useNA = "always"</code>
continues to do so.
</p>
</li>
<li> <p><code>summary.default()</code> no longer rounds, but its print
method does resulting in less extraneous rounding, notably of
numbers in the ten thousands.
</p>
</li>
<li> <p><code>factor(x, exclude = L)</code> behaves more rationally when
<code>x</code> or <code>L</code> are character vectors.  Further,
<code>exclude = &lt;factor&gt;</code> now behaves as documented for long.
</p>
</li>
<li><p> Arithmetic, logic (<code>&amp;</code>, <code>|</code>) and comparison (aka
&lsquo;relational&rsquo;, e.g., <code>&lt;</code>, <code>==</code>) operations with
arrays now behave consistently, notably for arrays of length zero.
</p>
<p>Arithmetic between length-1 arrays and longer non-arrays had
silently dropped the array attributes and recycled.  This now
gives a warning and will signal an error in the future, as it has
always for logic and comparison operations in these cases (e.g.,
compare <code>matrix(1,1) + 2:3</code> and <code>matrix(1,1) &lt; 2:3</code>).
</p>
</li>
<li><p> The JIT (&lsquo;Just In Time&rsquo;) byte-code compiler is now
enabled by default at its level 3. This means functions will be
compiled on first or second use and top-level loops will be
compiled and then run.  (Thanks to Tomas Kalibera for extensive
work to make this possible.)
</p>
<p>For now, the compiler will not compile code containing explicit
calls to <code>browser()</code>: this is to support single stepping from
the <code>browser()</code> call.
</p>
<p>JIT compilation can be disabled for the rest of the session using
<code>compiler::enableJIT(0)</code> or by setting environment variable
<span class="env">R_ENABLE_JIT</span> to <code>0</code>.
</p>
</li>
<li> <p><code>xtabs()</code> works more consistently with <code>NA</code>s, also
in its result no longer setting them to <code>0</code>.  Further, a new
logical option <code>addNA</code> allows to count <code>NA</code>s where
appropriate.  Additionally, for the case <code>sparse = TRUE</code>, the
result's <code>dimnames</code> are identical to the default case's.
</p>
</li>
<li><p> Matrix products now consistently bypass BLAS when the inputs
have <code>NaN</code>/<code>Inf</code> values. Performance of the check of
inputs has been improved. Performance when BLAS is used is
improved for matrix/vector and vector/matrix multiplication (DGEMV
is now used instead of DGEMM).
</p>
<p>One can now choose from alternative matrix product implementations
<em>via</em> <code>options(matprod = )</code>.  The <code>"internal"</code>
implementation is not optimized for speed but consistent in
precision with other summations in R (using <code>long double</code>
accumulators where available).  <code>"blas"</code> calls BLAS directly
for best speed, but usually with undefined behavior for inputs
with <code>NaN</code>/<code>Inf</code>.
</p>
</li></ul>




<h4>NEW FEATURES</h4>


<ul>
<li><p> User errors such as <code>integrate(f, 0:1, 2)</code> are now caught.
</p>
</li>
<li><p> Add <code>signature</code> argument to <code>debug()</code>,
<code>debugonce()</code>, <code>undebug()</code> and <code>isdebugged()</code> for
more conveniently debugging S3 and S4 methods.  (Based on a patch by
Gabe Becker.)
</p>
</li>
<li><p> Add <code>utils::debugcall()</code> and
<code>utils::undebugcall()</code> for debugging the function that would
be called by evaluating the given expression. When the call is to
an S4 generic or standard S3 generic, <code>debugcall()</code> debugs the
method that would be dispatched. A number of internal utilities
were added to support this, most notably
<code>utils::isS3stdGeneric()</code>.  (Based on a patch by Gabe Becker.)
</p>
</li>
<li><p> Add <code>utils::strcapture()</code>. Given a character vector and
a regular expression containing capture expressions,
<code>strcapture()</code> will extract the captured tokens into a
tabular data structure, typically a <code>data.frame</code>.
</p>
</li>
<li> <p><code>str()</code> and <code>strOptions()</code> get a new option
<code>drop.deparse.attr</code> with improved but <em>changed</em> default
behaviour for expressions.  For <code>expression</code> objects
<code>x</code>, <code>str(x)</code> now may remove extraneous white space and
truncate long lines.
</p>
</li>
<li> <p><code>str(&lt;looooooooong_string&gt;)</code> is no longer very slow;
inspired by Mikko Korpela's proposal in <a href="https://bugs.R-project.org/show_bug.cgi?id=16527">PR#16527</a>.
</p>
</li>
<li> <p><code>str(x)</code>'s default method is more &ldquo;accurate&rdquo; and
hence somewhat more generous in displaying character vectors; this
will occasionally change <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> outputs (and need changes to some
&lsquo;<span class="file">*.Rout(.save)</span>&rsquo; files).
<br /> 
For a classed integer vector such as <code>x &lt;- xtabs(~ c(1,9,9,9))</code>,
<code>str(x)</code> now shows both the class and <code>"int"</code>, instead
of only the latter.
</p>
</li>
<li> <p><code>isSymmetric(m)</code> is much faster for large asymmetric
matrices <code>m</code> <em>via</em> pre-tests and a new option <code>tol1</code>
(with which strict back compatibility is possible but not the
default).
</p>
</li>
<li><p> The result of <code>eigen()</code> now is of class <code>"eigen"</code>
in the default case when eigenvectors are computed.
</p>
</li>
<li><p> Zero-length date and date-time objects (of classes
<code>"POSIX[cl]?t"</code>) now <code>print()</code> &ldquo;recognizably&rdquo;.
</p>
</li>
<li> <p><code>xy.coords()</code> and <code>xyz.coords()</code> get a new
<code>setLab</code> option.
</p>
</li>
<li><p> The <code>method</code> argument of <code>sort.list()</code>,
<code>order()</code> and <code>sort.int()</code> gains an <code>"auto"</code> option
(the default) which should behave the same as before when
<code>method</code> was not supplied.
</p>
</li>
<li> <p><code>stopifnot(E, ..)</code> now reports differences when
<code>E</code> is a call to <code>all.equal()</code> and that is not true.
</p>
</li>
<li> <p><code>boxplot(&lt;formula&gt;, *)</code> gain optional arguments
<code>drop</code>, <code>sep</code>, and <code>lex.order</code> to pass to
<code>split.default()</code> which itself gains an argument
<code>lex.order</code> to pass to <code>interaction()</code> for more
flexibility.
</p>
</li>
<li><p> The <code>plot()</code> method for <code>ppr()</code> has enhanced
default labels (<code>xmin</code> and <code>main</code>).
</p>
</li>
<li> <p><code>sample.int()</code> gains an explicit <code>useHash</code> option
(with a back compatible default).
</p>
</li>
<li> <p><code>identical()</code> gains an <code>ignore.srcref</code> option
which drops <code>"srcref"</code> and similar attributes when true (as
by default).
</p>
</li>
<li> <p><code>diag(x, nrow = n)</code> now preserves <code>typeof(x)</code>, also
for logical, integer and raw <code>x</code> (and as previously for
complex and numeric).
</p>
</li>
<li> <p><code>smooth.spline()</code> now allows direct specification of
<code>lambda</code>, gets a <code>hatvalues()</code> method and keeps
<code>tol</code> in the result, and optionally parts of the internal
matrix computations.
</p>
</li>
<li> <p><code>addNA()</code> is faster now, e.g. when applied twice.
(Part of <a href="https://bugs.R-project.org/show_bug.cgi?id=16895">PR#16895</a>.)
</p>
</li>
<li><p> New option <code>rstandard(&lt;lm&gt;, type = "predicted")</code>
provides the &ldquo;PRESS&rdquo;&ndash;related leave-one-out
cross-validation errors for linear models.
</p>
</li>
<li><p> After seven years of deprecation, duplicated factor levels
now produce a warning when printed and an error in <code>levels&lt;-</code>
instead of a warning.
</p>
</li>
<li><p> Invalid factors, e.g., with duplicated levels (invalid but
constructable) now give a warning when printed, <em>via</em> new
function <code>.valid.factor()</code>.
</p>
</li>
<li> <p><code>sessionInfo()</code> has been updated for Apple's change in
OS naming as from &lsquo;10.12&rsquo; (&lsquo;macOS Sierra&rsquo; <em>vs</em>
&lsquo;OS X El Capitan&rsquo;).
</p>
<p>Its <code>toLatex()</code> method now includes the <code>running</code>
component.
</p>
</li>
<li> <p><code>options(interrupt=)</code> can be used to specify a default
action for user interrupts.  For now, if this option is not set
and the <code>error</code> option is set, then an unhandled user
interrupt invokes the <code>error</code> option.  (This may be dropped in
the future as <code>interrupt</code> conditions are not <code>error</code>
conditions.)
</p>
</li>
<li><p> In most cases user interrupt handlers will be called with a
<code>"resume"</code> restart available.  Handlers can invoke this
restart to resume computation. At the browser prompt the <code>r</code>
command will invoke a <code>"resume"</code> restart if one is
available. Some read operations cannot be resumed properly when
interrupted and do not provide a <code>"resume"</code> restart.
</p>
</li>
<li><p> Radix sort is now chosen by <code>method = "auto"</code> for
<code>sort.int()</code> for double vectors (and hence used for
<code>sort()</code> for unclassed double vectors), excluding
&lsquo;long&rsquo; vectors.
</p>
<p><code>sort.int(method = "radix")</code> no longer rounds double vectors.
</p>
</li>
<li><p> The <code>default</code> and <code>data.frame</code> methods for
<code>stack()</code> preserve the names of empty elements in the levels
of the <code>ind</code> column of the return value.  Set the new
<code>drop</code> argument to <code>TRUE</code> for the previous behavior.
</p>
</li>
<li><p> Speedup in <code>simplify2array()</code> and hence <code>sapply()</code> and
<code>mapply()</code> (for the case of names and common length &gt; 1),
thanks to Suharto Anggono's <a href="https://bugs.R-project.org/show_bug.cgi?id=17118">PR#17118</a>.
</p>
</li>
<li> <p><code>table(x, exclude = NULL)</code> now sets
<code>useNA = "ifany"</code> (instead of <code>"always"</code>).
Together with the bug fixes for this case, this recovers more
consistent behaviour  compatible to older versions of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>.  As
a consequence, <code>summary()</code> for a logical vector no longer
reports (zero) counts for <code>NA</code> when there are no <code>NA</code>s.
</p>
</li>
<li> <p><code>dump.frames()</code> gets a new option
<code>include.GlobalEnv</code> which allows to also dump the global
environment, thanks to Andreas Kersting's proposal in <a href="https://bugs.R-project.org/show_bug.cgi?id=17116">PR#17116</a>.
</p>
</li>
<li> <p><code>system.time()</code> now uses <code>message()</code> instead of
<code>cat()</code> when terminated early, such that
<code>suppressMessages()</code> has an effect; suggested by Ben Bolker.
</p>
</li>
<li> <p><code>citation()</code> supports &lsquo;<span class="file">inst/CITATION</span>&rsquo; files from
package source trees, with <code>lib.loc</code> pointing to the
directory containing the package.
</p>



</li>
<li> <p><code>try()</code> gains a new argument <code>outFile</code> with a
default that can be modified <em>via</em>
<code>options(try.outFile = .)</code>, useful notably for <code>Sweave</code>.
</p>
</li>
<li><p> The unexported low-level functions in package <span class="pkg">parallel</span>
for passing serialized <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> objects to and from forked children now
support long vectors on 64-bit platforms.  This removes some
limits on higher-level functions such as <code>mclapply()</code> (but
returning gigabyte results from forked processes <em>via</em>
serialization should be avoided if at all possible).
</p>
</li>
<li><p> Connections now <code>print()</code> without error even if
invalid, e.g. after having been destroyed.
</p>
</li>
<li> <p><code>apropos()</code> and <code>find(simple.words = FALSE)</code> no
longer match object names starting with <span class="samp">.</span> which are known
to be internal objects (such as <code>.__S3MethodsTable__.</code>).
</p>
</li>
<li><p> Convenience function <code>hasName()</code> has been added; it
is intended to replace the common idiom <code>!is.null(x$name)</code>
without the usually unintended partial name matching.
</p>
</li>
<li> <p><code>strcapture()</code> no longer fixes column names nor coerces
strings to factors (suggested by Bill Dunlap).
</p>
</li>
<li> <p><code>strcapture()</code> returns <code>NA</code> for non-matching
values in <code>x</code> (suggested by Bill Dunlap).
</p>
</li>
<li> <p><code>source()</code> gets new optional arguments, notably
<code>exprs</code>; this is made use of in the new utility function
<code>withAutoprint()</code>.
</p>
</li>
<li> <p><code>sys.source()</code> gets a new <code>toplevel.env</code> argument.
This argument is useful for frameworks running package tests;
contributed by Tomas Kalibera.
</p>
</li>
<li> <p><code>Sys.setFileTime()</code> and
<code>file.copy(copy.date = TRUE)</code> will set timestamps with
fractions of seconds on platforms/filesystems which support this.
</p>
</li>
<li><p> (Windows only.) <code>file.info()</code> now returns file
timestamps including fractions of seconds; it has done so on other
platforms since <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.14.0.  (NB: some filesystems do not
record modification and access timestamps to sub-second
resolution.)
</p>
</li>
<li><p> The license check enabled by
<code>options(checkPackageLicense = TRUE)</code> is now done when the
package's namespace is first loaded.
</p>
</li>
<li> <p><code>ppr()</code> and <code>supsmu()</code> get an optional
<code>trace</code> argument, and <code>ppr(.., sm.method = ..spline)</code> is
no longer limited to sample size <i>n &lt;= 2500</i>.
</p>
</li>
<li><p> The <code>POSIXct</code> method for <code>print()</code> gets optional
<code>tz</code> and <code>usetz</code> arguments, thanks to a report from
Jennifer S. Lyon.
</p>
</li>
<li><p> New function <code>check_packages_in_dir_details()</code> in
package <span class="pkg">tools</span> for analyzing package-check log files to
obtain check details.
</p>
</li>
<li><p> Package <span class="pkg">tools</span> now exports function
<code>CRAN_package_db()</code> for obtaining information about current
packages in the <acronym><span class="acronym">CRAN</span></acronym> package repository, and several
functions for obtaining the check status of these packages.
</p>
</li>
<li><p> The (default) Stangle driver <code>Rtangle</code> allows
<code>annotate</code> to be a function and gets a new
<code>drop.evalFALSE</code> option.
</p>
</li>
<li><p> The default method for <code>quantile(x, prob)</code> should now
be monotone in <code>prob</code>, even in border cases, see <a href="https://bugs.R-project.org/show_bug.cgi?id=16672">PR#16672</a>.
</p>
</li>
<li> <p><code>bug.report()</code> now tries to extract an email address
from a <span class="samp">BugReports</span> field, and if there is none, from a
<span class="samp">Contacts</span> field.
</p>
</li>
<li><p> The <code>format()</code> and <code>print()</code> methods for
<code>object.size()</code> results get new options <code>standard</code> and
<code>digits</code>; notably, <code>standard = "IEC"</code> and
<code>standard = "SI"</code> allow more standard (but less common)
abbreviations than the default ones, e.g. for kilobytes.
(From contributions by Henrik Bengtsson.)
</p>
</li>
<li><p> If a reference class has a validity method,
<code>validObject</code> will be called automatically from the
default initialization method for reference classes.
</p>
</li>
<li> <p><code>tapply()</code> gets new option <code>default = NA</code>
allowing to change the previously hardcoded value.
</p>
</li>
<li> <p><code>read.dcf()</code> now consistently interprets any
&lsquo;whitespace&rsquo; to be stripped to include newlines.
</p>
</li>
<li><p> The maximum number of DLLs that can be loaded into R
e.g. <em>via</em> <code>dyn.load()</code> can now be increased by
setting the environment variable <code>R_MAX_NUM_DLLS</code> before
starting R.
</p>
</li>
<li><p> Assigning to an element of a vector beyond the current
length now over-allocates by a small fraction. The new vector is
marked internally as growable, and the true length of the new
vector is stored in the <code>truelength</code> field. This makes
building up a vector result by assigning to the next element
beyond the current length more efficient, though pre-allocating is
still preferred.  The implementation is subject to change and not
intended to be used in packages at this time.
</p>
</li>
<li><p> Loading the <span class="pkg">parallel</span> package namespace no longer sets
or changes the <code>.Random.seed</code>, even if <span class="env">R_PARALLEL_PORT</span>
is unset.
</p>
<p>NB: This can break reproducibility of output, and did for a
<acronym><span class="acronym">CRAN</span></acronym> package.
</p>
</li>
<li><p> Methods <code>"wget"</code> and <code>"curl"</code> for
<code>download.file()</code> now give an <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> error rather than a non-zero
return value when the external command has a non-zero status.
</p>
</li>
<li><p> Encoding name <code>"utf8"</code> is mapped to <code>"UTF-8"</code>.
Many implementations of <code>iconv</code> accept <code>"utf8"</code>, but not
GNU <span class="pkg">libiconv</span> (including the late 2016 version 1.15).
</p>
</li>
<li> <p><code>sessionInfo()</code> shows the full paths to the library or
executable files providing the BLAS/LAPACK implementations
currently in use (not available on Windows).
</p>
</li>
<li><p> The binning algorithm used by bandwidth selectors
<code>bw.ucv()</code>, <code>bw.bcv()</code> and <code>bw.SJ()</code> switches to a
version linear in the input size <code>n</code> for <code>n &gt; nb/2</code>.
(The calculations are the same, but for larger <code>n/nb</code> it is
worth doing the binning in advance.)
</p>
</li>
<li><p> There is a new option <code>PCRE_study</code> which controls when
<code>grep(perl = TRUE)</code> and friends &lsquo;study&rsquo; the compiled
pattern.  Previously this was done for 11 or more input strings:
it now defaults to 10 or more (but most examples need many more
for the difference from studying to be noticeable).
</p>
</li>
<li> <p><code>grep(perl = TRUE)</code> and friends can now make use of
PCRE's Just-In-Time mechanism, for PCRE <i>&gt;=</i> 8.20 on
platforms where JIT is supported.  It is used by default whenever
the <code>pattern</code> is studied (see the previous item).  (Based on
a patch from Mikko Korpela.)
</p>
<p>This is controlled by a new option <code>PCRE_use_JIT</code>.
</p>
<p>Note that in general this makes little difference to the speed,
and may take a little longer: its benefits are most evident on
strings of thousands of characters.  As a side effect it reduces
the chances of C stack overflow in the PCRE library on very long
strings (millions of characters, but see next item).
</p>
<p>Warning: segfaults were seen using PCRE with JIT enabled on 64-bit
Sparc builds.
</p>
</li>
<li><p> There is a new option <code>PCRE_limit_recursion</code> for
<code>grep(perl = TRUE)</code> and friends to set a recursion limit
taking into account <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>'s estimate of the remaining C stack space
(or 10000 if that is not available).  This reduces the chance of C
stack overflow, but because it is conservative may report a
non-match (with a warning) in examples that matched before.  By
default it is enabled if any input string has 1000 or more bytes.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=16757">PR#16757</a>)
</p>
</li>
<li> <p><code>getGraphicsEvent()</code> now works on
<code>X11(type = "cairo")</code> devices.  Thanks to Frederick Eaton (for
reviving an earlier patch).
</p>
</li>
<li><p> There is a new argument <code>onIdle</code> for
<code>getGraphicsEvent()</code>, which allows an R function to be run
whenever there are no pending graphics events.  This is currently
only supported on X11 devices.  Thanks to Frederick Eaton.
</p>
</li>
<li><p> The <code>deriv()</code> and similar functions now can compute
derivatives of <code>log1p()</code>, <code>sinpi()</code> and similar
one-argument functions, thanks to a contribution by Jerry Lewis.
</p>
</li>
<li> <p><code>median()</code> gains a formal <code>...</code> argument, so
methods with extra arguments can be provided.
</p>
</li>
<li> <p><code>strwrap()</code> reduces <code>indent</code> if it is more than
half <code>width</code> rather than giving an error.  (Suggested by Bill
Dunlap.)
</p>
</li>
<li><p> When the condition <code>code</code> in <code>if(.)</code> or
<code>while(.)</code> is not of length one, an error instead of a
warning may be triggered by setting an environment variable, see
the help page.
</p>
</li>
<li><p> Formatting and printing of bibliography entries
(<code>bibentry</code>) is more flexible and better documented.  Apart
from setting <code>options(citation.bibtex.max = 99)</code> you can also
use <code>print(&lt;citation&gt;, bibtex=TRUE)</code> (or <code>format(..)</code>)
to get the BibTeX entries in the case of more than one entry.
This also affects <code>citation()</code>.
Contributions to enable <code>style = "html+bibtex"</code> are welcome.
</p>
</li></ul>




<h4>C-LEVEL FACILITIES</h4>


<ul>
<li><p> Entry points <code>R_MakeExternalPtrFn</code> and
<code>R_ExternalPtrFn</code> are now declared in header
&lsquo;<span class="file">Rinternals.h</span>&rsquo; to facilitate creating and retrieving an <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>
external pointer from a C function pointer without ISO C warnings
about the conversion of function pointers.
</p>
</li>
<li><p> There was an exception for the native Solaris C++ compiler
to the dropping (in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.3.0) of legacy C++ headers from headers
such as &lsquo;<span class="file">R.h</span>&rsquo; and &lsquo;<span class="file">Rmath.h</span>&rsquo; &mdash; this has now been
removed.  That compiler has strict C++98 compliance hence does not
include extensions in its (non-legacy) C++ headers: some
packages will need to request C++11 or replace non-C++98 calls
such as <code>lgamma</code>: see §1.6.4 of &lsquo;Writing R Extensions&rsquo;.
</p>
<p>Because it is needed by about 70 CRAN packages, headers &lsquo;<span class="file">R.h</span>&rsquo;
and &lsquo;<span class="file">Rmath.h</span>&rsquo; still declare </p>
<pre>use namespace std;</pre>
<p>when included on Solaris.
</p>
</li>
<li><p> When included from C++, the <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> headers now use forms such as
<code>std::FILE</code> directly rather than including the line </p>
<pre>using std::FILE;</pre>
<p>C++ code including these headers might be relying on the latter.
</p>
</li>
<li><p> Headers &lsquo;<span class="file">R_ext/BLAS.h</span>&rsquo; and &lsquo;<span class="file">R_ext/Lapack.h</span>&rsquo; have
many improved declarations including <code>const</code> for
double-precision complex routines. <em>Inter alia</em> this avoids
warnings when passing &lsquo;string literal&rsquo; arguments from C++11
code.
</p>
</li>
<li><p> Headers for Unix-only facilities &lsquo;<span class="file">R_ext/GetX11Image.h</span>&rsquo;,
&lsquo;<span class="file">R_ext/QuartzDevice.h</span>&rsquo; and &lsquo;<span class="file">R_ext/eventloop.h</span>&rsquo; are no
longer installed on Windows.
</p>
</li>
<li><p> No-longer-installed headers &lsquo;<span class="file">GraphicsBase.h</span>&rsquo;,
&lsquo;<span class="file">RGraphics.h</span>&rsquo;, &lsquo;<span class="file">Rmodules/RX11.h</span>&rsquo; and
&lsquo;<span class="file">Rmodules/Rlapack.h</span>&rsquo; which had a LGPL license no longer do so.
</p>
</li>
<li> <p><code>HAVE_UINTPTR_T</code> is now defined where appropriate by
<code>Rconfig.h</code> so that it can be included before
<code>Rinterface.h</code> when <code>CSTACK_DEFNS</code> is defined and a C
compiler (not C++) is in use.  <code>Rinterface.h</code> now includes C
header &lsquo;<span class="file">stdint.h</span>&rsquo; or C++11 header &lsquo;<span class="file">cstdint</span>&rsquo; where
needed.
</p>
</li>
<li><p> Package <span class="pkg">tools</span> has a new function
<code>package_native_routine_registration_skeleton()</code> to assist
adding native-symbol registration to a package.  See its help and
§5.4.1 of &lsquo;Writing R Extensions&rsquo; for how to use it.  (At
the time it was added it successfully automated adding
registration to over 90% of <acronym><span class="acronym">CRAN</span></acronym> packages which lacked
it.  Many of the failures were newly-detected bugs in the
packages, e.g. 50 packages called entry points with varying
numbers of arguments and 65 packages called entry points not in
the package.)


</p>
</li></ul>




<h4>INSTALLATION on a UNIX-ALIKE</h4>


<ul>
<li> <p><code>readline</code> headers (and not just the library) are
required unless configuring with <span class="option">--with-readline=no</span>.
</p>
</li>
<li> <p><code>configure</code> now adds a compiler switch for C++11
code, even if the compiler supports C++11 by default.  (This
ensures that <code>g++</code> 6.x uses C++11 mode and not its default
mode of C++14 with &lsquo;GNU extensions&rsquo;.)
</p>
<p>The tests for C++11 compliance are now much more comprehensive.
For gcc &lt; 4.8, the tests from R 3.3.0 are used in order to maintain
the same behaviour on Linux distributions with long-term support.
</p>
</li>
<li><p> An alternative compiler for C++11 is now specified with
<span class="samp">CXX11</span>, not <span class="samp">CXX1X</span>. Likewise C++11 flags are specified
with <span class="samp">CXX11FLAGS</span> and the standard (e.g., <span class="samp">-std=gnu++11</span>)
is specified with <span class="samp">CXX11STD</span>.
</p>
</li>
<li> <p><code>configure</code> now tests for a C++14-compliant compiler
by testing some basic features.  This by default tries flags for
the compiler specified by <span class="samp">CXX11</span>, but an alternative compiler,
options and standard can be specified by variables <span class="samp">CXX14</span>,
<span class="samp">CXX14FLAGS</span> and <span class="samp">CXX14STD</span> (e.g., <span class="option">-std=gnu++14</span>).
</p>
</li>
<li><p> There is a new macro <code>CXXSTD</code> to help specify the
standard for C++ code, e.g. <span class="option">-std=c++98</span>.  This
makes it easier to work with compilers which default to a later
standard: for example, with <code>CXX=g++6 CXXSTD=-std=c++98</code>
<code>configure</code> will select commands for <code>g++</code> 6.x
which conform to C++11 and C++14 where specified but otherwise use
C++98.
</p>
</li>
<li><p> Support for the defunct IRIX and OSF/1 OSes and Alpha CPU
has been removed.
</p>
</li>
<li> <p><code>configure</code> checks that the compiler specified by
<span class="samp">$CXX $CXXFLAGS</span> is able to compile C++ code.
</p>
</li>
<li> <p><code>configure</code> checks for the required header
&lsquo;<span class="file">sys/select.h</span>&rsquo; (or &lsquo;<span class="file">sys/time.h</span>&rsquo; on legacy systems) and
system call <code>select</code> and aborts if they are not found.
</p>
</li>
<li><p> If available, the POSIX 2008 system call <code>utimensat</code>
will be used by <code>Sys.setFileTime()</code> and
<code>file.copy(copy.date = TRUE)</code>.  This may result in slightly
more accurate file times.  (It is available on Linux and FreeBSD
but not macOS.)

</p>
</li>
<li><p> The minimum version requirement for <code>libcurl</code> has been
reduced to 7.22.0, although at least 7.28.0 is preferred and
earlier versions are little tested.  (This is to support Debian 7
&lsquo;Wheezy&rsquo; LTS and Ubuntu &lsquo;Precise&rsquo; 12.04 LTS,
although the latter is close to end-of-life.)

</p>
</li>
<li> <p><code>configure</code> tests for a C++17-compliant compiler.
The tests are experimental and subject to change in the future.
</p>
</li></ul>




<h4>INCLUDED SOFTWARE</h4>


<ul>
<li><p> (Windows only) Tcl/Tk version 8.6.4 is now included in the
binary builds.  The &lsquo;<span class="file">tcltk*.chm</span>&rsquo; help file is no longer
included; please consult the online help at
<a href="http://www.tcl.tk/man/">http://www.tcl.tk/man/</a> instead.
</p>
</li>
<li><p> The version of LAPACK included in the sources has been
updated to 3.7.0: no new routines have been added to <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>.
</p>
</li></ul>




<h4>PACKAGE INSTALLATION</h4>


<ul>
<li><p> There is support for compiling C++14 or C++17 code in
packages on suitable platforms: see &lsquo;Writing R Extensions&rsquo;
for how to request this.
</p>
</li>
<li><p> The order of flags when <span class="samp">LinkingTo</span> other packages has
been changed so their include directories come earlier, before
those specified in <code>CPPFLAGS</code>.  This will only have an effect
if non-system include directories are included with <span class="option">-I</span>
flags in <code>CPPFLAGS</code> (and so not the default
<code>-I/usr/local/include</code> which is treated as a system include
directory on most platforms).


</p>
</li>
<li><p> Packages which register native routines for <code>.C</code> or
<code>.Fortran</code> need to be re-installed for this version (unless
installed with R-devel SVN revision r72375 or later).
</p>
</li>
<li><p> Make variables with names containing <code>CXX1X</code> are
deprecated in favour of those using <code>CXX11</code>, but for the time
being are still made available <em>via</em> file
&lsquo;<span class="file">etc/Makeconf</span>&rsquo;.  Packages using them should be converted to
the new forms and made dependent on <span class="samp">R (&gt;= 3.4.0)</span>.
</p>
</li></ul>




<h4>UTILITIES</h4>


<ul>
<li><p> Running <code>R CMD check --as-cran</code> with
<span class="env">_R_CHECK_CRAN_INCOMING_REMOTE_</span> false now skips tests that
require remote access.  The remaining (local) tests typically
run quickly compared to the remote tests.
</p>
</li>
<li> <p><code>R CMD build</code> will now give priority to vignettes
produced from files in the &lsquo;<span class="file">vignettes</span>&rsquo; directory over those
in the &lsquo;<span class="file">inst/doc</span>&rsquo; directory, with a warning that the latter
are being ignored.
</p>
</li>
<li> <p><code>R CMD config</code> gains a <span class="option">--all</span> option for
printing names and values of all basic configure variables.
</p>
<p>It now knows about all the variables used for the C++98, C++11 and
C++14 standards.
</p>
</li>
<li> <p><code>R CMD check</code> now checks that output files in
&lsquo;<span class="file">inst/doc</span>&rsquo; are newer than the source files in &lsquo;<span class="file">vignettes</span>&rsquo;.
</p>
</li>
<li><p> For consistency with other package subdirectories, files
named &lsquo;<span class="file">*.r</span>&rsquo; in the &lsquo;<span class="file">tests</span>&rsquo; directory are now recognized
as tests by <code>R CMD check</code>. (Wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=17143">PR#17143</a>.)
</p>
</li>
<li> <p><code>R CMD build</code> and <code>R CMD check</code> now use the
<em>union</em> of <span class="env">R_LIBS</span> and <code>.libPaths()</code>.  They may not
be equivalent, e.g., when the latter is determined by
<span class="env">R_PROFILE</span>.
</p>
</li>
<li> <p><code>R CMD build</code> now preserves dates when it copies files
in preparing the tarball.  (Previously on Windows it changed the
dates on all files; on Unix, it changed some dates when installing
vignettes.)
</p>
</li>
<li><p> The new option <code>R CMD check --no-stop-on-test-error</code>
allows running the remaining tests (under &lsquo;<span class="file">tests/</span>&rsquo;) even if
one gave an error.
</p>
</li>
<li><p> Check customization <em>via</em> environment variables to
detect side effects of <code>.Call()</code> and <code>.External()</code> calls
which alter their arguments is described in §8 of the &lsquo;R
Internals&rsquo; manual.
</p>
</li>
<li> <p><code>R CMD check</code> now checks any <span class="samp">BugReports</span> field
to be non-empty and a suitable single URL.
</p>
</li>
<li> <p><code>R CMD check --as-cran</code> now NOTEs if the package
does not register its native routines or does not declare its
intentions on (native) symbol search.  (This will become a WARNING
in due course.)
</p>
</li></ul>




<h4>DEPRECATED AND DEFUNCT</h4>


<ul>
<li><p> (Windows only) Function <code>setInternet2()</code> is defunct.
</p>
</li>
<li><p> Installation support for <code>readline</code> emulations based on
<code>editline</code> (aka <code>libedit</code>) is deprecated.
</p>
</li>
<li><p> Use of the C/C++ macro <span class="samp">NO_C_HEADERS</span> is defunct and
silently ignored.
</p>
</li>
<li> <p><code>unix.time()</code>, a traditional synonym for
<code>system.time()</code>, has been deprecated.
</p>
</li>
<li> <p><code>structure(NULL, ..)</code> is now deprecated as you cannot
set attributes on <code>NULL</code>.
</p>
</li>
<li><p> Header &lsquo;<span class="file">Rconfig.h</span>&rsquo; no longer defines
<span class="samp">SUPPORT_OPENMP</span>; instead use <span class="samp">_OPENMP</span> (as documented
for a long time).
</p>
</li>
<li><p> (C-level Native routine registration.)  The deprecated
<code>styles</code> member of the <code>R_CMethodDef</code> and
<code>R_FortranMethodDef</code> structures has been removed.
Packages using these will need to be re-installed for <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.4.0.
</p>
</li>
<li><p> The deprecated support for PCRE versions older than 8.20
will be removed in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.4.1. (Versions 8.20&ndash;8.31 will still be
accepted but remain deprecated.)
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li><p> Getting or setting <code>body()</code> or <code>formals()</code> on
non-functions for now signals a warning and may become an error
for setting.
</p>
</li>
<li> <p><code>match(x, t)</code>, <code>duplicated(x)</code> and
<code>unique(x)</code> work as documented for complex numbers with <code>NA</code>s
or <code>NaN</code>s, where all those containing <code>NA</code> do match,
whereas in the case of <code>NaN</code>'s both real and imaginary parts
must match, compatibly with how <code>print()</code> and <code>format()</code>
work for complex numbers.
</p>
</li>
<li> <p><code>deparse(&lt;complex&gt;, options = "digits17")</code> prints more
nicely now, mostly thanks to a suggestion by Richie Cotton.
</p>
</li>
<li><p> Rotated symbols in plotmath expressions are now positioned
correctly on <code>x11(type = "Xlib")</code>. (<a href="https://bugs.R-project.org/show_bug.cgi?id=16948">PR#16948</a>)
</p>
</li>
<li> <p><code>as&lt;-()</code> avoids an infinite loop when a virtual class
is interposed between a subclass and an actual superclass.
</p>
</li>
<li><p> Fix level propagation in <code>unlist()</code> when the list
contains zero-length lists or factors.
</p>
</li>
<li><p> Fix S3 dispatch on S4 objects when the <span class="pkg">methods</span> package is
not attached.
</p>
</li>
<li><p> Internal S4 dispatch sets <code>.Generic</code> in the method
frame for consistency with <code>standardGeneric()</code>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16929">PR#16929</a>)
</p>
</li>
<li><p> Fix <code>order(x, decreasing = TRUE)</code> when <code>x</code> is an
integer vector containing <code>MAX_INT</code>.  Ported from a fix Matt
Dowle made to <a href="https://CRAN.R-project.org/package=data.table"><span class="pkg">data.table</span></a>.
</p>
</li>
<li><p> Fix caching by <code>callNextMethod()</code>, resolves <a href="https://bugs.R-project.org/show_bug.cgi?id=16973">PR#16973</a>
and <a href="https://bugs.R-project.org/show_bug.cgi?id=16974">PR#16974</a>.
</p>
</li>
<li> <p><code>grouping()</code> puts NAs last, to be consistent with the
default behavior of <code>order()</code>.
</p>
</li>
<li><p> Point mass limit cases: <code>qpois(-2, 0)</code> now gives
<code>NaN</code> with a warning and <code>qgeom(1, 1)</code> is <code>0</code>.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=16972">PR#16972</a>)
</p>
</li>
<li> <p><code>table()</code> no longer drops an <code>"NaN"</code> factor level,
and better obeys <code>exclude = &lt;chr&gt;</code>, thanks to Suharto Anggono's
patch for <a href="https://bugs.R-project.org/show_bug.cgi?id=16936">PR#16936</a>.  Also, in the case of <code>exclude = NULL</code>
and <code>NA</code>s, these are tabulated correctly (again).
</p>
<p>Further, <code>table(1:2, exclude = 1, useNA = "ifany")</code> no longer
erroneously reports <code>&lt;NA&gt;</code> counts.
</p>
<p>Additionally, all cases of empty <code>exclude</code> are equivalent,
and <code>useNA</code> is not overwritten when specified (as it was by
<code>exclude = NULL</code>).
</p>
</li>
<li> <p><code>wilcox.test(x, conf.int=TRUE)</code> no longer errors out in
cases where the confidence interval is not available, such as for
<code>x = 0:2</code>.
</p>
</li>
<li> <p><code>droplevels(f)</code> now keeps &lt;NA&gt; levels when present.
</p>
</li>
<li><p> In integer arithmetic, <code>NULL</code> is now treated as
<code>integer(0)</code> whereas it was previously treated as <code>double(0)</code>.
</p>
</li>
<li><p> The radix sort considers <code>NA_real_</code> and <code>NaN</code> to
be equivalent in rank (like the other sort algorithms).
</p>
</li>
<li><p> When <code>index.return=TRUE</code> is passed to <code>sort.int()</code>,
the radix sort treats <code>NA</code>s like <code>sort.list()</code> does
(like the other sort algorithms).
</p>
</li>
<li><p> When in <code>tabulate(bin, nbin)</code> <code>length(bin)</code> is
larger than the maximal integer, the result is now of type
<code>double</code> and hence no longer silently overflows to wrong
values.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=17140">PR#17140</a>)
</p>
</li>
<li> <p><code>as.character.factor()</code> respects S4 inheritance when
checking the type of its argument. (<a href="https://bugs.R-project.org/show_bug.cgi?id=17141">PR#17141</a>)
</p>
</li>
<li><p> The <code>factor</code> method for <code>print()</code> no longer sets
the class of the factor to <code>NULL</code>, which would violate a
basic constraint of an S4 object.
</p>
</li>
<li> <p><code>formatC(x, flag = f)</code> allows two new flags, and
signals an error for invalid flags also in the case of character
formatting.
</p>
</li>
<li><p> Reading from <code>file("stdin")</code> now also closes the
connection and hence no longer leaks memory when reading from a
full pipe, thanks to Gábor Csárdi, see thread starting at
<a href="https://stat.ethz.ch/pipermail/r-devel/2016-November/073360.html">https://stat.ethz.ch/pipermail/r-devel/2016-November/073360.html</a>.
</p>
</li>
<li><p> Failure to create file in <code>tempdir()</code> for compressed
<code>pdf()</code> graphics device no longer errors (then later
segfaults).  There is now a warning instead of error and
compression is turned off for the device.  Thanks to Alec
Wysoker (<a href="https://bugs.R-project.org/show_bug.cgi?id=17191">PR#17191</a>).
</p>
</li>
<li><p> Asking for <code>methods()</code> on <code>"|"</code> returns only S3
methods. See
<a href="https://stat.ethz.ch/pipermail/r-devel/2016-December/073476.html">https://stat.ethz.ch/pipermail/r-devel/2016-December/073476.html</a>.
</p>
</li>
<li> <p><code>dev.capture()</code> using Quartz Cocoa device (macOS) returned
invalid components if the back-end chose to use ARGB instead of RGBA
image format. (Reported by Noam Ross.)
</p>
</li>
<li> <p><code>seq("2", "5")</code> now works too, equivalently to
<code>"2":"5"</code> and <code>seq.int()</code>.
</p>
</li>
<li> <p><code>seq.int(to = 1, by = 1)</code> is now correct, other cases are
integer (instead of <code>double</code>) when <code>seq()</code> is integer
too, and the &quot;non-finite&quot; error messages are consistent between
<code>seq.default()</code> and <code>seq.int()</code>, no longer mentioning
<code>NaN</code> etc.
</p>
</li>
<li> <p><code>rep(x, times)</code> and <code>rep.int(x, times)</code> now work
when <code>times</code> is larger than the largest value representable
in an integer vector.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16932">PR#16932</a>)
</p>
</li>
<li> <p><code>download.file(method = "libcurl")</code> does not check for
URL existence before attempting downloads; this is more robust to
servers that do not support HEAD or range-based retrieval, but may
create empty or incomplete files for aborted download requests.
</p>
</li>
<li><p> Bandwidth selectors <code>bw.ucv()</code>, <code>bw.bcv()</code> and
<code>bw.SJ()</code> now avoid integer overflow for large sample sizes.
</p>
</li>
<li> <p><code>str()</code> no longer shows <code>"list output truncated"</code>,
in cases that list was not shown at all.  Thanks to Neal Fultz
(<a href="https://bugs.R-project.org/show_bug.cgi?id=17219">PR#17219</a>)
</p>
</li>
<li><p> Fix for <code>cairo_pdf()</code> (and <code>svg()</code> and
<code>cairo_ps()</code>) when replaying a saved display list that contains
a mix of <span class="pkg">grid</span> and <span class="pkg">graphics</span> output.
(Report by Yihui Xie.)
</p>



</li>
<li><p> The <code>str()</code> and <code>as.hclust()</code> methods for
<code>"dendrogram"</code> now also work for deeply nested dendrograms
thanks to non-recursive implementations by Bradley Broom.
</p>
</li>
<li> <p><code>sample()</code> now uses two uniforms for added precision
when the uniform generator is <code>Knuth-TAOCP</code>,
<code>Knuth-TAOCP-2002</code>, or a user-defined generator and the
population size is <i>2^25</i> or greater.
</p>
</li>
<li><p> If a vignette in the &lsquo;<span class="file">vignettes</span>&rsquo; directory is listed in
&lsquo;<span class="file">.Rbuildignore</span>&rsquo;, <code>R CMD build</code> would not include it
in the tarball, but would include it in the vignette database,
leading to a check warning.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=17246">PR#17246</a>)
</p>
</li>
<li> <p><code>tools::latexToUtf8()</code> infinite looped on certain
inputs.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=17138">PR#17138</a>)
</p>
</li>
<li> <p><code>terms.formula()</code> ignored argument names when determining
whether two terms were identical.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=17235">PR#17235</a>)
</p>
</li>
<li> <p><code>callNextMethod()</code> was broken when called from a method
that augments the formal arguments of a primitive generic.
</p>
</li>
<li><p> Coercion of an S4 object to a vector during sub-assignment
into a vector failed to dispatch through the <code>as.vector()</code>
generic (often leading to a segfault).
</p>
</li>
<li><p> Fix problems in command completion:  Crash (<a href="https://bugs.R-project.org/show_bug.cgi?id=17222">PR#17222</a>)
and junk display in Windows, handling special characters in
filenames on all systems.
</p>
</li></ul>




<h3><img src="../help/figures/../../html/Rlogo.svg" class="toplogo" alt="[R logo]" /> CHANGES IN R 3.3.3</h3>



<h4>NEW FEATURES</h4>


<ul>
<li><p> Changes when redirection of a <span class="samp">http://</span> URL to a
<span class="samp">https://</span> URL is encountered:
</p>

<ul>
<li><p> The internal methods of <code>download.file()</code> and
<code>url()</code> now report that they cannot follow this (rather
than failing silently).
</p>
</li>
<li><p> (Unix-alike) <code>download.file(method = "auto")</code> (the
default) re-tries with <code>method = "libcurl"</code>.
</p>
</li>
<li><p> (Unix-alike) <code>url(method = "default")</code> with an
explicit <code>open</code> argument re-tries with
<code>method = "libcurl"</code>.  This covers many of the usages,
e.g. <code>readLines()</code> with a URL argument.
</p>
</li></ul>

</li></ul>




<h4>INSTALLATION on a UNIX-ALIKE</h4>


<ul>
<li><p> The <code>configure</code> check for the <code>zlib</code> version is
now robust to versions longer than 5 characters, including
<code>1.2.11</code>.
</p>
</li></ul>




<h4>UTILITIES</h4>


<ul>
<li><p> Environmental variable <span class="env">_R_CHECK_TESTS_NLINES_</span> controls
how <code>R CMD check</code> reports failing tests (see §8 of the
&lsquo;R Internals&rsquo; manual).
</p>
</li></ul>




<h4>DEPRECATED AND DEFUNCT</h4>


<ul>
<li><p> (C-level Native routine registration.)  The undocumented
<code>styles</code> field of the components of <code>R_CMethodDef</code> and
<code>R_FortranMethodDef</code> is deprecated.
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li> <p><code>vapply(x, *)</code> now works with long vectors <code>x</code>.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=17174">PR#17174</a>)
</p>
</li>
<li> <p><code>isS3method("is.na.data.frame")</code> and similar are
correct now.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=17171">PR#17171</a>)
</p>
</li>
<li> <p><code>grepRaw(&lt;long&gt;, &lt;short&gt;, fixed = TRUE)</code> now works,
thanks to a patch by Mikko Korpela.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=17132">PR#17132</a>)
</p>
</li>
<li><p> Package installation into a library where the package exists
<em>via</em> symbolic link now should work wherever
<code>Sys.readlink()</code> works, resolving <a href="https://bugs.R-project.org/show_bug.cgi?id=16725">PR#16725</a>.
</p>
</li>
<li> <p><code>"Cincinnati"</code> was missing an <code>"n"</code> in the
<code>precip</code> dataset.
</p>
</li>
<li><p> Fix buffer overflow vulnerability in <code>pdf()</code> when
loading an encoding file.  Reported by Talos (TALOS-2016-0227).
</p>
</li>
<li> <p><code>getDLLRegisteredRoutines()</code> now produces its warning
correctly when multiple DLLs match, thanks to Matt Dowle's <a href="https://bugs.R-project.org/show_bug.cgi?id=17184">PR#17184</a>.
</p>
</li>
<li> <p><code>Sys.timezone()</code> now returns non-NA also on platforms
such as <span class="samp">Ubuntu 14.04.5 LTS</span>, thanks to Mikko Korpela's
<a href="https://bugs.R-project.org/show_bug.cgi?id=17186">PR#17186</a>.
</p>
</li>
<li> <p><code>format(x)</code> for an illegal <code>"POSIXlt"</code> object
<code>x</code> no longer segfaults.
</p>
</li>
<li> <p><code>methods(f)</code> now also works for <code>f</code> <code>"("</code>
or <code>"{"</code>.
</p>
</li>
<li><p> (Windows only)  <code>dir.create()</code> did not check the length
of the path to create, and so could overflow a buffer and crash
<span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=17206">PR#17206</a>)
</p>
</li>
<li><p> On some systems, very small hexadecimal numbers in hex notation
would underflow to zero.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=17199">PR#17199</a>)
</p>
</li>
<li> <p><code>pmin()</code> and <code>pmax()</code> now work again for
<code>ordered</code> factors and 0-length S3 classed objects, thanks to
Suharto Anggono's <a href="https://bugs.R-project.org/show_bug.cgi?id=17195">PR#17195</a> and <a href="https://bugs.R-project.org/show_bug.cgi?id=17200">PR#17200</a>.
</p>
</li>
<li> <p><code>bug.report()</code> did not do any validity checking on a
package's <span class="samp">BugReports</span> field.  It now ignores an empty field,
removes leading whitespace and only attempts to open
<span class="samp">http://</span> and <span class="samp">https://</span> URLs, falling back to emailing
the maintainer.
</p>
</li>
<li><p> Bandwidth selectors <code>bw.ucv()</code> and
<code>bw.SJ()</code> gave incorrect answers or incorrectly reported an
error (because of integer overflow) for inputs longer than
46341.  Similarly for <code>bw.bcv()</code> at length 5793.
</p>
<p>Another possible integer overflow is checked and may result in an
error report (rather than an incorrect result) for much longer
inputs (millions for a smooth distribution).
</p>
</li>
<li> <p><code>findMethod()</code> failed if the active signature had
expanded beyond what a particular package used. (Example with
packages <a href="https://CRAN.R-project.org/package=XR"><span class="pkg">XR</span></a> and <a href="https://CRAN.R-project.org/package=XRJulia"><span class="pkg">XRJulia</span></a> on <acronym><span class="acronym">CRAN</span></acronym>.)
</p>
</li>
<li> <p><code>qbeta()</code> underflowed too early in some very asymmetric
cases.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=17178">PR#17178</a>)
</p>
</li>
<li> <p><code>R CMD Rd2pdf</code> had problems with packages with
non-ASCII titles in &lsquo;<span class="file">.Rd</span>&rsquo; files (usually the titles were
omitted).
</p>
</li></ul>




<h3><img src="../help/figures/../../html/Rlogo.svg" class="toplogo" alt="[R logo]" /> CHANGES IN R 3.3.2</h3>



<h4>NEW FEATURES</h4>


<ul>
<li> <p><code>extSoftVersion()</code> now reports the version (if any) of
the <code>readline</code> library in use.
</p>
</li>
<li><p> The version of LAPACK included in the sources has been
updated to 3.6.1, a bug-fix release including a speedup for the
non-symmetric case of <code>eigen()</code>.
</p>
</li>
<li><p> Use <code>options(deparse.max.lines=)</code> to limit the number
of lines recorded in <code>.Traceback</code> and other deparsing
activities.
</p>
</li>
<li> <p><code>format(&lt;AsIs&gt;)</code> looks more regular, also for
non-character atomic matrices.
</p>
</li>
<li> <p><code>abbreviate()</code> gains an option <code>named = TRUE</code>.
</p>
</li>
<li><p> The online documentation for package <span class="pkg">methods</span> is
extensively rewritten.  The goals are to simplify
documentation for basic use, to note old features not
recommended and to correct out-of-date information.
</p>
</li>
<li><p> Calls to <code>setMethod()</code> no longer print a message when
creating a generic function in those cases where that is
natural: S3 generics and primitives.
</p>
</li></ul>




<h4>INSTALLATION and INCLUDED SOFTWARE</h4>


<ul>
<li><p> Versions of the <code>readline</code> library &gt;= 6.3 had been
changed so that terminal window resizes were not signalled to
<code>readline</code>: code has been added using a explicit signal
handler to work around that (when <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> is compiled against readline
&gt;= 6.3).  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16604">PR#16604</a>)
</p>
</li>
<li> <p><code>configure</code> works better with Oracle Developer
Studio 12.5.
</p>
</li></ul>




<h4>UTILITIES</h4>


<ul>
<li> <p><code>R CMD check</code> reports more dubious flags in files
&lsquo;<span class="file">src/Makevars[.in]</span>&rsquo;, including <span class="option">-w</span> and <span class="option">-g</span>.
</p>
</li>
<li> <p><code>R CMD check</code> has been set up to filter important
warnings from recent versions of <code>gfortran</code> with
<span class="option">-Wall -pedantic</span>: this now reports non-portable GNU
extensions such as out-of-order declarations.
</p>
</li>
<li> <p><code>R CMD config</code> works better with paths containing
spaces, even those of home directories (as reported by Ken Beath).
</p>
</li></ul>




<h4>DEPRECATED AND DEFUNCT</h4>


<ul>
<li><p> Use of the C/C++ macro <span class="samp">NO_C_HEADERS</span> is deprecated
(no C headers are included by <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> headers from C++ as from <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>
3.3.0, so it should no longer be needed).
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li><p> The check for non-portable flags in <code>R CMD check</code>
could be stymied by &lsquo;<span class="file">src/Makevars</span>&rsquo; files which contained
targets.
</p>
</li>
<li><p> (Windows only) When using certain desktop themes in Windows
7 or higher, <kbd>Alt-Tab</kbd> could cause <code>Rterm</code> to stop
accepting input.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14406">PR#14406</a>; patch submitted by Jan Gleixner.)
</p>
</li>
<li> <p><code>pretty(d, ..)</code> behaves better for date-time <code>d</code>
(<a href="https://bugs.R-project.org/show_bug.cgi?id=16923">PR#16923</a>).
</p>
</li>
<li><p> When an S4 class name matches multiple classes in the S4
cache, perform a dynamic search in order to obey namespace
imports.  This should eliminate annoying messages about multiple
hits in the class cache.  Also, pass along the package from the
<code>ClassExtends</code> object when looking up superclasses in the
cache.
</p>
</li>
<li> <p><code>sample(NA_real_)</code> now works.
</p>
</li>
<li><p> Packages using non-ASCII encodings in their code did not
install data properly on systems using different encodings.
</p>
</li>
<li> <p><code>merge(df1, df2)</code> now also works for data frames with
column names <code>"na.last"</code>, <code>"decreasing"</code>, or
<code>"method"</code>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=17119">PR#17119</a>)
</p>
</li>
<li> <p><code>contour()</code> caused a segfault if the <code>labels</code>
argument had length zero.  (Reported by Bill Dunlap.)
</p>
</li>
<li> <p><code>unique(warnings())</code> works more correctly, thanks to a
new <code>duplicated.warnings()</code> method.
</p>
</li>
<li> <p><code>findInterval(x, vec = numeric(), all.inside = TRUE)</code>
now returns <code>0</code>s as documented.  (Reported by Bill Dunlap.)
</p>
</li>
<li><p> (Windows only) <code>R CMD SHLIB</code> failed when a symbol
in the resulting library had the same name as a keyword in
the &lsquo;<span class="file">.def</span>&rsquo; file.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=17130">PR#17130</a>)
</p>
</li>
<li> <p><code>pmax()</code> and <code>pmin()</code> now work with (more ?)
classed objects, such as <code>"Matrix"</code> from the <a href="https://CRAN.R-project.org/package=Matrix"><span class="pkg">Matrix</span></a>
package, as documented for a long time.
</p>
</li>
<li> <p><code>axis(side, x = D)</code> and hence <code>Axis()</code> and
<code>plot()</code> now work correctly for <code>"Date"</code> and time
objects <code>D</code>, even when &ldquo;time goes backward&rdquo;, e.g.,
with decreasing <code>xlim</code>.  (Reported by William May.)
</p>
</li>
<li> <p><code>str(I(matrix(..)))</code> now looks as always intended.
</p>
</li>
<li> <p><code>plot.ts()</code>, the <code>plot()</code> method for time series,
now respects <code>cex</code>, <code>lwd</code> and <code>lty</code>.  (Reported by
Greg Werbin.)
</p>
</li>
<li> <p><code>parallel::mccollect()</code> now returns a named list (as
documented) when called with <code>wait = FALSE</code>.  (Reported by
Michel Lang.)
</p>
</li>
<li><p> If a package added a class to a class union in another
package, loading the first package gave erroneous warnings
about &ldquo;undefined subclass&rdquo;.
</p>
</li>
<li> <p><code>c()</code>'s argument <code>use.names</code> is documented now, as
belonging to the (C internal) default method.   In
&ldquo;parallel&rdquo;, argument <code>recursive</code> is also moved from
the generic to the default method, such that the formal argument list
of <span class="pkg">base</span> generic <code>c()</code> is just <code>(...)</code>.
</p>
</li>
<li> <p><code>rbeta(4, NA)</code> and similarly <code>rgamma()</code> and
<code>rnbinom()</code> now return <code>NaN</code>'s with a warning, as other
r&lt;dist&gt;(), and as documented.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=17155">PR#17155</a>)
</p>
</li>
<li><p> Using <code>options(checkPackageLicense = TRUE)</code> no longer
requires acceptance of the licence for non-default standard
packages such as <span class="pkg">compiler</span>.  (Reported by Mikko Korpela.)
</p>
</li>
<li> <p><code>split(&lt;very_long&gt;, *)</code> now works even when the split
off parts are long. (<a href="https://bugs.R-project.org/show_bug.cgi?id=17139">PR#17139</a>)
</p>
</li>
<li> <p><code>min()</code> and <code>max()</code> now also work correctly when
the argument list starts with <code>character(0)</code>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=17160">PR#17160</a>)
</p>
</li>
<li><p> Subsetting very large matrices (<code>prod(dim(.)) &gt;= 2^31</code>)
now works thanks to Michael Schubmehl's <a href="https://bugs.R-project.org/show_bug.cgi?id=17158">PR#17158</a>.
</p>
</li>
<li> <p><code>bartlett.test()</code> used residual sums of squares
instead of variances, when the argument was a list of <code>lm</code> objects.
(Reported by Jens Ledet Jensen).
</p>
</li>
<li> <p><code>plot(&lt;lm&gt;, which = *)</code> now correctly labels the
contour lines for the standardized residuals for <code>which = 6</code>.
It also takes the correct <i>p</i> in case of singularities (also
for <code>which = 5</code>).  (<a href="https://bugs.R-project.org/show_bug.cgi?id=17161">PR#17161</a>)
</p>
</li>
<li> <p><code>xtabs(~ exclude)</code> no longer fails from wrong scope,
thanks to Suharto Anggono's <a href="https://bugs.R-project.org/show_bug.cgi?id=17147">PR#17147</a>.
</p>
</li>
<li><p> Reference class calls to <code>methods()</code> did not
re-analyse previously defined methods, meaning that calls to
methods defined later would fail. (Reported by Charles Tilford).
</p>
</li>
<li> <p><code>findInterval(x, vec, left.open = TRUE)</code> misbehaved in some
cases. (Reported by Dmitriy Chernykh.)
</p>
</li></ul>




<h3><img src="../help/figures/../../html/Rlogo.svg" class="toplogo" alt="[R logo]" /> CHANGES IN R 3.3.1</h3>



<h4>BUG FIXES</h4>


<ul>
<li> <p><code>R CMD INSTALL</code> and hence <code>install.packages()</code>
gave an internal error installing a package called
<span class="pkg">description</span> from a tarball on a case-insensitive file system.
</p>
</li>
<li> <p><code>match(x, t)</code> (and hence <code>x %in% t</code>) failed
when <code>x</code> was of length one, and either <code>character</code> and <code>x</code>
and <code>t</code> only differed in their <code>Encoding</code> or when
<code>x</code> and <code>t</code> where <code>complex</code> with <code>NA</code>s or <code>NaN</code>s.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=16885">PR#16885</a>.)
</p>
</li>
<li> <p><code>unloadNamespace(ns)</code> also works again when <code>ns</code> is a
&lsquo;namespace&rsquo;, as from <code>getNamespace()</code>.
</p>
</li>
<li> <p><code>rgamma(1, Inf)</code> or <code>rgamma(1, 0, 0)</code> no longer give
<code>NaN</code> but the correct limit.
</p>
</li>
<li> <p><code>length(baseenv())</code> is correct now.
</p>
</li>
<li> <p><code>pretty(d, ..)</code> for date-time <code>d</code> rarely failed
when <code>"halfmonth"</code> time steps were tried (<a href="https://bugs.R-project.org/show_bug.cgi?id=16923">PR#16923</a>) and
on &lsquo;inaccurate&rsquo; platforms such as 32-bit Windows or
a configuration with <code>--disable-long-double</code>; see comment
#15 of <a href="https://bugs.R-project.org/show_bug.cgi?id=16761">PR#16761</a>.
</p>
</li>
<li><p> In <code>text.default(x, y, labels)</code>, the rarely(?) used
default for <code>labels</code> is now correct also for the case of a
2-column matrix <code>x</code> and missing <code>y</code>.
</p>
</li>
<li> <p><code>as.factor(c(a = 1L))</code> preserves <code>names()</code> again
as in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> &lt; 3.1.0.
</p>
</li>
<li> <p><code>strtrim(""[0], 0[0])</code> now works.
</p>
</li>
<li><p> Use of <code>Ctrl-C</code> to terminate a reverse incremental
search started by <code>Ctrl-R</code> in the <code>readline</code>-based Unix
terminal interface is now supported when <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> was compiled against
<code>readline</code> &gt;= 6.0 (<code>Ctrl-G</code> always worked).
(<a href="https://bugs.R-project.org/show_bug.cgi?id=16603">PR#16603</a>)
</p>
</li>
<li> <p><code>diff(&lt;difftime&gt;)</code> now keeps the <code>"units"</code>
attribute, as subtraction already did, <a href="https://bugs.R-project.org/show_bug.cgi?id=16940">PR#16940</a>.
</p>
</li></ul>




<h3><img src="../help/figures/../../html/Rlogo.svg" class="toplogo" alt="[R logo]" /> CHANGES IN R 3.3.0</h3>



<h4>SIGNIFICANT USER-VISIBLE CHANGES</h4>


<ul>
<li> <p><code>nchar(x, *)</code>'s argument <code>keepNA</code> governing how
the result for <code>NA</code>s in <code>x</code> is determined, gets a new
default <code>keepNA = NA</code> which returns <code>NA</code> where
<code>x</code> is <code>NA</code>, except for <code>type = "width"</code> which still
returns <code>2</code>, the formatting / printing width of <code>NA</code>.
</p>
</li>
<li><p> All builds have support for <span class="samp">https:</span> URLs in the
default methods for <code>download.file()</code>, <code>url()</code> and code
making use of them.
</p>
<p>Unfortunately that cannot guarantee that any particular
<span class="samp">https:</span> URL can be accessed.  For example, server and client
have to successfully negotiate a cryptographic protocol (TLS/SSL,
...) and the server's identity has to be verifiable <em>via</em>
the available certificates.  Different access methods may allow
different protocols or use private certificate bundles: we
encountered a <span class="samp">https:</span> CRAN mirror which could be accessed by
one browser but not by another nor by <code>download.file()</code> on
the same Linux machine.
</p>
</li></ul>




<h4>NEW FEATURES</h4>


<ul>
<li><p> The <code>print</code> method for <code>methods()</code> gains a
<code>byclass</code> argument.
</p>
</li>
<li><p> New functions <code>validEnc()</code> and <code>validUTF8()</code> to
give access to the validity checks for inputs used by
<code>grep()</code> and friends.
</p>
</li>
<li><p> Experimental new functionality for S3 method checking, notably
<code>isS3method()</code>.
</p>
<p>Also, the names of the <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> &lsquo;language elements&rsquo; are exported
as character vector <code>tools::langElts</code>.
</p>
</li>
<li> <p><code>str(x)</code> now displays <code>"Time-Series"</code> also for
matrix (multivariate) time-series, i.e. when <code>is.ts(x)</code> is true.
</p>
</li>
<li><p> (Windows only)  The GUI menu item to install local packages
now accepts &lsquo;<span class="file">*.tar.gz</span>&rsquo; files as well as &lsquo;<span class="file">*.zip</span>&rsquo; files
(but defaults to the latter).
</p>
</li>
<li><p> New programmeR's utility function <code>chkDots()</code>.
</p>
</li>
<li> <p><code>D()</code> now signals an error when given invalid input,
rather than silently returning <code>NA</code>.  (Request of John Nash.)
</p>
</li>
<li> <p><code>formula</code> objects are slightly more &ldquo;first class&rdquo;:
e.g., <code>formula()</code> or <code>new("formula", y ~ x)</code> are now
valid.  Similarly, for <code>"table"</code>, <code>"ordered"</code> and
<code>"summary.table"</code>.  Packages defining S4 classes with the above
S3/S4 classes as slots should be reinstalled.


</p>
</li>
<li><p> New function <code>strrep()</code> for repeating the elements of a
character vector.
</p>
</li>
<li> <p><code>rapply()</code> preserves attributes on the list when
<code>how = "replace"</code>.
</p>
</li>
<li><p> New S3 generic function <code>sigma()</code> with methods for
extracting the estimated standard deviation aka &ldquo;residual
standard deviation&rdquo; from a fitted model.
</p>
</li>
<li> <p><code>news()</code> now displays <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> and package news files within
the HTML help system if it is available.  If no news file is found,
a visible <code>NULL</code> is returned to the console.
</p>
</li>
<li> <p><code>as.raster(x)</code> now also accepts <code>raw</code> arrays
<code>x</code> assuming values in <code>0:255</code>.
</p>
</li>
<li><p> Subscripting of matrix/array objects of type
<code>"expression"</code> is now supported.
</p>
</li>
<li> <p><code>type.convert("i")</code> now returns a factor instead of a
complex value with zero real part and missing imaginary part.
</p>
</li>
<li><p> Graphics devices <code>cairo_pdf()</code> and <code>cairo_ps()</code>
now allow non-default values of the cairographics &lsquo;fallback
resolution&rsquo; to be set.
</p>
<p>This now defaults to 300 on all platforms: that is the default
documented by cairographics, but apparently was not used by all
system installations.
</p>
</li>
<li> <p><code>file()</code> gains an explicit <code>method</code> argument
rather than implicitly using
<code>getOption("url.method", "default")</code>.
</p>
</li>
<li><p> Thanks to a patch from Tomas Kalibera, <code>x[x != 0]</code> is
now typically faster than <code>x[which(x != 0)]</code> (in the case
where <code>x</code> has no NAs, the two are equivalent).
</p>
</li>
<li> <p><code>read.table()</code> now always uses the names for a named
<code>colClasses</code> argument (previously names were only used when
<code>colClasses</code> was too short). (In part, wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=16478">PR#16478</a>.)
</p>
</li>
<li><p> (Windows only) <code>download.file()</code> with default
<code>method = "auto"</code> and a <span class="samp">ftps://</span> URL chooses
<code>"libcurl"</code> if that is available.
</p>
</li>
<li><p> The out-of-the box Bioconductor mirror has been changed to
one using <span class="samp">https://</span>: use <code>chooseBioCmirror()</code> to choose
a <span class="samp">http://</span> mirror if required.
</p>
</li>
<li><p> The data frame and formula methods for <code>aggregate()</code>
gain a <code>drop</code> argument.
</p>
</li>
<li> <p><code>available.packages()</code> gains a <code>repos</code> argument.
</p>
</li>
<li><p> The undocumented switching of methods for <code>url()</code> on
<span class="samp">https:</span> and <span class="samp">ftps:</span> URLs is confined to
<code>method = "default"</code> (and documented).
</p>
</li>
<li> <p><code>smoothScatter()</code> gains a <code>ret.selection</code> argument.
</p>
</li>
<li> <p><code>qr()</code> no longer has a <code>...</code> argument to pass
additional arguments to methods.
</p>
</li>
<li> <p><code>[</code> has a method for class <code>"table"</code>.
</p>
</li>
<li><p> It is now possible (again) to <code>replayPlot()</code> a
display list snapshot that was created by <code>recordPlot()</code>
in a different <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> session.
</p>
<p>It is still not a good idea to use snapshots as a persistent
storage format for <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> plots, but it is now not completely silly to
use a snapshot as a format for transferring an R plot between two
R sessions.
</p>
<p>The underlying changes mean that packages providing graphics
devices (e.g., <a href="https://CRAN.R-project.org/package=Cairo"><span class="pkg">Cairo</span></a>, <a href="https://CRAN.R-project.org/package=RSvgDevice"><span class="pkg">RSvgDevice</span></a>,
<a href="https://CRAN.R-project.org/package=cairoDevice"><span class="pkg">cairoDevice</span></a>, <a href="https://CRAN.R-project.org/package=tikzDevice"><span class="pkg">tikzDevice</span></a>) will need to be
reinstalled.
</p>
<p>Code for restoring snapshots was contributed by Jeroen Ooms
and JJ Allaire.
</p>
<p>Some testing code is available at
<a href="https://github.com/pmur002/R-display-list">https://github.com/pmur002/R-display-list</a>.
</p>
</li>
<li> <p><code>tools::undoc(dir = D)</code> and <code>codoc(dir = D)</code> now
also work when <code>D</code> is a directory whose <code>normalizePath()</code>ed
version does not end in the package name, e.g. from a symlink.
</p>
</li>
<li> <p><code>abbreviate()</code> has more support for multi-byte
character sets &ndash; it no longer removes bytes within characters and
knows about Latin vowels with accents.  It is still only
really suitable for (most) European languages, and still warns on
non-ASCII input.
</p>
<p><code>abbreviate(use.classes = FALSE)</code> is now implemented, and
that is more suitable for non-European languages.
</p>
</li>
<li> <p><code>match(x, table)</code> is faster (sometimes by an order of
magnitude) when <code>x</code> is of length one and <code>incomparables</code>
is unchanged, thanks to Peter Haverty (<a href="https://bugs.R-project.org/show_bug.cgi?id=16491">PR#16491</a>).
</p>
</li>
<li><p> More consistent, partly not back-compatible behavior of
<code>NA</code> and <code>NaN</code> coercion to complex numbers, operations
less often resulting in complex <code>NA</code> (<code>NA_complex_</code>).
</p>
</li>
<li> <p><code>lengths()</code> considers methods for <code>length</code> and
<code>[[</code> on <code>x</code>, so it should work automatically on any
objects for which appropriate methods on those generics are
defined.
</p>
</li>
<li><p> The logic for selecting the default screen device on OS X
has been simplified: it is now <code>quartz()</code> if that is
available even if environment variable <span class="env">DISPLAY</span> has been set
by the user.
</p>
<p>The choice can easily be overridden <em>via</em> environment
variable <span class="env">R_INTERACTIVE_DEVICE</span>.
</p>
</li>
<li><p> On Unix-like platforms which support the <code>getline</code> C
library function, <code>system(*, intern = TRUE)</code> no longer
truncates (output) lines longer than 8192 characters, thanks to
Karl Millar. (<a href="https://bugs.R-project.org/show_bug.cgi?id=16544">PR#16544</a>)
</p>
</li>
<li> <p><code>rank()</code> gains a <code>ties.method = "last"</code> option,
for convenience (and symmetry).
</p>


</li>
<li> <p><code>regmatches(invert = NA)</code> can now be used to extract
both non-matched and matched substrings.
</p>
</li>
<li> <p><code>data.frame()</code> gains argument <code>fix.empty.names</code>;
<code>as.data.frame.list()</code> gets new <code>cut.names</code>,
<code>col.names</code> and <code>fix.empty.names</code>.
</p>
</li>
<li> <p><code>plot(x ~ x, *)</code> now warns that it is the same as
<code>plot(x ~ 1, *)</code>.
</p>
</li>
<li> <p><code>recordPlot()</code> has new arguments <code>load</code> and
<code>attach</code> to allow package names to be stored as part of a
recorded plot.  <code>replayPlot()</code> has new argument
<code>reloadPkgs</code> to load/attach any package names that were
stored as part of a recorded plot.
</p>
</li>
<li><p> S4 dispatch works within calls to <code>.Internal()</code>. This
means explicit S4 generics are no longer needed for
<code>unlist()</code> and <code>as.vector()</code>.
</p>
</li>
<li><p> Only font family names starting with <span class="samp">"Hershey"</span> (and
not <span class="samp">"Her"</span> as before) are given special treatment by the
graphics engine.
</p>
</li>
<li><p> S4 values are automatically coerced to vector (<em>via</em>
<code>as.vector</code>) when subassigned into atomic vectors.
</p>
</li>
<li> <p><code>findInterval()</code> gets a <code>left.open</code> option.
</p>
</li>
<li><p> The version of LAPACK included in the sources has been
updated to 3.6.0, including those &lsquo;deprecated&rsquo; routines
which were previously included.  <em>Ca</em> 40 double-complex
routines have been added at the request of a package maintainer.
</p>
<p>As before, the details of what is included are in
&lsquo;<span class="file">src/modules/lapack/README</span>&rsquo; and this now gives information on
earlier additions.
</p>
</li>
<li> <p><code>tapply()</code> has been made considerably more efficient
without changing functionality, thanks to proposals from Peter
Haverty and Suharto Anggono.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16640">PR#16640</a>)
</p>
</li>
<li> <p><code>match.arg(arg)</code> (the one-argument case) is faster; so
is <code>sort.int()</code>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16652">PR#16652</a>)
</p>
</li>
<li><p> The <code>format</code> method for <code>object_size</code> objects now
also accepts &ldquo;binary&rdquo; units such as <code>"KiB"</code> and e.g.,
<code>"Tb"</code>.  (Partly from <a href="https://bugs.R-project.org/show_bug.cgi?id=16649">PR#16649</a>.)
</p>
</li>
<li><p> Profiling now records calls of the form <code>foo::bar</code> and
some similar cases directly rather than as calls to
<code>&lt;Anonymous&gt;</code>.  Contributed by Winston Chang.
</p>
</li>
<li><p> New string utilities <code>startsWith(x, prefix)</code> and
<code>endsWith(x, suffix)</code>.  Also provide speedups for some
<code>grepl("^...", *)</code> uses (related to proposals in <a href="https://bugs.R-project.org/show_bug.cgi?id=16490">PR#16490</a>).
</p>
</li>
<li><p> Reference class finalizers run at exit, as well as on
garbage collection.
</p>
</li>
<li><p> Avoid <span class="pkg">parallel</span> dependency on <span class="pkg">stats</span> for port
choice and random number seeds.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16668">PR#16668</a>)
</p>
</li>
<li><p> The radix sort algorithm and implementation from
<a href="https://CRAN.R-project.org/package=data.table"><span class="pkg">data.table</span></a> (<code>forder</code>) replaces the previous radix
(counting) sort and adds a new method for <code>order()</code>.
Contributed by Matt Dowle and Arun Srinivasan, the new algorithm
supports logical, integer (even with large values), real, and
character vectors.  It outperforms all other methods, but there
are some caveats (see <code>?sort</code>).
</p>
</li>
<li><p> The <code>order()</code> function gains a <code>method</code> argument
for choosing between <code>"shell"</code> and <code>"radix"</code>.
</p>
</li>
<li><p> New function <code>grouping()</code> returns a permutation that
stably rearranges data so that identical values are adjacent.  The
return value includes extra partitioning information on the
groups.  The implementation came included with the new radix sort.
</p>
</li>
<li> <p><code>rhyper(nn, m, n, k)</code> no longer returns <code>NA</code> when
one of the three parameters exceeds the maximal integer.
</p>
</li>
<li> <p><code>switch()</code> now warns when no alternatives are provided.
</p>
</li>
<li> <p><code>parallel::detectCores()</code> now has default <code>logical
	= TRUE</code> on all platforms &ndash; as this was the default on Windows,
this change only affects Sparc Solaris.
</p>
<p>Option <code>logical = FALSE</code> is now supported on Linux and recent
versions of OS X (for the latter, thanks to a suggestion of Kyaw
Sint).
</p>
</li>
<li> <p><code>hist()</code> for <code>"Date"</code> or <code>"POSIXt"</code> objects
would sometimes give misleading labels on the breaks, as they
were set to the day before the start of the period being
displayed.  The display format has been changed, and the shift of the
start day has been made conditional on <code>right = TRUE</code> (the
default).  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16679">PR#16679</a>)
</p>
</li>
<li> <p><span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> now uses a new version of the logo (donated to the R
Foundation by RStudio).  It is defined in &lsquo;<span class="file">.svg</span>&rsquo; format, so
will resize without unnecessary degradation when displayed on
HTML pages&mdash;there is also a vector PDF version.  Thanks to
Dirk Eddelbuettel for producing the corresponding X11 icon.
</p>
</li>
<li><p> New function <code>.traceback()</code> returns the stack trace
which <code>traceback()</code> prints.
</p>
</li>
<li> <p><code>lengths()</code> dispatches internally.
</p>
</li>
<li> <p><code>dotchart()</code> gains a <code>pt.cex</code> argument to control
the size of points separately from the size of plot labels.
Thanks to Michael Friendly and Milan Bouchet-Valat for ideas
and patches.
</p>
</li>
<li> <p><code>as.roman(ch)</code> now correctly deals with more diverse
character vectors <code>ch</code>; also arithmetic with the resulting
roman numbers works in more cases.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16779">PR#16779</a>)
</p>
</li>
<li> <p><code>prcomp()</code> gains a new option <code>rank.</code> allowing to
directly aim for less than <code>min(n,p)</code> PC's.  The
<code>summary()</code> and its <code>print()</code> method have been amended,
notably for this case.
</p>
</li>
<li> <p><code>gzcon()</code> gains a new option <code>text</code>, which marks
the connection as text-oriented (so e.g. <code>pushBack()</code>
works).  It is still always opened in binary mode.
</p>
</li>
<li><p> The <code>import()</code> namespace directive now accepts an
argument <code>except</code> which names symbols to exclude from the
imports. The <code>except</code> expression should evaluate to a
character vector (after substituting symbols for strings). See
Writing R Extensions.
</p>
</li>
<li><p> New convenience function <code>Rcmd()</code> in package
<span class="pkg">tools</span> for invoking <code>R CMD</code> tools from within <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>.
</p>
</li>
<li><p> New functions <code>makevars_user()</code> and
<code>makevars_site()</code> in package <span class="pkg">tools</span> to determine the
location of the user and site specific &lsquo;<span class="file">Makevars</span>&rsquo; files for
customizing package compilation.
</p>
</li></ul>




<h4>UTILITIES</h4>


<ul>
<li> <p><code>R CMD check</code> has a new option
<span class="option">--ignore-vignettes</span> for use with non-Sweave vignettes
whose <span class="samp">VignetteBuilder</span> package is not available.
</p>
</li>
<li> <p><code>R CMD check</code> now by default checks code usage
(<em>via</em> <a href="https://CRAN.R-project.org/package=codetools"><span class="pkg">codetools</span></a>) with only the base package
attached.  Functions from default packages other than <span class="pkg">base</span>
which are used in the package code but not imported are reported
as undefined globals, with a suggested addition to the
<code>NAMESPACE</code> file.
</p>
</li>
<li> <p><code>R CMD check --as-cran</code> now also checks DOIs in
package &lsquo;<span class="file">CITATION</span>&rsquo; and Rd files.
</p>
</li>
<li> <p><code>R CMD Rdconv</code> and <code>R CMD Rd2pdf</code> each have
a new option <span class="option">--RdMacros=pkglist</span> which allows Rd macros
to be specified before processing.
</p>
</li></ul>




<h4>DEPRECATED AND DEFUNCT</h4>


<ul>
<li><p> The previously included versions of <code>zlib</code>,
<code>bzip2</code>, <code>xz</code> and PCRE have been removed, so suitable
external (usually system) versions are required (see the
&lsquo;R Installation and Administration&rsquo; manual).
</p>
</li>
<li><p> The unexported and undocumented Windows-only devices
<code>cairo_bmp()</code>, <code>cairo_png()</code> and <code>cairo_tiff()</code>
have been removed.  (These devices should be used as
e.g. <code>bmp(type = "cairo")</code>.)
</p>
</li>
<li><p> (Windows only)  Function <code>setInternet2()</code> has no effect
and will be removed in due course.  The choice between methods
<code>"internal"</code> and <code>"wininet"</code> is now made by the
<code>method</code> arguments of <code>url()</code> and <code>download.file()</code>
and their defaults can be set <em>via</em> options.  The
out-of-the-box default remains <code>"wininet"</code> (as it has been
since <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.2.2).
</p>
</li>
<li> <p><code>[&lt;-</code> with an S4 value into a list currently embeds the
S4 object into its own list such that the end result is roughly
equivalent to using <code>[[&lt;-</code>.  That behavior is deprecated.  In
the future, the S4 value will be coerced to a list with
<code>as.list()</code>.
</p>
</li>
<li><p> Package <span class="pkg">tools</span>' functions
<code>package.dependencies()</code>, <code>pkgDepends()</code>, etc are
deprecated now, mostly in favor of <code>package_dependencies()</code>
which is both more flexible and efficient.
</p>
</li></ul>




<h4>INSTALLATION and INCLUDED SOFTWARE</h4>


<ul>
<li><p> Support for very old versions of <code>valgrind</code>
(e.g., 3.3.0) has been removed.
</p>
</li>
<li><p> The included <code>libtool</code> script (generated by
<code>configure</code>) has been updated to version 2.4.6 (from 2.2.6a).
</p>
</li>
<li> <p><code>libcurl</code> version 7.28.0 or later with support for the
<code>https</code> protocol is required for installation (except on
Windows).
</p>
</li>
<li><p> BSD networking is now required (except on Windows) and so
<code>capabilities("http/ftp")</code> is always true.
</p>
</li>
<li> <p><code>configure</code> uses <code>pkg-config</code> for PNG, TIFF
and JPEG where this is available.  This should work better with
multiple installs and with those using static libraries.
</p>
</li>
<li><p> The minimum supported version of OS X is 10.6 (&lsquo;Snow
Leopard&rsquo;): even that has been unsupported by Apple since 2012.
</p>
</li>
<li><p> The <code>configure</code> default on OS X is
<span class="option">--disable-R-framework</span>: enable this if you intend to
install under &lsquo;<span class="file">/Library/Frameworks</span>&rsquo; and use with <code>R.app</code>.
</p>
</li>
<li><p> The minimum preferred version of PCRE has since <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.0.0
been 8.32 (released in Nov 2012).  Versions 8.10 to 8.31 are now
deprecated (with warnings from <code>configure</code>), but will
still be accepted until <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.4.0.
</p>
</li>
<li> <p><code>configure</code> looks for C functions <code>__cospi</code>,
<code>__sinpi</code> and <code>__tanpi</code> and uses these if <code>cospi</code>
<em>etc</em> are not found.  (OS X is the main instance.)
</p>
</li>
<li><p> (Windows) R is now built using <code>gcc</code>
4.9.3.  This build will require recompilation of at least those packages
that include C++ code, and possibly others.  A build of R-devel using
the older toolchain will be temporarily available for comparison
purposes.
</p>
<p>During the transition, the environment variable
<span class="env">R_COMPILED_BY</span> has been defined to indicate which toolchain
was used to compile R (and hence, which should be used to compile
code in packages).  The <code>COMPILED_BY</code> variable described below
will be a permanent replacement for this.
</p>
</li>
<li><p> (Windows) A <code>make</code> and <code>R CMD config</code> variable
named <code>COMPILED_BY</code> has been added.  This indicates
which toolchain was used to compile R (and hence, which should be
used to compile code in packages).
</p>
</li></ul>




<h4>PACKAGE INSTALLATION</h4>


<ul>
<li><p> The <code>make</code> macro <code>AWK</code> which used to be made
available to files such as &lsquo;<span class="file">src/Makefile</span>&rsquo; is no longer set.
</p>
</li></ul>




<h4>C-LEVEL FACILITIES</h4>


<ul>
<li><p> The API call <code>logspace_sum</code> introduced in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.2.0 is
now remapped as an entry point to <code>Rf_logspace_sum</code>, and its
first argument has gained a <code>const</code> qualifier.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16470">PR#16470</a>)
</p>
<p>Code using it will need to be reinstalled.
</p>
<p>Similarly, entry point <code>log1pexp</code> also defined in
&lsquo;<span class="file">Rmath.h</span>&rsquo; is remapped there to <code>Rf_log1pexp</code>
</p>
</li>
<li> <p><code>R_GE_version</code> has been increased to <code>11</code>.
</p>
</li>
<li><p> New API call <code>R_orderVector1</code>, a faster
one-argument version of <code>R_orderVector</code>.
</p>
</li>
<li><p> When <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> headers such as &lsquo;<span class="file">R.h</span>&rsquo; and &lsquo;<span class="file">Rmath.h</span>&rsquo; are
called from C++ code in packages they include the C++ versions of
system headers such as &lsquo;<span class="file">&lt;cmath&gt;</span>&rsquo; rather than the legacy
headers such as &lsquo;<span class="file">&lt;math.h&gt;</span>&rsquo;.  (Headers &lsquo;<span class="file">Rinternals.h</span>&rsquo; and
&lsquo;<span class="file">Rinterface.h</span>&rsquo; already did, and inclusion of system headers
can still be circumvented by defining <code>NO_C_HEADERS</code>,
including as from this version for those two headers.)
</p>
<p>The manual has long said that <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> headers should <b>not</b> be
included within an <code>extern "C"</code> block, and almost all the
packages affected by this change were doing so.
</p>
</li>
<li><p> Including header &lsquo;<span class="file">S.h</span>&rsquo; from C++ code would fail on some
platforms, and so gives a compilation error on all.
</p>
</li>
<li><p> The deprecated header &lsquo;<span class="file">Rdefines.h</span>&rsquo; is now compatible
with defining <code>R_NO_REMAP</code>.
</p>
</li>
<li><p> The connections interface now includes a function
<code>R_GetConnection()</code> which allows packages implementing
connections to convert R <code>connection</code> objects to
<code>Rconnection</code> handles. Code which previously
used the low-level R-internal <code>getConnection()</code> entry point
should switch.
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li><p> C-level <code>asChar(x)</code> is fixed for when <code>x</code> is not a
vector, and it returns <code>"TRUE"</code>/<code>"FALSE"</code> instead of
<code>"T"</code>/<code>"F"</code> for logical vectors.
</p>
</li>
<li><p> The first arguments of <code>.colSums()</code> etc (with an
initial dot) are now named <code>x</code> rather than <code>X</code> (matching
<code>colSums()</code>): thus error messages are corrected.
</p>
</li>
<li><p> A <code>coef()</code> method for class <code>"maov"</code> has been
added to allow <code>vcov()</code> to work with multivariate
results. (<a href="https://bugs.R-project.org/show_bug.cgi?id=16380">PR#16380</a>)
</p>
</li>
<li> <p><code>method = "libcurl"</code> connections signal errors rather
than retrieving HTTP error pages (where the ISP reports the
error).
</p>
</li>
<li> <p><code>xpdrows.data.frame()</code> was not checking for unique
row names; in particular, this affected assignment to non-existing
rows <em>via</em> numerical indexing. (<a href="https://bugs.R-project.org/show_bug.cgi?id=16570">PR#16570</a>)
</p>
</li>
<li> <p><code>tail.matrix()</code> did not work for zero rows matrices,
and could produce row &ldquo;labels&rdquo; such as <code>"[1e+05,]"</code>.
</p>
</li>
<li><p> Data frames with a column named <code>"stringsAsFactors"</code>
now format and print correctly.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16580">PR#16580</a>)
</p>
</li>
<li> <p><code>cor()</code> is now guaranteed to return a value with
absolute value less than or equal to 1. (<a href="https://bugs.R-project.org/show_bug.cgi?id=16638">PR#16638</a>)
</p>
</li>
<li><p> Array subsetting now keeps <code>names(dim(.))</code>.
</p>
</li>
<li><p> Blocking socket connection selection recovers more
gracefully on signal interrupts.
</p>
</li>
<li><p> The <code>data.frame</code> method of <code>rbind()</code> construction
<code>row.names</code> works better in borderline integer cases, but
may change the names assigned.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16666">PR#16666</a>)
</p>
</li>
<li><p> (X11 only)  <code>getGraphicsEvent()</code> miscoded buttons and
missed mouse motion events.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16700">PR#16700</a>)
</p>
</li>
<li> <p><code>methods(round)</code> now also lists <code>round.POSIXt</code>.
</p>
</li>
<li> <p><code>tar()</code> now works with the default <code>files = NULL</code>.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=16716">PR#16716</a>)
</p>
</li>
<li><p> Jumps to outer contexts, for example in error recovery, now
make intermediate jumps to contexts where <code>on.exit()</code> actions
are established instead of trying to run all <code>on.exit()</code>
actions before jumping to the final target. This unwinds the stack
gradually, releases resources held on the stack, and significantly
reduces the chance of a segfault when running out of C stack
space. Error handlers established using
<code>withCallingHandlers()</code> and <code>options("error")</code>
specifications are ignored when handling a C stack overflow error
as attempting one of these would trigger a cascade of C stack
overflow errors.  (These changes resolve <a href="https://bugs.R-project.org/show_bug.cgi?id=16753">PR#16753</a>.)
</p>
</li>
<li><p> The spacing could be wrong when printing a complex array.
(Report and patch by Lukas Stadler.)
</p>
</li>
<li> <p><code>pretty(d, n, min.n, *)</code> for date-time objects <code>d</code>
works again in border cases with large <code>min.n</code>, returns a
<code>labels</code> attribute also for small-range dates and in such cases
its returned length is closer to the desired <code>n</code>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16761">PR#16761</a>)
Additionally, it finally does cover the range of <code>d</code>, as it
always claimed.
</p>
</li>
<li> <p><code>tsp(x) &lt;- NULL</code> did not handle correctly objects
inheriting from both <code>"ts"</code> and <code>"mts"</code>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16769">PR#16769</a>)
</p>
</li>
<li> <p><code>install.packages()</code> could give false errors when
<code>options("pkgType")</code> was <code>"binary"</code>.  (Reported by
Jose Claudio Faria.)
</p>
</li>
<li><p> A bug fix in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.0.2 fixed problems with <code>locator()</code>
in X11, but introduced problems in Windows.  Now both should be
fixed.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15700">PR#15700</a>)
</p>
</li>
<li> <p><code>download.file()</code> with <code>method = "wininet"</code>
incorrectly warned of download file length difference when
reported length was unknown. (<a href="https://bugs.R-project.org/show_bug.cgi?id=16805">PR#16805</a>)
</p>
</li>
<li> <p><code>diag(NULL, 1)</code> crashed because of missed type
checking.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16853">PR#16853</a>)
</p>
</li></ul>




<h3><img src="../help/figures/../../html/Rlogo.svg" class="toplogo" alt="[R logo]" /> CHANGES IN R 3.2.5</h3>



<h4>BUG FIXES</h4>


<ul>
<li> <p><code>format.POSIXlt()</code> behaved incorrectly in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.2.4.
E.g. the output of
<code>format(as.POSIXlt(paste0(1940:2000, "-01-01"), tz = "CET"),
	usetz = TRUE)</code> ended in two <code>"CEST"</code> time formats.
</p>
</li></ul>




<h3><img src="../help/figures/../../html/Rlogo.svg" class="toplogo" alt="[R logo]" /> CHANGES IN R 3.2.4</h3>



<h4>NEW FEATURES</h4>


<ul>
<li> <p><code>install.packages()</code> and related functions now give a
more informative warning when an attempt is made to install a base
package.
</p>
</li>
<li> <p><code>summary(x)</code> now prints with less rounding when
<code>x</code> contains infinite values. (Request of <a href="https://bugs.R-project.org/show_bug.cgi?id=16620">PR#16620</a>.)
</p>
</li>
<li> <p><code>provideDimnames()</code> gets an optional <code>unique</code> argument.
</p>
</li>
<li> <p><code>shQuote()</code> gains <code>type = "cmd2"</code> for quoting
in <code>cmd.exe</code> in Windows.  (Response to <a href="https://bugs.R-project.org/show_bug.cgi?id=16636">PR#16636</a>.)
</p>
</li>
<li><p> The <code>data.frame</code> method of <code>rbind()</code> gains an
optional argument <code>stringsAsFactors</code> (instead of only
depending on <code>getOption("stringsAsFactors")</code>).
</p>
</li>
<li> <p><code>smooth(x, *)</code> now also works for long vectors.
</p>
</li>
<li> <p><code>tools::texi2dvi()</code> has a workaround for problems with
the <code>texi2dvi</code> script supplied by <span class="pkg">texinfo 6.1</span>.
</p>
<p>It extracts more error messages from the LaTeX logs when in
emulation mode.
</p>
</li></ul>




<h4>UTILITIES</h4>


<ul>
<li> <p><code>R CMD check</code> will leave a log file
&lsquo;<span class="file">build_vignettes.log</span>&rsquo; from the re-building of vignettes in
the &lsquo;<span class="file">.Rcheck</span>&rsquo; directory if there is a problem, and always if
environment variable <span class="env">_R_CHECK_ALWAYS_LOG_VIGNETTE_OUTPUT_</span> is
set to a true value.
</p>
</li></ul>




<h4>DEPRECATED AND DEFUNCT</h4>


<ul>
<li><p> Use of <span class="samp">SUPPORT_OPENMP</span> from header &lsquo;<span class="file">Rconfig.h</span>&rsquo; is
deprecated in favour of the standard OpenMP define <span class="samp">_OPENMP</span>.
</p>
<p>(This has been the recommendation in the manual for a while now.)
</p>
</li>
<li><p> The <code>make</code> macro <code>AWK</code> which is long unused by
<span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> itself but recorded in file &lsquo;<span class="file">etc/Makeconf</span>&rsquo; is deprecated
and will be removed in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.3.0.
</p>
</li>
<li><p> The C header file &lsquo;<span class="file">S.h</span>&rsquo; is no longer documented: its
use should be replaced by &lsquo;<span class="file">R.h</span>&rsquo;.
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li> <p><code>kmeans(x, centers = &lt;1-row&gt;)</code> now works. (<a href="https://bugs.R-project.org/show_bug.cgi?id=16623">PR#16623</a>)
</p>
</li>
<li> <p><code>Vectorize()</code> now checks for clashes in argument names.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=16577">PR#16577</a>)
</p>
</li>
<li> <p><code>file.copy(overwrite = FALSE)</code> would signal a successful
copy when none had taken place.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16576">PR#16576</a>)
</p>
</li>
<li> <p><code>ngettext()</code> now uses the same default domain as
<code>gettext()</code>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14605">PR#14605</a>)
</p>
</li>
<li> <p><code>array(.., dimnames = *)</code> now warns about
non-<code>list</code> dimnames and, from <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.3.0, will signal the same
error for invalid dimnames as <code>matrix()</code> has always done.
</p>
</li>
<li> <p><code>addmargins()</code> now adds dimnames for the extended
margins in all cases, as always documented.
</p>
</li>
<li> <p><code>heatmap()</code> evaluated its <code>add.expr</code> argument
in the wrong environment.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16583">PR#16583</a>)
</p>
</li>
<li> <p><code>require()</code> etc now give the correct entry of
<code>lib.loc</code> in the warning about an old version of a package
masking a newer required one.
</p>
</li>
<li><p> The internal deparser did not add parentheses when
necessary,  e.g. before <code>[]</code> or <code>[[]]</code>.  (Reported by
Lukas Stadler; additional fixes included as well).
</p>
</li>
<li> <p><code>as.data.frame.vector(*, row.names=*)</code> no longer
produces &lsquo;corrupted&rsquo; data frames from row names of incorrect
length, but rather warns about them.  This will become an error.
</p>
</li>
<li> <p><code>url</code> connections with <code>method = "libcurl"</code> are
destroyed properly. (<a href="https://bugs.R-project.org/show_bug.cgi?id=16681">PR#16681</a>)
</p>
</li>
<li> <p><code>withCallingHandler()</code> now (again) handles warnings
even during S4 generic's argument evaluation.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16111">PR#16111</a>)
</p>
</li>
<li> <p><code>deparse(..., control = "quoteExpressions")</code>
incorrectly quoted empty expressions.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16686">PR#16686</a>)
</p>
</li>
<li> <p><code>format()</code>ting datetime objects (<code>"POSIX[cl]?t"</code>)
could segfault or recycle wrongly.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16685">PR#16685</a>)
</p>
</li>
<li> <p><code>plot.ts(&lt;matrix&gt;, las = 1)</code> now does use <code>las</code>.
</p>
</li>
<li> <p><code>saveRDS(*, compress = "gzip")</code> now works as
documented.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16653">PR#16653</a>)
</p>
</li>
<li><p> (Windows only) The <code>Rgui</code> front end did not
always initialize the console properly, and could cause
<span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> to crash.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16698">PR#16698</a>)
</p>
</li>
<li> <p><code>dummy.coef.lm()</code> now works in more cases, thanks to a
proposal by Werner Stahel (<a href="https://bugs.R-project.org/show_bug.cgi?id=16665">PR#16665</a>).  In addition, it now works
for multivariate linear models (<code>"mlm"</code>, <code>manova</code>)
thanks to a proposal by Daniel Wollschlaeger.
</p>
</li>
<li><p> The <code>as.hclust()</code> method for <code>"dendrogram"</code>s
failed often when there were ties in the heights.
</p>
</li>
<li> <p><code>reorder()</code> and <code>midcache.dendrogram()</code> now are
non-recursive and hence applicable to somewhat deeply nested
dendrograms, thanks to a proposal by Suharto Anggono in <a href="https://bugs.R-project.org/show_bug.cgi?id=16424">PR#16424</a>.
</p>
</li>
<li> <p><code>cor.test()</code> now calculates very small p values
more accurately (affecting the result only in extreme not
statistically relevant cases).  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16704">PR#16704</a>)
</p>
</li>
<li> <p><code>smooth(*, do.ends=TRUE)</code> did not always work correctly
in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> versions between 3.0.0 and 3.2.3.
</p>
</li>
<li> <p><code>pretty(D)</code> for date-time objects <code>D</code> now also
works well if <code>range(D)</code> is (much) smaller than a second.  In
the case of only one unique value in <code>D</code>, the pretty range
now is more symmetric around that value than previously.
<br />
Similarly, <code>pretty(dt)</code> no longer returns a length 5 vector
with duplicated entries for <code>Date</code> objects <code>dt</code> which
span only a few days.
</p>
</li>
<li><p> The figures in help pages such as <code>?points</code> were
accidentally damaged, and did not appear in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.2.3.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=16708">PR#16708</a>)
</p>
</li>
<li> <p><code>available.packages()</code> sometimes deleted the wrong
file when cleaning up temporary files.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16712">PR#16712</a>)
</p>
</li>
<li><p> The <code>X11()</code> device sometimes froze on Red Hat
Enterprise Linux 6. It now waits for <code>MapNotify</code> events
instead of <code>Expose</code> events, thanks to Siteshwar
Vashisht. (<a href="https://bugs.R-project.org/show_bug.cgi?id=16497">PR#16497</a>)
</p>
</li>
<li> <p><code>[dpqr]nbinom(*, size=Inf, mu=.)</code> now works as limit
case, for &lsquo;dpq&rsquo; as the Poisson.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16727">PR#16727</a>)<br />
<code>pnbinom()</code> no longer loops infinitely in border cases.
</p>
</li>
<li> <p><code>approxfun(*, method="constant")</code> and hence <code>ecdf()</code>
which calls the former now correctly &ldquo;predict&rdquo; <code>NaN</code>
values as <code>NaN</code>.
</p>
</li>
<li> <p><code>summary.data.frame()</code> now displays <code>NA</code>s in
<code>Date</code> columns in all cases.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16709">PR#16709</a>)
</p>
</li></ul>




<h3><img src="../help/figures/../../html/Rlogo.svg" class="toplogo" alt="[R logo]" /> CHANGES IN R 3.2.3</h3>



<h4>NEW FEATURES</h4>


<ul>
<li><p> Some recently-added Windows time zone names have been added
to the conversion table used to convert these to Olson names.
(Including those relating to changes for Russia in Oct 2014, as in
<a href="https://bugs.R-project.org/show_bug.cgi?id=16503">PR#16503</a>.)
</p>
</li>
<li><p> (Windows) Compatibility information has been added to the
manifests for &lsquo;<span class="file">Rgui.exe</span>&rsquo;, &lsquo;<span class="file">Rterm.exe</span>&rsquo; and
&lsquo;<span class="file">Rscript.exe</span>&rsquo;.  This should allow <code>win.version()</code> and
<code>Sys.info()</code> to report the actual Windows version up to
Windows 10.
</p>
</li>
<li><p> Windows <code>"wininet"</code> FTP first tries EPSV / PASV mode
rather than only using active mode (reported by Dan Tenenbaum).

</p>
</li>
<li> <p><code>which.min(x)</code> and <code>which.max(x)</code> may be much
faster for logical and integer <code>x</code> and now also work for long
vectors.
</p>
</li>
<li><p> The &lsquo;emulation&rsquo; part of <code>tools::texi2dvi()</code> has
been somewhat enhanced, including supporting <code>quiet = TRUE</code>.
It can be selected by <code>texi2dvi = "emulation"</code>.
</p>
<p>(Windows) MiKTeX removed its <code>texi2dvi.exe</code> command in Sept
2015: <code>tools::texi2dvi()</code> tries <code>texify.exe</code> if it is
not found.
</p>
</li>
<li><p> (Windows only) Shortcuts for printing and saving have
been added to menus in <code>Rgui.exe</code>.  (Request of <a href="https://bugs.R-project.org/show_bug.cgi?id=16572">PR#16572</a>.)
</p>
</li>
<li> <p><code>loess(..., iterTrace=TRUE)</code> now provides diagnostics
for robustness iterations, and the <code>print()</code> method for
<code>summary(&lt;loess&gt;)</code> shows slightly more.
</p>
</li>
<li><p> The included version of PCRE has been updated to 8.38, a
bug-fix release.
</p>
</li>
<li> <p><code>View()</code> now displays nested data frames in a more
friendly way.  (Request with patch in <a href="https://bugs.R-project.org/show_bug.cgi?id=15915">PR#15915</a>.)
</p>
</li></ul>




<h4>INSTALLATION and INCLUDED SOFTWARE</h4>


<ul>
<li><p> The included configuration code for <code>libintl</code> has been
updated to that from <code>gettext</code> version 0.19.5.1 &mdash; this
should only affect how an external library is detected (and the
only known instance is under OpenBSD).  (Wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=16464">PR#16464</a>.)
</p>
</li>
<li> <p><code>configure</code> has a new argument
<span class="option">--disable-java</span> to disable the checks for Java.
</p>
</li>
<li><p> The <code>configure</code> default for <code>MAIN_LDFLAGS</code> has
been changed for the FreeBSD, NetBSD and Hurd OSes to one more
likely to work with compilers other than <code>gcc</code> (FreeBSD 10
defaults to <code>clang</code>).
</p>
</li>
<li> <p><code>configure</code> now supports the OpenMP flags
<span class="option">-fopenmp=libomp</span> (clang) and <span class="option">-qopenmp</span> (Intel C).
</p>
</li>
<li><p> Various macros can be set to override the default
behaviour of <code>configure</code> when detecting OpenMP: see file
&lsquo;<span class="file">config.site</span>&rsquo;.
</p>
</li>
<li><p> Source installation on Windows has been modified to allow
for MiKTeX installations without <code>texi2dvi.exe</code>.  See file
&lsquo;<span class="file">MkRules.dist</span>&rsquo;.
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li> <p><code>regexpr(pat, x, perl = TRUE)</code> with Python-style named
capture did not work correctly when <code>x</code> contained <code>NA</code>
strings.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16484">PR#16484</a>)
</p>
</li>
<li><p> The description of dataset <code>ToothGrowth</code> has been
improved/corrected.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15953">PR#15953</a>)
</p>
</li>
<li> <p><code>model.tables(type = "means")</code> and hence
<code>TukeyHSD()</code> now support <code>"aov"</code> fits without an
intercept term.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16437">PR#16437</a>)
</p>
</li>
<li> <p><code>close()</code> now reports the status of a <code>pipe()</code>
connection opened with an explicit <code>open</code> argument.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=16481">PR#16481</a>)
</p>
</li>
<li><p> Coercing a list without names to a data frame is faster if
the elements are very long. (<a href="https://bugs.R-project.org/show_bug.cgi?id=16467">PR#16467</a>)
</p>
</li>
<li><p> (Unix-only) Under some rare circumstances piping the output
from <code>Rscript</code> or <code>R -f</code> could result in
attempting to close the input file twice, possibly crashing the
process.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16500">PR#16500</a>)
</p>
</li>
<li><p> (Windows) <code>Sys.info()</code> was out of step with
<code>win.version()</code> and did not report Windows 8.
</p>
</li>
<li> <p><code>topenv(baseenv())</code> returns <code>baseenv()</code> again as
in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.1.0 and earlier.  This also fixes <code>compilerJIT(3)</code>
when used in &lsquo;<span class="file">.Rprofile</span>&rsquo;.
</p>
</li>
<li> <p><code>detach()</code>ing the <span class="pkg">methods</span> package keeps
<code>.isMethodsDispatchOn()</code> true, as long as the methods
namespace is not unloaded.
</p>
</li>
<li><p> Removed some spurious warnings from <code>configure</code> about the
preprocessor not finding header files.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15989">PR#15989</a>)
</p>
</li>
<li> <p><code>rchisq(*, df=0, ncp=0)</code> now returns <code>0</code> instead
of <code>NaN</code>, and <code>dchisq(*, df=0, ncp=*)</code> also no longer
returns <code>NaN</code> in limit cases (where the limit is unique).
(<a href="https://bugs.R-project.org/show_bug.cgi?id=16521">PR#16521</a>)
</p>
</li>
<li> <p><code>pchisq(*, df=0, ncp &gt; 0, log.p=TRUE)</code> no longer
underflows (for ncp &gt; ~60).
</p>
</li>
<li> <p><code>nchar(x, "w")</code> returned -1 for characters it did not
know about (e.g. zero-width spaces): it now assumes 1.
It now knows about most zero-width characters and a few more
double-width characters.
</p>
</li>
<li><p> Help for <code>which.min()</code> is now more precise about
behavior with logical arguments.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16532">PR#16532</a>)
</p>
</li>
<li><p> The print width of character strings marked as
<code>"latin1"</code> or <code>"bytes"</code> was in some cases computed
incorrectly.
</p>
</li>
<li> <p><code>abbreviate()</code> did not give names to the return value
if <code>minlength</code> was zero, unlike when it was positive.
</p>
</li>
<li><p> (Windows only) <code>dir.create()</code> did not always warn
when it failed to create a directory.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16537">PR#16537</a>)
</p>
</li>
<li><p> When operating in a non-UTF-8 multibyte locale
(e.g. an East Asian locale on Windows), <code>grep()</code> and
related functions did not handle UTF-8 strings properly.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=16264">PR#16264</a>)
</p>
</li>
<li> <p><code>read.dcf()</code> sometimes misread lines longer than 8191
characters.  (Reported by Hervé Pagès with a patch.)
</p>
</li>
<li> <p><code>within(df, ..)</code> no longer drops columns whose name
start with a <code>"."</code>.
</p>
</li>
<li><p> The built-in <code>HTTP</code> server converted entire
<code>Content-Type</code> to lowercase including parameters which
can cause issues for multi-part form boundaries (<a href="https://bugs.R-project.org/show_bug.cgi?id=16541">PR#16541</a>).
</p>
</li>
<li><p> Modifying slots of S4 objects could fail when the
<span class="pkg">methods</span> package was not attached. (<a href="https://bugs.R-project.org/show_bug.cgi?id=16545">PR#16545</a>)
</p>
</li>
<li> <p><code>splineDesign(*, outer.ok=TRUE)</code> (<span class="pkg">splines</span>) is better now
(<a href="https://bugs.R-project.org/show_bug.cgi?id=16549">PR#16549</a>), and <code>interpSpline()</code> now allows <code>sparse=TRUE</code>
for speedup with non-small sizes.
</p>
</li>
<li><p> If the expression in the traceback was too long,
<code>traceback()</code> did not report the source line number.  (Patch
by Kirill Müller.)
</p>
</li>
<li><p> The browser did not truncate the display of the function when
exiting with <code>options("deparse.max.lines")</code> set.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=16581">PR#16581</a>)
</p>
</li>
<li><p> When <code>bs(*, Boundary.knots=)</code> had boundary knots inside
the data range, extrapolation was somewhat off.  (Patch by Trevor
Hastie.)
</p>
</li>
<li> <p><code>var()</code> and hence <code>sd()</code> warn about
<code>factor</code> arguments which are deprecated now. (<a href="https://bugs.R-project.org/show_bug.cgi?id=16564">PR#16564</a>)
</p>
</li>
<li> <p><code>loess(*, weights = *)</code> stored wrong weights and hence
gave slightly wrong predictions for <code>newdata</code>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16587">PR#16587</a>)
</p>
</li>
<li> <p><code>aperm(a, *)</code> now preserves <code>names(dim(a))</code>.
</p>
</li>
<li> <p><code>poly(x, ..)</code> now works when either <code>raw=TRUE</code> or
<code>coef</code> is specified.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16597">PR#16597</a>)
</p>
</li>
<li> <p><code>data(package=*)</code> is more careful in determining the path.
</p>
</li>
<li> <p><code>prettyNum(*, decimal.mark, big.mark)</code>: fixed bug
introduced when fixing <a href="https://bugs.R-project.org/show_bug.cgi?id=16411">PR#16411</a>.
</p>
</li></ul>




<h3><img src="../help/figures/../../html/Rlogo.svg" class="toplogo" alt="[R logo]" /> CHANGES IN R 3.2.2</h3>



<h4>SIGNIFICANT USER-VISIBLE CHANGES</h4>


<ul>
<li><p> It is now easier to use secure downloads from
<span class="samp">https://</span> URLs on builds which support them: no longer do
non-default options need to be selected to do so.  In particular,
packages can be installed from repositories which offer
<span class="samp">https://</span> URLs, and those listed by <code>setRepositories()</code>
now do so (for some of their mirrors).
</p>
<p>Support for <span class="samp">https://</span> URLs is available on Windows, and on
other platforms if support for <code>libcurl</code> was compiled in and
if that supports the <code>https</code> protocol (system installations
can be expected to do).  So <span class="samp">https://</span> support can be
expected except on rather old OSes (an example being OS X
&lsquo;Snow Leopard&rsquo;, where a non-system version of
<code>libcurl</code> can be used).
</p>
<p>(Windows only) The default method for accessing URLs <em>via</em>
<code>download.file()</code> and <code>url()</code> has been changed to be
<code>"wininet"</code> using Windows API calls.  This changes the way
proxies need to be set and security settings made: there have been
some reports of <span class="samp">ftp:</span> sites being inaccessible under the new default
method (but the previous methods remain available).
</p>
</li></ul>




<h4>NEW FEATURES</h4>


<ul>
<li> <p><code>cmdscale()</code> gets new option <code>list.</code> for increased
flexibility when a list should be returned.
</p>
</li>
<li> <p><code>configure</code> now supports <code>texinfo</code> version 6.0,
which (unlike the change from 4.x to 5.0) is a minor update.
(Wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=16456">PR#16456</a>.)
</p>
</li>
<li><p> (Non-Windows only) <code>download.file()</code> with default
<code>method = "auto"</code> now chooses <code>"libcurl"</code> if that is
available and a <span class="samp">https://</span> or <span class="samp">ftps://</span> URL is used.
</p>
</li>
<li><p> (Windows only) <code>setInternet2(TRUE)</code> is now the default.
The command-line option <code>--internet2</code> and environment
variable <span class="env">R_WIN_INTERNET2</span> are now ignored.
</p>
<p>Thus by default the <code>"internal"</code> method for
<code>download.file()</code> and <code>url()</code> uses the <code>"wininet"</code>
method: to revert to the previous default use
<code>setInternet2(FALSE)</code>.
</p>
<p>This means that <span class="samp">https://</span> URLs can be read by default by
<code>download.file()</code> (they have been readable by <code>file()</code>
and <code>url()</code> since <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.2.0).
</p>
<p>There are implications for how proxies need to be set (see
<code>?download.file</code>).
</p>
</li>
<li> <p><code>chooseCRANmirror()</code> and <code>chooseBioCmirror()</code> now
offer HTTPS mirrors in preference to HTTP mirrors.  This changes
the interpretation of their <code>ind</code> arguments: see their help
pages.
</p>
</li>
<li> <p><code>capture.output()</code> gets optional arguments <code>type</code>
and <code>split</code> to pass to <code>sink()</code>, and hence can be used to
capture messages.
</p>
</li></ul>




<h4>C-LEVEL FACILITIES</h4>


<ul>
<li><p> Header &lsquo;<span class="file">Rconfig.h</span>&rsquo; now defines <code>HAVE_ALLOCA_H</code> if
the platform has the &lsquo;<span class="file">alloca.h</span>&rsquo; header (it is needed to
define <code>alloca</code> on Solaris and AIX, at least: see
&lsquo;Writing R Extensions&rsquo; for how to use it).
</p>
</li></ul>




<h4>INSTALLATION and INCLUDED SOFTWARE</h4>


<ul>
<li><p> The <code>libtool</code> script generated by
<code>configure</code> has been modified to support FreeBSD &gt;= 10
(<a href="https://bugs.R-project.org/show_bug.cgi?id=16410">PR#16410</a>).
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li><p> The HTML help page links to demo code failed due to a change
in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.2.0.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16432">PR#16432</a>)
</p>
</li>
<li><p> If the <code>na.action</code> argument was used in
<code>model.frame()</code>, the original data could be
modified. (<a href="https://bugs.R-project.org/show_bug.cgi?id=16436">PR#16436</a>)
</p>
</li>
<li> <p><code>getGraphicsEvent()</code> could cause a crash if a graphics
window was closed while it was in use. (<a href="https://bugs.R-project.org/show_bug.cgi?id=16438">PR#16438</a>)
</p>
</li>
<li> <p><code>matrix(x, nr, nc, byrow = TRUE)</code> failed if <code>x</code>
was an object of type <code>"expression"</code>.
</p>
</li>
<li> <p><code>strptime()</code> could overflow the allocated storage on
the C stack when the timezone had a non-standard format much
longer than the standard formats. (Part of <a href="https://bugs.R-project.org/show_bug.cgi?id=16328">PR#16328</a>.)
</p>
</li>
<li> <p><code>options(OutDec = s)</code> now signals a warning (which will
become an error in the future) when <code>s</code> is not a string with
exactly one character, as that has been a documented requirement.
</p>
</li>
<li> <p><code>prettyNum()</code> gains a new option <code>input.d.mark</code>
which together with other changes, e.g., the default for
<code>decimal.mark</code>, fixes some <code>format()</code>ting variants with
non-default <code>getOption("OutDec")</code> such as in <a href="https://bugs.R-project.org/show_bug.cgi?id=16411">PR#16411</a>.
</p>
</li>
<li> <p><code>download.packages()</code> failed for <code>type</code> equal to
either <code>"both"</code> or <code>"binary"</code>.  (Reported by Dan
Tenenbaum.)
</p>
</li>
<li><p> The <code>dendrogram</code> method of <code>labels()</code> is much more
efficient for large dendrograms, now using <code>rapply()</code>.
(Comment #15 of <a href="https://bugs.R-project.org/show_bug.cgi?id=15215">PR#15215</a>)
</p>
</li>
<li><p> The <code>"port"</code> algorithm of <code>nls()</code> could give
spurious errors.  (Reported by Radford Neal.)
</p>
</li>
<li><p> Reference classes that inherited from reference classes in
another package could invalidate methods of the inherited
class. Fixing this requires adding the ability for methods to be
&ldquo;external&rdquo;, with the object supplied explicitly as the first
argument, named <code>.self</code>. See &quot;Inter-Package Superclasses&quot;
in the documentation.
</p>
</li>
<li> <p><code>readBin()</code> could fail on the SPARC architecture
due to alignment issues.  (Reported by Radford Neal.)
</p>
</li>
<li> <p><code>qt(*, df=Inf, ncp=.)</code> now uses the natural
<code>qnorm()</code> limit instead of returning <code>NaN</code>. (<a href="https://bugs.R-project.org/show_bug.cgi?id=16475">PR#16475</a>)
</p>
</li>
<li><p> Auto-printing of S3 and S4 values now searches for
<code>print()</code> in the base namespace and <code>show()</code> in the
<span class="pkg">methods</span> namespace instead of searching the global
environment.
</p>
</li>
<li> <p><code>polym()</code> gains a <code>coefs = NULL</code> argument and
returns class <code>"poly"</code> just like <code>poly()</code> which gets a
new <code>simple=FALSE</code> option.  They now lead to correct
<code>predict()</code>ions, e.g., on subsets of the original data.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=16239">PR#16239</a>)
</p>
</li>
<li> <p><code>rhyper(nn, &lt;large&gt;)</code> now works correctly. (<a href="https://bugs.R-project.org/show_bug.cgi?id=16489">PR#16489</a>)
</p>
</li>
<li> <p><code>ttkimage()</code> did not (and could not) work so was
removed. Ditto for <code>tkimage.cget()</code> and
<code>tkimage.configure()</code>. Added two Ttk widgets and missing
subcommands for Tk's <code>image</code> command:
<code>ttkscale()</code>,
<code>ttkspinbox()</code>,
<code>tkimage.delete()</code>,
<code>tkimage.height()</code>,
<code>tkimage.inuse()</code>,
<code>tkimage.type()</code>,
<code>tkimage.types()</code>,
<code>tkimage.width()</code>. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15372">PR#15372</a>, <a href="https://bugs.R-project.org/show_bug.cgi?id=16450">PR#16450</a>)
</p>
</li>
<li> <p><code>getClass("foo")</code> now also returns a class definition when it is
found in the cache more than once.
</p>
</li></ul>




<h3><img src="../help/figures/../../html/Rlogo.svg" class="toplogo" alt="[R logo]" /> CHANGES IN R 3.2.1</h3>



<h4>NEW FEATURES</h4>


<ul>
<li> <p><code>utf8ToInt()</code> now checks that its input is valid UTF-8
and returns <code>NA</code> if it is not.
</p>
</li>
<li> <p><code>install.packages()</code> now allows <code>type = "both"</code>
with <code>repos = NULL</code> if it can infer the type of file.
</p>
</li>
<li> <p><code>nchar(x, *)</code> and <code>nzchar(x)</code> gain a new argument
<code>keepNA</code> which governs how the result for <code>NA</code>s in
<code>x</code> is determined.  For <code>nzchar()</code> in general and
<code>nchar()</code> in the <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.2.x series, the default
remains <code>FALSE</code> which is fully back compatible.
From <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.3.0, <code>nchar()</code>'s default will change to
<code>keepNA = NA</code> and you are advised to consider this for code
portability.
</p>
</li>
<li> <p><code>news()</code> more flexibly extracts dates from package
&lsquo;<span class="file">NEWS.Rd</span>&rsquo; files.
</p>
</li>
<li> <p><code>lengths(x)</code> now also works (trivially) for atomic
<code>x</code> and hence can be used more generally as an efficient
replacement of <code>sapply(x, length)</code> and similar.
</p>
</li>
<li><p> The included version of PCRE has been updated to 8.37, a
bug-fix release.
</p>
</li>
<li> <p><code>diag()</code> no longer duplicates a matrix when extracting
its diagonal.
</p>
</li>
<li> <p><code>as.character.srcref()</code> gains an argument to allow
characters corresponding to a range of source references to be
extracted.
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li> <p><code>acf()</code> and <code>ccf()</code> now guarantee values strictly
in <i>[-1,1]</i> (instead of sometimes very slightly outside). <a href="https://bugs.R-project.org/show_bug.cgi?id=15832">PR#15832</a>.
</p>
</li>
<li> <p><code>as.integer("111111111111")</code> now gives NA (with a warning) as
it does for the corresponding numeric or negative number
coercions.  Further, <code>as.integer(M + 0.1)</code> now gives <code>M</code>
(instead of NA) when M is the maximal representable integer.
</p>
</li>
<li><p> On some platforms <code>nchar(x, "c")</code> and <code>nchar(x, "w")</code>
would return values (possibly <code>NA</code>) for inputs which were
declared to be UTF-8 but were not, or for invalid strings without a
marked encoding in a multi-byte locale, rather than give an
error.  Additional checks have been added to mitigate this.
</p>
</li>
<li> <p><code>apply(a, M, function(u) c(X = ., Y = .))</code> again
has dimnames containing &quot;X&quot; and &quot;Y&quot; (as in R &lt; 3.2.0).
</p>
</li>
<li><p> (Windows only) In some cases, the <code>--clean</code> option
to <code>R CMD INSTALL</code> could fail.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16178">PR#16178</a>)
</p>
</li>
<li><p> (Windows only) <code>choose.files()</code> would occasionally
include characters from the result of an earlier call in
the result of a later one.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16270">PR#16270</a>)
</p>
</li>
<li><p> A change in <code>RSiteSearch()</code> in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.2.0 caused it to
submit invalid URLs.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16329">PR#16329</a>)
</p>
</li>
<li> <p><code>Rscript</code> and command line <code>R</code> silently
ignored incomplete statements at the end of a script; now they
are reported as parse errors.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16350">PR#16350</a>)
</p>
</li>
<li><p> Parse data for very long strings was not stored.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16354">PR#16354</a>)
</p>
</li>
<li> <p><code>plotNode()</code>, the workhorse of the <code>plot</code> method
for <code>"dendrogram"</code>s is no longer recursive, thanks to Suharto
Anggono, and hence also works for deeply nested dendrograms.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15215">PR#15215</a>)
</p>
</li>
<li><p> The parser could overflow internally when given numbers
in scientific format with extremely large exponents.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16358">PR#16358</a>)
</p>
</li>
<li><p> If the CRAN mirror was not set, <code>install.packages(type = "both")</code>
and related functions could repeatedly query the user for it.
(Part of <a href="https://bugs.R-project.org/show_bug.cgi?id=16362">PR#16362</a>)
</p>
</li>
<li><p> The low-level functions <code>.rowSums()</code> etc. did not
check the length of their argument, so could segfault. (<a href="https://bugs.R-project.org/show_bug.cgi?id=16367">PR#16367</a>)
</p>
</li>
<li><p> The <code>quietly</code> argument of <code>library()</code> is now
correctly propagated from <code>.getRequiredPackages2()</code>.
</p>
</li>
<li><p> Under some circumstances using the internal PCRE when
building <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> from source would cause external libs such as
<code>-llzma</code> to be omitted from the main link.
</p>
</li>
<li><p> The .Primitive default methods of the logic operators, i.e.,
<code>!</code>, <code>&amp;</code> and <code>|</code>, now give correct error messages
when appropriate, e.g., for <code>`&amp;`(TRUE)</code> or <code>`!`()</code>.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=16385">PR#16385</a>)
</p>
</li>
<li> <p><code>cummax(x)</code> now correctly propagates <code>NA</code>s also
when <code>x</code> is of type <code>integer</code> and begins with an <code>NA</code>.
</p>
</li>
<li> <p><code>summaryRprof()</code> could fail when the profile contained
only two records.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16395">PR#16395</a>)
</p>
</li>
<li><p> HTML vignettes opened using <code>vignette()</code> did not support
links into the rest of the HTML help system.  (Links worked properly
when the vignette was opened using <code>browseVignettes()</code> or from
within the help system.)
</p>
</li>
<li> <p><code>arima(*, xreg = .)</code> (for <i>d &gt;= 1</i>)
computes estimated variances based on a the number of effective
observations as in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> version 3.0.1 and earlier.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16278">PR#16278</a>)
</p>
</li>
<li> <p><code>slotNames(.)</code> is now correct for <code>"signature"</code>
objects (mostly used internally in <span class="pkg">methods</span>).
</p>
</li>
<li><p> On some systems, the first string comparison after
a locale change would result in <code>NA</code>.
</p>
</li></ul>




<h3><img src="../help/figures/../../html/Rlogo.svg" class="toplogo" alt="[R logo]" /> CHANGES IN R 3.2.0</h3>



<h4>NEW FEATURES</h4>


<ul>
<li> <p><code>anyNA()</code> gains a <code>recursive</code> argument.
</p>
</li>
<li><p> When <code>x</code> is missing and <code>names</code> is not false
(including the default value), <code>Sys.getenv(x, names)</code> returns
an object of class <code>"Dlist"</code> and hence prints tidily.
</p>
</li>
<li><p> (Windows.)  <code>shell()</code> no longer consults the
environment variable <span class="env">SHELL</span>: too many systems have been
encountered where it was set incorrectly (usually to a path where
software was compiled, not where it was installed).
<span class="env">R_SHELL</span>, the preferred way to select a non-default shell,
can be used instead.
</p>
</li>
<li><p> Some unusual arguments to <code>embedFonts()</code> can now be
specified as character vectors, and the defaults have been changed
accordingly.
</p>
</li>
<li><p> Functions in the <code>Summary</code> group duplicate less.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=15798">PR#15798</a>)
</p>
</li>
<li><p> (Unix-alikes.) <code>system(cmd, input = )</code> now uses
&lsquo;shell-execution-environment&rsquo; redirection, which will be
more natural if <code>cmd</code> is not a single command (but requires a
POSIX-compliant shell). (Wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=15508">PR#15508</a>)
</p>
</li>
<li> <p><code>read.fwf()</code> and <code>read.DIF()</code> gain a
<code>fileEncoding</code> argument, for convenience.
</p>
</li>
<li><p> Graphics devices can add attributes to their description in
<code>.Device</code> and <code>.Devices</code>.  Several of those included with
<span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> use a <code>"filepath"</code> attribute.
</p>
</li>
<li> <p><code>pmatch()</code> uses hashing in more cases and so is faster
at the expense of using more memory. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15697">PR#15697</a>)
</p>
</li>
<li> <p><code>pairs()</code> gains new arguments to select sets of
variables to be plotted against each other.
</p>
</li>
<li> <p><code>file.info(, extra_cols = FALSE)</code> allows a minimal set
of columns to be computed on Unix-alikes: on some systems without
properly-configured caching this can be significantly faster with
large file lists.
</p>
</li>
<li><p> New function <code>dir.exists()</code> in package <span class="pkg">base</span> to
test efficiently whether one or more paths exist and are
directories.
</p>
</li>
<li> <p><code>dput()</code> and friends gain new controls
<span class="samp">hexNumeric</span> and <span class="samp">digits17</span> which output double and
complex quantities as, respectively, binary fractions (exactly,
see <code>sprintf("%a")</code>) and as decimals with up to 17
significant digits.
</p>
</li>
<li> <p><code>save()</code>, <code>saveRDS()</code> and <code>serialize()</code> now
support <code>ascii = NA</code> which writes ASCII files using
<code>sprintf("%a")</code> for double/complex quantities.  This is
read-compatible with <code>ascii = TRUE</code> but avoids
binary-&gt;decimal-&gt;binary conversions with potential loss of
precision.  Unfortunately the Windows C runtime's lack of C99
compliance means that the format cannot be read correctly there in
<span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> before 3.1.2.
</p>
</li>
<li><p> The default for <code>formatC(decimal.mark =)</code> has been
changed to be <code>getOption("OutDec")</code>; this makes it more
consistent with <code>format()</code> and suitable for use in print
methods, e.g. those for classes <code>"density"</code>, <code>"ecdf"</code>,
<code>"stepfun"</code> and <code>"summary.lm"</code>.
</p>
<p><code>getOption("OutDec")</code> is now consulted by the print method
for class <code>"kmeans"</code>, by <code>cut()</code>, <code>dendrogram()</code>,
<code>plot.ts()</code> and <code>quantile()</code> when constructing labels
and for the report from <code>legend(trace = TRUE)</code>.
</p>
<p>(In part, wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=15819">PR#15819</a>.)
</p>
</li>
<li> <p><code>printNum()</code> and hence <code>format()</code> and
<code>formatC()</code> give a warning if <code>big.mark</code> and
<code>decimal.mark</code> are set to the same value (period and comma
are not uncommonly used for each, and this is a check that
conventions have not got mixed).
</p>
</li>
<li> <p><code>merge()</code> can create a result which uses long vectors
on 64-bit platforms.
</p>
</li>
<li> <p><code>dget()</code> gains a new argument <code>keep.source</code> which
defaults to <code>FALSE</code> for speed (<code>dput()</code> and
<code>dget()</code> are most often used for data objects where this can
make <code>dget()</code> many times faster).
</p>
</li>
<li><p> Packages may now use a file of common macro definitions in
their help files, and may import definitions from other packages.
</p>
</li>
<li><p> A number of macros have been added in the new
&lsquo;<span class="file">share/Rd</span>&rsquo; directory for use in package overview help pages,
and <code>promptPackage()</code> now makes use of them.
</p>
</li>
<li> <p><code>tools::parse_Rd()</code> gains a new <code>permissive</code>
argument which converts unrecognized macros into text.  This is
used by <code>utils:::format.bibentry</code> to allow LaTeX markup to be
ignored.
</p>
</li>
<li> <p><code>options(OutDec =)</code> can now specify a multi-byte
character, e.g., <code>options(OutDec = "\u00b7")</code> in a UTF-8
locale.
</p>
</li>
<li> <p><code>is.recursive(x)</code> is no longer true when <code>x</code> is an
external pointer, a weak reference or byte code; the first enables
<code>all.equal(x, x)</code> when <code>x &lt;- getClass(.)</code>.
</p>
</li>
<li> <p><code>ls()</code> (aka <code>objects()</code>) and
<code>as.list.environment()</code> gain a new argument <code>sorted</code>.
</p>
</li>
<li><p> The <code>"source"</code> attribute (which has not been added to
functions by <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> since before <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> version 2.14.0) is no longer
treated as special.
</p>
</li>
<li><p> Function <code>returnValue()</code> has been added to give
<code>on.exit()</code> code access to a function's return value for
debugging purposes.
</p>
</li>
<li> <p><code>crossprod(x, y)</code> allows more matrix coercions when
<code>x</code> or <code>y</code> are vectors, now equalling
<code>t(x) %*% y</code> in these cases (also reported by Radford Neal).
Similarly, <code>tcrossprod(x,y)</code> and <code>%*%</code> work in more
cases with vector arguments.
</p>
</li>
<li><p> Utility function <code>dynGet()</code> useful for detecting
cycles, aka infinite recursions.
</p>
</li>
<li><p> The byte-code compiler and interpreter include new
instructions that allow many scalar subsetting and assignment and
scalar arithmetic operations to be handled more efficiently. This
can result in significant performance improvements in scalar
numerical code.
</p>
</li>
<li> <p><code>apply(m, 2, identity)</code> is now the same as the matrix
<code>m</code> when it has <em>named</em> row names.
</p>
</li>
<li><p> A new function <code>debuggingState()</code> has been added,
allowing to temporarily turn off debugging.
</p>
</li>
<li> <p><code>example()</code> gets a new optional argument
<code>run.donttest</code> and <code>tools::Rd2ex()</code> a corresponding
<code>commentDonttest</code>, with a default such that
<code>example(..)</code> in help examples will run <code>\donttest</code>
code only if used interactively (a change in behaviour).
</p>
</li>
<li> <p><code>rbind.data.frame()</code> gains an optional argument
<code>make.row.names</code>, for potential speedup.
</p>
</li>
<li><p> New function <code>extSoftVersion()</code> to report on the
versions of third-party software in use in this session.
Currently reports versions of <code>zlib</code>, <code>bzlib</code>, the
<code>liblzma</code> from <code>xz</code>, PCRE, ICU, TRE and the <code>iconv</code>
implementation.
</p>
<p>A similar function <code>grSoftVersion()</code> in package <span class="pkg">grDevices</span>
reports on third-party graphics software.
</p>
<p>Function <code>tcltk::tclVersion()</code> reports the Tcl/Tk version.
</p>
</li>
<li><p> Calling <code>callGeneric()</code> without arguments now works
with primitive generics to some extent.
</p>
</li>
<li> <p><code>vapply(x, FUN, FUN.VALUE)</code> is more efficient notably
for large <code>length(FUN.VALUE)</code>; as extension of <a href="https://bugs.R-project.org/show_bug.cgi?id=16061">PR#16061</a>.
</p>
</li>
<li> <p><code>as.table()</code> now allows tables with one or more
dimensions of length 0 (such as <code>as.table(integer())</code>).
</p>
</li>
<li> <p><code>names(x) &lt;- NULL</code> now clears the names of call
and <code>...</code> objects.
</p>
</li>
<li> <p><code>library()</code> will report a warning when an insufficient
dependency version is masking a sufficient one later on the
library search path.
</p>
</li>
<li><p> A new <code>plot()</code> method for class <code>"raster"</code> has
been added.
</p>
</li>
<li><p> New <code>check_packages_in_dir_changes()</code> function in
package <span class="pkg">tools</span> for conveniently analyzing how changing
sources impacts the check results of their reverse dependencies.
</p>
</li>
<li><p> Speed-up from Peter Haverty for <code>ls()</code> and
<code>methods:::.requirePackage()</code> speeding up package loading.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=16133">PR#16133</a>)
</p>
</li>
<li><p> New <code>get0()</code> function, combining <code>exists()</code> and
<code>get()</code> in one call, for efficiency.
</p>
</li>
<li> <p><code>match.call()</code> gains an <code>envir</code> argument for
specifying the environment from which to retrieve
the <code>...</code> in the call, if any; this environment was wrong
(or at least undesirable) when the <code>definition</code> argument was
a function.
</p>
</li>
<li> <p><code>topenv()</code> has been made <code>.Internal()</code> for
speedup, based on Peter Haverty's proposal in <a href="https://bugs.R-project.org/show_bug.cgi?id=16140">PR#16140</a>.
</p>
</li>
<li> <p><code>getOption()</code> no longer calls <code>options()</code> in the main
case.
</p>
</li>
<li><p> Optional use of <code>libcurl</code> (version 7.28.0 from Oct 2012
or later) for Internet access:
</p>

<ul>
<li> <p><code>capabilities("libcurl")</code> reports if this is
available.
</p>
</li>
<li> <p><code>libcurlVersion()</code> reports the version in use, and
other details of the <code>"libcurl"</code> build including which URL
schemes it supports.
</p>
</li>
<li> <p><code>curlGetHeaders()</code> retrieves the headers for
<span class="samp">http://</span>, <span class="samp">https://</span>, <span class="samp">ftp://</span> and
<span class="samp">ftps://</span> URLs: analysis of these headers can provide
insights into the &lsquo;existence&rsquo; of a URL (it might for example be
permanently redirected) and is so used in <code>R CMD
	  check --as-cran</code>.
</p>
</li>
<li> <p><code>download.file()</code> has a new optional method
<code>"libcurl"</code> which will handle more URL schemes, follow
redirections, and allows simultaneous downloads of multiple
URLs.
</p>
</li>
<li> <p><code>url()</code> has a new method <code>"libcurl"</code> which
handles more URL schemes and follows redirections.  The default
method is controlled by a new option <code>url.method</code>, which
applies also to the opening of URLs <em>via</em> <code>file()</code>
(which happens implicitly in functions such as
<code>read.table</code>.)
</p>
</li>
<li><p> When <code>file()</code> or <code>url()</code> is invoked with a
<code>https://</code> or <code>ftps://</code> URL which the current method
cannot handle, it switches to a suitable method if one is
available.
</p>
</li></ul>

</li>
<li><p> (Windows.) The DLLs &lsquo;<span class="file">internet.dll</span>&rsquo; and
&lsquo;<span class="file">internet2.dll</span>&rsquo; have been merged.  In this version it is safe
to switch (repeatedly) between the internal and Windows internet
functions within an <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> session.
</p>
<p>The Windows internet functions are still selected by flag
<span class="option">--internet2</span> or <code>setInternet2()</code>.  This can be
overridden for an <code>url()</code> connection <em>via</em> its new
<code>method</code> argument.
</p>
<p><code>download.file()</code> has new method <code>"wininet"</code>, selected
as the default by <span class="option">--internet2</span> or <code>setInternet2()</code>.
</p>
</li>
<li> <p><code>parent.env&lt;-</code> can no longer modify the parent of a
locked namespace or namespace imports environment.  Contributed by
Karl Millar.
</p>
</li>
<li><p> New function <code>isNamespaceLoaded()</code> for readability and speed.
</p>
</li>
<li> <p><code>names(env)</code> now returns all the object names of an
<code>environment</code> <code>env</code>, equivalently to
<code>ls(env, all.names = TRUE, sorted = FALSE)</code> and also to
the names of the corresponding list,
<code>names(as.list(env, all.names = TRUE))</code>.
Note that although <code>names()</code> returns a character vector, the
names have no particular ordering.
</p>
</li>
<li><p> The memory manager now grows the heap more aggressively. This
reduces the number of garbage collections, in particular while
data or code are loaded, at the expense of slightly increasing the
memory footprint.
</p>
</li>
<li><p> New function <code>trimws()</code> for removing leading/trailing
whitespace.
</p>
</li>
<li> <p><code>cbind()</code> and <code>rbind()</code> now consider S4 inheritance
during S3 dispatch and also obey <code>deparse.level</code>.
</p>
</li>
<li> <p><code>cbind()</code> and <code>rbind()</code> will delegate recursively
to <code>methods::cbind2</code> (<code>methods::rbind2</code>) when at least
one argument is an S4 object and S3 dispatch fails (due to
ambiguity).
</p>
</li>
<li><p> (Windows.)  <code>download.file(quiet = FALSE)</code> now uses
text rather than Windows progress bars in non-interactive use.
</p>
</li>
<li><p> New function <code>hsearch_db()</code> in package <span class="pkg">utils</span> for
building and retrieving the help search database used by
<code>help.search()</code>, along with functions for inspecting the
concepts and keywords in the help search database.
</p>
</li>
<li><p> New function <code>.getNamespaceInfo()</code>, a no-check version
of <code>getNamespaceInfo()</code> mostly for internal speedups.
</p>
</li>
<li><p> The help search system now takes <span class="samp">\keyword</span> entries in
Rd files which are not standard keywords (as given in
&lsquo;<span class="file">KEYWORDS</span>&rsquo; in the <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> documentation directory) as concepts.
For standard keyword entries the corresponding descriptions are
additionally taken as concepts.
</p>
</li>
<li><p> New <code>lengths()</code> function for getting the lengths of all
elements in a list.
</p>
</li>
<li><p> New function <code>toTitleCase()</code> in package <span class="pkg">tools</span>,
tailored to package titles.
</p>
</li>
<li><p> The matrix methods of <code>cbind()</code> and <code>rbind()</code>
allow matrices as inputs which have <i>2^31</i> or more
elements.  (For <code>cbind()</code>, wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=16198">PR#16198</a>.)
</p>
</li>
<li><p> The default method of <code>image()</code> has an explicit check
for a numeric or logical matrix (which was always required).
</p>
</li>
<li> <p><code>URLencode()</code> will not by default encode further URLs
which appear to be already encoded.
</p>
</li>
<li> <p><code>BIC(mod)</code> and <code>BIC(mod, mod2)</code> now give non-NA
numbers for <code>arima()</code> fitted models, as <code>nobs(mod)</code> now
gives the number of &ldquo;used&rdquo; observations for such models.
This fixes <a href="https://bugs.R-project.org/show_bug.cgi?id=16198">PR#16198</a>, quite differently than proposed there.
</p>
</li>
<li><p> The <code>print()</code> methods for <code>"htest"</code>,
<code>"pairwise.htest"</code> and <code>"power.htest"</code> objects now have
a <code>digits</code> argument defaulting to (a function of)
<code>getOption("digits")</code>, and influencing all printed numbers
coherently.  Unavoidably, this changes the display of such test
results in some cases.
</p>
</li>
<li><p> Code completion for namespaces now recognizes all loaded
namespaces, rather than only the ones that are also attached.
</p>
</li>
<li><p> The code completion mechanism can now be replaced by a
user-specified completer function, for (temporary) situations
where the usual code completion is inappropriate.
</p>
</li>
<li> <p><code>unzip()</code> will now warn if it is able to detect truncation
when unpacking a file of 4GB or more (related to <a href="https://bugs.R-project.org/show_bug.cgi?id=16243">PR#16243</a>).
</p>
</li>
<li> <p><code>methods()</code> reports S4 in addition to S3 methods;
output is simplified when the <code>class</code> argument is
used.  <code>.S3methods()</code> and <code>methods::.S4methods()</code> report
S3 and S4 methods separately.
</p>
</li>
<li><p> Higher order functions such as the <code>apply</code> functions
and <code>Reduce()</code> now force arguments to the functions they apply
in order to eliminate undesirable interactions between lazy
evaluation and variable capture in closures.  This resolves
<a href="https://bugs.R-project.org/show_bug.cgi?id=16093">PR#16093</a>.
</p>
</li></ul>




<h4>INSTALLATION and INCLUDED SOFTWARE</h4>


<ul>
<li><p> The <code>\donttest</code> sections of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>'s help files can be
tested by<br />
<code>make check TEST_DONTTEST=TRUE</code> .
</p>
</li>
<li><p> It is possible to request the use of system
<code>valgrind</code> headers <em>via</em> <code>configure</code> option
<span class="option">--with-system-valgrind-headers</span>: note the possible future
incompatibility of such headers discussed in the 'R Installation
and Administration' manual. (Wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=16068">PR#16068</a>.)
</p>
</li>
<li><p> The included version of <code>liblzma</code> has been updated to
<code>xz-utils</code> 5.0.7 (minor bug fixes from 5.0.5).
</p>
</li>
<li> <p><code>configure</code> options <span class="option">--with-system-zlib</span>,
<span class="option">--with-system-bzlib</span> and <span class="option">--with-system-pcre</span> are
now the default.  For the time being there is fallback to the
versions included in the <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> sources if no system versions are
found or (unlikely) if they are too old.
</p>
<p>Linux users should check that the <code>-devel</code> or <code>-dev</code>
versions of packages <span class="pkg">zlib</span>, <span class="pkg">bzip2</span>/<span class="pkg">libbz2</span> and
<span class="pkg">pcre</span> as well as <span class="pkg">xz-devel</span>/<span class="pkg">liblzma-dev</span> (or
similar names) are installed.
</p>
</li>
<li> <p><code>configure</code> by default looks for the
<code>texi2any</code> script from <span class="pkg">texinfo</span> 5.1 or later, rather
than the <code>makeinfo</code> program.  (<code>makeinfo</code> is a
link to the Perl script <code>texi2any</code> in <span class="pkg">texinfo</span> 5.x.)
</p>
</li>
<li> <p><code>R CMD INSTALL</code> gains an  option
<span class="option">--built-timestamp=STAMP</span> allowing 100% reproducible
package building, thanks to Dirk Eddelbuettel.
</p>
</li></ul>




<h4>UTILITIES</h4>


<ul>
<li><p> There is support for testing the <code>\dontrun</code> and
<code>\donttest</code> parts of examples in packages.
</p>
<p><code>tools::testInstalledPackage()</code> accepts new arguments
<code>commentDontrun = FALSE</code> and <code>commentDonttest = FALSE</code>.
</p>
<p><code>R CMD check</code> gains options <span class="option">--run-dontrun</span> and
<span class="option">--run-donttest</span>.
</p>
</li>
<li><p> The <acronym><span class="acronym">HTML</span></acronym> generated by <code>tools::Rd2HTML()</code> and
<code>tools::toHTML()</code> methods is now
&lsquo;<acronym><span class="acronym">XHTML</span></acronym> 1.0 Strict&rsquo;.
</p>
</li>
<li><p> The <span class="pkg">compiler</span> package's utility function
<code>setCompilerOptions()</code> now returns the old values
invisibly. The initial optimization level can also be set with the
environment variable <span class="env">R_COMPILER_OPTIMIZE</span>.
</p>
</li>
<li> <p><code>R CMD build</code> adds a <span class="samp">NeedsCompilation</span> field
if one is not already present in the &lsquo;<span class="file">DESCRIPTION</span>&rsquo; file.
</p>
</li>
<li> <p><code>R CMD check</code> gains option <span class="option">--test-dir</span> to
specify an alternative set of tests to run.
</p>
</li>
<li> <p><code>R CMD check</code> will now by default continue with
testing after many types of errors, and will output a summary
count of errors at the end if any have occurred.
</p>
</li>
<li> <p><code>R CMD check</code> now checks that the <span class="samp">Title</span> and
<span class="samp">Description</span> fields are correctly terminated.
</p>
</li>
<li> <p><code>R CMD check --as-cran</code> now:
</p>

<ul>
<li><p> checks a &lsquo;<span class="file">README.md</span>&rsquo; file can be processed: this
needs <code>pandoc</code> installed.
</p>
</li>
<li><p> checks the existence and accessibility of URLs in the
&lsquo;<span class="file">DESCRIPTION</span>&rsquo;, &lsquo;<span class="file">CITATION</span>&rsquo;, &lsquo;<span class="file">NEWS.Rd</span>&rsquo; and
&lsquo;<span class="file">README.md</span>&rsquo; files and in the help files (provided the build
has <code>libcurl</code> support).
</p>
</li>
<li><p> reports non-ASCII characters in R source files when there
is no package encoding declared in the &lsquo;<span class="file">DESCRIPTION</span>&rsquo; file.
</p>
</li>
<li><p> reports (apparent) S3 methods exported but not registered.
</p>
</li>
<li><p> reports overwriting registered S3 methods from
base/recommended packages.  (Such methods are replaced in the
affected package for the rest of the session, even if the
replacing namespace is unloaded.)
</p>
</li>
<li><p> reports if the <code>Title</code> field does not appear to be in
title case (see &lsquo;Writing R Extensions&rsquo;: there may be
false positives, but note that technical words should be
single-quoted and will then be accepted).
</p>
</li></ul>

<p>Most of these checks can also be selected by environment
variables: see the &lsquo;R Internals&rsquo; manual.
</p>
</li></ul>




<h4>C-LEVEL FACILITIES</h4>


<ul>
<li><p> New C API utility <code>logspace_sum(logx[], n)</code>.
</p>
</li>
<li><p> Entry points <code>rbinom_mu</code>, <code>rnbinom_mu</code> and
<code>rmultinom</code> are remapped (by default) to <code>Rf_rbinom_mu</code>
etc.  This requires packages using them to be re-installed.
</p>
</li>
<li> <p><code>.C(DUP = FALSE)</code> and <code>.Fortran(DUP = FALSE)</code> are
now ignored, so arguments are duplicated if <code>DUP = TRUE</code>
would do so.  As their help has long said, <code>.Call()</code> is much
preferred.
</p>
</li>
<li><p> New entry point <code>R_allocLD</code>, like <code>R_alloc</code> but
guaranteed to have sufficient alignment for <code>long double</code>
pointers.
</p>
</li>
<li> <p><code>isPairList()</code> now returns <code>TRUE</code> for DOTSXP.
</p>
</li></ul>




<h4>WINDOWS BUILD CHANGES</h4>

<p>A number of changes to the Windows build system are in development.
The following are currently in place.
</p>

<ul>
<li><p> Installation using external binary distributions
of <span class="pkg">zlib</span>, <span class="pkg">bzip2</span>, <span class="pkg">liblzma</span>, <span class="pkg">pcre</span>,
<span class="pkg">libpng</span>, <span class="pkg">jpeglib</span> and <span class="pkg">libtiff</span> is now required,
and the build instructions have been revised.
</p>
</li>
<li><p> A new <code>make</code> target <code>rsync-extsoft</code> has been
added to obtain copies of the external libraries from
<acronym><span class="acronym">CRAN</span></acronym>.
</p>
</li>
<li><p> Building the manuals now requires <code>texi2any</code> from
<span class="pkg">texinfo</span> 5.1 or later.  <acronym><span class="acronym">CRAN</span></acronym> binary builds include
the manuals, but by default builds from source will not, and they
will be accessed from <acronym><span class="acronym">CRAN</span></acronym>.  See the comments in
&lsquo;<span class="file">src/gnuwin32/MkRules.dist</span>&rsquo; for how to specify the location
of <code>texi2any</code>.
</p>
</li>
<li><p> (Windows) Changes have been made to support an experimental
Windows toolchain based on GCC 4.9.2.  The default toolchain
continues to be based on GCC 4.6.3, as the new toolchain is not
yet stable enough.  A change to a new toolchain is expected during
the R 3.2.x lifetime.
</p>
</li></ul>




<h4>PACKAGE INSTALLATION</h4>


<ul>
<li><p>  (Windows) The use of macro <code>ZLIB_LIBS</code> in file
&lsquo;<span class="file">src/Makevars.win</span>&rsquo; (which has not been documented for a long
time) now requires an external &lsquo;<span class="file">libz.a</span>&rsquo; to be available (it is
part of the &lsquo;goodies&rsquo; used to compile Windows binary
packages).  It would be simpler to use <code>-lz</code> instead.
</p>
</li>
<li><p> The default for option <code>pkgType</code> on platforms using
binary packages is now <code>"both"</code>, so source packages will be
tried if binary versions are not available or not up to date.
</p>
<p>There are options for what <code>install.packages(type = "both")</code>
(possibly called <em>via</em> <code>update.packages()</code>) will do if
compilation of a source package is desirable: see <code>?options</code>
(under <span class="pkg">utils</span>).
</p>
<p>If you intend not to accept updates as source packages, you should
use <code>update.packages(type = "binary")</code>.
</p>
</li></ul>




<h4>DEPRECATED AND DEFUNCT</h4>


<ul>
<li> <p><code>download.file(method = "lynx")</code> is defunct.
</p>
</li>
<li><p> Building <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> using the included versions of <code>zlib</code>,
<code>bzip2</code>, <code>xz</code> and PCRE is deprecated: these are frozen
(bar essential bug-fixes) and will be removed for <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.3.0.
</p>
</li>
<li><p> The <code>configure</code> option
<span class="option">--with-valgrind-instrumentation=3</span> has been withdrawn, as
it did not work with recent <code>valgrind</code> headers: it is now
treated as level <code>2</code>.
</p>
</li>
<li><p> The <code>MethodsList</code> class in package <span class="pkg">methods</span> had
been deprecated in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.11.0 and is defunct now.  Functions using
it are defunct if they had been deprecated in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.11.0, and are
deprecated now, otherwise.
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li><p> Fixed two obscure bugs in pairlist subassignment, reported by
Radford Neal as part of pqR issue 16.
</p>
</li>
<li><p> Fixes for bugs in handling empty arguments and argument
matching by name in <code>log()</code>.
</p>
</li>
<li> <p><code>all.equal()</code> gains methods for <code>environment</code>s and
<code>refClass</code>es.
</p>
</li>
<li> <p><code>[&lt;-</code> and <code>[[&lt;-</code> gain S4 <code>data.frame</code> methods
to avoid corruption of S4 class information by the S3 methods.
</p>
</li>
<li> <p><code>callNextMethod()</code> should now work within a <code>.local</code>
call when <code>...</code> is absent from <code>formals(.local)</code>.
</p>
</li>
<li> <p><code>dput(pairlist(x))</code> generates a call to the
<code>pairlist</code> constructor instead of the <code>list</code>
constructor.
</p>
</li>
<li><p> Fix <code>missing()</code> when arguments are propagated through
<code>...</code> . (<a href="https://bugs.R-project.org/show_bug.cgi?id=15707">PR#15707</a>)
</p>
</li>
<li> <p><code>eigen(m)</code> now defaults to <code>symmetric = TRUE</code> even
when the dimnames are asymmetric if the matrix is otherwise
symmetric.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16151">PR#16151</a>)
</p>
</li>
<li><p> Fix issues with forwarding <code>...</code> through
<code>callGeneric()</code> and <code>callNextMethod()</code>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16141">PR#16141</a>)
</p>
</li>
<li> <p><code>callGeneric()</code> now works after a <code>callNextMethod()</code>.
</p>
</li>
<li><p> Subclass information is kept consistent when replacing an
ordinary S4 class with an &ldquo;old class&rdquo; <em>via</em> the
<code>S4Class</code> argument to <code>setOldClass()</code>. Thus, for
example, a <code>data.frame</code> is valid for a <code>list</code> argument
in the signature, and a <code>factor</code> is valid for <code>vector</code>
arguments.
</p>
</li>
<li><p> In <code>qbeta()</code> the inversion of <code>pbeta()</code> is much
more sophisticated.  This works better in corner cases some of
which failed completely previously (<a href="https://bugs.R-project.org/show_bug.cgi?id=15755">PR#15755</a>), or were using
too many iterations.
</p>
</li>
<li><p> Auto-printing no longer duplicates objects when printing is
dispatched to a method.
</p>
</li>
<li> <p><code>kmeans(x, k)</code> would fail when <code>nrow(x) &gt;= 42949673</code>.
(Comment 6 of <a href="https://bugs.R-project.org/show_bug.cgi?id=15364">PR#15364</a>)
</p>
</li>
<li> <p>&lsquo;Abbreviated&rsquo; locale-specific day and month names
could have been truncated in those rare locales where there are
the same as the full names.
</p>
</li>
<li><p> An irrelevant warning message from updating subclass
information was silenced (the namespace would not be writable
in this case).
</p>
</li></ul>




<h3><img src="../help/figures/../../html/Rlogo.svg" class="toplogo" alt="[R logo]" /> CHANGES IN R 3.1.3</h3>



<h4>NEW FEATURES</h4>


<ul>
<li><p> The internal method of <code>download.file()</code> can now handle
files larger than 2GB on 32-bit builds which support such files
(tested on 32-bit <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> running on 64-bit Windows).
</p>
</li>
<li> <p><code>kruskal.test()</code> warns on more types of suspicious input.
</p>
</li>
<li><p> The <code>as.dendrogram()</code> method for <code>"hclust"</code>
objects gains a <code>check</code> argument protecting against memory
explosion for invalid inputs.
</p>
</li>
<li> <p><code>capabilities()</code> has a new item <code>long.double</code>
which indicates if the build uses a <code>long double</code> type which
is longer than <code>double</code>.
</p>
</li>
<li> <p><code>nlm()</code> no longer modifies the callback argument in
place (a new vector is allocated for each invocation, which mimics
the implicit duplication that occurred in R &lt; 3.1.0); note that
this is a change from the previously documented
behavior. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15958">PR#15958</a>)
</p>
</li>
<li> <p><code>icuSetCollate()</code> now accepts <code>locale = "ASCII"</code>
which uses the basic C function <code>strcmp</code> and so collates
strings byte-by-byte in numerical order.
</p>
</li>
<li> <p><code>sessionInfo()</code> tries to report the OS version in use
(not just that compiled under, and including details of Linux
distributions).
</p>
</li>
<li> <p><code>model.frame()</code> (used by <code>lm()</code> and many other
modelling functions) now warns when it drops contrasts
from factors.  (Wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=16119">PR#16119</a>)
</p>
</li>
<li> <p><code>install.packages()</code> and friends now accept the value
<code>type = "binary"</code> as a synonym for the native binary type on
the platform (if it has one).
</p>
</li>
<li><p> Single source or binary files can be supplied for
<code>install.packages(type = "both")</code> and the appropriate type
and <code>repos = NULL</code> will be inferred.
</p>
</li>
<li><p> New function <code>pcre_config()</code> to report on some of the
configuration options of the version of PCRE in use.  In
particular, this reports if regular expressions using
<span class="samp">\p{xx}</span> are supported.
</p>
</li>
<li><p> (Windows.) <code>download.file(cacheOK = FALSE)</code> is now
supported when &lsquo;<span class="file">internet2.dll</span>&rsquo; is used.
</p>
</li>
<li> <p><code>browseURL()</code> has been updated to work with Firefox
36.0 which has dropped support for the <span class="option">-remote</span> interface.
</p>
</li></ul>




<h4>INSTALLATION and INCLUDED SOFTWARE</h4>


<ul>
<li><p> The included version of PCRE has been updated to 8.36.
</p>
</li>
<li> <p><code>configure</code> accepts <span class="samp">MAKEINFO=texi2any</span> as
another way to ensure <span class="pkg">texinfo</span> 5.x is used when both 5.x and
4.x are installed.
</p>
</li></ul>




<h4>UTILITIES</h4>


<ul>
<li> <p><code>R CMD check</code> now checks the packages used in
<code>\donttest</code> sections of the examples are specified in the
&lsquo;<span class="file">DESCRIPTION</span>&rsquo; file.
(These are needed to run the examples interactively.)
</p>
</li>
<li> <p><code>R CMD check</code> checks for the undeclared use of GNU
extensions in Makefiles, and for Makefiles with a missing final
linefeed.
</p>
<p><code>R CMD build</code> will correct line endings in all Makefiles,
not just those in the &lsquo;<span class="file">src</span>&rsquo; directory.
</p>
</li>
<li> <p><code>R CMD check</code> notes uses of <code>library()</code> and
<code>require()</code> in package code: see the section
&lsquo;Suggested packages&rsquo; of &lsquo;Writing R Extensions&rsquo; for
good practice.
</p>
</li></ul>




<h4>DEPRECATED AND DEFUNCT</h4>


<ul>
<li><p> The <code>configure</code> option
<span class="option">--with-valgrind-instrumentation=3</span> is deprecated and will
be removed in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.2.0.
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li><p> (Windows.) <code>Rscript.exe</code> was missing a
manifest specifying the modern style for common controls (e.g.,
the download progress bar).
</p>
</li>
<li><p> If a package had extra documentation files but no vignette,
the HTML help system produced an empty index page.
</p>
</li>
<li><p> The parser now gives an error if a null character is included
in a string using Unicode escapes. (<a href="https://bugs.R-project.org/show_bug.cgi?id=16046">PR#16046</a>)
</p>
</li>
<li> <p><code>qr.Q()</code> failed on complex arguments due to
pre-3.0(!) typo. (<a href="https://bugs.R-project.org/show_bug.cgi?id=16054">PR#16054</a>)
</p>
</li>
<li> <p><code>abs()</code> failed with named arguments when the argument
was complex.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16047">PR#16047</a>)
</p>
</li>
<li> <p><code>"noquote"</code> objects may now be used as columns in
data frames.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15997">PR#15997</a>)
</p>
</li>
<li><p> Some values with extremely long names were printed
incorrectly.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15999">PR#15999</a>)
</p>
</li>
<li><p> Extremely large exponents on zero expressed in scientific
notation (e.g. <code>0.0e50000</code>) could give <code>NaN</code>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15976">PR#15976</a>)
</p>
</li>
<li> <p><code>download.file()</code> reported downloaded sizes as 0KB if
less than 1MB, only for <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.1.2 and only on big-endian platforms.
</p>
</li>
<li> <p><code>prompt()</code> did not escape percent signs in the
automatically generated usage section of help files.
</p>
</li>
<li> <p><code>drop.terms()</code> dropped some of the attributes of the
object it was working with.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16029">PR#16029</a>)
</p>
</li>
<li><p> (Windows.) The command completion in <code>Rgui.exe</code>
messed up the console.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15791">PR#15791</a>)
</p>
</li>
<li><p> (Windows.) The <code>choose.files()</code> command returned a
blank string when the user asked for a single file but cancelled
the request.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16074">PR#16074</a>)
</p>
</li>
<li> <p><code>Math2</code> S4 group generics failed to correctly dispatch
<code>"structure"</code>- and <code>"nonStructure"</code>-derived classes.
</p>
</li>
<li> <p><code>loadNamespace()</code> imposed undocumented restrictions
on the <code>versionCheck</code> parameter.  (Reported by Geoff Lee.)
</p>
</li>
<li><p> Rare over-runs detected by AddressSanitizer in
<code>substr()</code> and its replacement version have been avoided.
</p>
<p><em>Inter alia</em> that fix gives the documented behaviour for
<code>substr(x, 1, 2) &lt;- ""</code> (subsequently reported as
<a href="https://bugs.R-project.org/show_bug.cgi?id=16214">PR#16214</a>).
</p>
</li>
<li><p> Loading packages incorrectly defining an S4 generic followed
by a function of the same name caused an erroneous cyclic
namespace dependency error.
</p>
</li>
<li><p> Declared vignette encodings are now always passed to the
vignette engine.
</p>
</li>
<li><p> Port Tomas Kalibera's fix from R-devel that restores the
<code>loadMethod()</code> fast path, effectively doubling the speed of
S4 dispatch.
</p>
</li>
<li> <p><code>power.t.test()</code> and <code>power.prop.test()</code> now make
use of the <code>extendInt</code> option of <code>uniroot()</code> and hence
work in more extreme cases.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15792">PR#15792</a>)
</p>
</li>
<li><p> If a package was updated and attached when its namespace was
already loaded, it could end up with parts from one version and
parts from the other.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16120">PR#16120</a>)
</p>
</li>
<li> <p><code>tools:::.Rdconv()</code> didn't accept <code>--encoding=</code> due
to a typo.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16121">PR#16121</a>)
</p>
</li>
<li><p> Unix-alike builds without a suitable <code>makeinfo</code> were
documented to link the missing HTML manuals to CRAN, but did not.
</p>
</li>
<li> <p><code>save(*, ascii=TRUE)</code> and <code>load()</code> now correctly
deal with <code>NaN</code>'s.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16137">PR#16137</a>)
</p>
</li>
<li> <p><code>split.Date()</code> retains fractional representations while
avoiding incomplete class propagation.
</p>
</li>
<li> <p>&lsquo;<span class="file">R_ext/Lapack.h</span>&rsquo; had not been updated for changes made
by LAPACK to the argument lists of its (largely internal)
functions <code>dlaed2</code> and <code>dlaed3</code>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16157">PR#16157</a>)
</p>
</li>
<li> <p><code>RShowDoc("NEWS", "txt")</code> had not been updated for the
layout changes of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.1.0.
</p>
</li>
<li><p> The <code>xtfrm()</code> method for class <code>"Surv"</code> has been
corrected and its description expanded.
</p>
</li>
<li> <p><code>mode(x) &lt;- y</code> would incorrectly evaluate <code>x</code> before
changing its mode. (<a href="https://bugs.R-project.org/show_bug.cgi?id=16215">PR#16215</a>)
</p>
</li>
<li> <p><code>besselJ(1, 2^64)</code> and <code>besselY(..)</code> now signal a
warning, returning <code>NaN</code> instead of typically
segfaulting. (Issue 3 of <a href="https://bugs.R-project.org/show_bug.cgi?id=15554">PR#15554</a>)
</p>
</li>
<li><p> HTML conversion of <span class="samp">\href</span> markup in &lsquo;<span class="file">.Rd</span>&rsquo; files
did not remove the backslash from <span class="samp">\%</span> and so gave an
invalid URL.  In a related change, the <span class="samp">\</span> escape is now
required in such URLs.
</p>
</li></ul>




<h3><img src="../help/figures/../../html/Rlogo.svg" class="toplogo" alt="[R logo]" /> CHANGES IN R 3.1.2</h3>



<h4>NEW FEATURES</h4>


<ul>
<li> <p><code>embedFonts()</code> now defaults to
<code>format = "ps2write"</code> for &lsquo;<span class="file">.ps</span>&rsquo; and &lsquo;<span class="file">.eps</span>&rsquo; files.
This is available in Ghostscript 9.x (since 2010) whereas the
previous default, <code>format = "pswrite"</code>, was removed in
Ghostscript 9.10.
</p>
</li>
<li><p> For consistency with <code>[dpqr]norm()</code>,
<code>[dp]lnorm(sdlog = 0)</code> model a point mass at
<code>exp(mulog)</code> rather than return <code>NaN</code> (for an error).
</p>
</li>
<li> <p><code>capabilities()</code> now reports if ICU is compiled in for
use for collation (it is only actually used if a suitable locale
is set for collation, and never for a <code>C</code> locale).
</p>
</li>
<li><p> (OS X only.) Package <span class="pkg">tcltk</span> checks when loaded if it is
linked against the CRAN X11-based Tcl/Tk and if so that the Tcl/Tk
component and the X11 libraries are installed.  This allows more
informative error messages to be given advising the installation
of the missing component or of XQuartz.
</p>
<p>The <code>X11()</code> device and X11-based versions of the data editor
and viewer (invoked by <code>edit()</code> and <code>View()</code> for data
frames and matrices from command-line <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>) check that the X11
libraries are installed and if not advises installing XQuartz.
</p>
</li>
<li> <p><code>icuSetCollate()</code> allows <code>locale = "default"</code>, and
<code>locale = "none"</code> to use OS services rather than ICU for
collation.
</p>
<p>Environment variable <span class="env">R_ICU_LOCALE</span> can be used to set the
default ICU locale, in case the one derived from the OS locale is
inappropriate (this is currently necessary on Windows).
</p>
</li>
<li><p> New function <code>icuGetCollate()</code> to report on the ICU
collation locale in use (if any).
</p>
</li>
<li> <p><code>utils::URLencode()</code> was updated to use unreserved and
reserved characters from RFC 3986
(<a href="http://tools.ietf.org/html/rfc3986">http://tools.ietf.org/html/rfc3986</a>) instead of RFC 1738.
</p>
</li>
<li> <p><code>unique(warnings())</code> and <code>c(warnings())</code> are now
supported.
</p>
</li>
<li><p> The Bioconductor &lsquo;version&rsquo; used by
<code>setRepositories()</code> now defaults to <code>3.0</code>. (It can be
set at runtime <em>via</em> environment variable
<span class="env">R_BIOC_VERSION</span>.)
</p>
</li>
<li><p> Omegahat is no longer listed as providing Windows binary
packages, e.g. by <code>setRepositories()</code>.  It has no binary
packages available for <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.1.x and those for earlier versions
were 32-bit only.
</p>
</li></ul>




<h4>INSTALLATION and INCLUDED SOFTWARE</h4>


<ul>
<li><p> The <code>configure</code> script reports on the more important
capabilities/options which will not be compiled in.
</p>
<p>More types of external BLAS are recognized by name in that report.
</p>
</li>
<li><p> When building <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> as a shared library, the
<span class="option">-L${R_HOME}/lib${R_ARCH}</span> flag is placed earlier in the
link commands used during installation and when packages are
installed: this helps ensure that the current build has priority
if an <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> shared library has already been installed by
e.g. <code>install-libR</code> in a library mentioned in
<span class="env">LDFLAGS</span> (and not in &lsquo;your system's library directory&rsquo;
as documented). (Wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=15790">PR#15790</a>.)
</p>
</li>
<li><p> LaTeX package <span class="pkg">upquote</span> is no longer required for <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>'s
use of <span class="pkg">inconsolata</span>.
</p>
</li>
<li><p> (Windows only) If both 32- and 64-bit versions of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> are
installed, the &lsquo;<span class="file">bin/R.exe</span>&rsquo; and &lsquo;<span class="file">bin/Rscript.exe</span>&rsquo; executables
now run 64-bit <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>.  (To run 32-bit <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>, overwrite these files
with copies of &lsquo;<span class="file">bin/i386/Rfe.exe</span>&rsquo;.)
</p>
</li></ul>




<h4>UTILITIES</h4>


<ul>
<li><p> Running <code>R CMD check</code> with
<span class="env">_R_CHECK_DEPENDS_ONLY_</span> true now makes the
<span class="samp">VignetteBuilder</span> packages available even if they are
listed in <span class="samp">Suggests</span>, since they are needed to recognise and
process non-Sweave vignettes.
</p>
</li>
<li> <p><code>R CMD check</code> now reports empty <code>importFrom</code>
declarations in a &lsquo;<span class="file">NAMESPACE</span>&rsquo; file, as these are common
errors (writing <code>importFrom(<var>Pkg</var>)</code> where
<code>import(<var>Pkg</var>)</code> was intended).
</p>
</li>
<li> <p><code>R CMD check</code> now by default checks code usage
directly on the package namespace without loading and attaching
the package and its suggests and enhances.  For good practice with
packages in the <span class="samp">Suggests</span> field, see §1.1.3.1 of
&lsquo;Writing R Extensions&rsquo;.  For use of lazy-data objects in
the package's own code, see <code>?data</code>.
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li> <p><code>dmultinom()</code> did not handle non-finite probabilities
correctly.
</p>
</li>
<li> <p><code>prettyNum(x, zero.print=*)</code> now also works when
<code>x</code> contains <code>NA</code>s.
</p>
</li>
<li><p> A longstanding bug exhibited by <code>nlminb()</code> on Windows
was traced to a compiler bug in gcc 4.6.3; a workaround has been
put in place.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15244">PR#15244</a> and <a href="https://bugs.R-project.org/show_bug.cgi?id=15914">PR#15914</a>).
</p>
</li>
<li><p> Rendering of <code>\command</code> in HTML versions of help pages
has been improved: this is particularly evident on the help page
for <code>INSTALL</code>.
</p>
</li>
<li> <p><code>as.hexmode(x)</code> and <code>as.octmode(x)</code> now behave
correctly for some numeric <code>x</code>, e.g., <code>c(NA, 1)</code> or
<code>c(1, pi)</code>.
</p>
</li>
<li> <p><code>drop1()</code> failed if the <code>scope</code> argument had
no variables to drop.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15935">PR#15935</a>)
</p>
</li>
<li> <p><code>edit()</code> (and hence <code>fix()</code>) failed if
an object had a non-character attribute named <code>"source"</code>
(an attribute that had been used in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> prior to version 2.14.0).
</p>
</li>
<li> <p><code>callGeneric()</code> could fail if the generic had
<code>...</code> as a formal argument. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15937">PR#15937</a>).
</p>
</li>
<li><p> Forking in package <span class="pkg">parallel</span> called C entry point
<code>exit</code> in the child.  This was unsafe (<code>_exit</code> should
have been called), and could flush <code>stdin</code> of the main <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>
process (seen most often on Solaris).
</p>
<p>As good practice, <code>stdout</code> is now flushed before forking a child.
</p>
</li>
<li> <p><span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> objects such as <code>list(`a\b` = 1)</code> now print correctly.
</p>
</li>
<li> <p><code>getAnywhere("C_pbinom")</code> now returns correctly a
single object (rather than unlisting it).
</p>
</li>
<li><p> The <code>confint()</code> method for <code>nls()</code> fits failed it
these has specified parameter limits despite using an algorithm
other than <code>"port"</code>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15960">PR#15960</a>)
</p>
</li>
<li><p> Subclassing an S4 class failed if the class required
arguments to the generator, through its <code>initialize()</code> method.
</p>
</li>
<li> <p><code>removeSource()</code> did not properly handle expressions
containing arguments that were supplied as missing, e.g.
<code>x[i,]</code>. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15957">PR#15957</a>)
</p>
</li>
<li> <p><code>as.environment(list())</code> now works, and
<code>as.list()</code> of such an environment is now the same as
<code>list()</code>. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15926">PR#15926</a>)
</p>
</li>
<li><p> Several <span class="pkg">tcltk</span> functions failed when run in unusual
environments. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15970">PR#15970</a>)
</p>
</li>
<li> <p><code>options(list())</code> now works (trivially). (<a href="https://bugs.R-project.org/show_bug.cgi?id=15979">PR#15979</a>)
</p>
</li>
<li> <p><code>merge(&lt;dendrogram&gt;, ..)</code> now works correctly for two
&lsquo;independent&rsquo; dendrograms (<a href="https://bugs.R-project.org/show_bug.cgi?id=15648">PR#15648</a>), and still compatibly
<em>via</em> <code>adjust = "auto"</code> e.g. for two branches of an
existing dendrogram.
</p>
</li>
<li><p> The <code>plot</code> method for <code>"hclust"</code> objects gets an
optional argument <code>check</code>; when that is true (the default) it
checks more carefully for valid input.
</p>
</li>
<li><p> (Windows only) If a user chose to install 64 bit <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> but not
32 bit <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>, the &lsquo;<span class="file">bin/R</span>&rsquo; and &lsquo;<span class="file">bin/Rscript</span>&rsquo; executables
failed to run.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15981">PR#15981</a>)
</p>
</li>
<li><p> Various possible buffer overruns have been prevented,
and missed memory protection added. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15990">PR#15990</a>)
</p>
</li>
<li> <p><code>Rscript</code> no longer passes <code>--args</code> to
<code>R</code> when there are no extra (&ldquo;user&rdquo;) arguments.
</p>
</li>
<li><p> objects like <code>getClass("refClass")@prototype</code> now
<code>print()</code> and <code>str()</code> without error.
</p>
</li>
<li> <p><code>identical()</code> now also looks at the S4 bit.
</p>
</li>
<li> <p><code>hist(x, breaks)</code> is more robust in adding a small fuzz
to few breaks when some are very large. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15988">PR#15988</a>)
</p>
</li>
<li> <p><code>sub()</code> and <code>gsub()</code> did not handle regular
expressions like <code>"\s{2,}"</code> properly if the text
contained <code>NA</code> or non-ASCII elements in a UTF-8
locale.  Part of this was due to a bug in the TRE library.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=16009">PR#16009</a>)
</p>
</li>
<li> <p><code>RShowDoc("NEWS")</code> now displays the PDF version.
</p>
</li>
<li><p> Matrices and arrays with last dimension zero did not print
at all or incompletely.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=16012">PR#16012</a>)
</p>
</li>
<li> <p><code>plot.histogram()</code> and hence <code>hist()</code> now respect
the <code>xaxs</code>, <code>yaxs</code> and <code>lab</code> graphics parameters.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=16021">PR#16021</a>)
</p>
</li>
<li> <p><code>bw.SJ(x)</code> and other bw.*() no longer segfault when
<code>x</code> contains non-finite values. (<a href="https://bugs.R-project.org/show_bug.cgi?id=16024">PR#16024</a>)
</p>
</li>
<li> <p><code>R CMD Rd2pdf</code> unintentionally ignored its
<span class="option">--os</span> option.
</p>
</li>
<li><p> The internal method of <code>download.file()</code> was not
reporting file sizes and progress correctly on files larger than
2GB (inherited from <code>libxml2</code>).  This is corrected for 64-bit
builds (32-bit platforms may not support such files, but where
possible will be supported in future versions of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>).
</p>
</li>
<li><p> Work around a bug in OS X Yosemite where key environment
variables may be duplicated causing issues in subprocesses. The
duplicates are now removed on <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> startup (<em>via</em>
Rprofile). (<a href="https://bugs.R-project.org/show_bug.cgi?id=16042">PR#16042</a>)
</p>
</li>
<li><p> Adjust X11 auto-launch detection in DISPLAY on OS X to
recognize latest XQuartz.
</p>
</li></ul>




<h3><img src="../help/figures/../../html/Rlogo.svg" class="toplogo" alt="[R logo]" /> CHANGES IN R 3.1.1</h3>



<h4>NEW FEATURES</h4>


<ul>
<li><p> When <code>attach()</code> reports conflicts, it does so
compatibly with <code>library()</code> by using <code>message()</code>.
</p>
</li>
<li> <p><code>R CMD Sweave</code> no longer cleans any files by
default, compatibly with versions of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> prior to 3.1.0.  There are
new options <span class="option">--clean</span>, <span class="option">--clean=default</span> and
<span class="option">--clean=keepOuts</span>.
</p>
</li>
<li> <p><code>tools::buildVignette()</code> and <code>tools::buildVignettes()</code>
with <code>clean = FALSE</code> no longer remove any created files.
<code>buildvignette()</code> gains a <code>keep</code> argument for more
cleaning customization.
</p>
</li>
<li><p> The Bioconductor &lsquo;version&rsquo; used by
<code>setRepositories()</code> can now be set by environment variable
<span class="env">R_BIOC_VERSION</span> at runtime, not just when <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> is installed.
(It has been stated that Bioconductor will switch from
&lsquo;version&rsquo; 2.14 to &lsquo;version&rsquo; 3.0 during the lifetime
of the <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.1 series.)
</p>
</li>
<li><p> Error messages from bugs in embedded <span class="samp">Sexpr</span> code
in Sweave documents now report the source location.
</p>
</li>
<li> <p><code>type.convert()</code>, <code>read.table()</code> and similar
<code>read.*()</code> functions get a new <code>numerals</code> argument,
specifying how numeric input is converted when its conversion to
double precision loses accuracy.  The default value,
<code>"allow.loss"</code> allows accuracy loss, as in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> versions before
3.1.0.
</p>
</li>
<li><p> For some compilers, integer addition could overflow without
a warning.  <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>'s internal code for both integer addition and
subtraction is more robust now.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15774">PR#15774</a>)
</p>
</li>
<li><p> The function determining the default number of knots for
<code>smooth.spline()</code> is now exported, as <code>.nknots.smspl()</code>.
</p>
</li>
<li> <p><code>dbeta(, a,b)</code>, <code>pbeta()</code>, <code>qbeta()</code> and
<code>rbeta()</code> are now defined also for <i>a = 0</i>, <i>b = 0</i>,
or infinite <i>a</i> and <i>b</i> (where they typically returned
<code>NaN</code> before).
</p>
</li>
<li><p> Many package authors report that the RStudio graphics device
does not work correctly with their package's use of
<code>dev.new()</code>.  The new option <code>dev.new(noRStudioGD =
      TRUE)</code> replaces the RStudio override by the default device as
selected by <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> itself, still respecting environment variables
<span class="env">R_INTERACTIVE_DEVICE</span> and <span class="env">R_DEFAULT_DEVICE</span>.
</p>
</li>
<li> <p><code>readRDS()</code> now returns visibly.
</p>
</li>
<li><p> Modifying internal logical scalar constants now results in
an error instead of a warning.
</p>
</li>
<li> <p><code>install.packages(repos = NULL)</code> now accepts
<span class="samp">http://</span> or <span class="samp">ftp://</span> URLs of package archives as well
as file paths, and will download as required.  In most cases
<code>repos = NULL</code> can be deduced from the extension of the URL.
</p>
</li>
<li><p> The warning when using partial matching with the <code>$</code>
operator on data frames is now only given when
<code>options("warnPartialMatchDollar")</code> is <code>TRUE</code>.
</p>
</li>
<li><p> Package help requests like <code>package?foo</code> now
try the package <code>foo</code> whether loaded or not.
</p>
</li>
<li><p> General help requests now default to trying all loaded
packages, not just those on the search path.
</p>
</li>
<li><p> Added a new function <code>promptImport()</code>, to generate a
help page for a function that was imported from another package
(and presumably re-exported, or help would not be needed).
</p>
</li></ul>




<h4>INSTALLATION and INCLUDED SOFTWARE</h4>


<ul>
<li> <p><code>configure</code> option <span class="option">--with-internal-tzcode</span>
can now be used with variable <code>rsharedir</code>.
</p>
</li>
<li><p> The included version of PCRE has been updated to 8.35.
</p>
</li>
<li><p> There is a new target <code>make uninstall-libR</code> to
remove an installed shared/static &lsquo;<span class="file">libR</span>&rsquo;.
</p>
<p><code>make install-libR</code> now works if a sub-architecture is
used, although the user will need to specify <code>libdir</code>
differently for different sub-architectures.
</p>
</li>
<li><p> There is more extensive advice on which LaTeX packages are
required to install <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> or to make package manuals (as done by
<code>R CMD check</code>) in the &lsquo;Writing R Extensions&rsquo;
manual.
</p>
</li>
<li><p> Compilers/linkers were handling the visibility control in
&lsquo;<span class="file">src/extra/xz</span>&rsquo; inconsistently (and apparently in some cases
incorrectly), so it has been simplified.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15327">PR#15327</a>)
</p>
</li>
<li><p> (Windows)  There is updated support for the use of ICU for
collation: see the &lsquo;R Installation and Administration Manual&rsquo;.
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li> <p><code>dbinom(x, n)</code>, <code>pbinom()</code>, <code>dpois()</code>, etc,
are slightly less restrictive in checking if <code>n</code> is
integer-valued.  (Wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=15734">PR#15734</a>.)
</p>
</li>
<li> <p><code>pchisq(x, df, ncp, log.p = TRUE)</code> is more accurate and
no longer underflows for small <code>x</code> and <code>ncp &lt; 80</code>, e.g,
for <code>pchisq(1e-5, df = 100, ncp = 1, log = TRUE)</code>.
(Based on <a href="https://bugs.R-project.org/show_bug.cgi?id=15635">PR#15635</a> and a suggestion by Roby Joehanes.)
</p>
</li>
<li><p> The <code>s</code> (&ldquo;step into&rdquo;) command in the debugger
would cause <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> to step into expressions evaluated there,
not just into functions being debugged.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15770">PR#15770</a>)
</p>
</li>
<li><p> The C code used by <code>strptime()</code> rejected time-zone
offsets of more than <code>+1200</code> (<code>+1245</code>, <code>+1300</code> and
<code>+1400</code> can occur).  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15768">PR#15768</a>)
</p>
</li>
<li><p> (Windows only.)
<code>png(type = "cairo", antialias = "gray")</code>
was not accepted.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15760">PR#15760</a>)
</p>
</li>
<li><p> Use of <code>save(..., envir=)</code> with named objects could
fail.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15758">PR#15758</a>)
</p>
</li>
<li> <p><code>Sweave()</code> mis-parsed <span class="samp">Sexpr</span> expressions that
contained backslashes.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15779">PR#15779</a>)
</p>
</li>
<li><p> The return value from <code>options(foo = NULL)</code> was not
the previous value of the option.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15781">PR#15781</a>)
</p>
</li>
<li> <p><code>enc2utf8()</code> and <code>enc2native()</code> did not always
mark the encoding of the return values when it was known.
</p>
</li>
<li> <p><code>dnbinom(x, size = &lt;large&gt;, mu, log = TRUE)</code> no longer
underflows to -Inf for large <code>mu</code>, thanks to a suggestion
from Alessandro Mammana (MPI MolGen, Berlin).
</p>
</li>
<li> <p><code>pbeta(x, a, b, log = TRUE)</code> no longer behaves
discontinuously (in a small x-region) because of denormalized
numbers.  Also, <code>pbeta(1-1e-12, 1e30, 1.001, log=TRUE)</code> now
terminates &ldquo;in real time&rdquo;.
</p>
</li>
<li><p> The <code>"CRAN"</code> filter (see <code>available.packages()</code>)
no longer removes duplicates other than of packages on CRAN, and
does not fail if there is no CRAN repository in
<code>getOption("repos")</code>.
</p>
</li>
<li><p> The device listing from <code>dev2bitmap()</code> and
<code>bitmap()</code> was truncated to 1000 characters: modern versions
of GhostScript on most platforms have many more devices.
</p>
</li>
<li><p> (Windows.)  Commands such as <code>Sys.which()</code> and
<code>pipe()</code> which needed to find the full path to a command
could segfault if the &lsquo;long&rsquo; path name was much longer than
the &lsquo;short&rsquo; path name (which <code>Sys.which()</code> returns),
as the behaviour of the Windows API call had changed.
</p>
</li>
<li> <p><code>R CMD build</code> will fail with an error if one of the
packages specified in the <span class="samp">VignetteBuilder</span> field is not
installed.  (Without loading those packages it cannot be
ascertained which files are intended to be vignettes. This means
that the <span class="samp">VignetteBuilder</span> packages have to be installed for
package checking too.)
(Wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=15775">PR#15775</a>.)
</p>
</li>
<li><p> Misguided attempts to use <code>chull()</code> with non-finite
points now give an error (related to <a href="https://bugs.R-project.org/show_bug.cgi?id=15777">PR#15777</a>).
</p>
</li>
<li><p> For a formula with exactly 32 variables the 32nd variable
was aliased to the intercept in some C-level computations of
terms, so that for example attempting to remove it would remove
the intercept instead (and leave a corrupt internal structure).
(<a href="https://bugs.R-project.org/show_bug.cgi?id=15735">PR#15735</a>)
</p>
</li>
<li> <p><code>anyDuplicated()</code> silently returned wrong values when
the first duplicate was at an index which was too large to be
stored in an integer vector (although a lot of RAM and patience
would have been needed to encounter this).
</p>
</li>
<li> <p><code>tools::Rd2ex(commentDontrun = FALSE)</code> failed if the
block had only one line.
</p>
</li>
<li><p> Hexadecimal constants such as <code>0x110p-5L</code> which were
incorrectly qualified by <code>L</code> were parsed incorrectly since <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>
3.0.0, with a slightly garbled warning. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15753">PR#15753</a>)
</p>
</li>
<li> <p><code>system()</code> returned success on some platforms even if
the system was unable to launch a process. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15796">PR#15796</a>)
</p>
</li>
<li><p> (Windows <code>Rgui</code> console.)  Unbuffered output was
sometimes not output immediately if the prompt was not on the last
line of the console.
</p>
</li>
<li><p> The built-in help server did not declare the encoding for
the &lsquo;<span class="file">DESCRIPTION</span>&rsquo; or other text files to be the package
encoding, so non-ASCII characters could be displayed incorrectly.
</p>
</li>
<li> <p><span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> is now trying harder to not cleanup child processes
that were not spawned by <code>mcparallel()</code> on platforms that
provide information about the source process of the <code>SIGCHLD</code>
signal. This allows 3rd party libraries to manage the exit status
of children that they spawn without <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> interfering.
</p>
</li>
<li> <p><code>mcmapply()</code> was only parallelizing if the number of
jobs was bigger than the number of cores. It now parallelizes if
the number of jobs is more than one.
</p>
</li>
<li><p> Auto-printing would re-evaluate its argument when trying to
dispatch to a print method.  This is now avoided when possible.
</p>
</li>
<li><p> Unserializing (including <code>load()</code> and <code>readRDS()</code>)
could silently return incorrect numeric values from ASCII saves if
there was a read error.
</p>
</li>
<li> <p><code>getParseData()</code> could return incorrect values for
the parents of some elements. (Reported by Andrew Redd.)
</p>
</li>
<li><p> Attempting to use data frames of 2^31 or more rows with
<code>merge()</code> or to create a merged data frame of that size now
gives a clearer error message.
</p>
</li>
<li> <p><code>parse()</code> did not check its <code>file</code> argument was a
connection if it was not a character string, so
e.g. <code>parse(FALSE)</code> attempted to read from <code>stdin</code>.
</p>
<p>Nor did <code>dump()</code> and <code>dput()</code>.
</p>
</li>
<li><p> The <code>"help.try.all.packages"</code> option was ignored when
the shortcut syntax for help was used, e.g. <code>?foo</code>.
</p>
</li>
<li><p> A potential segfault in string allocation has been fixed.
(Found by Radford Neal.)
</p>
</li>
<li><p> Potential memory protection errors in <code>sort()</code> and
<code>D()</code> have been fixed. (Found by Radford Neal.)
</p>
</li>
<li><p> Fixed a lack of error checking in graphics event functions.
(Found by Radford Neal; a different patch used here than the
one in pqR.)
</p>
</li>
<li> <p><code>numericDeriv()</code> sometimes miscalculated the gradient.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=15849">PR#15849</a>, reported originally by Radford Neal)
</p>
</li></ul>




<h3><img src="../help/figures/../../html/Rlogo.svg" class="toplogo" alt="[R logo]" /> CHANGES IN R 3.1.0</h3>



<h4>NEW FEATURES</h4>


<ul>
<li> <p><code>type.convert()</code> (and hence by default
<code>read.table()</code>) returns a character vector or factor when
representing a numeric input as a double would lose accuracy.
Similarly for complex inputs.
</p>
<p>If a file contains numeric data with unrepresentable numbers of
decimal places that are intended to be read as numeric, specify
<code>colClasses</code> in <code>read.table()</code> to be <code>"numeric"</code>.
</p>
</li>
<li> <p><code>tools::Rdiff(useDiff = FALSE)</code> is closer to the POSIX
definition of <code>diff -b</code> (as distinct from the description
in the <code>man</code> pages of most systems).
</p>
</li>
<li><p> New function <code>anyNA()</code>, a version of
<code>any(is.na(.))</code> which is fast for atomic vectors, based on a
proposal by Tim Hesterberg. (Wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=15239">PR#15239</a>.)
</p>
</li>
<li> <p><code>arrayInd(*, useNames = TRUE)</code> and, analogously,
<code>which(*, arr.ind = TRUE)</code> now make use of
<code>names(.dimnames)</code> when available.
</p>
</li>
<li> <p><code>is.unsorted()</code> now also works for <code>raw</code> vectors.
</p>
</li>
<li><p> The <code>"table"</code> method for <code>as.data.frame()</code> (also
useful as <code>as.data.frame.table()</code>) now passes <code>sep</code> and
<code>base</code> arguments to <code>provideDimnames()</code>.
</p>
</li>
<li> <p><code>uniroot()</code> gets new optional arguments, notably
<code>extendInt</code>, allowing to auto-extend the search interval when
needed.  The return value has an extra component, <code>init.it</code>.
</p>




</li>
<li> <p><code>switch(f, ...)</code> now warns when <code>f</code> is a factor,
as this typically happens accidentally where the useR meant to
pass a character string, but <code>f</code> is treated as integer (as
always documented).
</p>
</li>
<li><p> The parser has been modified to use less memory.
</p>
</li>
<li><p> The way the unary operators (<code>+ - !</code>) handle attributes
is now more consistent.  If there is no coercion, all attributes
(including class) are copied from the input to the result:
otherwise only names, dims and dimnames are.
</p>
</li>
<li> <p><code>colorRamp()</code> and <code>colorRampPalette()</code> now allow
non-opaque colours and a ramp in opacity <em>via</em> the new argument
<code>alpha = TRUE</code>.  (Suggested by Alberto Krone-Martins, but
optionally as there are existing uses which expect only RGB values.)

</p>
</li>
<li> <p><code>grid.show.layout()</code> and <code>grid.show.viewport()</code>
get an optional <code>vp.ex</code> argument.
</p>
</li>
<li><p> There is a new function <code>find_gs_cmd()</code> in the
<span class="pkg">tools</span> package to locate a GhostScript executable.  (This is
an enhanced version of a previously internal function there.)
</p>
</li>
<li> <p><code>object.size()</code> gains a <code>format()</code> method.
</p>
</li>
<li><p> There is a new family, <code>"ArialMT"</code>, for the
<code>pdf()</code> and <code>postscript()</code> devices.  This will only be
rendered correctly on viewers which have access to Monotype
TrueType fonts (which are sometimes requested by journals).
</p>
</li>
<li><p> The text and PDF news files, including &lsquo;<span class="file">NEWS</span>&rsquo; and
&lsquo;<span class="file">NEWS.2</span>&rsquo;, have been moved to the &lsquo;<span class="file">doc</span>&rsquo; directory.
</p>
</li>
<li> <p><code>combn(x, simplify = TRUE)</code> now gives a factor result
for factor input <code>x</code> (previously user error).
(Related to <a href="https://bugs.R-project.org/show_bug.cgi?id=15442">PR#15442</a>.)
</p>
</li>
<li><p> Added <code>utils::fileSnapshot()</code> and
<code>utils::changedFiles()</code> functions to allow snapshots and
comparison of directories of files.
</p>
</li>
<li> <p><code>make.names(names, unique=TRUE)</code> now tries to preserve
existing names. (Suggestion of <a href="https://bugs.R-project.org/show_bug.cgi?id=15452">PR#15452</a>.)
</p>
</li>
<li><p> New functions <code>cospi(x)</code>, <code>sinpi(x)</code>, and
<code>tanpi(x)</code>, for more accurate computation of
<code>cos(pi*x)</code>, etc, both in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> and the C API.  Using these
gains accuracy in some cases, e.g., inside <code>lgamma()</code> or
<code>besselI()</code>.  (Suggested by Morten Welinder in <a href="https://bugs.R-project.org/show_bug.cgi?id=15529">PR#15529</a>.)
</p>
</li>
<li> <p><code>print.table(x, zero.print = ".")</code> now also has an
effect when <code>x</code> is not integer-valued.
</p>
</li>
<li><p> There is more support to explore the system's idea of
time-zone names.  <code>Sys.timezone()</code> tries to give the current
system setting by name (and succeeds at least on Linux, OS X,
Solaris and Windows), and <code>OlsonNames()</code> lists the names in
the system's Olson database. <code>Sys.timezone(location = FALSE)</code>
gives the previous behaviour.
</p>
</li>
<li><p> Platforms with a 64-bit <code>time_t</code> type are allowed to
handle conversions between the <code>"POSIXct"</code> and
<code>"POSIXlt"</code> classes for date-times outside the 32-bit range
(before 1902 or after 2037): the existing workarounds are used on
other platforms.  (Note that time-zone information for post-2037
is speculative at best, and the OS services are tested for known
errors and so not used on OS X.)
</p>
<p>Currently <code>time_t</code> is usually <code>long</code> and hence 64-bit on
Unix-alike 64-bit platforms: however in several cases the
time-zone database is 32-bit.  For <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> for Windows it is 64-bit
(for both architectures as from this version).
</p>
</li>
<li><p> The <code>"save.defaults"</code> option can include a value for
<code>compression_level</code>.  (Wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=15579">PR#15579</a>.)
</p>
</li>
<li> <p><code>colSums()</code> and friends now have support for arrays and
data-frame columns with <i>2^31</i> or more elements.
</p>
</li>
<li> <p><code>as.factor()</code> is faster when <code>f</code> is an unclassed
integer vector (for example, when called from <code>tapply()</code>).
</p>
</li>
<li> <p><code>fft()</code> now works with longer inputs, from the 12
million previously supported up to 2 billion.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15593">PR#15593</a>)
</p>
</li>
<li><p> Complex <code>svd()</code> now uses LAPACK subroutine
<code>ZGESDD</code>, the complex analogue of the routine used for the
real case.
</p>
</li>
<li><p> Sweave now outputs &lsquo;<span class="file">.tex</span>&rsquo; files in UTF-8 if the
input encoding is declared to be UTF-8, regardless of the
local encoding.  The UTF-8 encoding may now be declared using
a LaTeX comment containing the string <code>%\SweaveUTF8</code>
on a line by itself.
</p>
</li>
<li> <p><code>file.copy()</code> gains a <code>copy.date</code> argument.
</p>
</li>
<li><p> Printing of date-times will make use of the time-zone
abbreviation in use at the time, if known.  For example, for Paris
pre-1940 this could be <span class="samp">LMT</span>, <span class="samp">PMT</span>, <span class="samp">WET</span> or
<span class="samp">WEST</span>.  To enable this, the <code>"POSIXlt"</code> class has an
optional component <code>"zone"</code> recording the abbreviation for
each element.
</p>
<p>For platforms which support it, there is also a component
<code>"gmtoff"</code> recording the offset from GMT where known.
</p>
</li>
<li><p> (On Windows, by default on OS X and optionally elsewhere.)
The system C function <code>strftime</code> has been replaced by a more
comprehensive version with closer conformance to the POSIX 2008
standard.
</p>
</li>
<li> <p><code>dnorm(x, log = FALSE)</code> is more accurate (but somewhat
slower) for |x| &gt; 5; as suggested in <a href="https://bugs.R-project.org/show_bug.cgi?id=15620">PR#15620</a>.
</p>
</li>
<li><p> Some versions of the <code>tiff()</code> device have further
compression options.
</p>
</li>
<li> <p><code>read.table()</code>, <code>readLines()</code> and <code>scan()</code>
have a new argument to influence the treatment of embedded nuls.
</p>
</li>
<li><p> Avoid duplicating the right hand side values in complex
assignments when possible.  This reduces copying of replacement
values in expressions such as <code>Z$a &lt;- a0</code> and
<code>ans[[i]] &lt;- tmp</code>: some package code has relied on there
being copies.
</p>
<p>Also, a number of other changes to reduce copying of objects; all
contributed by or based on suggestions by Michael Lawrence.
</p>
</li>
<li><p> The <code>fast</code> argument of <code>KalmanLike()</code>,
<code>KalmanRun()</code> and <code>KalmanForecast()</code> has been replaced
by <code>update</code>, which instead of updating <code>mod</code> in place,
optionally returns the updated model in an attribute <code>"mod"</code>
of the return value.
</p>
</li>
<li> <p><code>arima()</code> and <code>makeARIMA()</code> get a new optional
argument <code>SSinit</code>, allowing the choice of a different
<b>s</b>tate <b>s</b>pace initialization which has been observed
to be more reliable close to non-stationarity: see <a href="https://bugs.R-project.org/show_bug.cgi?id=14682">PR#14682</a>.
</p>
</li>
<li> <p><code>warning()</code> has a new argument <code>noBreaks.</code>, to
simplify post-processing of output with <code>options(warn = 1)</code>.
</p>
</li>
<li> <p><code>pushBack()</code> gains an argument <code>encoding</code>, to
support reading of UTF-8 characters using <code>scan()</code>,
<code>read.table()</code> and related functions in a non-UTF-8 locale.
</p>
</li>
<li> <p><code>all.equal.list()</code> gets a new argument <code>use.names</code>
which by default labels differing components by names (if they
match) rather than by integer index.  Saved <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> output in packages may
need to be updated.
</p>
</li>
<li><p> The methods for <code>all.equal()</code> and
<code>attr.all.equal()</code> now have argument <code>check.attributes</code>
after <code>...</code> so it cannot be partially nor positionally
matched (as it has been, unintentionally).
</p>
<p>A side effect is that some previously undetected errors of passing
empty arguments (no object between commas) to <code>all.equal()</code>
are detected and reported.
</p>
<p>There are explicit checks that <code>check.attributes</code> is logical,
<code>tolerance</code> is numeric and <code>scale</code> is <code>NULL</code> or
numeric.  This catches some unintended positional matching.
</p>
<p>The message for <code>all.equal.numeric()</code> reports a
<code>"scaled difference"</code> only for <code>scale != 1</code>.
</p>
</li>
<li> <p><code>all.equal()</code> now has a <code>"POSIXt"</code> method
replacing the <code>"POSIXct"</code> method.
</p>
</li>
<li><p> The <code>"Date"</code> and <code>"POSIXt"</code> methods of
<code>seq()</code> allows <code>by = "quarter"</code> for completeness
(<code>by = "3 months"</code> always worked).
</p>
</li>
<li> <p><code>file.path()</code> removes any trailing separator on
Windows, where they are invalid (although sometimes accepted).
This is intended to enhance the portability of code written by
those using POSIX file systems (where a trailing <code>/</code> can be
used to confine path matching to directories).
</p>
</li>
<li><p> New function <code>agrepl()</code> which like <code>grepl()</code>
returns a logical vector.
</p>
</li>
<li> <p><code>fifo()</code> is now supported on Windows. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15600">PR#15600</a>)
</p>
</li>
<li> <p><code>sort.list(method = "radix")</code> now allows negative
integers (wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=15644">PR#15644</a>).
</p>
</li>
<li><p> Some functionality of <code>print.ts()</code> is now available in
<code>.preformat.ts()</code> for more modularity.
</p>
</li>
<li> <p><code>mcparallel()</code> gains an option <code>detach = TRUE</code>
which allows execution of code independently of the current
session.  It is based on a new <code>estranged = TRUE</code> argument to
<code>mcfork()</code> which forks child processes such that they become
independent of the parent process.
</p>
</li>
<li><p> The <code>pdf()</code> device omits circles and text at extremely
small sizes, since some viewers were failing on such files.
</p>
</li>
<li><p> The rightmost break for the <code>"months"</code>,
<code>"quarters"</code> and <code>"years"</code> cases of
<code>hist.POSIXlt()</code> has been increased by a day.  (Inter alia,
fixes <a href="https://bugs.R-project.org/show_bug.cgi?id=15717">PR#15717</a>.)
</p>
</li>
<li><p> The handling of <code>DF[i,] &lt;- a</code> where <code>i</code> is of
length 0 is improved.  (Inter alia, fixes <a href="https://bugs.R-project.org/show_bug.cgi?id=15718">PR#15718</a>.)
</p>
</li>
<li> <p><code>hclust()</code> gains a new method <code>"ward.D2"</code> which
implements Ward's method correctly.  The previous <code>"ward"</code>
method is <code>"ward.D"</code> now, with the old name still working.
Thanks to research and proposals by Pierre Legendre.
</p>
</li>
<li><p> The <code>sunspot.month</code> dataset has been amended and
updated from the official source, whereas the <code>sunspots</code> and
<code>sunspot.year</code> datasets will remain immutable. The
documentation and source links have been updated correspondingly.
</p>
</li>
<li><p> The <code>summary()</code> method for <code>"lm"</code> fits warns if
the fit is essentially perfect, as most of the summary may be
computed inaccurately (and with platform-dependent values).
</p>
<p>Programmers who use <code>summary()</code> in order to extract just
a component which will be reliable (e.g., <code>$cov.unscaled</code>)
should wrap their calls in <code>suppressWarnings()</code>.
</p>
</li></ul>




<h4>INSTALLATION and INCLUDED SOFTWARE</h4>


<ul>
<li><p> The included version of LAPACK has been updated to 3.5.0.
</p>
</li>
<li><p> There is some support for parallel testing of an
installation, by setting <span class="env">TEST_MC_CORES</span> to an integer
greater than one to indicate the maximum number of cores to be
used in parallel. (It is worth specifying at least 8 cores if
available.)  Most of these require a <code>make</code> program (such
as GNU <code>make</code> and <code>dmake</code>) which supports the
<code>$MAKE -j nproc</code> syntax.
</p>
<p>Except on Windows: the tests of standard package examples in
<code>make check</code> are done in parallel.  This also applies to
running <code>tools::testInstalledPackages()</code>.
</p>
<p>The more time-consuming regression tests are done in parallel.
</p>
<p>The package checks in <code>make check-devel</code> and <code>make
	check-recommended</code> are done in parallel.
</p>
</li>
<li><p> More of <code>make check</code> will work if recommended packages
are not installed: but recommended packages remain needed for
thorough checking of an <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> build.
</p>
</li>
<li><p> The version of <span class="samp">tzcode</span> included in
&lsquo;<span class="file">src/extra/tzone</span>&rsquo; has been updated.  (Formerly used only on
Windows.)
</p>
</li>
<li><p> The included (64-bit) time-zone conversion code and Olson
time-zone database can be used instead of the system version: use
<code>configure</code> option <span class="option">--with-internal-tzcode</span>.  This
is the default on Windows and OS X.  (Note that this does not
currently work if a non-default <code>rsharedir</code>
<code>configure</code> variable is used.)
</p>
<p>(It might be necessary to set environment variable <span class="env">TZ</span> on
OSes where this is not already set, although the system timezone is
deduced correctly on at least Linux, OS X and Windows.)
</p>
<p>This option also switches to the version of <code>strftime</code>
included in directory &lsquo;<span class="file">src/extra/tzone</span>&rsquo;.
</p>
</li>
<li> <p><code>configure</code> now tests for a C++11-compliant compiler
by testing some basic features.  This by default tries flags for
the compiler specified by <span class="samp">CXX</span>, but an alternative compiler,
options and standard can be specified by variables <span class="samp">CXX1X</span>,
<span class="samp">CXX1XFLAGS</span> and <span class="samp">CXX1XSTD</span> (e.g., <span class="samp">-std=gnu++11</span>).
</p>
</li>
<li> <p><span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> can now optionally be compiled to use reference
counting instead of the <code>NAMED</code> mechanism by defining
<code>SWITCH_TO_REFCNT</code> in &lsquo;<span class="file">Rinternals.h</span>&rsquo;. This may become
the default in the future.
</p>
</li>
<li><p> There is a new option <span class="option">--use-system-tre</span> to use a
suitable system <span class="pkg">tre</span> library: at present this means a version
from their <code>git</code> repository, after corrections.
(Wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=15660">PR#15660</a>.)
</p>
</li></ul>




<h4>PACKAGE INSTALLATION</h4>


<ul>
<li><p> The <code>CRANextra</code> repository is no longer a default
repository on Windows: all the binary versions of packages from
CRAN are now on CRAN, although <code>CRANextra</code> contains packages
from Omegahat and elsewhere used by CRAN packages.
</p>
</li>
<li><p> Only vignettes sources in directory &lsquo;<span class="file">vignettes</span>&rsquo; are
considered to be vignettes and hence indexed as such.
</p>
</li>
<li><p> In the &lsquo;<span class="file">DESCRIPTION</span>&rsquo; file, </p>
<pre>    License: X11</pre>
<p>is no longer recognized as valid.  Use <span class="samp">MIT</span> or
<span class="samp">BSD_2_clause</span> instead, both of which need <span class="samp">+ file LICENSE</span>.
</p>
</li>
<li><p> For consistency, entries in &lsquo;<span class="file">.Rinstignore</span>&rsquo; are now matched
case-insensitively on all platforms.
</p>
</li>
<li><p> Help for S4 methods with very long signatures now tries
harder to split the description in the <span class="samp">Usage</span> field to no
more than 80 characters per line (some packages had over 120
characters).
</p>
</li>
<li> <p><code>R CMD INSTALL --build</code> (not Windows) now defaults to
the internal <code>tar()</code> unless <span class="env">R_INSTALL_TAR</span> is set.
</p>
</li>
<li><p> There is support for compiling C++11 code in packages on
suitable platforms: see &lsquo;Writing R Extensions&rsquo;.
</p>
</li>
<li><p> Fake installs now install the contents of directory
&lsquo;<span class="file">inst</span>&rsquo;: some packages use this to install e.g. C++ headers
for use by other packages that are independent of the package
itself.  Option <span class="option">--no-inst</span> can be used to get the previous
behaviour.
</p>
</li></ul>




<h4>DEBUGGING</h4>


<ul>
<li><p> The behaviour of the code browser has been made more
consistent, in part following the suggestions in <a href="https://bugs.R-project.org/show_bug.cgi?id=14985">PR#14985</a>.
</p>
</li>
<li><p> Calls to <code>browser()</code> are now consistent with calls
to the browser triggered by <code>debug()</code>, in that <kbd>Enter</kbd>
will default to <code>n</code> rather than <code>c</code>.
</p>
</li>
<li><p> A new browser command <code>s</code> has been added, to
&ldquo;step into&rdquo; function calls.
</p>
</li>
<li><p> A new browser command <code>f</code> has been added, to
&ldquo;finish&rdquo; the current loop or function.
</p>
</li>
<li><p> Within the browser, the command <code>help</code> will
display a short list of available commands.
</p>
</li></ul>




<h4>UTILITIES</h4>


<ul>
<li><p> Only vignettes sources in directory &lsquo;<span class="file">vignettes</span>&rsquo; are
considered to be vignettes by <code>R CMD check</code>.  That has
been the preferred location since <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.14.0 and is now obligatory.
</p>
</li>
<li><p> For consistency, <code>R CMD build</code> now matches entries
in &lsquo;<span class="file">.Rbuildignore</span>&rsquo;  and &lsquo;<span class="file">vignettes/.install_extras</span>&rsquo;
case-insensitively on all platforms (not just on Windows).
</p>
</li>
<li> <p><code>checkFF()</code> (called by <code>R CMD check</code> by
default) can optionally check foreign function calls for
consistency with the registered type and argument count.  This is
the default for <code>R CMD check --as-cran</code> or can be enabled
by setting environment variable <span class="env">_R_CHECK_FF_CALLS_</span> to
<span class="samp">registration</span> (but is in any case suppressed by
<span class="option">--install=no</span>).   Because this checks calls in which
<code>.NAME</code> is an <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> object and not just a literal character
string, some other problems are detected for such calls.
</p>
<p>Functions <code>suppressForeignCheck()</code> and <code>dontCheck()</code>
have been added to allow package authors to suppress false
positive reports.
</p>
</li>
<li> <p><code>R CMD check --as-cran</code> warns about a false value of
the &lsquo;<span class="file">DESCRIPTION</span>&rsquo; field <span class="samp">BuildVignettes</span> for Open Source
packages, and ignores it.  (An Open Source package needs to have
complete sources for its vignettes which should be usable on a
suitably well-equipped system).
</p>
</li>
<li> <p><code>R CMD check --no-rebuild-vignettes</code> is defunct:<br />
<code>R CMD check --no-build-vignettes</code> has been preferred since
<span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.0.0.
</p>
</li>
<li> <p><code>R CMD build --no-vignettes</code> is defunct:<br />
<code>R CMD build --no-build-vignettes</code> has been preferred since
<span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.0.0.
</p>
</li>
<li> <p><code>R CMD Sweave</code> and <code>R CMD Stangle</code> now
process both Sweave and non-Sweave vignettes.  The
<code>tools::buildVignette()</code> function has been added to do the
same tasks from within <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>.
</p>
</li>
<li><p> The flags returned by <code>R CMD config --ldflags</code> and
(where installed) <code>pkg-config --libs libR</code> are now those
needed to link a front-end against the (shared or static) <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>
library.
</p>
</li>
<li> <p>&lsquo;<span class="file">Sweave.sty</span>&rsquo; has a new option <span class="samp">[inconsolata]</span>.
</p>
</li>
<li> <p><code>R CMD check</code> customizations such as
<span class="env">_R_CHECK_DEPENDS_ONLY_</span> make available packages only in
<span class="samp">LinkingTo</span> only for installation, and not for
loading/runtime tests.
</p>
</li>
<li> <p><code>tools::checkFF()</code> reports on <code>.C</code> and
<code>.Fortran</code> calls with <code>DUP = FALSE</code> if argument
<code>check_DUP</code> is true.  This is selected by
<code>R CMD check</code> by default.
</p>
</li>
<li> <p><code>R CMD check --use-gct</code> can be tuned to
garbage-collect less frequently using <code>gctorture2()</code>
<em>via</em> the setting of environment variable
<span class="env">_R_CHECK_GCT_N_</span>.
</p>
</li>
<li><p> Where supported, <code>tools::texi2dvi()</code> limits the number
of passes tried to 20.
</p>
</li></ul>




<h4>C-LEVEL FACILITIES</h4>


<ul>
<li><p> (Windows only) A function <code>R_WaitEvent()</code> has been
added (with declaration in header&lsquo;<span class="file">R.h</span>&rsquo;) to block execution
until the next event is received by <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>.
</p>
</li>
<li><p> Remapping in the &lsquo;<span class="file">Rmath.h</span>&rsquo; header can be suppressed by
defining <span class="samp">R_NO_REMAP_RMATH</span>.
</p>
</li>
<li><p> The remapping of <code>rround()</code> in header &lsquo;<span class="file">Rmath.h</span>&rsquo;
has been removed: use <code>fround()</code> instead.
</p>
</li>
<li> <p><code>ftrunc()</code> in header &lsquo;<span class="file">Rmath.h</span>&rsquo; is now a wrapper
for the C99 function <code>trunc()</code>, which might as well be used
in C code: <code>ftrunc()</code> is still needed for portable C++ code.
</p>
</li>
<li><p> The never-documented remapping of <code>prec()</code> to
<code>fprec()</code> in header &lsquo;<span class="file">Rmath.h</span>&rsquo; has been removed.
</p>
</li>
<li><p> The included LAPACK subset now contains <code>ZGESDD</code> and
<code>ZGELSD</code>.
</p>
</li>
<li><p> The function <code>LENGTH()</code> now checks that it is only
applied to vector arguments.  However, in packages <code>length()</code>
should be used. (In <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> itself <code>LENGTH()</code> is a macro without
the function overhead of <code>length()</code>.)
</p>
</li>
<li><p> Calls to <code>SET_VECTOR_ELT()</code> and <code>SET_STRING_ELT()</code>
are now checked for indices which are in-range: several packages
were writing one element beyond the allocated length.
</p>
</li>
<li> <p><code>allocVector3</code> has been added which allows custom
allocators to be used for individual vector allocations.
</p>
</li></ul>




<h4>DEPRECATED AND DEFUNCT</h4>


<ul>
<li> <p><code>chol(pivot = TRUE, LINPACK = TRUE)</code> is defunct.
</p>
<p>Arguments <code>EISPACK</code> for <code>eigen()</code> and <code>LINPACK</code> for
<code>chol()</code>, <code>chol2inv()</code>, <code>solve()</code> and <code>svd()</code>
are ignored: LAPACK is always used.
</p>
</li>
<li> <p><code>.find.package()</code> and <code>.path.package()</code> are
defunct: only the versions without the initial dot introduced in
<span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.13.0 have ever been in the API.
</p>
</li>
<li><p> Partial matching when using the <code>$</code> operator <em>on
data frames</em> now throws a warning and may become defunct in the
future. If partial matching is intended, replace <code>foo$bar</code>
by <code>foo[["bar", exact = FALSE]]</code>.
</p>
</li>
<li><p> The long-deprecated use of <code>\synopsis</code> in the
<span class="samp">Usage</span> section of &lsquo;<span class="file">.Rd</span>&rsquo; files has been removed: such
sections are now ignored (with a warning).
</p>
</li>
<li> <p><code>package.skeleton()</code>'s deprecated argument
<code>namespace</code> has been removed.
</p>
</li>
<li><p> Many methods are no longer exported by package <span class="pkg">stats</span>.
They are all registered on their generic, which should be called
rather than calling a method directly.
</p>
</li>
<li><p> Functions <code>readNEWS()</code> and <code>checkNEWS()</code> in
package <span class="pkg">tools</span> are defunct.
</p>
</li>
<li> <p><code>download.file(method = "lynx")</code> is deprecated.
</p>
</li>
<li> <p><code>.C(DUP = FALSE)</code> and <code>.Fortran(DUP = FALSE)</code> are
now deprecated, and may be disabled in future versions of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>.  As
their help has long said, <code>.Call()</code> is much preferred.
</p>
<p><code>R CMD check</code> notes such usages (by default).
</p>
</li>
<li><p> The workaround of setting <span class="env">R_OSX_VALGRIND</span> has been
removed: it is not needed in current valgrind.
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li><p> Calling <code>lm.wfit()</code> with no non-zero weights gave an
array-overrun in the Fortran code and a not very sensible answer.
It is now special-cased with a simpler answer (no <code>qr</code>
component).
</p>
</li>
<li><p> Error messages involving non-syntactic names (e.g., as produced
by <code>`\r`</code> when that object does not exist) now encode
the control characters.  (Reported by Hadley Wickham.)
</p>
</li>
<li> <p><code>getGraphicsEvent()</code> caused 100% usage of one CPU in
Windows. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15500">PR#15500</a>)
</p>
</li>
<li> <p><code>nls()</code> with no <code>start</code> argument may now work
inside another function (scoping issue).
</p>
</li>
<li> <p><code>pbeta()</code> and similar work better for very large
(billions) <code>ncp</code>.
</p>
</li>
<li><p> Where time zones have changed abbreviations over the years,
the software tries to more consistently use the abbreviation
appropriate to the time or if that is unknown, the current
abbreviation.  On some platforms where the C function
<code>localtime</code> changed the <code>tzname</code> variables the reported
abbreviation could have been that of the last time converted.
</p>
</li>
<li> <p><code>all.equal(list(1), identity)</code> now works.
</p>
</li>
<li><p> Bug fix for pushing viewports in <span class="pkg">grid</span> (reported by
JJ Allaire and Kevin Ushey).
</p>
<p>NOTE for anyone poking around within the graphics engine display
list (despite the warnings not to) that this changes what
is recorded by <span class="pkg">grid</span> on the graphics engine display list.
</p>
</li>
<li><p> Extra checks have been added for unit resolution and
conversion in <span class="pkg">grid</span>, to catch instances of division-by-zero.
This may introduce error messages in existing code and/or produce
a different result in existing code (but only where a non-finite
location or dimension may now become zero).
</p>
</li>
<li><p> Some bugs in TRE have been corrected by updating from the
<code>git</code> repository.  This allows <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> to be installed on some
platforms for which this was a blocker (<a href="https://bugs.R-project.org/show_bug.cgi?id=15087">PR#15087</a> suggests Linux
on ARM and HP-UX).
</p>
</li>
<li> <p><code>?</code> applied to a call to an S4 generic failed in
several cases. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15680">PR#15680</a>)
</p>
</li>
<li><p> The implicit S4 generics for primitives with <code>...</code> in
their argument list were incorrect. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15690">PR#15690</a>)
</p>
</li>
<li><p> Bug fixes to <code>methods::callGeneric()</code>. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15691">PR#15691</a>)
</p>
</li>
<li><p> The bug fix to <code>aggregrate()</code> in <a href="https://bugs.R-project.org/show_bug.cgi?id=15004">PR#15004</a> introduced
a new bug in the case of no grouping variables. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15699">PR#15699</a>)
</p>
</li>
<li><p> In rare cases printing deeply nested lists overran a buffer
by one byte and on a few platforms segfaulted. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15679">PR#15679</a>)
</p>
</li>
<li><p> The dendrogram method of <code>as.dendrogram()</code> was hidden
accidentally, (<a href="https://bugs.R-project.org/show_bug.cgi?id=15703">PR#15703</a>), and <code>order.dendrogram(d)</code> gave
too much for a leaf <code>d</code>. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15702">PR#15702</a>)
</p>
</li>
<li> <p><span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> would try to kill processes on exit that have pids ever
used by a child process spawned by <code>mcparallel</code> even though
the current process with that pid was not actually its child.
</p>
</li>
<li> <p><code>cophenetic()</code> applied to a <code>"dendrogram"</code> object
sometimes incorrectly returned a <code>"Labels"</code> attribute with
dimensions.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15706">PR#15706</a>)
</p>
</li>
<li> <p><code>printCoefmat()</code> called from quite a few <code>print()</code>
methods now obeys small <code>getOption("width")</code> settings,
line wrapping the <span class="samp">"signif. codes"</span> legend appropriately.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=15708">PR#15708</a>)
</p>
</li>
<li> <p><code>model.matrix()</code> assumed that the stored dimnames for a
matrix was <code>NULL</code> or length 2, but length 1 occurred.
</p>
</li>
<li><p> The clipping region for a device was sometimes used in base
graphics before it was set.
</p>
</li></ul>




<h3><img src="../help/figures/../../html/Rlogo.svg" class="toplogo" alt="[R logo]" /> CHANGES IN R 3.0.3</h3>



<h4>NEW FEATURES</h4>


<ul>
<li><p> On Windows there is support for making &lsquo;<span class="file">.texi</span>&rsquo; manuals
using <code>texinfo</code> 5.0 or later: the setting is in file
&lsquo;<span class="file">src/gnuwin32/MkRules.dist</span>&rsquo;.
</p>
<p>A packaging of the Perl script and modules for <code>texinfo</code>
5.2 has been made available at
<a href="http://www.stats.ox.ac.uk/pub/Rtools/">http://www.stats.ox.ac.uk/pub/Rtools/</a>.
</p>
</li>
<li> <p><code>write.table()</code> now handles matrices of
<i>2^31</i> or more elements, for those with large amounts
of patience and disc space.
</p>
</li>
<li><p> There is a new function, <code>La_version()</code>, to report the
version of LAPACK in use.
</p>
</li>
<li><p> The HTML version of &lsquo;An Introduction to R&rsquo; now has
links to PNG versions of the figures.
</p>
</li>
<li><p> There is some support to produce manuals in ebook
formats. (See &lsquo;<span class="file">doc/manual/Makefile</span>&rsquo;.  Suggested by Mauro
Cavalcanti.)
</p>
</li>
<li><p> On a Unix-alike <code>Sys.timezone()</code> returns <code>NA</code> if
the environment variable <span class="env">TZ</span> is unset, to distinguish it from
an empty string which on some OSes means the <span class="samp">UTC</span> time zone.
</p>
</li>
<li><p> The backtick may now be escaped in strings, to allow names
containing them to be constructed, e.g. <code>`\``</code>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15621">PR#15621</a>)
</p>
</li>
<li> <p><code>read.table()</code>, <code>readLines()</code> and <code>scan()</code>
now warn when an embedded nul is found in the input.  (Related to
<a href="https://bugs.R-project.org/show_bug.cgi?id=15625">PR#15625</a> which was puzzled by the behaviour in this unsupported
case.)
</p>
</li>
<li><p> (Windows only.)  <code>file.symlink()</code> works around the
undocumented restriction of the Windows system call to
backslashes.  (Wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=15631">PR#15631</a>.)
</p>
</li>
<li> <p><code>KalmanForecast(fast = FALSE)</code> is now the default, and
the help contains an example of how <code>fast = TRUE</code> can be used
in this version.  (The usage will change in 3.1.0.)
</p>
</li>
<li> <p><code>strptime()</code> now checks the locale only when
locale-specific formats are used and caches the locale in use:
this can halve the time taken on OSes with slow system
functions (e.g., OS X).
</p>
</li>
<li> <p><code>strptime()</code> and the <code>format()</code> methods for
classes <code>"POSIXct"</code>, <code>"POSIXlt"</code> and <code>"Date"</code>
recognize strings with marked encodings: this allows, for example,
UTF-8 French month names to be read on (French) Windows.
</p>
</li>
<li> <p><code>iconv(to = "utf8")</code> is now accepted on all platforms
(some implementations did already, but GNU <span class="pkg">libiconv</span> did not:
however converted strings were not marked as being in UTF-8).  The
official name, <code>"UTF-8"</code> is still preferred.
</p>
</li>
<li> <p><code>available.packages()</code> is better protected against
corrupt metadata files.  (A recurring problem with Debian package
<span class="pkg">shogun-r</span>: <a href="https://bugs.R-project.org/show_bug.cgi?id=14713">PR#14713</a>.)
</p>
</li>
<li><p> Finalizers are marked to be run at garbage collection, but
run only at a somewhat safer later time (when interrupts are
checked).  This circumvents some problems with finalizers running
arbitrary code during garbage collection (the known instances being
running <code>options()</code> and (C-level) <code>path.expand()</code>
re-entrantly).
</p>
</li></ul>




<h4>INSTALLATION and INCLUDED SOFTWARE</h4>


<ul>
<li><p> The included version of PCRE has been updated to 8.34.  This
fixes bugs and makes the behaviour closer to Perl 5.18.  In
particular, the concept of &lsquo;space&rsquo; includes <span class="samp">VT</span> and
hence agrees with POSIX's.
</p>
</li></ul>




<h4>PACKAGE INSTALLATION</h4>


<ul>
<li><p> The new field <span class="samp">SysDataCompression</span> in the
&lsquo;<span class="file">DESCRIPTION</span>&rsquo; file allows user control over the compression
used for &lsquo;<span class="file">sysdata.rda</span>&rsquo; objects in the lazy-load database.
</p>
</li>
<li> <p><code>install.packages(dependencies = value)</code> for <code>value =
	NA</code> (the default) or <code>value = TRUE</code> omits packages only in
<code>LinkingTo</code> for binary package installs.
</p>
</li></ul>




<h4>C-LEVEL FACILITIES</h4>


<ul>
<li><p> The long undocumented remapping of <code>rround()</code> to
<code>Rf_fround()</code> in header &lsquo;<span class="file">Rmath.h</span>&rsquo; is now formally
deprecated: use <code>fround()</code> directly.
</p>
</li>
<li><p> Remapping of <code>prec()</code> and <code>trunc()</code> in the
&lsquo;<span class="file">Rmath.h</span>&rsquo; header has been disabled in C++ code (it has caused
breakage with <code>libc++</code> headers).
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li> <p><code>getParseData()</code> truncated the imaginary part of
complex number constants.  (Reported by Yihui Xie.)
</p>
</li>
<li> <p><code>dbeta(x, a, b)</code> with <code>a</code> or <code>b</code> within a
factor of 2 of the largest representable number could
infinite-loop.  (Reported by Ioannis Kosmidis.)
</p>
</li>
<li> <p><code>provideDimnames()</code> failed for arrays with a 0
dimension. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15465">PR#15465</a>)
</p>
</li>
<li> <p><code>rbind()</code> and <code>cbind()</code> did not handle
list objects correctly. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15468">PR#15468</a>)
</p>
</li>
<li> <p><code>replayPlot()</code> now checks if it is replaying a plot
from the same session.
</p>
</li>
<li> <p><code>rasterImage()</code> and <code>grid.raster()</code> now give
error on an empty (zero-length) raster.  (Reported by Ben North.)
</p>
</li>
<li> <p><code>plot.lm()</code> would sometimes scramble the labels
in plot type 5.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15458">PR#15458</a> and <a href="https://bugs.R-project.org/show_bug.cgi?id=14837">PR#14837</a>)
</p>
</li>
<li> <p><code>min()</code> did not handle <code>NA_character_</code> values
properly.  (Reported by Magnus Thor Torfason.)
</p>
</li>
<li><p> (Windows only.)  <code>readRegistry()</code> would duplicate
default values for keys.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15455">PR#15455</a>)
</p>
</li>
<li> <p><code>str(..., strict.width = "cut")</code> did not handle
it properly when more than one line needed to be cut.  (Reported
by Gerrit Eichner.)
</p>
</li>
<li><p> Removing subclass back-references when S4 classes were
removed or their namespace unloaded had several bugs (e.g., <a href="https://bugs.R-project.org/show_bug.cgi?id=15481">PR#15481</a>).
</p>
</li>
<li> <p><code>aggregate()</code> could fail when there were too many
levels present in the <code>by</code> argument.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15004">PR#15004</a>)
</p>
</li>
<li> <p><code>namespaceImportFrom()</code> needed to detect primitive
functions when checking for duplicated imports (reported by
Karl Forner).
</p>
</li>
<li> <p><code>getGraphicsEvent()</code> did not exit when a user closed
the graphics window.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15208">PR#15208</a>)
</p>
</li>
<li><p> Errors in vignettes were not always captured and displayed
properly.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15495">PR#15495</a>)
</p>
</li>
<li> <p><code>contour()</code> could fail when dealing with extremely
small z values.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15454">PR#15454</a>)
</p>
</li>
<li><p> Several functions did not handle zero-length vectors properly,
including <code>browseEnv()</code>, <code>format()</code>, <code>gl()</code>,
<code>relist()</code> and <code>summary.data.frame()</code>.  (E.g., <a href="https://bugs.R-project.org/show_bug.cgi?id=15499">PR#15499</a>)
</p>
</li>
<li> <p><code>Sweave()</code> did not restore the <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> output to the
console if it was interrupted by a user in the middle of evaluating
a code chunk.  (Reported by Michael Sumner.)
</p>
</li>
<li><p> Fake installs of packages with vignettes work again.
</p>
</li>
<li><p> Illegal characters in the input caused <code>parse()</code>
(and thus <code>source()</code>) to segfault.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15518">PR#15518</a>)
</p>
</li>
<li><p> The nonsensical use of <code>nmax = 1</code> in
<code>duplicated()</code> or <code>unique()</code> is now silently ignored.
</p>
</li>
<li> <p><code>qcauchy(p, *)</code> is now fully accurate even when p is
very close to 1. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15521">PR#15521</a>)
</p>
</li>
<li><p> The <code>validmu()</code> and <code>valideta()</code> functions in the
standard <code>glm()</code> families now also report non-finite values,
rather than failing.
</p>
</li>
<li><p> Saved vignette results (in a &lsquo;<span class="file">.Rout.save</span>&rsquo; file) were
not being compared to the new ones during <code>R CMD check</code>.
</p>
</li>
<li><p> Double-clicking outside of the list box (e.g., on the scrollbar)
of a Tk listbox widget generated by <code>tk_select.list()</code> no
longer causes the window to close. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15407">PR#15407</a>)
</p>
</li>
<li><p> Improved handling of edge cases in
<code>parallel::splitindices()</code>. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15552">PR#15552</a>)
</p>
</li>
<li><p> HTML display of results from <code>help.search()</code> and
<code>??</code> sometimes contained badly constructed links.
</p>
</li>
<li> <p><code>c()</code> and related functions such as <code>unlist()</code>
converted raw vectors to invalid logical vectors. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15535">PR#15535</a>)
</p>
</li>
<li><p> (Windows only) When a call to <code>system2()</code> specified
one of <code>stdin</code>, <code>stdout</code> or <code>stderr</code> to be a file,
but the command was not found (e.g., it contained its arguments,
or the program was not on the <span class="env">PATH</span>), it left the file open
and unusable until <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> terminated.  (Reported by Mathew McLean.)
</p>
</li>
<li><p> The <code>bmp()</code> device was not recording <code>res = NA</code>
correctly: it is now recorded as 72 ppi.
</p>
</li>
<li><p> Several potential problems with compiler-specific behaviour
have been identified using the &lsquo;Undefined Behaviour
Sanitizer&rsquo; in conjunction with the <code>clang</code> compiler.
</p>
</li>
<li> <p><code>hcl()</code> now honours <code>NA</code> inputs (previously they
were mapped to black).
</p>
</li>
<li><p> Some translations in base packages were being looked up in
the main catalog rather than that for the package.
</p>
</li>
<li><p> As a result of the 3.0.2 change about &lsquo;the last
second before the epoch&rsquo;, most conversions which should have given
<code>NA</code> returned that time.  (The platforms affected include
Linux and OS X, but not Windows nor Solaris.)
</p>
</li>
<li> <p><code>rowsum()</code> has more support for matrices and data frames
with <i>2^31</i> or more elements. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15587">PR#15587</a>)
</p>
</li>
<li> <p><code>predict(&lt;lm object&gt;, interval = "confidence", scale =
	&lt;something&gt;)</code> now works.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15564">PR#15564</a>)
</p>
</li>
<li><p> The bug fix in 3.0.2 for <a href="https://bugs.R-project.org/show_bug.cgi?id=15411">PR#15411</a> was too aggressive,
and sometimes removed spaces that should not have been removed.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=15583">PR#15583</a>)
</p>
</li>
<li><p> Running <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> code in a <span class="pkg">tcltk</span> callback failed to set the
busy flag, which will be needed to tell OS X not to &lsquo;App Nap&rsquo;.
</p>
</li>
<li><p> The code for date-times before 1902 assumed that the offset
from GMT in 1902 was a whole number of minutes: that was not true
of Paris (as recorded on some platforms).
</p>
</li>
<li><p> Using <code>Sys.setlocale</code> to set <code>LC_NUMERIC</code> to
<code>"C"</code> (to restore the sane behavior) no longer gives a
warning.
</p>
</li>
<li> <p><code>deparse()</code> now deparses complex vectors in a way that
re-parses to the original values.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15534">PR#15534</a>, patch based on code
submitted by Alex Bertram.)
</p>
</li>
<li><p> In some extreme cases (more than <i>10^15</i>)
integer inputs to <code>dpqrxxx()</code> functions might have been
rounded up by one (with a warning about being non-integer).
(<a href="https://bugs.R-project.org/show_bug.cgi?id=15624">PR#15624</a>)
</p>
</li>
<li><p> Plotting symbol <code>pch = 14</code> had the triangle upside down
on some devices (typically screen devices). The triangle is
supposed to be point up.  (Reported by Bill Venables.)
</p>
</li>
<li> <p><code>getSrcref()</code> did not work on method definitions if
<code>rematchDefinition()</code> had been used.
</p>
</li>
<li> <p><code>KalmanForecast(fast = FALSE)</code> reported a (harmless)
stack imbalance.
</p>
</li>
<li><p> The count of observations used by <code>KalmanRun()</code> did not
take missing values into account.
</p>
</li>
<li><p> In locales where the abbreviated name of one month is a
partial match for the full name of a later one, the <code>%B</code>
format in <code>strptime()</code> could fail.  An example was French on
OS X, where <span class="samp">juin</span> is abbreviated to <span class="samp">jui</span> and partially
matches <code>juillet</code>.  Similarly for weekday names.
</p>
</li>
<li> <p><code>pbeta(x, a, b, log.p = TRUE)</code> sometimes underflowed to
zero for very small and very differently sized <code>a</code>, <code>b</code>.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=15641">PR#15641</a>)
</p>
</li>
<li> <p><code>approx()</code> and <code>approxfun()</code> now handle infinite
values with the <code>"constant"</code> method. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15655">PR#15655</a>)
</p>
</li>
<li> <p><code>stripchart()</code> again respects reversed limits in
<code>xlim</code> and <code>ylim</code>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15664">PR#15664</a>)
</p>
</li></ul>




<h3><img src="../help/figures/../../html/Rlogo.svg" class="toplogo" alt="[R logo]" /> CHANGES IN R 3.0.2</h3>



<h4>NEW FEATURES</h4>


<ul>
<li><p> The &lsquo;<span class="file">NEWS</span>&rsquo; files have been re-organized.
</p>
<p>This file contains news for <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> &gt;= 3.0.0: news for the 0.x.y, 1.x.y
and 2.x.y releases is in files &lsquo;<span class="file">NEWS.0</span>&rsquo;, &lsquo;<span class="file">NEWS.1</span>&rsquo; and
&lsquo;<span class="file">NEWS.2</span>&rsquo;.  The latter files are now installed when <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> is
installed.  An HTML version of news from 2.10.0 to 2.15.3 is
available as &lsquo;<span class="file">doc/html/NEWS.2.html</span>&rsquo;.
</p>
</li>
<li> <p><code>sum()</code> for integer arguments now uses an integer
accumulator of at least 64 bits and so will be more accurate in
the very rare case that a cumulative sum exceeds
<i>2^53</i> (necessarily summing more than 4 million
elements).
</p>
</li>
<li><p> The <code>example()</code> and <code>tools::Rd2ex()</code> functions now
have parameters to allow them to ignore <code>\dontrun</code> markup in
examples.  (Suggested by Peter Solymos.)
</p>
</li>
<li> <p><code>str(x)</code> is considerably faster for very large lists,
or factors with 100,000 levels, the latter as in <a href="https://bugs.R-project.org/show_bug.cgi?id=15337">PR#15337</a>.
</p>
</li>
<li> <p><code>col2rgb()</code> now converts factors to character strings
not integer codes (suggested by Bryan Hanson).
</p>
</li>
<li> <p><code>tail(warnings())</code> now works, <em>via</em> the new
<code>`[`</code> method.
</p>
</li>
<li><p> There is now support for the LaTeX style file &lsquo;<span class="file">zi4.sty</span>&rsquo;
which has in some distributions replaced &lsquo;<span class="file">inconsolata.sty</span>&rsquo;.
</p>
</li>
<li> <p><code>unlist(x)</code> now typically returns all non-list
<code>x</code>s unchanged, not just the &ldquo;vector&rdquo; ones.
Consequently, <code>format(lst)</code> now also works when the list
<code>lst</code> has non-vector elements.
</p>
</li>
<li><p> The <code>tools::getVignetteInfo()</code> function has been added
to give information about installed vignettes.
</p>
</li>
<li><p> New <code>assertCondition()</code>, etc. utilities in <span class="pkg">tools</span>, useful
for testing.
</p>
</li>
<li><p> Profiling now records non-inlined calls from byte-compiled
code to <code>BUILTIN</code> functions.
</p>
</li>
<li><p> Various functions in <span class="pkg">stats</span> and elsewhere that use
non-standard evaluation are now more careful to follow the
namespace scoping rules.  E.g., <code>stats::lm()</code> can now find
<code>stats::model.frame()</code> even if <span class="pkg">stats</span> is not on the
search path or if some package defines a function of that name.
</p>
</li>
<li><p> If an invalid/corrupt <code>.Random.seed</code> object is
encountered in the workspace it is ignored with a warning rather
than giving an error.  (This allows <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> itself to rely on a working
RNG, e.g. to choose a random port.)
</p>
</li>
<li> <p><code>seq()</code> and <code>seq.int()</code> give more explicit error
messages if called with invalid (e.g., <code>NaN</code>) inputs.
</p>
</li>
<li><p> When <code>parse()</code> finds a syntax error, it now makes
partial parse information available up to the location of the
error.  (Request of Reijo Sund.)
</p>
</li>
<li><p> Methods invoked by <code>NextMethod()</code> had a different
dynamic parent to the generic. This was causing trouble where S3
methods invoked <em>via</em> lazy evaluation could lose track of
their generic.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15267">PR#15267</a>)
</p>
</li>
<li><p> Code for the negative binomial distribution now treats the case
<code>size == 0</code> as a one-point distribution at zero.
</p>
</li>
<li> <p><code>abbreviate()</code> handles without warning non-ASCII input
strings which require no abbreviation.
</p>
</li>
<li> <p><code>read.dcf()</code> no longer has a limit of 8191 bytes per
line. (Wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=15250">PR#15250</a>.)
</p>
</li>
<li> <p><code>formatC(x)</code> no longer copies the class of <code>x</code> to
the result, to avoid misuse creating invalid objects as in
<a href="https://bugs.R-project.org/show_bug.cgi?id=15303">PR#15303</a>.  A warning is given if a class is discarded.
</p>
</li>
<li><p> Dataset <code>npk</code> has been copied from <a href="https://CRAN.R-project.org/package=MASS"><span class="pkg">MASS</span></a> to
allow more tests to be run without recommended packages being
installed.
</p>
</li>
<li><p> The initialization of the regression coefficients for
non-degenerate differenced models in <code>arima()</code> has been
changed and in some examples avoids a local maximum.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15396">PR#15396</a>)
</p>
</li>
<li> <p><code>termplot()</code> now has an argument <code>transform.x</code>
to control the display of individual terms in the plot.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=15329">PR#15329</a>)
</p>
</li>
<li> <p><code>format()</code> now supports <code>digits = 0</code>, to
display <code>nsmall</code> decimal places.
</p>
</li>
<li><p> There is a new read-only <code>par()</code> parameter called
<code>"page"</code>, which returns a logical value indicating whether
the next <code>plot.new()</code> call will start a new page.
</p>
</li>
<li><p> Processing Sweave and Rd documents to PDF now renders
backticks and single quotes better in several instances, including
in <span class="samp">\code</span> and <span class="samp">\samp</span> expressions.
</p>
</li>
<li> <p><code>utils::modifyList()</code> gets a new argument <code>keep.null</code>
allowing <code>NULL</code> components in the replacement to be retained,
instead of causing corresponding components to be deleted.
</p>
</li>
<li> <p><code>tools::pkgVignettes()</code> gains argument <code>check</code>;
if set to <code>TRUE</code>, it will warn when it appears a vignette requests
a non-existent vignette engine.
</p>
</li></ul>




<h4>UTILITIES</h4>


<ul>
<li> <p><code>R CMD check --as-cran</code> checks the line widths in
usage and examples sections of the package Rd files.
</p>
</li>
<li> <p><code>R CMD check --as-cran</code> now implies <span class="option">--timings</span>.
</p>
</li>
<li> <p><code>R CMD check</code> looks for command <code>gfile</code> if a
suitable <code>file</code> is not found.  (Although <code>file</code> is
not from GNU, OpenCSW on Solaris installs it as <code>gfile</code>.)
</p>
</li>
<li> <p><code>R CMD build</code> (with the internal <code>tar</code>) checks
the permissions of &lsquo;<span class="file">configure</span>&rsquo; and &lsquo;<span class="file">cleanup</span>&rsquo; files and
adds execute permission to the recorded permissions for these
files if needed, with a warning.  This is useful on OSes and file
systems which do not support execute permissions (notably, on
Windows).
</p>
</li>
<li> <p><code>R CMD build</code> now weaves and tangles all vignettes,
so suggested packages are not required during package installation
if the source tarball was prepared with current
<code>R CMD build</code>.
</p>
</li>
<li> <p><code>checkFF()</code> (used by <code>R CMD check</code>) does a
better job of detecting calls from other packages, including not
reporting those where a function has been copied from another
namespace (e.g., as a default method).  It now reports calls where
<code>.NAME</code> is a symbol registered in another package.
</p>
</li>
<li><p> On Unix-alike systems, <code>R CMD INSTALL</code> now installs packages
group writably whenever the library (<code>lib.loc</code>) is group
writable.  Hence, <code>update.packages()</code> works for other group
members (suggested originally and from a patch by Dirk Eddelbuettel).
</p>
</li>
<li> <p><code>R CMD javareconf</code> now supports the use of symbolic
links for <span class="env">JAVA_HOME</span> on platforms which have
<code>realpath</code>.  So it is now possible to
use </p>
<pre>R CMD javareconf JAVA_HOME=/usr/lib/jvm/java-1.7.0</pre>
<p>on a Linux system and record that value rather than the
frequently-changing full path such as
&lsquo;<span class="file">/usr/lib/jvm/java-1.7.0-openjdk-1.7.0.25.x86_64</span>&rsquo;.
</p>
</li>
<li><p> (Windows only.) <code>Rscript -e</code> requires a non-empty
argument for consistency with Unix versions of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>.  (Also
<code>Rterm -e</code> and <code>R -e</code>.)
</p>
</li>
<li> <p><code>R CMD check</code> does more thorough checking of
declared packages and namespaces.  It reports
</p>

<ul>
<li><p> packages declared in more than one of the
<span class="samp">Depends</span>, <span class="samp">Imports</span>, <span class="samp">Suggests</span> and
<span class="samp">Enhances</span> fields of the &lsquo;<span class="file">DESCRIPTION</span>&rsquo; file.
</p>
</li>
<li><p> namespaces declared in <span class="samp">Imports</span> but not
imported from, neither in the &lsquo;<span class="file">NAMESPACE</span>&rsquo; file nor using
the <code>::</code> nor <code>:::</code> operators.
</p>
</li>
<li><p> packages which are used in <code>library()</code> or
<code>requires()</code> calls in the <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> code but were already put on
the search path <em>via</em> <span class="samp">Depends</span>.
</p>
</li>
<li><p> packages declared in <span class="samp">Depends</span> not imported
<em>via</em> the &lsquo;<span class="file">NAMESPACE</span>&rsquo; file (except the standard
packages).  Objects used from <span class="samp">Depends</span> packages should be
imported to avoid conflicts and to allow correct operation when
the namespace is loaded but not attached.
</p>
</li>
<li><p> objects imported <em>via</em> <code>:::</code> calls where
<code>::</code> would do.
</p>
</li>
<li><p> objects imported by <code>::</code> which are not exported.
</p>
</li>
<li><p> objects imported by <code>:::</code> calls which do not exist.
</p>
</li></ul>

<p>See &lsquo;Writing R Extensions&rsquo; for good practice.
</p>
</li>
<li> <p><code>R CMD check</code> optionally checks for non-standard
top-level files and directories (which are often mistakes): this
is enabled for <span class="option">--as-cran</span>.
</p>
</li>
<li><p> LaTeX style file <code>upquote.sty</code> is no longer included
(the version was several years old): it is no longer used in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>.
A much later version is commonly included in LaTeX distributions
but does not play well with the <code>ae</code> fonts which are the
default for Sweave vignettes.
</p>
</li>
<li> <p><code>R CMD build</code> makes more use of the &lsquo;<span class="file">build</span>&rsquo;
sub-directory of package sources, for example to record
information about the vignettes.
</p>
</li>
<li> <p><code>R CMD check</code> analyses <code>:::</code> calls.
</p>
</li></ul>




<h4>INSTALLATION and INCLUDED SOFTWARE</h4>


<ul>
<li><p> The macros used for the texinfo manuals have been changed to
work better with the incompatible changes made in <code>texinfo
      5.x</code>.
</p>
</li>
<li><p> The minimum version for a system <code>xz</code> library is now
5.0.3 (was 4.999).  This is in part to avoid 5.0.2, which can
compress in ways other versions cannot decompress.
</p>
</li>
<li><p> The included version of PCRE has been updated to 8.33.
</p>
</li>
<li><p> The included version of <code>zlib</code> has been updated to
1.2.8, a bug-fix release.
</p>
</li>
<li><p> The included version of xz utils's <code>liblzma</code> has been
updated to 5.0.5.
</p>
</li>
<li><p> Since <code>javareconf</code> (see above) is used when <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> is
installed, a stable link for <span class="env">JAVA_HOME</span> can be supplied then.
</p>
</li>
<li><p> Configuring with <span class="option">--disable-byte-compilation</span> will
override the &lsquo;<span class="file">DESCRIPTION</span>&rsquo; files of recommended packages,
which typically require byte-compilation.
</p>
</li>
<li><p> More of the installation and checking process will work even
when <span class="env">TMPDIR</span> is set to a path containing spaces, but this is
not recommended and external software (such as
<code>texi2dvi</code>) may fail.
</p>
</li></ul>




<h4>PACKAGE INSTALLATION</h4>


<ul>
<li><p> Installation is aborted immediately if a <code>LinkingTo</code>
package is not installed.
</p>
</li>
<li> <p><code>R CMD INSTALL</code> has a new option
<code>--no-byte-compile</code> which will override a <span class="samp">ByteCompile</span>
field in the package's &lsquo;<span class="file">DESCRIPTION</span>&rsquo; file.
</p>
</li>
<li><p> License <span class="samp">BSD</span> is deprecated: use <span class="samp">BSD_3_clause</span>
or <span class="samp">BSD_2_clause</span> instead.
</p>
<p>License <span class="samp">X11</span> is deprecated: use <span class="samp">MIT</span> or
<span class="samp">BSD_2_clause</span> instead.
</p>
</li>
<li><p> Version requirements for <code>LinkingTo</code> packages are now
recognized: they are checked at installation.  (Fields with
version requirements were previously silently ignored.)
</p>
</li>
<li><p> The limit of 500 <code>S3method</code> entries in a
<code>NAMESPACE</code> file has been removed.
</p>
</li>
<li><p> The default &lsquo;version&rsquo; of Bioconductor for its
packages has been changed to the upcoming <span class="samp">2.13</span>, but this
can be set by the environment variable <span class="env">R_BIOC_VERSION</span> when
<span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> is installed.
</p>
</li></ul>




<h4>C-LEVEL FACILITIES</h4>


<ul>
<li> <p>&lsquo;<span class="file">Rdefines.h</span>&rsquo; has been tweaked so it can be included in
C++ code after &lsquo;<span class="file">R_ext/Boolean.h</span>&rsquo; (which is included by
&lsquo;<span class="file">R.h</span>&rsquo;).
</p>
<p>Note that &lsquo;<span class="file">Rdefines.h</span>&rsquo; is not kept up-to-date, and
&lsquo;<span class="file">Rinternals.h</span>&rsquo; is preferred for new code.
</p>
</li>
<li> <p><code>eval</code> and <code>applyClosure</code> are now protected
against package code supplying an invalid <code>rho</code>.
</p>
</li></ul>




<h4>DEPRECATED AND DEFUNCT</h4>


<ul>
<li><p> The unused <code>namespace</code> argument to
<code>package.skeleton()</code> is now formally deprecated and will be
removed in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.1.0.
</p>
</li>
<li> <p><code>plclust()</code> is deprecated: use the <code>plot()</code> method
for class <code>"hclust"</code> instead.
</p>
</li>
<li><p> Functions <code>readNEWS()</code> and <code>checkNEWS()</code> in
package <span class="pkg">tools</span> are deprecated (and they have not worked with
current &lsquo;<span class="file">NEWS</span>&rsquo; files for a long time).
</p>
</li></ul>




<h4>DOCUMENTATION</h4>


<ul>
<li> <p>&lsquo;An Introduction to R&rsquo; has a new chapter on using <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>
as a scripting language including interacting with the OS.
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li> <p><code>help.request()</code> could not determine the current version
of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> on CRAN.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15241">PR#15241</a>)
</p>
</li>
<li><p> On Windows, <code>file.info()</code> failed on root directories unless
the path was terminated with an explicit <code>"."</code>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15302">PR#15302</a>)
</p>
</li>
<li><p> The <code>regmatches&lt;-()</code> replacement function mishandled
results coming from <code>regexpr()</code>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15311">PR#15311</a>)
</p>
</li>
<li><p> The help for <code>setClass()</code> and
<code>representation()</code> still suggested the deprecated argument
<code>representation=</code>. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15312">PR#15312</a>)
</p>
</li>
<li> <p><code>R CMD config</code> failed in an installed build of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>
3.0.1 (only) when a sub-architecture was used.  (Reported by
Berwin Turlach.)
</p>
</li>
<li><p> On Windows, the installer modified the &lsquo;<span class="file">etc/Rconsole</span>&rsquo;
and &lsquo;<span class="file">etc/Rprofile.site</span>&rsquo; files even when default options were
chosen, so the MD5 sums did not refer to the installed versions.
(Reported by Tal Galili.)
</p>
</li>
<li> <p><code>plot(hclust(), cex =)</code> respects <code>cex</code> again
(and possibly others similarly).  (Reported by Peter Langfelder.)
</p>
</li>
<li><p> If multiple packages were checked by <code>R CMD check</code>,
and one was written for a different OS, it would set
<code>--no-install</code> for all following packages as well as
itself.
</p>
</li>
<li> <p><code>qr.coef()</code> and related functions did not properly coerce
real vectors to complex when necessary.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15332">PR#15332</a>)
</p>
</li>
<li> <p><code>ftable(a)</code> now fixes up empty <code>dimnames</code> such
that the result is printable.
</p>
</li>
<li> <p><code>package.skeleton()</code> was not starting its search for
function objects in the correct place if <code>environment</code> was
supplied.  (Reported by Karl Forner.)
</p>
</li>
<li><p> Parsing code was changing the length field of vectors and
confusing the memory manager.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15345">PR#15345</a>)
</p>
</li>
<li><p> The Fortran routine <code>ZHER2K</code> in the reference BLAS
had a comment-out bug in two places.
This caused trouble with <code>eigen()</code> for Hermitian matrices.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=15345">PR#15345</a> and report from Robin Hankin)
</p>
</li>
<li> <p><code>vignette()</code> and <code>browseVignettes()</code> did not
display non-Sweave vignettes properly.
</p>
</li>
<li><p> Two warning/error messages have been corrected:
the (optional) warning produced by a partial name match
with a pairlist, the error message from a zero-length argument to
the <code>:</code> operator.  (Found by Radford Neal; <a href="https://bugs.R-project.org/show_bug.cgi?id=15358">PR#15358</a>,
<a href="https://bugs.R-project.org/show_bug.cgi?id=15356">PR#15356</a>)
</p>
</li>
<li> <p><code>svd()</code> returned <code>NULL</code> rather than omitting
components as documented.  (Found by Radford Neal; <a href="https://bugs.R-project.org/show_bug.cgi?id=15360">PR#15360</a>)
</p>
</li>
<li> <p><code>mclapply()</code> and <code>mcparallel()</code> with
<code>silent = TRUE</code> could break a process that uses
<code>stdout</code> output
unguarded against broken pipes (e.g., <code>zip</code> will fail
silently). To work around such issues, they now replace
<code>stdout</code> with a descriptor pointed to &lsquo;<span class="file">/dev/null</span>&rsquo;
instead. For this purpose, internal <code>closeStdout</code> and
<code>closeStderr</code> functions have gained the <code>to.null</code> flag.
</p>
</li>
<li> <p><code>log()</code>, <code>signif()</code> and <code>round()</code> now raise an
error if a single named argument is not named <code>x</code>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15361">PR#15361</a>)
</p>
</li>
<li> <p><code>deparse()</code> now deparses raw vectors in a form that
is syntactically correct. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15369">PR#15369</a>)
</p>
</li>
<li><p> The <code>jpeg</code> driver in Sweave created a JPEG file, but gave
it a &lsquo;<span class="file">.png</span>&rsquo; extension. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15370">PR#15370</a>)
</p>
</li>
<li><p> Deparsing of infix operators with named arguments is
improved. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15350">PR#15350</a>)
</p>
</li>
<li> <p><code>mget()</code>, <code>seq.int()</code> and <code>numericDeriv()</code>
did not duplicate arguments properly. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15352">PR#15352</a>, <a href="https://bugs.R-project.org/show_bug.cgi?id=15353">PR#15353</a>,
<a href="https://bugs.R-project.org/show_bug.cgi?id=15354">PR#15354</a>)
</p>
</li>
<li> <p><code>kmeans(algorithm = "Hartigan-Wong")</code> now always stops
iterating in the QTran stage. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15364">PR#15364</a>).
</p>
</li>
<li> <p><code>read.dcf()</code> re-allocated incorrectly and so could
segfault when called on a file with lines of more than 100 bytes.
</p>
</li>
<li><p> On systems where <code>mktime()</code> does not set <code>errno</code>,
the last second before the epoch could not be converted from
<code>POSIXlt</code> to <code>POSIXct</code>. (Reported by Bill Dunlap.)
</p>
</li>
<li> <p><code>add1.glm()</code> miscalculated F-statistics when df &gt; 1. (Bill
Dunlap, <a href="https://bugs.R-project.org/show_bug.cgi?id=15386">PR#15386</a>).
</p>
</li>
<li> <p><code>stem()</code> now discards infinite inputs rather than
hanging.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15376">PR#15376</a>)
</p>
</li>
<li><p> The parser now enforces C99 syntax for floating point
hexadecimal constants (e.g., <code>0x1.1p0</code>), rather than returning
unintended values for malformed constants. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15234">PR#15234</a>)
</p>
</li>
<li> <p><code>model.matrix()</code> now works with very long LHS
names (more than 500 bytes).  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15377">PR#15377</a>)
</p>
</li>
<li> <p><code>integrate()</code> reverts to the pre-2.12.0 behaviour: from
2.12.0 to 3.0.1 it sometimes failed to achieve the requested
tolerance and reported error estimates that were exceeded.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=15219">PR#15219</a>)
</p>
</li>
<li> <p><code>strptime()</code> now handles <span class="samp">%W</span> fields with value
0. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15915">PR#15915</a>)
</p>
</li>
<li> <p><span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> is now better protected against people trying to interact
with the console in startup code.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15325">PR#15325</a>)
</p>
</li>
<li><p> Subsetting 1D arrays often lost dimnames (<a href="https://bugs.R-project.org/show_bug.cgi?id=15301">PR#15301</a>).
</p>
</li>
<li><p> Unary <code>+</code> on a logical vector did not coerce to
integer, although unary <code>-</code> did.
</p>
</li>
<li> <p><code>na.omit()</code> and <code>na.exclude()</code> added a row
to a zero-row data frame.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15399">PR#15399</a>)
</p>
</li>
<li><p> All the (where necessary cut-down) vignettes are installed
if <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> was configured with <span class="option">--without-recommended-packages</span>.
</p>
</li>
<li> <p><code>source()</code> did not display filenames when reporting
syntax errors.
</p>
</li>
<li><p> Syntax error reports misplaced the caret pointing out the bad
token.
</p>
</li>
<li><p> (Windows only) Starting <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> with <code>R</code> (instead of
<code>Rterm</code> or <code>Rgui</code>) would lose any
zero-length strings from the command line arguments. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15406">PR#15406</a>)
</p>
</li>
<li><p> Errors in the encoding specified on the command line
<em>via</em> <code>--encoding=foo</code> were not handled properly.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=15405">PR#15405</a>)
</p>
</li>
<li><p> If <code>x</code> is a symbol, <code>is.vector(x, "name")</code> now
returns <code>TRUE</code>, since <code>"name"</code> and <code>"symbol"</code>
should be synonyms.  (Reported by Hervé Pagès.)
</p>
</li>
<li> <p><code>R CMD rtags</code> works on platforms (such as OS X)
with a XSI-conformant shell command <code>echo</code>. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15231">PR#15231</a>)
</p>
</li>
<li> <p><code>is.unsorted(NA)</code> returns false as documented (rather than
<code>NA</code>).
</p>
</li>
<li> <p><code>R CMD LINK</code> did not know about sub-architectures.
</p>
</li>
<li> <p><code>system()</code> and <code>system2()</code> are better protected
against users who misguidedly have spaces in the temporary
directory path.
</p>
</li>
<li> <p><code>file.show()</code> and <code>edit()</code> are now more likely to
work on file paths containing spaces.  (Where external utilities
are used, not the norm on Windows nor in <code>R.app</code> which
should previously have worked.)
</p>
</li>
<li><p> Packages using the <span class="pkg">methods</span> package are more likely to
work when they import it but it is not attached.  (Several parts
of its C code were looking for its <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> functions on the search path
rather than in its namespace.)
</p>
</li>
<li> <p><code>lgamma(-x)</code> is no longer <code>NaN</code> for very small x.
</p>
</li>
<li><p> (Windows) <code>system2()</code> now respects specifying
<code>stdout</code> and <code>stderr</code> as files if called from
<code>Rgui</code>. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15393">PR#15393</a>)
</p>
</li>
<li><p> Closing an <code>x11()</code> device whilst <code>locator()</code> or
<code>identify()</code> is in progress no longer hangs <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15253">PR#15253</a>)
</p>
</li>
<li> <p><code>list.dirs(full.names = FALSE)</code> was not implemented.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=15170">PR#15170</a>)
</p>
</li>
<li> <p><code>format()</code> sometimes added unnecessary spaces.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=15411">PR#15411</a>)
</p>
</li>
<li> <p><code>all.equal(check.names = FALSE)</code> would ignore the request
to ignore the names and would check them as attributes.
</p>
</li>
<li><p> The symbol set by <code>tools::Rd2txt_options(itemBullet=)</code>
was not respected in some locales. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15435">PR#15435</a>)
</p>
</li>
<li> <p><code>mcMap()</code> was not exported by package
<span class="pkg">parallel</span>. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15439">PR#15439</a>)
</p>
</li>
<li> <p><code>plot()</code> for <code>TukeyHSD</code> objects did not balance
<code>dev.hold()</code> and <code>dev.flush()</code> calls on multi-page plots.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=15449">PR#15449</a>)
</p>
</li></ul>




<h3><img src="../help/figures/../../html/Rlogo.svg" class="toplogo" alt="[R logo]" /> CHANGES IN R 3.0.1</h3>



<h4>NEW FEATURES</h4>


<ul>
<li> <p><code>chooseCRANmirror()</code> and <code>chooseBioCmirror()</code> gain
an <code>ind</code> argument (like <code>setRepositories()</code>).
</p>
</li>
<li> <p><code>mcparallel</code> has a new argument <code>mc.interactive</code>
which can modify the interactive flag in the child process. The
new default is <code>FALSE</code> which makes child processes
non-interactive by default (this prevents lock-ups due to children
waiting for interactive input).
</p>
</li>
<li> <p><code>scan()</code> now warns when end-of-file occurs within
a quoted string.
</p>
</li>
<li> <p><code>count.fields()</code> is now consistent with <code>scan()</code>
in its handling of newlines in quoted strings.  Instead of
triggering an error, this results in the current line receiving
<code>NA</code> as the field count, with the next line getting the total
count of the two lines.
</p>
</li>
<li><p> The default method of <code>image()</code> will plot axes of the
class of <code>xlim</code> and <code>ylim</code> (and hence of <code>x</code> and
<code>y</code> if there is a suitable <code>range()</code> method).  Based on
a suggestion of Michael Sumner.
</p>
</li>
<li> <p><code>load()</code> now has a <code>verbose</code> argument for
debugging support, to print the names of objects just before
loading them.
</p>
</li>
<li><p> When loading a serialized object encounters a reference to a
namespace which cannot be loaded, this is replaced by a reference
to the global environment, with a warning.
</p>
</li>
<li> <p><code>pairs()</code> gains a <code>line.main</code> option for title placement.
</p>
</li>
<li><p> The remaining instances in which serialization to a raw
vector was limited to 2GB have been unlimited on a 64-bit
platform, and in most cases serialization to a vector of more than
1GB will be substantially faster.
</p>
</li></ul>




<h4>UTILITIES</h4>


<ul>
<li> <p><code>R CMD config</code> now make use of personal
&lsquo;<span class="file">Makevars</span>&rsquo; files under &lsquo;<span class="file">~/.R</span>&rsquo; and a site file
&lsquo;<span class="file">Makevars.site</span>&rsquo;, in the same way as <code>R CMD SHLIB</code> and
<code>R CMD INSTALL</code>.  This makes the utility more useful in
package <code>configure</code> scripts.
</p>
<p>On Windows finding the personal files may require the environment
variable <span class="env">HOME</span> set.
</p>
<p>The old behaviour can be obtained with the new options
<span class="option">--no-user-files</span> and <span class="option">--no-site-files</span>.
</p>
</li></ul>




<h4>PACKAGE INSTALLATION</h4>


<ul>
<li><p> Alternatives to the site and user customization files
&lsquo;<span class="file">Makevars.site</span>&rsquo; and &lsquo;<span class="file">~/.R/Makevars</span>&rsquo; can be specified
<em>via</em> the environment variables <span class="env">R_MAKEVARS_SITE</span> and
<span class="env">R_MAKEVARS_USER</span> respectively.  These can be used to suppress
the use of the default files by setting an empty value (where
possible) or a non-existent path.
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li> <p><code>sys.source()</code> did not report error locations when
<code>keep.source = TRUE</code>.
</p>
</li>
<li> <p><code>as.POSIXct.numeric</code> was coercing <code>origin</code> using
the <code>tz</code> argument and not <code>"GMT"</code> as documented
(<a href="https://bugs.R-project.org/show_bug.cgi?id=14973">PR#14973</a>).
</p>
</li>
<li><p> The active binding to assign fields in reference classes
has been cleaned up to reduce dependence on the class' package
environment, also fixing bug in initializing read-only fields
(inspired by a report from Hadley Wickham).
</p>
</li>
<li> <p><code>str(d)</code> no longer gives an error when <code>names(d)</code>
contain illegal multibyte strings (<a href="https://bugs.R-project.org/show_bug.cgi?id=15247">PR#15247</a>).
</p>
</li>
<li><p> Profiling of built-in functions with <code>line.profiling=
      TRUE</code> did not record the line from which they were called.
</p>
</li>
<li> <p><code>citation(pkg)</code> dropped the header and footer specified
in the &lsquo;<span class="file">CITATION</span>&rsquo; file (<a href="https://bugs.R-project.org/show_bug.cgi?id=15257">PR#15257</a>).
</p>
</li>
<li><p> Quotes were handled differently when reading the first line
and reading the rest, so <code>read.table()</code> misread some files
that contained quote characters (<a href="https://bugs.R-project.org/show_bug.cgi?id=15245">PR#15245</a>).
</p>
</li>
<li> <p><code>cat()</code> with <code>sep</code> a character vector of length
greater than one and more than one argument was using separators
inconsistently (<a href="https://bugs.R-project.org/show_bug.cgi?id=15261">PR#15261</a>).
</p>
</li>
<li><p> On Windows in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.0.0, <code>savePlot()</code> failed because of
an incorrect check on the argument count.
</p>
</li>
<li> <p><code>unzip(list = TRUE)</code> returned <code>Names</code> as a factor
and not a character vector (as documented) for the internal method.
(Noticed by Sean O'Riordain.)
</p>
</li>
<li> <p><code>contourLines()</code> now checks more comprehensively for
conformance of its <code>x</code>, <code>y</code> and <code>z</code> arguments (it
was used incorrectly in package <a href="https://CRAN.R-project.org/package=R2G2"><span class="pkg">R2G2</span></a>).
</p>
</li>
<li><p> Saved graphics display lists are <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> version-specific.
Attempting to load workspaces containing them (or some other
version-specific objects) aborted the load in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.0.0 and
earlier; now it does a partial load and generates a warning
instead.
</p>
</li>
<li><p> In <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.0.0, <code>identify()</code> and <code>locator()</code> did
not record information correctly, so replaying a graph (e.g., by
copying it to another device) would fail. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15271">PR#15271</a>)
</p>
</li>
<li><p> Calling <code>file.copy()</code> or <code>dirname()</code> with the
invalid input <code>""</code> (which was being used in packages, despite
not being a file path) could have caused a segfault.
</p>
<p><code>dirname("")</code> is now <code>""</code> rather than <code>"."</code> (unless
it segfaulted).
</p>
</li>
<li> <p><code>supsmu()</code> could read/write outside its input vectors
for very short inputs (seen in package <a href="https://CRAN.R-project.org/package=rms"><span class="pkg">rms</span></a> for <code>n = 4</code>).
</p>
</li>
<li> <p><code>as.dendrogram()</code>'s <code>hclust</code> method uses less
memory and hence gets considerably faster for large (n ~ 1000)
clusterings, thanks to Daniel Müllner. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15174">PR#15174</a>)
</p>
</li>
<li><p> The return value when all workers failed from
<code>parallel::mclapply(mc.preschedule = TRUE)</code> was a list of
strings and not of error objects.  (Spotted by Karl Forner and
Bernd Bischl.)
</p>
</li>
<li><p> In <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.0.0, when <code>help()</code> found multiple pages with
the same alias, the HTML display of all the selections was not
produced.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15282">PR#15282</a>)
</p>
</li>
<li> <p><code>splinefun(method="monoH.FC")</code> now produces a
function with first argument named <code>x</code> and allows
<code>deriv=3</code>, as documented. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15273">PR#15273</a>)
</p>
</li>
<li> <p><code>summaryRprof()</code> would only read the first
<code>chunksize</code> lines of an <code>Rprof</code> file produced with
<code>line.profiling=TRUE</code>. By default, this is the first 100
seconds.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=15288">PR#15288</a>)
</p>
</li>
<li> <p><code>lsfit()</code> produced an incorrect error message when
argument <code>x</code> had more columns than rows or <code>x</code> had a
different number of rows than <code>y</code>. (Spotted by Renaud Gaujoux.)
</p>
</li>
<li><p> Binary operations on equal length vectors copied the
class name from the second operand when the first had no
class name, but did not set the object bit. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15299">PR#15299</a>)
</p>
</li>
<li><p> The <code>trace()</code> method for reference generator objects
failed after those objects became function definitions.
</p>
</li>
<li> <p><code>write.table()</code> did not check that factors were
constructed correctly, and so caused a segment fault when
writing bad ones. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15300">PR#15300</a>)
</p>
</li>
<li><p> The internal HTTP server no longer chokes on POST requests
without body. It will also pass-through other request types for
custom handlers (with the method stored in Request-Method header)
instead of failing.
</p>
</li></ul>




<h3><img src="../help/figures/../../html/Rlogo.svg" class="toplogo" alt="[R logo]" /> CHANGES IN R 3.0.0</h3>



<h4>SIGNIFICANT USER-VISIBLE CHANGES</h4>


<ul>
<li><p> Packages need to be (re-)installed under this version
(3.0.0) of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>.
</p>
</li>
<li><p> There is a subtle change in behaviour for numeric index
values <i>2^31</i> and larger.  These never used to be
legitimate and so were treated as <code>NA</code>, sometimes with a
warning.  They are now legal for long vectors so there is no
longer a warning, and <code>x[2^31] &lt;- y</code> will now extend the
vector on a 64-bit platform and give an error on a 32-bit one.
</p>
</li>
<li><p> It is now possible for 64-bit builds to allocate amounts of
memory limited only by the OS.  It may be wise to use OS
facilities (e.g., <code>ulimit</code> in a <code>bash</code> shell,
<code>limit</code> in <code>csh</code>), to set limits on overall memory
consumption of an <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> process, particularly in a multi-user
environment.  A number of packages need a limit of at least 4GB of
virtual memory to load.
</p>
<p>64-bit Windows builds of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> are by default limited in memory usage
to the amount of RAM installed: this limit can be changed by
command-line option <span class="option">--max-mem-size</span> or setting environment
variable <span class="env">R_MAX_MEM_SIZE</span>.
</p>
</li>
<li><p> Negative numbers for colours are consistently an error:
previously they were sometimes taken as transparent, sometimes
mapped into the current palette and sometimes an error.
</p>
</li></ul>




<h4>NEW FEATURES</h4>


<ul>
<li> <p><code>identical()</code> has a new argument,
<code>ignore.environment</code>, used when comparing functions (with
default <code>FALSE</code> as before).
</p>
</li>
<li><p> There is a new option, <code>options(CBoundsCheck=)</code>, which
controls how <code>.C()</code> and <code>.Fortran()</code> pass arguments to
compiled code.  If true (which can be enabled by setting the
environment variable <span class="env">R_C_BOUNDS_CHECK</span> to <span class="samp">yes</span>), raw,
integer, double and complex arguments are always copied, and
checked for writing off either end of the array on return from the
compiled code (when a second copy is made).  This also checks
individual elements of character vectors passed to <code>.C()</code>.
</p>
<p>This is not intended for routine use, but can be very helpful in
finding segfaults in package code.
</p>
</li>
<li><p> In <code>layout()</code>, the limits on the grid size have been
raised (again).
</p>
</li>
<li><p> New simple <code>provideDimnames()</code> utility function.
</p>
</li>
<li><p> Where methods for <code>length()</code> return a double value
which is representable as an integer (as often happens for package
<a href="https://CRAN.R-project.org/package=Matrix"><span class="pkg">Matrix</span></a>), this is converted to an integer.
</p>
</li>
<li><p> Matrix indexing of data frames by two-column numeric indices
is now supported for replacement as well as extraction.
</p>
</li>
<li> <p><code>setNames()</code> now has a default for its <code>object</code>
argument, useful for a character result.
</p>
</li>
<li> <p><code>StructTS()</code> has a revised additive constant in the
<code>loglik</code> component of the result: the previous definition is
returned as the <code>loglik0</code> component.  However, the help page has
always warned of a lack of comparability of log-likelihoods for
non-stationary models.  (Suggested by Jouni Helske.)
</p>
</li>
<li><p> The logic in <code>aggregate.formula()</code> has been revised.
It is now possible to use a formula stored in a variable;
previously, it had to be given explicitly in the function call.
</p>
</li>
<li> <p><code>install.packages()</code> has a new argument <code>quiet</code> to
reduce the amount of output shown.
</p>
</li>
<li><p> Setting an element of the graphics argument <code>lwd</code> to a
negative or infinite value is now an error.  Lines corresponding
to elements with values <code>NA</code> or <code>NaN</code> are silently
omitted.
</p>
<p>Previously the behaviour was device-dependent.
</p>
</li>
<li><p> Setting graphical parameters <code>cex</code>, <code>col</code>,
<code>lty</code>, <code>lwd</code> and <code>pch</code> in <code>par()</code> now requires a
length-one argument.   Previously some silently took the first
element of a longer vector, but not always when documented to do so.
</p>
</li>
<li> <p><code>Sys.which()</code> when used with inputs which would be
unsafe in a shell (e.g., absolute paths containing spaces) now uses
appropriate quoting.
</p>
</li>
<li> <p><code>as.tclObj()</code> has been extended to handle raw vectors.
Previously, it only worked in the other direction.
(Contributed by Charlie Friedemann, <a href="https://bugs.R-project.org/show_bug.cgi?id=14939">PR#14939</a>.)
</p>
</li>
<li><p> New functions <code>cite()</code> and <code>citeNatbib()</code> have
been added, to allow generation of in-text citations from
<code>"bibentry"</code> objects.  A <code>cite()</code> function may be added
to <code>bibstyle()</code> environments.
</p>
</li>
<li><p> A <code>sort()</code> method has been added for <code>"bibentry"</code>
objects.
</p>
</li>
<li><p> The <code>bibstyle()</code> function now defaults to setting the
default bibliography style. The <code>getBibstyle()</code> function
has been added to report the name of the current default style.
</p>
</li>
<li> <p><code>scatter.smooth()</code> now has an argument <code>lpars</code> to
pass arguments to <code>lines()</code>.
</p>
</li>
<li> <p><code>pairs()</code> has a new <code>log</code> argument, to allow some
or all variables to be plotted on logarithmic scale.
(In part, wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=14919">PR#14919</a>.)
</p>
</li>
<li> <p><code>split()</code> gains a <code>sep</code> argument.
</p>
</li>
<li> <p><code>termplot()</code> does a better job when given a model with
interactions (and no longer attempts to plot interaction terms).
</p>
</li>
<li><p> The parser now incorporates code from Romain Francois'
<a href="https://CRAN.R-project.org/package=parser"><span class="pkg">parser</span></a> package, to support more detailed computation on
the code, such as syntax highlighting, comment-based
documentation, etc.  Functions <code>getParseData()</code> and
<code>getParseText()</code> access the data.
</p>
</li>
<li><p> There is a new function <code>rep_len()</code> analogous to
<code>rep.int()</code> for when speed is required (and names are not).
</p>
</li>
<li><p> The undocumented use <code>rep(NULL, length.out = n)</code> for
<code>n &gt; 0</code> (which returns <code>NULL</code>) now gives a warning.
</p>
</li>
<li> <p><code>demo()</code> gains an <code>encoding</code> argument for those
packages with non-ASCII demos: it defaults to the package encoding
where there is one.
</p>
</li>
<li> <p><code>strwrap()</code> converts inputs with a marked encoding to
the current locale: previously it made some attempt to pass
through as bytes inputs invalid in the current locale.
</p>
</li>
<li><p> Specifying both <code>rate</code> and <code>scale</code> to
<code>[dpqr]gamma</code> is a warning (if they are essentially the same
value) or an error.
</p>
</li>
<li> <p><code>merge()</code> works in more cases where the data frames
include matrices.  (Wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=14974">PR#14974</a>.)
</p>
</li>
<li> <p><code>optimize()</code> and <code>uniroot()</code> no longer use a
shared parameter object across calls.  (<code>nlm()</code>,
<code>nlminb()</code> and <code>optim()</code> with numerical derivatives
still do, as documented.)
</p>
</li>
<li><p> The <code>all.equal()</code> method for date-times is now
documented: times are regarded as equal (by default) if they
differ by up to 1 msec.
</p>
</li>
<li> <p><code>duplicated()</code> and <code>unique()</code> gain a <code>nmax</code>
argument which can be used to make them much more efficient when
it is known that there are only a small number of unique entries.
This is done automatically for factors.
</p>
</li>
<li><p> Functions <code>rbinom()</code>, <code>rgeom()</code>, <code>rhyper()</code>,
<code>rpois()</code>, <code>rnbinom(),</code> <code>rsignrank()</code> and
<code>rwilcox()</code> now return integer (not double) vectors.  This
halves the storage requirements for large simulations.
</p>
</li>
<li> <p><code>sort()</code>, <code>sort.int()</code> and <code>sort.list()</code> now
use radix sorting for factors of less than 100,000 levels when
<code>method</code> is not supplied.  So does <code>order()</code> if called
with a single factor, unless <code>na.last = NA</code>.
</p>
</li>
<li> <p><code>diag()</code> as used to generate a diagonal matrix has been
re-written in C for speed and less memory usage.  It now forces
the result to be numeric in the case <code>diag(x)</code> since it is
said to have &lsquo;zero off-diagonal entries&rsquo;.
</p>
</li>
<li> <p><code>backsolve()</code> (and <code>forwardsolve()</code>) are now
internal functions, for speed and support for large matrices.
</p>
</li>
<li><p> More matrix algebra functions (e.g., <code>chol()</code> and
<code>solve()</code>) accept logical matrices (and coerce to numeric).
</p>
</li>
<li> <p><code>sample.int()</code> has some support for  <i>n &gt;= 2^31</i>: see its help for the limitations.
</p>
<p>A different algorithm is used for <code>(n, size, replace = FALSE,
	prob = NULL)</code> for <code>n &gt; 1e7</code> and <code>size &lt;= n/2</code>.  This
is much faster and uses less memory, but does give different results.
</p>
</li>
<li> <p><code>approxfun()</code> and <code>splinefun()</code> now return a
wrapper to an internal function in the <span class="pkg">stats</span> namespace
rather than a <code>.C()</code> or <code>.Call()</code> call.  This is more
likely to work if the function is saved and used in a different
session.
</p>
</li>
<li><p> The functions <code>.C()</code>, <code>.Call()</code>,
<code>.External()</code> and <code>.Fortran()</code> now give an error (rather
than a warning) if called with a named first argument.
</p>
</li>
<li> <p><code>Sweave()</code> by default now reports the locations in
the source file(s) of each chunk.
</p>
</li>
<li> <p><code>clearPushBack()</code> is now a documented interface to a
long-existing internal call.
</p>
</li>
<li> <p><code>aspell()</code> gains filters for <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> code, Debian Control
Format and message catalog files, and support for <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> level
dictionaries.  In addition, package <span class="pkg">utils</span> now provides
functions <code>aspell_package_R_files()</code> and
<code>aspell_package_C_files()</code> for spell checking <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> and C level
message strings in packages.
</p>
</li>
<li> <p><code>bibentry()</code> gains some support for &ldquo;incomplete&rdquo;
entries with a <span class="samp">crossref</span> field.
</p>
</li>
<li> <p><code>gray()</code> and <code>gray.colors()</code> finally allow
<code>alpha</code> to be specified.
</p>
</li>
<li> <p><code>monthplot()</code> gains parameters to control the look of
the reference lines.  (Suggestion of Ian McLeod.)
</p>
</li>
<li><p> Added support for new <code>%~%</code> relation
(&ldquo;is distributed as&rdquo;) in plotmath.
</p>
</li>
<li> <p><code>domain = NA</code> is accepted by <code>gettext()</code> and
<code>ngettext()</code>, analogously to <code>stop()</code> etc.
</p>
</li>
<li> <p><code>termplot()</code> gains a new argument <code>plot = FALSE</code>
which returns information to allow the plots to be modified for
use as part of other plots, but does not plot them.
(Contributed by Terry Therneau, <a href="https://bugs.R-project.org/show_bug.cgi?id=15076">PR#15076</a>.)
</p>
</li>
<li> <p><code>quartz.save()</code>, formerly an undocumented part of
<code>R.app</code>, is now available to copy a device to a
<code>quartz()</code> device.  <code>dev.copy2pdf()</code> optionally does
this for PDF output: <code>quartz.save()</code> defaults to PNG.
</p>
</li>
<li><p> The default method of <code>pairs()</code> now allows
<code>text.panel = NULL</code> and the use of <code>&lt;foo&gt;.panel = NULL</code>
is now documented.
</p>
</li>
<li> <p><code>setRefClass()</code> and <code>getRefClass()</code> now return
class generator functions, similar to <code>setClass()</code>, but
still with the reference fields and methods as before
(suggestion of Romain Francois).
</p>
</li>
<li><p> New functions <code>bitwNot()</code>, <code>bitwAnd()</code>,
<code>bitwOr()</code> and <code>bitwXor()</code>, using the internal
interfaces previously used for classes <code>"octmode"</code> and
<code>"hexmode"</code>.
</p>
<p>Also <code>bitwShiftL()</code> and <code>bitwShiftR()</code> for shifting bits
in elements of integer vectors.
</p>
</li>
<li><p> New option <code>"deparse.cutoff"</code> to control the deparsing
of language objects such as calls and formulae when printing.
(Suggested by a comment of Sarah Goslee.)
</p>
</li>
<li> <p><code>colors()</code> gains an argument <code>distinct</code>.
</p>
</li>
<li><p> New <code>demo(colors)</code> and <code>demo(hclColors)</code>, with
utility functions.
</p>
</li>
<li> <p><code>list.files()</code> (aka <code>dir()</code>) gains a new optional
argument <code>no..</code> which allows to exclude <code>"."</code> and
<code>".."</code> from listings.
</p>
</li>
<li><p> Multiple time series are also of class <code>"matrix"</code>;
consequently, <code>head()</code>, e.g., is more useful.
</p>
</li>
<li> <p><code>encodeString()</code> preserves UTF-8 marked encodings.
Thus if factor levels are marked as UTF-8 an attempt is made to
print them in UTF-8 in <code>RGui</code> on Windows.
</p>
</li>
<li> <p><code>readLines()</code> and <code>scan()</code> (and hence
<code>read.table()</code>) in a UTF-8 locale now discard a UTF-8
byte-order-mark (BOM).  Such BOMs are allowed but not recommended
by the Unicode Standard: however Microsoft applications can
produce them and so they are sometimes found on websites.
</p>
<p>The encoding name <code>"UTF-8-BOM"</code> for a connection will
ensure that a UTF-8 BOM is discarded.
</p>
</li>
<li> <p><code>mapply(FUN, a1, ..)</code> now also works when <code>a1</code> (or
a further such argument) needs a <code>length()</code> method (which the
documented arguments never do).  (Requested by Hervé Pagès; with a
patch.)
</p>
</li>
<li> <p><code>.onDetach()</code> is supported as an alternative to
<code>.Last.lib</code>.  Unlike <code>.Last.lib</code>, this does not need to
be exported from the package's namespace.
</p>
</li>
<li><p> The <code>srcfile</code> argument to <code>parse()</code> may now be a
character string, to be used in error messages.
</p>
</li>
<li><p> The <code>format()</code> method for <code>ftable</code> objects gains
a <code>method</code> argument, propagated to <code>write.ftable()</code> and
<code>print()</code>, allowing more compact output, notably for LaTeX
formatting, thanks to Marius Hofert.
</p>
</li>
<li><p> The <code>utils::process.events()</code> function has been added
to trigger immediate event handling.
</p>
</li>
<li> <p><code>Sys.which()</code> now returns <code>NA</code> (not <code>""</code>) for
<code>NA</code> inputs (related to <a href="https://bugs.R-project.org/show_bug.cgi?id=15147">PR#15147</a>).
</p>
</li>
<li><p> The <code>print()</code> method for class <code>"htest"</code> gives
fewer trailing spaces (wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=15124">PR#15124</a>).
</p>
<p>Also print output from <code>HoltWinters()</code>, <code>nls()</code> and others.
</p>
</li>
<li> <p><code>loadNamespace()</code> allows a version specification to be
given, and this is used to check version specifications given in
the <span class="samp">Imports</span> field when a namespace is loaded.
</p>
</li>
<li> <p><code>setClass()</code> has a new argument, <code>slots</code>, clearer
and less ambiguous than <code>representation</code>.  It is recommended
for future code, but should be back-compatible.  At the same time,
the allowed slot specification is slightly more general.  See the
documentation for details.
</p>
</li>
<li> <p><code>mget()</code> now has a default for <code>envir</code> (the frame
from which it is called), for consistency with <code>get()</code> and
<code>assign()</code>.
</p>
</li>
<li> <p><code>close()</code> now returns an integer status where available,
invisibly. (Wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=15088">PR#15088</a>.)
</p>
</li>
<li><p> The internal method of <code>tar()</code> can now store paths too
long for the <span class="samp">ustar</span> format, using the (widely supported) GNU
extension.  It can also store long link names, but these are much
less widely supported.  There is support for larger files, up to
the <span class="samp">ustar</span> limit of 8GB.
</p>
</li>
<li><p> Local reference classes have been added to package
<span class="pkg">methods</span>.  These are a technique for avoiding unneeded
copying of large components of objects while retaining standard <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>
functional behavior.  See <code>?LocalReferenceClasses</code>.
</p>
</li>
<li> <p><code>untar()</code> has a new argument <code>restore_times</code> which
if false (not the default) discards the times in the tarball.
This is useful if they are incorrect (some tarballs submitted to
<acronym><span class="acronym">CRAN</span></acronym> have times in a local time zone or many years in the
past even though the standard required them to be in UTC).
</p>
</li>
<li> <p><code>replayplot()</code> cannot (and will not attempt to) replay
plots recorded under <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> &lt; 3.0.0.  It may crash the <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> session if
an attempt is made to replay plots created in a different build of
<span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> &gt;= 3.0.0.
</p>
</li>
<li><p> Palette changes get recorded on the display list, so
replaying plots (including when resizing screen devices and using
<code>dev.copy()</code>) will work better when the palette is changed
during a plot.
</p>
</li>
<li> <p><code>chol(pivot = TRUE)</code> now defaults to LAPACK, not LINPACK.
</p>
</li>
<li><p> The <code>parse()</code> function has a new parameter
<code>keep.source</code>, which defaults to <code>options("keep.source")</code>.
</p>
</li>
<li><p> Profiling <em>via</em> <code>Rprof()</code> now optionally records
information at the statement level, not just the function level.
</p>
</li>
<li><p> The <code>Rprof()</code> function now quotes function names in
in its output file on Windows, to be consistent with the quoting
in Unix.
</p>
</li>
<li><p> Profiling <em>via</em> <code>Rprof()</code> now optionally records
information about time spent in GC.
</p>
</li>
<li><p> The HTML help page for a package now displays non-vignette
documentation files in a more accessible format.
</p>
</li>
<li><p> To support <code>options(stringsAsFactors = FALSE)</code>,
<code>model.frame()</code>, <code>model.matrix()</code> and
<code>replications()</code> now automatically convert character
vectors to factors without a warning.
</p>
</li>
<li><p> The <code>print</code> method for objects of class <code>"table"</code>
now detects tables with 0-extents and prints the results as, e.g.,
<span class="samp">&lt; table of extent 0 x 1 x 2 &gt;</span>. (Wish of <a href="https://bugs.R-project.org/show_bug.cgi?id=15198">PR#15198</a>.)
</p>
</li>
<li><p> Deparsing involving calls to anonymous functions has been
made closer to reversible by the addition of extra parentheses.
</p>
</li>
<li><p> The function <code>utils::packageName()</code> has been added as
a lightweight version of <code>methods::getPackageName()</code>.
</p>
</li>
<li> <p><code>find.package(lib.loc = NULL)</code> now treats loaded
namespaces preferentially in the same way as attached packages
have been for a long time.
</p>
</li>
<li><p> In Windows, the Change Directory dialog now defaults to
the current working directory, rather than to the last directory
chosen in that dialog.
</p>
</li>
<li> <p><code>available.packages()</code> gains a
<code>"license/restricts_use"</code> filter which retains only packages
for which installation can proceed solely based on packages which
are guaranteed not to restrict use.
</p>
</li>
<li><p> New <code>check_packages_in_dir()</code> function in package
<span class="pkg">tools</span> for conveniently checking source packages along with
their reverse dependencies.
</p>
</li>
<li><p> R's completion mechanism has been improved to handle help
requests (starting with a question mark).  In particular, help
prefixes are now supported, as well as quoted help topics.  To
support this, completion inside quotes are now handled by R by
default on all platforms.
</p>
</li>
<li><p> The memory manager now allows the strategy used to balance
garbage collection and memory growth to be controlled by setting
the environment variable <span class="env">R_GC_MEM_GROW</span>. See <code>?Memory</code>
for more details.
</p>
</li>
<li><p> (&lsquo;For experts only&rsquo;, as the introductory manual
says.)  The use of environment variables <span class="env">R_NSIZE</span> and
<span class="env">R_VSIZE</span> to control the initial (= minimum) garbage
collection trigger for number of cons cels and size of heap has
been restored: they can be overridden by the command-line options
<code>--min-nsize</code> and <code>--min-vsize</code>; see <code>?Memory</code>.
</p>
</li>
<li><p> On Windows, the device name for bitmap devices as reported
by <code>.Device</code> and <code>.Devices</code> no longer includes the file
name.   This is for consistency with other platforms and was
requested by the <a href="https://CRAN.R-project.org/package=lattice"><span class="pkg">lattice</span></a> maintainer.
</p>
<p><code>win.metafile()</code> still uses the file name: the exact form is
used by package <a href="https://CRAN.R-project.org/package=tkrplot"><span class="pkg">tkrplot</span></a>.
</p>
</li>
<li> <p><code>set.seed(NULL)</code> re-initializes <code>.Random.seed</code> as
done at the beginning of the session if not already set.
(Suggestion of Bill Dunlap.)
</p>
</li>
<li><p> The <code>breaks</code> argument in <code>hist.default()</code> can now be
a function that returns the breakpoints to be used (previously it
could only return the suggested number of breakpoints).
</p>
</li>
<li><p> File &lsquo;<span class="file">share/licenses/licenses.db</span>&rsquo; has some
clarifications, especially as to which variants of &lsquo;BSD&rsquo;
and &lsquo;MIT&rsquo; is intended and how to apply them to packages.
The problematic licence &lsquo;Artistic-1.0&rsquo; has been removed.
</p>
</li></ul>




<h4>LONG VECTORS</h4>

<p>This section applies only to 64-bit platforms.
</p>

<ul>
<li><p> There is support for vectors longer than <i>2^31
      - 1</i> elements.  This applies to raw, logical, integer, double,
complex and character vectors, as well as lists.  (Elements of
character vectors remain limited to <i>2^31 - 1</i>
bytes.)
</p>
</li>
<li><p> Most operations which can sensibly be done with long vectors
work: others may return the error &lsquo;long vectors not
supported yet&rsquo;.  Most of these are because they explicitly work
with integer indices (e.g., <code>anyDuplicated()</code> and
<code>match()</code>) or because other limits (e.g., of character strings
or matrix dimensions) would be exceeded or the operations would be
extremely slow.
</p>
</li>
<li> <p><code>length()</code> returns a double for long vectors, and
lengths can be set to <i>2^31</i> or more by the
replacement function with a double value.
</p>
</li>
<li><p> Most aspects of indexing are available.  Generally
double-valued indices can be used to access elements beyond
<i>2^31 - 1</i>.
</p>
</li>
<li><p> There is some support for matrices and arrays with each
dimension less than <i>2^31</i> but total number of
elements more than that.  Only some aspects of matrix algebra work
for such matrices, often taking a very long time.  In other cases
the underlying Fortran code has an unstated restriction (as was
found for complex <code>svd()</code>).
</p>
</li>
<li> <p><code>dist()</code> can produce dissimilarity objects for more
than 65536 rows (but for example <code>hclust()</code> cannot process
such objects).
</p>
</li>
<li> <p><code>serialize()</code> to a raw vector is unlimited in size
(except by resources).
</p>
</li>
<li><p> The C-level function <code>R_alloc</code> can now allocate
<i>2^35</i> or more bytes.
</p>
</li>
<li> <p><code>agrep()</code> and <code>grep()</code> will return double vectors
of indices for long vector inputs.
</p>
</li>
<li><p> Many calls to <code>.C()</code> have been replaced by
<code>.Call()</code> to allow long vectors to be supported (now or in
the future).  Regrettably several packages had copied the non-API
<code>.C()</code> calls and so failed.
</p>
</li>
<li> <p><code>.C()</code> and <code>.Fortran()</code> do not accept long vector
inputs.  This is a precaution as it is very unlikely that existing
code will have been written to handle long vectors (and the <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>
wrappers often assume that <code>length(x)</code> is an integer).
</p>
</li>
<li><p> Most of the methods for <code>sort()</code> work for long vectors.
</p>
<p><code>rank()</code>, <code>sort.list()</code> and <code>order()</code> support
long vectors (slowly except for radix sorting).
</p>
</li>
<li> <p><code>sample()</code> can do uniform sampling from a long vector.
</p>
</li></ul>




<h4>PERFORMANCE IMPROVEMENTS</h4>


<ul>
<li><p> More use has been made of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> objects representing registered
entry points, which is more efficient as the address is provided
by the loader once only when the package is loaded.
</p>
<p>This has been done for packages <code>base</code>, <code>methods</code>,
<code>splines</code> and <code>tcltk</code>: it was already in place for the
other standard packages.
</p>
<p>Since these entry points are always accessed by the <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> entry
points they do not need to be in the load table which can be
substantially smaller and hence searched faster.  This does mean
that <code>.C</code> / <code>.Fortran</code> / <code>.Call</code> calls copied from
earlier versions of <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> may no longer work &ndash; but they were never
part of the API.
</p>
</li>
<li><p> Many <code>.Call()</code> calls in package <span class="pkg">base</span> have been
migrated to <code>.Internal()</code> calls.
</p>
</li>
<li> <p><code>solve()</code> makes fewer copies, especially when <code>b</code>
is a vector rather than a matrix.
</p>
</li>
<li> <p><code>eigen()</code> makes fewer copies if the input has dimnames.
</p>
</li>
<li><p> Most of the linear algebra functions make fewer copies when
the input(s) are not double (e.g., integer or logical).
</p>
</li>
<li><p> A foreign function call (<code>.C()</code> etc) in a package
without a <code>PACKAGE</code> argument will only look in the first DLL
specified in the &lsquo;<span class="file">NAMESPACE</span>&rsquo; file of the package rather than
searching all loaded DLLs.  A few packages needed <code>PACKAGE</code>
arguments added.
</p>
</li>
<li><p> The <code>@&lt;-</code> operator is now implemented as a primitive,
which should reduce some copying of objects when used.  Note that
the operator object must now be in package <span class="pkg">base</span>: do not try
to import it explicitly from package <span class="pkg">methods</span>.
</p>
</li></ul>




<h4>PACKAGE INSTALLATION</h4>


<ul>
<li><p> The transitional support for installing packages without
namespaces (required since <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.14.0) has been removed.
<code>R CMD build</code> will still add a namespace, but a
<code>.First.lib()</code> function will need to be converted.
</p>
<p><code>R CMD INSTALL</code> no longer adds a namespace (so
installation will fail), and a <code>.First.lib()</code> function in a
package will be ignored (with an installation warning for now).
</p>
<p>As an exception, packages without a &lsquo;<span class="file">R</span>&rsquo; directory and no
&lsquo;<span class="file">NAMESPACE</span>&rsquo; file can still be installed.
</p>
</li>
<li><p> Packages can specify in their &lsquo;<span class="file">DESCRIPTION file</span>&rsquo; a line
like </p>
<pre>     Biarch: yes
</pre>
<p>to be installed on Windows with <span class="option">--force-biarch</span>.
</p>
</li>
<li><p> Package vignettes can now be processed by other engines
besides <code>Sweave</code>; see &lsquo;Writing R Extensions&rsquo; and the
<code>tools::vignetteEngine</code> help topic for details.
</p>
</li>
<li><p> The &lsquo;<span class="file">*.R</span>&rsquo; tangled source code for vignettes is now
included in tarballs when <code>R CMD build</code> is used to produce
them.  In <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 3.0.0, &lsquo;<span class="file">*.R</span>&rsquo; files not in the sources will be
produced at install time, but eventually this will be dropped.
</p>
</li>
<li><p> The package type <code>"mac.binary"</code> now looks in a path in
the repository without any Mac subtype (which used to be
<span class="samp">universal</span> or <span class="samp">leopard</span>): it looks in
&lsquo;<span class="file">bin/macosx/contrib/3.0</span>&rsquo; rather than
&lsquo;<span class="file">bin/macosx/leopard/contrib/2.15</span>&rsquo;).  This is the type used
for the <acronym><span class="acronym">CRAN</span></acronym> binary distribution for OS X as from <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>
3.0.0.
</p>
</li>
<li><p> File &lsquo;<span class="file">etc/Makeconf</span>&rsquo; makes more use of the macros
<code>$(CC)</code>, <code>$(CXX)</code>, <code>$(F77)</code> and <code>$(FC)</code>, so
the compiler in use can be changed by setting just these (and if
necessary the corresponding flags and <code>FLIBS</code>) in file
&lsquo;<span class="file">~/.R/Makevars</span>&rsquo;.
</p>
<p>This is convenient for those working with binary distributions of
<span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>, e.g. on OS X.
</p>
</li></ul>




<h4>UTILITIES</h4>


<ul>
<li> <p><code>R CMD check</code> now gives a warning rather than a
note if it finds calls to <code>abort</code>, <code>assert</code> or
<code>exit</code> in compiled code, and has been able to find the
&lsquo;<span class="file">.o</span>&rsquo; file in which the calls occur.
</p>
<p>Such calls can terminate the <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> process which loads the package.
</p>
</li>
<li><p> The location of the build and check environment files can
now be specified by the environment variables
<span class="env">R_BUILD_ENVIRON</span> and <span class="env">R_CHECK_ENVIRON</span>, respectively.
</p>
</li>
<li> <p><code>R CMD Sweave</code> gains a <span class="option">--compact</span> option
to control possibly reducing the size of the PDF file it creates
when <span class="option">--pdf</span> is given.
</p>
</li>
<li> <p><code>R CMD build</code> now omits Eclipse's &lsquo;<span class="file">.metadata</span>&rsquo;
directories, and <code>R CMD check</code> warns if it finds them.
</p>
</li>
<li> <p><code>R CMD check</code> now does some checks on functions
defined within reference classes, including of <code>.Call()</code> etc
calls.
</p>
</li>
<li> <p><code>R CMD check --as-cran</code> notes assignments to the
global environment, calls to <code>data()</code> which load into the
global environment, and calls to <code>attach()</code>.
</p>
</li>
<li> <p><code>R CMD build</code> by default uses the internal method of
<code>tar()</code> to prepare the tarball.  This is more likely to
produce a tarball compatible with <code>R CMD INSTALL</code> and
<code>R CMD check</code>: an external <code>tar</code> program,
including options, can be specified <em>via</em> the environment
variable <span class="env">R_BUILD_TAR</span>.
</p>
</li>
<li> <p><code>tools::massageExamples()</code> is better protected against
packages which re-define base functions such as <code>cat()</code> and
<code>get()</code> and so can cause <code>R CMD check</code> to fail when
checking examples.
</p>
</li>
<li> <p><code>R CMD javareconf</code> has been enhanced to be more
similar to the code used by <code>configure</code>.
</p>
<p>There is now a test that a JNI program can be compiled (like
<code>configure</code> did) and only working settings are used.
</p>
<p>It makes use of custom settings from configuration recorded in
&lsquo;<span class="file">etc/javaconf</span>&rsquo;.
</p>
</li>
<li><p> The <span class="option">--no-vignettes</span> argument of <code>R CMD
	build</code> has been renamed to the more accurate
<span class="option">--no-build-vignettes</span>: its action has always been to
(re)build vignettes and never omitted them.
</p>
<p><code>R CMD check</code> accepts <span class="option">--no-build-vignettes</span> as a
preferred synonym for <span class="option">--no-rebuild-vignettes</span>.
</p>
</li></ul>




<h4>DEPRECATED AND DEFUNCT</h4>


<ul>
<li><p> The <code>ENCODING</code> argument to <code>.C()</code> is defunct.
Use <code>iconv()</code> instead.
</p>
</li>
<li><p> The <code>.Internal(eval.with.vis)</code> non-API function has
been removed.
</p>
</li>
<li><p> Support for the converters for use with <code>.C()</code> has been
removed, including the oft misused non-API header
&lsquo;<span class="file">R_ext/RConverters.h</span>&rsquo;.
</p>
</li>
<li><p> The previously deprecated uses of <code>array()</code> with a
0-length <code>dim</code> argument and <code>tapply()</code> with a 0-length
<code>INDEX</code> list are now errors.
</p>
</li>
<li> <p><span class="samp">Translation</span> packages are defunct.
</p>
</li>
<li><p> Calling <code>rep()</code> or <code>rep.int()</code> on a pairlist or
other non-vector object is now an error.
</p>
</li>
<li><p> Several non-API entry points have been transferred to
packages (e.g., <code>R_zeroin2</code>) or replaced by different non-API
entry points (e.g., <code>R_tabulate</code>).
</p>
</li>
<li><p> The &lsquo;internal&rsquo; graphics device invoked by
<code>.Call("R_GD_nullDevice", package = "grDevices")</code> has
been removed: use <code>pdf(file = NULL)</code> instead.
</p>
</li>
<li><p> The <code>.Fortran()</code> entry point <code>"dqrls"</code> which has
not been used by <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> since version 2.15.1 is no longer available.
</p>
</li>
<li><p> Functions <code>traceOn()</code> and <code>traceOff()</code> in package
<span class="pkg">methods</span> are now defunct.
</p>
</li>
<li><p> Function <code>CRAN.packages()</code> is finally defunct.
</p>
</li>
<li><p> Use of <code>col2rgb(0)</code> is defunct: use <code>par("bg")</code> or
<code>NA</code> instead.
</p>
</li>
<li><p> The long-defunct functions <code>Rd_parse()</code>,
<code>anovalist.lm()</code>, <code>categpry()</code>, <code>clearNames()</code>,
<code>gammaCody()</code>, <code>glm.fit.null()</code>, <code>lm.fit.null()</code>,
<code>lm.wfit.null()</code>, <code>manglePackageNames()</code>,
<code>mauchley.test()</code>, <code>package.contents()</code>,
<code>print.coefmat()</code>, <code>reshapeLong()</code>,
<code>reshapeWide()</code>, <code>tkclose()</code>, <code>tkcmd()</code>,
<code>tkfile.dir()</code>, <code>tkfile.tail()</code>, <code>tkopen()</code>,
<code>tkputs()</code>, <code>tkread()</code>, <code>trySilent()</code> and
<code>zip.file.extract()</code> have been removed entirely (but are
still documented in the help system).
</p>
</li>
<li><p> The unused <code>dataPath</code> argument to
<code>attachNamespace()</code> has been removed.
</p>
</li>
<li> <p><code>grid.prompt()</code> has been removed: use
<code>devAskNewPage()</code> instead.
</p>
</li>
<li><p> The long-deprecated <code>intensities</code> component is no
longer returned by <code>hist()</code>.
</p>
</li>
<li> <p><code>mean()</code> for data frames and <code>sd()</code> for data
frames and matrices are defunct.
</p>
</li>
<li> <p><code>chol(pivot = FALSE, LINPACK = TRUE)</code>,
<code>ch2inv(LINPACK = TRUE)</code>, <code>eigen(EISPACK = TRUE)</code>,
<code>solve(LINPACK = TRUE)</code> and <code>svd(LINPACK = TRUE)</code> are
defunct: LAPACK will be used, with a warning.
</p>
</li>
<li><p> The <code>keep.source</code> argument to <code>library()</code> and
<code>require()</code> is defunct.  This option needs to be set
at install time.
</p>
</li>
<li><p> Documentation for <code>real()</code>, <code>as.real()</code> and
<code>is.real()</code> has been moved to &lsquo;defunct&rsquo; and the
functions removed.
</p>
</li>
<li><p> The <code>maxRasters</code> argument of <code>pdf()</code> (unused since
<span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> 2.14.0) has been removed.
</p>
</li>
<li><p> The unused <code>fontsmooth</code> argument has been removed from
the <code>quartz()</code> device.
</p>
</li>
<li><p> All the (non-API) EISPACK entry points in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> have been removed.
</p>
</li>
<li> <p><code>chol(pivot = TRUE, LINPACK = TRUE)</code> is deprecated.
</p>
</li>
<li><p> The long-deprecated use of <code>\synopsis</code> in the
<span class="samp">Usage</span> section of &lsquo;<span class="file">.Rd</span>&rsquo; files will be removed in <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>
3.1.0.
</p>
</li>
<li> <p><code>.find.package()</code> and <code>.path.package()</code> are
deprecated: only the public versions without the dot have ever
been in the API.
</p>
</li>
<li><p> In a package's &lsquo;<span class="file">DESCRIPTION</span>&rsquo; file, </p>
<pre>    License: X11</pre>
<p>is deprecated, since it includes
&lsquo;Copyright (C) 1996 X Consortium&rsquo; which cannot be
appropriate for a current <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> package.  Use &lsquo;MIT&rsquo; or
&lsquo;BSD_2_clause&rsquo; instead.
</p>
</li></ul>




<h4>CODE MIGRATION</h4>


<ul>
<li><p> The C code underlying base graphics has been migrated to the
<span class="pkg">graphics</span> package (and hence no longer uses
<code>.Internal()</code> calls).
</p>
</li>
<li><p> Most of the <code>.Internal()</code> calls used in the <span class="pkg">stats</span>
package have been migrated to C code in that package.
</p>
<p>This means that a number of <code>.Internal()</code> calls which have
been used by packages no longer exist, including
<code>.Internal(cor)</code> <code>.Internal(cov)</code>,
<code>.Internal(optimhess)</code> and <code>.Internal(update.formula)</code>.
</p>
</li>
<li><p> Some <code>.External()</code> calls to the <code>base</code> package
(really to the <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> executable or shared library) have been moved to
more appropriate packages.  Packages should not have been using
such calls, but some did (mainly those used by <code>integrate()</code>).
</p>
</li></ul>




<h4>PACKAGE parallel</h4>


<ul>
<li><p> There is a new function <code>mcaffinity()</code> which allows
getting or setting the CPU affinity mask for the current <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> process on
systems that supports this (currently only Linux has been tested
successfully).  It has no effect on systems which do not support
process affinity.  Users are not expected to use this function
directly (with the exception of fixing libraries that break
affinity settings like OpenBLAS) &ndash; the function is rather
intended to support affinity control in high-level parallel
functions.  In the future, <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> may supplement lack of affinity
control in the OS by its own bookkeeping <em>via</em> <code>mcaffinity()</code>
related to processes and threads it spawns.
</p>
</li>
<li> <p><code>mcparallel()</code> has a new argument <code>mc.affinity</code>
which attempts to set the affinity of the child process according
to the specification contained therein.
</p>
</li>
<li><p> The port used by socket clusters is chosen randomly: this
should help to avoid clashes observed when two users of a
multi-user machine try to create a cluster at the same time.  To
reproduce the previous behaviour set environment variable
<span class="env">R_PARALLEL_PORT</span> to <code>10187</code>.
</p>
</li></ul>




<h4>C-LEVEL FACILITIES</h4>


<ul>
<li><p> There has been some minor re-organization of the non-API
header files.  In particular, &lsquo;<span class="file">Rinternals.h</span>&rsquo; no longer
includes the non-API header &lsquo;<span class="file">R_exts/PrtUtil.h</span>&rsquo;, and that no
longer includes &lsquo;<span class="file">R_exts/Print.h</span>&rsquo;.
</p>
</li>
<li><p> Passing <code>NULL</code> to <code>.C()</code> is now an error.
</p>
</li>
<li> <p><code>.C()</code> and <code>.Fortran()</code> now warn if
<code>"single"</code> arguments are used with <code>DUP = FALSE</code>, as
changes to such arguments are not returned to the caller.
</p>
</li>
<li><p> C entry points <code>R_qsort</code> and <code>R_qsort_I</code> now have
<code>start</code> and <code>end</code> as <code>size_t</code> to allow them to work
with longer vectors on 64-bit platforms.  Code using them should
be recompiled.
</p>
</li>
<li><p> A few recently added C entry points were missing the
remapping to <code>Rf_</code>, notably <code>[dpq]nbinom_mu</code>.
</p>
</li>
<li><p> Some of the interface pointers formerly available only to
<code>R.app</code> are now available to front-ends on all
Unix-alikes: one has been added for the interface to
<code>View()</code>.
</p>
</li>
<li> <p><code>PACKAGE = ""</code> is now an error in <code>.C()</code> etc calls:
it was always contrary to the documentation.
</p>
</li>
<li><p> Entry point <code>rcont2</code> has been migrated to package
<span class="pkg">stats</span> and so is no longer available.
</p>
</li>
<li> <p><code>R_SVN_REVISION</code> in &lsquo;<span class="file">Rversion.h</span>&rsquo; is now an integer
(rather than a string) and hence usable as e.g.
<code>#if R_SVN_REVISION &lt; 70000</code>.
</p>
</li>
<li><p> The entry points <code>rgb2hsv</code> and <code>hsv2rgb</code> have been
migrated to package <span class="pkg">grDevices</span> and so are no longer available.
</p>
</li>
<li> <p><code>R_GE_version</code> has been increased to <code>10</code> and
<code>name2col</code> removed (use <code>R_GE_str2col</code> instead).  <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>
internal colour codes are now defined using the typedef
<code>rcolor</code>.
</p>
</li>
<li><p> The <code>REPROTECT</code> macro now checks that the protect index
is valid.
</p>
</li>
<li><p> Several non-API entry points no longer used by <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> have been
removed, including the Fortran entry points <code>chol</code>,
<code>chol2inv</code>, <code>cg</code>, <code>ch</code> and <code>rg</code>, and the C
entry points <code>Brent_fmin</code>, <code>fft_factor</code> and <code>fft_work</code>.
</p>
</li>
<li><p> If a <code>.External</code> call is registered with a number of
arguments (other than <code>-1</code>), the number of arguments passed
is checked for each call (as for other foreign function calls).
</p>
</li>
<li><p> It is now possible to write custom connection
implementations outside core R using &lsquo;<span class="file">R_ext/Connections.h</span>&rsquo;.
Please note that the implementation of connections is still
considered internal and may change in the future (see the above
file for details).
</p>
</li></ul>




<h4>INTERNATIONALIZATION</h4>


<ul>
<li><p> The management of translations has been converted to <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span>
code: see <code>?tools::update_pkg_po</code>.
</p>
</li>
<li><p> The translations for the <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> interpreter and
<code>RGui.exe</code> are now part of the <span class="pkg">base</span> package (rather than
having sources in directory &lsquo;<span class="file">po</span>&rsquo; and being installed to
&lsquo;<span class="file">share/locale</span>&rsquo;).  Thus the <span class="pkg">base</span> package supports three
translation domains, <code>R-base</code>, <code>R</code> and <code>RGui</code>.
</p>
</li>
<li><p> The compiled translations which ship with <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> are all
installed to the new package <span class="pkg">translations</span> for easier
updating.  The first package of that name found on
<code>.libPaths()</code> at the start of the <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> session will be used.
(It is possible messages will be used before <code>.libPaths()</code> is
set up in which case the default translations will be used: set
environment variable <span class="env">R_TRANSLATIONS</span> to point to the location
of the intended <span class="pkg">translations</span> package to use this right from
the start.)
</p>
</li>
<li><p> The translations form a separate group in the Windows
installer, so can be omitted if desired.
</p>
</li>
<li><p> The markup for many messages has been changed to make them
easier to translate, incorporating suggestions from Łukasz Daniel.
</p>
</li></ul>




<h4>INSTALLATION</h4>


<ul>
<li><p> There is again support for building without using the C
&lsquo;long double&rsquo; type.  This is required by C99, but system
implementations can be slow or flawed.  Use <code>configure</code>
option <span class="option">--disable-long-double</span>.
</p>
</li>
<li> <p><code>make pdf</code> and <code>make install-pdf</code> now make
and install the full reference index (including all base and
recommended packages).
</p>
</li>
<li><p> The 'reference manual' on the Windows GUI menu and included
in the installer is now the full reference index, including all
base and recommended packages.
</p>
</li>
<li> <p><span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> help pages and manuals have no ISBNs because ISBN
rules no longer allow constantly changing content to be assigned
an ISBN.
</p>
</li>
<li><p> The Windows installer no longer installs a Start Menu
link to the static help pages; as most pages are generated
dynamically, this led to a lot of broken links.
</p>
</li>
<li><p> Any custom settings for Java configuration are recorded in
file &lsquo;<span class="file">etc/javaconf</span>&rsquo; for subsequent use by <code>R CMD
	javareconf</code>.
</p>
</li>
<li><p> There is now support for <code>makeinfo</code> version 5.0
(which requires a slightly different &lsquo;<span class="file">.texi</span>&rsquo; syntax).
</p>
</li>
<li><p> The minimum versions for <span class="option">--use-system-zlib</span> and
<code>--use-system-pcre</code> are now tested as 1.2.5 and 8.10
respectively.
</p>
</li>
<li><p> On Windows, the stack size is reduced to 16MB on 32-bit
systems: misguided users were launching many threads without
controlling the stack size.
</p>
</li>
<li> <p><code>configure</code> no longer looks for file
&lsquo;<span class="file">~/.Rconfig</span>&rsquo;: &lsquo;<span class="file">~/.R/config</span>&rsquo; has long been preferred.
</p>
</li></ul>




<h4>BUG FIXES</h4>


<ul>
<li><p> When <code>R CMD build</code> is run in an encoding other than
the one specified in the package's &lsquo;<span class="file">DESCRIPTION</span>&rsquo; file it
tries harder to expand the <code>authors@R</code> field in the specified
encoding.  (<a href="https://bugs.R-project.org/show_bug.cgi?id=14958">PR#14958</a>)
</p>
</li>
<li><p> If <code>R CMD INSTALL</code> is required to expand the
<code>authors@R</code> field of the &lsquo;<span class="file">DESCRIPTION</span>&rsquo; file, it tries
harder to do so in the encoding specified for the package (rather
than using ASCII escapes).
</p>
</li>
<li><p> Fix in package <span class="pkg">grid</span> for pushing a viewport into a
layout cell, where the layout is within a viewport that has zero
physical width OR where the layout has zero total relative width
(likewise for height).  The layout column widths (or row heights)
in this case were being calculated with non-finite values.
(Reported by Winston Chang.)
</p>
</li>
<li> <p><code>solve(A, b)</code> for a vector <code>b</code> gave the answer
names from <code>colnames(A)</code> for <code>LINPACK = TRUE</code> but not in
the default case.
</p>
</li>
<li> <p><code>La.svd()</code> accepts logical matrices (as documented, and
as <code>svd()</code> did).
</p>
</li>
<li> <p><code>legend()</code> now accepts negative <code>pch</code> values, in
the same way <code>points()</code> long has.
</p>
</li>
<li><p> Parse errors when installing files now correctly display
the name of the file containing the bad code.
</p>
</li>
<li><p> In Windows, tcltk windows were not always properly constructed.
(<a href="https://bugs.R-project.org/show_bug.cgi?id=15150">PR#15150</a>)
</p>
</li>
<li><p> The internal functions implementing <code>parse()</code>,
<code>tools::parseLatex()</code> and <code>tools::parse_Rd()</code> were not
reentrant, leading to errors in rare circumstances such as a
garbage collection triggering a recursive call.
</p>
</li>
<li><p> Field assignments in reference class objects <em>via</em>
<code>$&lt;-</code> were not being checked
because the magic incantation to turn methods on for that
primitive operator had been inadvertently omitted. 
</p>
</li>
<li> <p><code>setHook(hookname, value, action="replace")</code> set the
hook to be the value, rather than a list containing the value as
documented. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15167">PR#15167</a>)
</p>
</li>
<li><p>  If a package used a &lsquo;<span class="file">NEWS.Rd</span>&rsquo; file, the main HTML
package index page did not link to it.  (Reported by Dirk
Eddelbuettel.)
</p>
</li>
<li><p> The primitive implementation of <code>@&lt;-</code> was not
checking the class of the replacement.  It now does a check,
quicker but less general than <code>slot&lt;-</code>. See the help.
</p>
</li>
<li> <p><code>split(x, f)</code> now recycles classed objects <code>x</code> in
the same way as vectors.  (Reported by Martin Morgan.)
</p>
</li>
<li> <p><code>pbeta(.28, 1/2, 2200, lower.tail=FALSE, log.p=TRUE)</code>
is no longer <code>-Inf</code>; ditto for corresponding <code>pt()</code> and
<code>pf()</code> calls, such as <code>pt(45, df=5000, lower.tail=FALSE,
	log.p=TRUE)</code>. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15162">PR#15162</a>)
</p>
</li>
<li><p> The Windows graphics device would crash <span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> if a user
attempted to load the graphics history from a variable that was
not a saved history. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15230">PR#15230</a>)
</p>
</li>
<li><p> The workspace size for the <code>predict()</code>
method for <code>loess()</code> could exceed the maximum integer size.
(Reported by Hiroyuki Kawakatsu.)
</p>
</li>
<li> <p><code>ftable(x, row.vars, col.vars)</code> now also works when the
<code>*.vars</code> arguments are (integer or character vectors) of
length zero.
</p>
</li>
<li><p> Calling <code>cat()</code> on a malformed UTF-8 string could cause
the Windows GUI to lock up. (<a href="https://bugs.R-project.org/show_bug.cgi?id=15227">PR#15227</a>)
</p>
</li>
<li> <p><code>removeClass(cc)</code> gave &quot;node stack overflow&quot; for some
class definitions containing <code>"array"</code> or <code>"matrix"</code>.
</p>
</li></ul>




<h3>CHANGES in previous versions</h3>


<ul>
<li><p> Older news can be found in text format in files
<a href="../NEWS.0">NEWS.0</a>, <a href="../NEWS.1">NEWS.1</a>
and <a href="../NEWS.2">NEWS.2</a>
in the &lsquo;<span class="file">doc</span>&rsquo; directory.  News in HTML format for
<span style="font-family: Courier New, Courier; color: #666666;"><b>R</b></span> versions from 2.10.0 to 2.15.3 is in
<a href="NEWS.2.html">NEWS.2.html</a>.
</p>
</li></ul>



</div></body></html>
