install.packages('httr')
install.packages("XML", type = "binary")


library(httr)
library(rvest)
library(dplyr)
library(stringr)

url <- 'https://finance.naver.com/item/board.nhn?code=215360&page=1'

ah <- httr::add_headers("User-Agent" = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36')
GET(url, ah) %>%
  content() %>% 
  html_nodes(".title a") %>%
  html_text() %>%
  str_trim() %>%
  gsub("\n|\t|[:[]:]", "", .) -> reply


reply



df <- data.frame(dat3)
write.csv(df, "craw°á°ú.csv", row.names = FALSE)




r <- GET("Resource URL", add_headers(TDCProjectKey='TDCProjectKey'))
headers(r)
content(r, "text")
bin <- content(r, "raw")
writeBin(bin, "r.txt")


