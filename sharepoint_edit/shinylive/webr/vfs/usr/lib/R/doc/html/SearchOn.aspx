<!DOCTYPE html>
<html>
<head>
<title>R: Search Engine</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes" />
<link rel="stylesheet" type="text/css" href="R.css" />
</head>
<body>
<div class="container">
<h1>Search Engine <img class="toplogo" src="Rlogo.svg" alt="[R logo]"></h1>

<div style="text-align: center;">
<a href="index.html"><img class="arrow" src="up.jpg" alt="[Top]"></a>
</div>

<hr style="width: 100%;">

<h2>Search</h2>

<p>
You can search for keywords, function and data names, concepts and
within help page titles.  The first search of a session will be slower.
</p>

<p>
<b>Usage:</b> Enter a string in the text field below and click the
Search button or hit
<code>RETURN</code>.  
</p>

<form name="f" action="Search" method = "get">
<input type="text" name="pattern" size="20" maxlength="256" value="">
<p>
Fields:
<input name="fields.alias" type="checkbox" checked value="1">Topics
<input name="fields.title" type="checkbox" checked value="1">Titles
<input name="fields.concept" type="checkbox" checked value="1">Concepts
<input name="fields.keyword" type="checkbox" value="1">Keywords
</p>
<p>
Options:
<input name="ignore.case" type="checkbox" checked value="1">Ignore case
<input name="agrep" type="checkbox" value="1"> Fuzzy match
</p>
<p>
Types:
<input name="types.help" type="checkbox" checked value="1">Help pages
<input name="types.vignette" type="checkbox" checked value="1">Vignettes
<input name="types.demo" type="checkbox" checked value="1">Demos
</p>
<br>
<input value="Search" type="submit">
<input value="Reset" type="reset">
</form>

<hr style="width: 100%;">

<h2>Concepts</h2>

<a href="/doc/html/hsearch_db_concepts.html">
Browse concepts available for searching the help system</a>

<h2>Keywords</h2>

<a href="/doc/html/hsearch_db_keywords.html">
Browse keywords available for searching the help system</a>

<h3>Keywords by Topic</h3>

<dl>
<dt>Basics</dt>
<dd>
  <ul>
    <li><a href="Search?category=attribute">attribute</a>:  Data Attributes</li>
    <li><a href="Search?category=chron">chron</a>:  Dates and Times</li>
    <li><a href="Search?category=classes">classes</a>:  Data Types (not OO)
      <ul>
	<li><a href="Search?category=NA">NA</a>:  Missing Values </li>
	<li><a href="Search?category=category">category</a>:  Categorical Data</li>
	<li><a href="Search?category=character">character</a>:  Character Data ("String") Operations</li>
	<li><a href="Search?category=complex">complex</a>:  Complex Numbers</li>
      </ul>
    </li>
    <li><a href="Search?category=data">data</a>:  Environments, Scoping, Packages</li>
    <li><a href="Search?category=datasets">datasets</a>:  Datasets available by data()</li>
    <li><a href="Search?category=list">list</a>:  Lists</li>
    <li><a href="Search?category=manip">manip</a>:  Data Manipulation</li>
    <li><a href="Search?category=package">package</a>:  Package Summaries</li>
    <li><a href="Search?category=sysdata">sysdata</a>:  Basic System Variables</li>
  </ul>
</dd>

<dt>Graphics</dt>
<dd>
  <ul>
    <li><a href="Search?category=aplot">aplot</a>:  Add to Existing Plot / internal plot</li>
    <li><a href="Search?category=color">color</a>:  Color, Palettes etc</li>
    <li><a href="Search?category=device">device</a>:  Graphical Devices</li>
    <li><a href="Search?category=dplot">dplot</a>:  Computations Related to Plotting</li>
    <li><a href="Search?category=dynamic">dynamic</a>:  Dynamic Graphics</li>
    <li><a href="Search?category=hplot">hplot</a>:  High-Level Plots</li>
    <li><a href="Search?category=iplot">iplot</a>:  Interacting with Plots</li>
  </ul>
</dd>

<dt>MASS (the book) uses</dt>
<dd>
  <ul>
    <li><a href="Search?category=classif">classif</a>:  Classification </li>
    <li><a href="Search?category=neural">neural</a>:  Neural Networks </li>
    <li><a href="Search?category=spatial">spatial</a>:  Spatial Statistics </li>
  </ul>
