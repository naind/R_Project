install.packages('rvest')

library(rvest)
library(stringr)

url <- 'https://finance.naver.com/item/board.nhn?code=015760&page=1'

page = read_html(url)

page2 = html_nodes(page, '.title a')
title = html_text(page2)

page3 = html_attr(page2, 'title')
page4 = as.data.frame(page3)
page4

