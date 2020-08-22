
## ��ȭ ���� ũ�Ѹ���

install.packages('rvest')
install.packages('stringr')


library(rvest)
library(stringr)


main_url <- 'https://movie.naver.com/movie/bi/mi/pointWriteFormList.nhn?code=163608&type=after&isActualPointWriteExecute=false&isMileageSubscriptionAlready=false&isMileageSubscriptionReject=false&page='

reply_list = character()
star_list = numeric()
date_list = character()

for(page_url in 1:10){
  page_url = 1
  url = paste(main_url, page_url, sep = "") # paste �� str�� ���δ�
  content = read_html(url)
  
  node_1 = html_nodes(content, ".score_reple p")
  node_2 = html_nodes(content, ".score_result .star_score em")
  node_3 = html_nodes(content, ".score_reple em:nth-child(2)")
  
  reply = str_trim(html_text(node_1)) # str_trim ���ڿ� ���� ���� ���Ű�
  star = html_text(node_2)
  date = html_text(node_3)
  date = gsub("\\.","-",date) # gsub ���ڿ� ��ȯ
  
  reply_list = append(reply_list, reply)  # ����Ʈ�� �߰�
  reply_list
  star_list = append(star_list, star)
  date_list = append(date_list, date)
  
}


df = data.frame(date_list, reply_list, star_list) # ������������
colnames(df) = c("��¥","���","����")

write.csv(df, "��ȭ_��_���.csv", row.names = FALSE)
