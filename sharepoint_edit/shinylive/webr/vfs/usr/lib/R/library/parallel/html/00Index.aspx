<!DOCTYPE html>
<html>
<head><title>R: Support for Parallel Computation in R</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes" />
<link rel="stylesheet" type="text/css" href="R.css" />
</head><body><div class="container">
<h1> Support for Parallel Computation in R
<img class="toplogo" src="../../../doc/html/Rlogo.svg" alt="[R logo]" />
</h1>
<hr/>
<div style="text-align: center;">
<a href="../../../doc/html/packages.html"><img class="arrow" src="../../../doc/html/left.jpg" alt="[Up]" /></a>
<a href="../../../doc/html/index.html"><img class="arrow" src="../../../doc/html/up.jpg" alt="[Top]" /></a>
</div><h2>Documentation for package &lsquo;parallel&rsquo; version 4.3.0</h2>

<ul><li><a href="../DESCRIPTION">DESCRIPTION file</a>.</li>
<li><a href="../doc/index.html">User guides, package vignettes and other documentation.</a></li>
</ul>

<h2>Help Pages</h2>


<table style="width: 100%;">
<tr><td style="width: 25%;"><a href="parallel-package.html">parallel-package</a></td>
<td>Support for Parallel Computation</td></tr>
<tr><td style="width: 25%;"><a href="children.html">children</a></td>
<td>Low-level Functions for Management of Forked Processes</td></tr>
<tr><td style="width: 25%;"><a href="clusterApply.html">clusterApply</a></td>
<td>Apply Operations using Clusters</td></tr>
<tr><td style="width: 25%;"><a href="clusterApply.html">clusterApplyLB</a></td>
<td>Apply Operations using Clusters</td></tr>
<tr><td style="width: 25%;"><a href="clusterApply.html">clusterCall</a></td>
<td>Apply Operations using Clusters</td></tr>
<tr><td style="width: 25%;"><a href="clusterApply.html">clusterEvalQ</a></td>
<td>Apply Operations using Clusters</td></tr>
<tr><td style="width: 25%;"><a href="clusterApply.html">clusterExport</a></td>
<td>Apply Operations using Clusters</td></tr>
<tr><td style="width: 25%;"><a href="clusterApply.html">clusterMap</a></td>
<td>Apply Operations using Clusters</td></tr>
<tr><td style="width: 25%;"><a href="RngStream.html">clusterSetRNGStream</a></td>
<td>Implementation of Pierre L'Ecuyer's RngStreams</td></tr>
<tr><td style="width: 25%;"><a href="clusterApply.html">clusterSplit</a></td>
<td>Apply Operations using Clusters</td></tr>
<tr><td style="width: 25%;"><a href="detectCores.html">detectCores</a></td>
<td>Detect the Number of CPU Cores</td></tr>
<tr><td style="width: 25%;"><a href="makeCluster.html">getDefaultCluster</a></td>
<td>Create a Parallel Socket Cluster</td></tr>
<tr><td style="width: 25%;"><a href="makeCluster.html">makeCluster</a></td>
<td>Create a Parallel Socket Cluster</td></tr>
<tr><td style="width: 25%;"><a href="makeCluster.html">makeForkCluster</a></td>
<td>Create a Parallel Socket Cluster</td></tr>
<tr><td style="width: 25%;"><a href="makeCluster.html">makePSOCKcluster</a></td>
<td>Create a Parallel Socket Cluster</td></tr>
<tr><td style="width: 25%;"><a href="RngStream.html">mc.reset.stream</a></td>
<td>Implementation of Pierre L'Ecuyer's RngStreams</td></tr>
<tr><td style="width: 25%;"><a href="mcaffinity.html">mcaffinity</a></td>
<td>Get or Set CPU Affinity Mask of the Current Process</td></tr>
<tr><td style="width: 25%;"><a href="mcparallel.html">mccollect</a></td>
<td>Evaluate an R Expression Asynchronously in a Separate Process</td></tr>
<tr><td style="width: 25%;"><a href="mcfork.html">mcexit</a></td>
<td>Fork a Copy of the Current R Process</td></tr>
<tr><td style="width: 25%;"><a href="mcfork.html">mcfork</a></td>
<td>Fork a Copy of the Current R Process</td></tr>
<tr><td style="width: 25%;"><a href="children.html">mckill</a></td>
<td>Low-level Functions for Management of Forked Processes</td></tr>
<tr><td style="width: 25%;"><a href="mclapply.html">mclapply</a></td>
<td>Parallel Versions of 'lapply' and 'mapply' using Forking</td></tr>
<tr><td style="width: 25%;"><a href="mclapply.html">mcMap</a></td>
<td>Parallel Versions of 'lapply' and 'mapply' using Forking</td></tr>
<tr><td style="width: 25%;"><a href="mclapply.html">mcmapply</a></td>
<td>Parallel Versions of 'lapply' and 'mapply' using Forking</td></tr>
<tr><td style="width: 25%;"><a href="mcparallel.html">mcparallel</a></td>
<td>Evaluate an R Expression Asynchronously in a Separate Process</td></tr>
<tr><td style="width: 25%;"><a href="RngStream.html">nextRNGStream</a></td>
<td>Implementation of Pierre L'Ecuyer's RngStreams</td></tr>
<tr><td style="width: 25%;"><a href="RngStream.html">nextRNGSubStream</a></td>
<td>Implementation of Pierre L'Ecuyer's RngStreams</td></tr>
<tr><td style="width: 25%;"><a href="parallel-package.html">parallel</a></td>
<td>Support for Parallel Computation</td></tr>
<tr><td style="width: 25%;"><a href="clusterApply.html">parApply</a></td>
<td>Apply Operations using Clusters</td></tr>
<tr><td style="width: 25%;"><a href="clusterApply.html">parCapply</a></td>
<td>Apply Operations using Clusters</td></tr>
<tr><td style="width: 25%;"><a href="clusterApply.html">parLapply</a></td>
<td>Apply Operations using Clusters</td></tr>
<tr><td style="width: 25%;"><a href="clusterApply.html">parLapplyLB</a></td>
<td>Apply Operations using Clusters</td></tr>
<tr><td style="width: 25%;"><a href="clusterApply.html">parRapply</a></td>
<td>Apply Operations using Clusters</td></tr>
<tr><td style="width: 25%;"><a href="clusterApply.html">parSapply</a></td>
<td>Apply Operations using Clusters</td></tr>
<tr><td style="width: 25%;"><a href="clusterApply.html">parSapplyLB</a></td>
<td>Apply Operations using Clusters</td></tr>
<tr><td style="width: 25%;"><a href="pvec.html">pvec</a></td>
<td>Parallelize a Vector Map Function using Forking</td></tr>
<tr><td style="width: 25%;"><a href="children.html">readChild</a></td>
<td>Low-level Functions for Management of Forked Processes</td></tr>
<tr><td style="width: 25%;"><a href="children.html">readChildren</a></td>
<td>Low-level Functions for Management of Forked Processes</td></tr>
<tr><td style="width: 25%;"><a href="makeCluster.html">R_PARALLEL_PORT</a></td>
<td>Create a Parallel Socket Cluster</td></tr>
<tr><td style="width: 25%;"><a href="children.html">selectChildren</a></td>
<td>Low-level Functions for Management of Forked Processes</td></tr>
<tr><td style="width: 25%;"><a href="children.html">sendChildStdin</a></td>
<td>Low-level Functions for Management of Forked Processes</td></tr>
<tr><td style="width: 25%;"><a href="children.html">sendMaster</a></td>
<td>Low-level Functions for Management of Forked Processes</td></tr>
<tr><td style="width: 25%;"><a href="makeCluster.html">setDefaultCluster</a></td>
<td>Create a Parallel Socket Cluster</td></tr>
<tr><td style="width: 25%;"><a href="splitIndices.html">splitIndices</a></td>
<td>Divide Tasks for Distribution in a Cluster</td></tr>
<tr><td style="width: 25%;"><a href="makeCluster.html">stopCluster</a></td>
<td>Create a Parallel Socket Cluster</td></tr>
</table>
</div></body></html>
