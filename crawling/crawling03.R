install.packages('httr')
install.packages("XML", type = "binary")

library(httr)
library(XML)

url='https://www.megabox.co.kr/movie'
web=GET(url)
web=htmlParse(web)

xpath1 = '//*[@id="movieList"]/li[1]/div[2]/p[2]'
x = xpathSApply(web, xpath1, xmlValue)  
x


//*[@id="page_best"]/div[2]/div[2]/div[2]/h3/a/span
//*[@id="page_best"]/div[2]/div[3]/div[2]/h3/a/span