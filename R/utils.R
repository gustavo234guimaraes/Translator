text_link<-function(x){
  str_replace_all(
    x,
    pattern = " ",
    replacement = "%20"
  )
}

wait<-function(x){
  
  1.4+0.002*str_length(x)
  
}

text_split<-function(x){
  loc<-str_locate_all(x,pattern = "\\.")[[1]] %>% 
    as_tibble() %>% 
    mutate(here=end/1400)
  n_splits<-trunc(max(loc$end)/1400)
  
  splits<-lapply(1:n_splits, function(y){
    which.min( abs(loc$here-y) )
  }) %>% unlist()
  splits<-c(splits,nrow(loc))
  resp<-c()
  for (i in 1:length(splits)) {
    if(i==1){
      resp<-c(resp,str_sub(x,1,loc$end[splits[i]]) )
    }else{
      resp<-c(resp,str_sub(x,loc$end[splits[i-1]],loc$end[splits[i]]))
    }
  }
  return(resp)
}



