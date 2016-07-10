# Example


You can write math:


$$
f (x) = x \times x
$$


This is \autoref{table:example}:

  Right     Left     Center     Default
-------     ------ ----------   -------
     12     12        12            12
    123     123       123          123
      1     1          1             1

Table:  Demonstration of simple table syntax.
\label{table:example}

This is \autoref{fig:example}:

\begin{figure}[htp]
  \centering
  \includegraphics[width=32mm]{figures/beltcrest}
  \caption{Example}
  \label{fig:example}
\end{figure}

## Even Tikz figures and other things

\begin{tikzpicture}[sibling distance=10em,
  every node/.style = {shape=rectangle, rounded corners,
    draw, align=center,
    top color=white, bottom color=blue!20}]]
  \node {Formulas}
    child { node {single-line} }
    child { node {multi-line}
      child { node {aligned at}
        child { node {relation sign} }
        child { node {several places} }
        child { node {center} } }
      child { node {first left,\\centered,\\last right} } };
\end{tikzpicture}
