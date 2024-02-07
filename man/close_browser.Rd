\name{close_browser}
\alias{close_browser}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Close browser
}
\description{
This function close a broser started by get_browser.
}
\usage{
close_browser()
}


\arguments{
  \item{drive}{
A rsClientServer. A driver created by get_browser.
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

translate_text("Example text",from="en",to="pt",drive=firefox)

close_browser(firefox)


}
