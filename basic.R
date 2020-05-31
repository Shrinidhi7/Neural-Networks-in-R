
urldata<-GET("https://en.wikipedia.org/wiki/2016_Summer_Olympics_medal_table")
data<-readHTMLTable(rawToChar(urldata$content),stringsAsFactors=FALSE,header = TRUE)
X=data$`2016 Summer Olympics medal table`
install.packages("rvest")
medal_tally <- url %>% read_html() %>% 
  html_nodes(xpath='//*[@id="mw-content-text"]/div/table[2]') %>% html_table(fill=TRUE)
medal_tally <- medal_tally[[1]]
