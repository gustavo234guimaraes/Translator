\name{get_browser}
\alias{get_browser}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Start a selenium server and browser (Firefox), with Rselenium
}
\description{
This function uses RSelenium to obtain a driver for a Firefox browser that will be used to obtain the translations. Do you need install firefox in your machine before use.
}
\usage{
get_browser()
}


\arguments{
  \item{headless}{
A logical. Sets the headless option for firefox to run the hidden program. The default is TRUE, but FALSE can be useful for identifying possible execution problems.
}

}

\author{
"Guimarães, Gustavo <caiogcg.mobilidade@gmail.com>"
}

\seealso{
RSelenium
}
\examples{

firefox<-get_browser()

## To execute without headless
firefox<-get_browser(FALSE)

}
