install.packages('httr')
install.packages("XML", type = "binary")

library(httr)
library(XML)
library(rvest)

url <- 'https://www.megabox.co.kr/movie'
dat <- GET(url)
headers(dat)

dat <- content(dat)
dat
dat1 <- html_nodes(dat, "#movieList .tit")
dat1
dat2 <- html_text(dat1)
dat2


r <- GET("Resource URL", add_headers(TDCProjectKey='TDCProjectKey'))
headers(r)
content(r, "text")
bin <- content(r, "raw")
writeBin(bin, "r.txt")


