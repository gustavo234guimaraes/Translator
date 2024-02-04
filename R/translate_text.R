library(RSelenium)
library(dplyr)
library(stringr)

translate_text<-function(text,from,to,drive){
  UseMethod("translate_text")
}



translate_text.character<-function(
  text="Text translated automatically using R",
  from="en",
  to="pt-BR",
  drive
){
  
  
  lapply(text, function(x){
    
    if(is.na(x)|is.null(x)|str_remove_all(x," ")==""){
      return(NA)
    }else{
      text<-str_replace_all(
        x,
        pattern = " ",
        replacement = "%20"
      )
      drive$client$navigate(paste0(
        "https://www.deepl.com/pt-BR/translator#",
        from,"/",to,"/",
        text
      ))
      Sys.sleep(1.6)
      
      result<-try(drive$client$findElements("d-textarea",using="css")[[2]])
      n<-0
      while ("try-error"%in%class(result)&n<8) {
        drive$client$refresh()
        result<-try(drive$client$findElements("d-textarea",using="css")[[2]])
        n<-n+1
      }
      
      
      
      
      result$getElementText()[[1]] %>% 
        return()
    }
    
    
  }) %>% 
    unlist() %>% 
    return()
  
  

  
}


translate_text.factor<-function(
    text="Texto traduzido automáticamente usando R",
    from="pt-BR",
    to="en",
    drive
){
  
  lvs<-levels(text) %>% as.character()
  
  new.lvs<-lapply(lvs, function(x){
    
    text<-str_replace_all(
        x,
        pattern = " ",
        replacement = "%20"
      )
      drive$client$navigate(paste0(
        "https://www.deepl.com/pt-BR/translator#",
        from,"/",to,"/",
        text
      ))
      Sys.sleep(1.6)
      
      result<-try(drive$client$findElements("d-textarea",using="css")[[2]])
      n<-0
      while ("try-error"%in%class(result)&n<8) {
        drive$client$refresh()
        result<-try(drive$client$findElements("d-textarea",using="css")[[2]])
        n<-n+1
      }
      
      
      
      result$getElementText()[[1]] %>% 
        return()
    
    
  }) %>% 
    unlist()
  
  levels(text)<-new.lvs
  
  return(text)
  
}

a<-factor(c("Baixo","Médio","Alto","Baixo"),levels = c("Baixo","Médio","Alto")) 

levels(a)

firefox<-get_driver()

translate_text.factor(text = a,drive = firefox)



