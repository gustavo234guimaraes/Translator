\name{get_driver}
\alias{get_driver}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Get a driver to a firefox browser
}
\description{
This function uses RSelenium to obtain a driver for a Firefox browser that will be used to obtain the translations. Do you need install firefox in your machine before use.
}
\usage{
get_driver()
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

firefox<-get_driver()

## To execute without headless
firefox<-get_driver(FALSE)

}
