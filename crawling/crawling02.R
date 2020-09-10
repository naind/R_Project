
## 영화 평점 크롤링링

# install.packages('rvest')
# install.packages('stringr')


library(rvest)
library(stringr)


main_url <- 'https://movie.naver.com/movie/bi/mi/pointWriteFormList.nhn?code=163608&type=after&isActualPointWriteExecute=false&isMileageSubscriptionAlready=false&isMileageSubscriptionReject=false&page='

reply_list = character()
star_list = numeric()
date_list = character()

for(page_url in 1:10){
  
  url = paste(main_url, page_url, sep = "") # paste 두 str을 붙인다
  content = read_html(url)
  
  node_1 = html_nodes(content, ".score_reple p")
  node_2 = html_nodes(content, ".score_result .star_score em")
  node_3 = html_nodes(content, ".score_reple em:nth-child(2)")
  
  reply = str_trim(html_text(node_1)) # str_trim 문자열 양쪽 공백 제거거
  star = html_text(node_2)
  date = html_text(node_3)
  date = gsub("\\.","-",date) # gsub 문자열 변환
  
  reply_list = append(reply_list, reply)  # 리스트에 추가
  star_list = append(star_list, star)
  date_list = append(date_list, date)
  
}


df = data.frame(date_list, reply_list, star_list) # 데이터프레임
colnames(df) = c("날짜","댓글","평점")

write.csv(df, "crawling/crawling02_결과.csv", row.names = FALSE)

