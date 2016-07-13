# Introduction

## This is an example.


Simply use normal pandoc-markdown and it will be rendered properly.

This is an example code-block. For more options you should probably play around
with latex and pass the `--listings` options to `pandoc`.
For more information check this [SO post](http://tex.stackexchange.com/questions/179926/pandoc-markdown-to-pdf-without-cutting-off-code-block-lines-that-are-too-long).

### This is a code-block with pandoc engine

Pandoc fenced-code blocks are cool but it is hard to add captions to it.
So if you don't need a caption go and use it, otherwise stick to normal latex
listings (\cref{sec:listings}).

```haskell
main :: IO ()
main = putStrLn "Hello World"
```

### This is a listing rendered with latex \label{sec:listings}

Listing \cref{lst:example} contains an example of a listing.

\begin{figure}[htp]
\centering
\begin{minted}{haskell}
map :: (a -> b) -> [a] -> [b]
map f []           = []
map f (x:xs)       = f x : map f xs

filter :: (a -> Bool) -> [a] -> [a]
filter pred []     = []
filter pred (x:xs)
  | pred x         = x : filter pred xs
  | otherwise      = filter pred xs
\end{minted}
\caption{Example of a listing.}
\label{lst:example}
\end{figure}

\begin{minted}{haskell}
map :: (a -> b) -> [a] -> [b]
map f []           = []
map f (x:xs)       = f x : map f xs

filter :: (a -> Bool) -> [a] -> [a]
filter pred []     = []
filter pred (x:xs)
  | pred x         = x : filter pred xs
  | otherwise      = filter pred xs
\end{minted}

#### These are some citations
Citations should work in normal pandoc style. For example, check [@Sousa:2013cc]
for more information about the basis for my thesis.
These are more citation examples [@Vytiniotis:2013fg]. You can even cite multiple
references at once [@Moran:1999us; @Sands:1998ur].
