install.packages('rvest')


library(rvest)
url <- 'https://finance.naver.com/item/board.nhn?code=015760&page=1'

page <- read_html(url, encoding = 'euc-kr')
page2 <- html_nodes(page, 'body div#wrap div#middle.new_totalinfo div#content div.section.inner_sub table.type2 tbody tr td.title a')
page3 <- html_attr(page2, 'title')
page4 <- as.data.frame(page3)
page4

