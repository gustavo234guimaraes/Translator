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
      
      if(str_length(x)>1400){
        text<-text_split(x)
        resp<-c()
        
        for (i in 1:length(text)) {
          cat("\r","Translating part ",i," of ",length(text)," of the text")
          drive$client$navigate(paste0(
            "https://www.deepl.com/pt-BR/translator#",
            from,"/",to,"/",
            text[i]
          ))
          Sys.sleep(wait(text))
          
          result<-try(drive$client$findElements("d-textarea",using="css")[[2]])
          n<-0
          while ("try-error"%in%class(result)&n<8) {
            drive$client$refresh()
            result<-try(drive$client$findElements("d-textarea",using="css")[[2]])
            n<-n+1
          }
          
          resp<-c(resp,result$getElementText()[[1]])
          
          
        }
        
        return(paste(resp,collapse = " "))
        
      }else{
        text<-text_link(x)
        drive$client$navigate(paste0(
          "https://www.deepl.com/pt-BR/translator#",
          from,"/",to,"/",
          text
        ))
        Sys.sleep(wait(text))
        
        result<-try(drive$client$findElements("d-textarea",using="css")[[2]])
        n<-0
        while ("try-error"%in%class(result)&n<8) {
          drive$client$refresh()
          result<-try(drive$client$findElements("d-textarea",using="css")[[2]])
          n<-n+1
        }
        
        n<-0
        while(resp==""&n<8){
          Sys.sleep(0.2)
          resp<-result$getElementText()[[1]]
          n<-n+1
        }
        
        return(resp)
      }
      
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
    
    text<-text_link(x)
      drive$client$navigate(paste0(
        "https://www.deepl.com/pt-BR/translator#",
        from,"/",to,"/",
        text
      ))
      Sys.sleep(wait(text))
      
      
      result<-try(drive$client$findElements("d-textarea",using="css")[[2]])
      
      n<-0
      while ("try-error"%in%class(result)&n<8) {
        drive$client$refresh()
        result<-try(drive$client$findElements("d-textarea",using="css")[[2]])
        n<-n+1
      }
      
      n<-0
      while(resp==""&n<8){
        Sys.sleep(0.2)
        resp<-result$getElementText()[[1]]
        n<-n+1
      }
      
      return(resp)
    
    
  }) %>% 
    unlist()
  
  levels(text)<-new.lvs
  
  return(text)
  
}






