
get_driver<-function(headless){
  UseMethod("get_driver")
}



get_driver.default<-function(headless=TRUE){
  
  driver<-RSelenium::rsDriver(browser = c("firefox"),port = netstat::unassigned_ports()[sample(1:1000,1)],verbose = F,
                              extraCapabilities=list(acceptInsecureCerts=TRUE,
                                                     "moz:firefoxOptions"=list(args=ifelse(headless,list('-headless',"-sessionTimeout 57868143"),list('-sessionTimeout 57868143')))))
  while (str_detect(driver$server$log()[[1]][1],"Erro")) {
    licenses<-list.files(
      path=paste0(Sys.getenv("USERPROFILE"),"/AppData/Local/binman"),
      pattern = "LICENSE.chrome",
      recursive = T,
      full.names = T
    )
    if(length(licenses)>0){
      lapply(licenses, file.remove)
    }
    
    driver<-RSelenium::rsDriver(browser = c("firefox"),port = netstat::unassigned_ports()[sample(1:1000,1)],verbose = F,
                                extraCapabilities=list(acceptInsecureCerts=TRUE,
                                                       "moz:firefoxOptions"=list(args=ifelse(headless,
                                                                                             list('-headless',"-sessionTimeout 57868143"),
                                                                                             list('-sessionTimeout 57868143') ) )))
  }
  
  return(driver)
  
}

