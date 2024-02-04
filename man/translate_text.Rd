\name{translate_text}
\alias{translate_text}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Translate text to another language.
}
\description{
Translate a text or a list of characters using DeepL, and WebScraping with RSelenium.
}
\usage{
translate_text("Text translated automatically using R",drive=drive)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{text}{
A character. Text to be translated. 
}

  \item{from}{
A character. Short code for the source language of the text see details.
}

  \item{to}{
A character. Short code for the target language of the text.
}

  \item{drive}{
A rsClientServer. A driver created by get_driver (recommended). Or a driver created by RSelenium::rsDriver
}


}


\author{
"Guimarães, Gustavo <caiogcg.mobilidade@gmail.com>"
}

\details{
Short codes from Languages in DeepL. To find codes see \href{https://www.deepl.com/translator#}{DeepL page}
}

\seealso{
RSelenium
}
\examples{

firefox<-get_driver()

new.text<-translate_text(
  "Example text",
  from="en",
  to="es",
  drive=firefox
)


chickwts %>% 
  mutate(feed=translate_text(feed,from="en",to="pt-BR",drive=firefox))

## Translate to German
new.text<-translate_text(
  "Example text",
  from="en",
  to="de",
  drive=firefox
)


}