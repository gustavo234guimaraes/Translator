translate_text
================

Translator is a package for translate text using DeepL and WebScraping.
This package has only two functions, the first obtain a RSelenium drive
for firefox browser, and the second use the browser to translate texts.
\## Instalação

You can install the development version from GitHub with

``` r
remotes::install_github("gustavo234guimaraes/Translator")
```

## Examples

### Translate single text

``` r
library(Translator)
tic()
firefox<-get_driver()
toc()
```

    ## 11.26 sec elapsed

``` r
# The default is from=en and to=pt
tic()
translate_text(text = "Text translated automatically using R",drive=firefox)
```

    ## [1] ""

``` r
toc()
```

    ## 4.79 sec elapsed

``` r
tic()
translate_text(text =c(
   "Text translated automatically using R",
   "Text translated quickly using R"
),to="pt-BR",drive=firefox)
```

    ## [1] "Texto traduzido automaticamente usando R"
    ## [2] "Texto traduzido rapidamente usando R"

``` r
toc()
```

    ## 3.54 sec elapsed

### Translate a factor list

You can convert a text in data.frame using dplyr::mutate, if the text is
a factor, the function will only consider levels.

``` r
chickwts$feed
```

    ##  [1] horsebean horsebean horsebean horsebean horsebean horsebean horsebean
    ##  [8] horsebean horsebean horsebean linseed   linseed   linseed   linseed  
    ## [15] linseed   linseed   linseed   linseed   linseed   linseed   linseed  
    ## [22] linseed   soybean   soybean   soybean   soybean   soybean   soybean  
    ## [29] soybean   soybean   soybean   soybean   soybean   soybean   soybean  
    ## [36] soybean   sunflower sunflower sunflower sunflower sunflower sunflower
    ## [43] sunflower sunflower sunflower sunflower sunflower sunflower meatmeal 
    ## [50] meatmeal  meatmeal  meatmeal  meatmeal  meatmeal  meatmeal  meatmeal 
    ## [57] meatmeal  meatmeal  meatmeal  casein    casein    casein    casein   
    ## [64] casein    casein    casein    casein    casein    casein    casein   
    ## [71] casein   
    ## Levels: casein horsebean linseed meatmeal soybean sunflower

``` r
chickwts %>% 
  mutate(feed=translate_text(feed,from="en",to="pt-BR",drive=firefox)) %>% 
  .$feed
```

    ##  [1] fava de cavalo     fava de cavalo     fava de cavalo     fava de cavalo    
    ##  [5] fava de cavalo     fava de cavalo     fava de cavalo     fava de cavalo    
    ##  [9] fava de cavalo     fava de cavalo     semente de linhaça semente de linhaça
    ## [13] semente de linhaça semente de linhaça semente de linhaça semente de linhaça
    ## [17] semente de linhaça semente de linhaça semente de linhaça semente de linhaça
    ## [21] semente de linhaça semente de linhaça soja               soja              
    ## [25] soja               soja               soja               soja              
    ## [29] soja               soja               soja               soja              
    ## [33] soja               soja               soja               soja              
    ## [37] girassol           girassol           girassol           girassol          
    ## [41] girassol           girassol           girassol           girassol          
    ## [45] girassol           girassol           girassol           girassol          
    ## [49] farinha de carne   farinha de carne   farinha de carne   farinha de carne  
    ## [53] farinha de carne   farinha de carne   farinha de carne   farinha de carne  
    ## [57] farinha de carne   farinha de carne   farinha de carne   caseína           
    ## [61] caseína            caseína            caseína            caseína           
    ## [65] caseína            caseína            caseína            caseína           
    ## [69] caseína            caseína            caseína           
    ## 6 Levels: caseína fava de cavalo semente de linhaça farinha de carne ... girassol

``` r
tibble(
  cidade=c("Fortaleza","Recife","Salvador"),
  info=c(
    "Fortaleza é a capital do estado do Ceará, no nordeste do Brasil. A cidade é conhecida por suas praias, com falésias vermelhas, palmeiras, dunas e lagoas.",
    "Recife, a capital do estado de Pernambuco, no nordeste do Brasil, distingue-se pelos seus vários rios, pontes, ilhéus, penínsulas e pelo carnaval de rua.",
    "Salvador, a capital do estado da Bahia no nordeste do Brasil, é conhecida pela arquitetura colonial portuguesa, pela cultura afrobrasileira e pelo litoral tropical."
  )
) %>% 
  mutate(information=translate_text(info,from="en",to="pt-BR",drive=firefox)) %>% 
  .$information
```

    ## [1] ""                                                                                                                                                            
    ## [2] "Recife, the capital of the state of Pernambuco in northeastern Brazil, is distinguished by its many rivers, bridges, islets, peninsulas and street carnival."
    ## [3] ""