</dd>

<dt>Mathematics</dt>
<dd>
  <ul>
    <li><a href="Search?category=arith">arith</a>:  Basic Arithmetic and Sorting</li>
    <li><a href="Search?category=array">array</a>:  Matrices and Arrays
      <ul>
	<li><a href="Search?category=algebra">algebra</a>:  Linear Algebra</li>
      </ul>
    </li>
    <li><a href="Search?category=graphs">graphs</a>:  Graphs (not
      graphics), i.e nodes &amp; edges, e.g. dendrograms</li>
    <li><a href="Search?category=logic">logic</a>:  Logical Operators</li>
    <li><a href="Search?category=math">math</a>:  Mathematical Calculus etc </li>
    <li><a href="Search?category=optimize">optimize</a>:  Optimization</li>
    <li><a href="Search?category=symbolmath">symbolmath</a>:  "Symbolic
      Math", as polynomials, fractions</li> 
  </ul>
</dd>

<dt>Programming, Input/Ouput, and Miscellaneous</dt>
<dd>
  <ul>
    <li><a href="Search?category=IO">IO</a>:   Input/output
      <ul>
	<li><a href="Search?category=connection">connection</a>:  Input/Output Connections</li>
	<li><a href="Search?category=database">database</a>:  Interfaces to databases</li>
	<li><a href="Search?category=file">file</a>:  Input/Output Files</li>
      </ul>
    </li>
    <li><a href="Search?category=debugging">debugging</a>:  Debugging Tools</li>
    <li><a href="Search?category=documentation">documentation</a>:  Documentation</li>
    <li><a href="Search?category=environment">environment</a>:  Session Environment</li>
    <li><a href="Search?category=error">error</a>:  Error Handling</li>
    <li><a href="Search?category=internal">internal</a>:  Internal Objects (not part of API)</li>
    <li><a href="Search?category=iteration">iteration</a>:  Looping and Iteration</li>
    <li><a href="Search?category=methods">methods</a>:  Methods and Generic Functions</li>
    <li><a href="Search?category=misc">misc</a>:  Miscellaneous</li>
    <li><a href="Search?category=print">print</a>:  Printing</li>
    <li><a href="Search?category=programming">programming</a>:  Programming
      <ul>
	<li><a href="Search?category=interface">interface</a>:  Interfaces to Other Languages</li>
      </ul>
    </li>
    <li><a href="Search?category=utilities">utilities</a>:  Utilities</li>
  </ul>
</dd>

<dt>Statistics</dt>
<dd>
  <ul>
    <li><a href="Search?category=cluster">cluster</a>:  Clustering</li>
    <li><a href="Search?category=datagen">datagen</a>:  Functions for generating data sets</li>
    <li><a href="Search?category=design">design</a>:  Designed Experiments</li>
    <li><a href="Search?category=distribution">distribution</a>:  Probability Distributions and Random Numbers</li>
    <li><a href="Search?category=htest">htest</a>:  Statistical Inference</li>
    <li><a href="Search?category=models">models</a>:  Statistical Models
      <ul>
	<li><a href="Search?category=regression">regression</a>:  Regression
	  <ul>
	    <li><a href="Search?category=nonlinear">nonlinear</a>:
	      Non-linear Regression </li> 
	  </ul>
	</li>
      </ul>
    </li>
    <li><a href="Search?category=multivariate">multivariate</a>:  Multivariate Techniques</li>
    <li><a href="Search?category=nonparametric">nonparametric</a>:  Nonparametric Statistics </li>
    <li><a href="Search?category=robust">robust</a>:  Robust/Resistant Techniques</li>
    <li><a href="Search?category=smooth">smooth</a>:  Curve (and Surface) Smoothing
      <ul>
	<li><a href="Search?category=loess">loess</a>:  Loess Objects</li>
      </ul>
    </li>
    <li><a href="Search?category=survey">survey</a>:  Complex survey samples</li>
    <li><a href="Search?category=survival">survival</a>:  Survival Analysis</li>
    <li><a href="Search?category=tree">tree</a>:  Regression and Classification Trees</li>
    <li><a href="Search?category=ts">ts</a>:  Time Series</li>
    <li><a href="Search?category=univar">univar</a>:  simple univariate statistics  </li>
  </ul>
</dd>
</dl>

</div>
</body>
</html>
