setwd("C:/Users/94050/Desktop/git/R_Project") # 내 워킹 디렉토리 변경
list.files() # 내 워킹 디렉토리 안에 파일목록보기

library(KoNLP)
useNIADic()

# 사전에 없는 단어 추가한다.
mergeUserDic(data.frame(c("청취"), c("ncn")))

text1 <- readLines("ANSI.txt")
text2 <- extractNoun(text1)
text2

# 리스트 안에 리스트가 들어있기에 unlist해준다.
text3 <- unlist(text2)

# 불용어 전처리 ㅎ -> "" 변경
text4 <- gsub("ㅎ", "", text3)

# 2 글자 이상 4 글자 이하 단어
text5 <- text4[nchar(text4) < 5]
text5 <- text5[nchar(text5) > 1]

# 내림차순으로 설정 (default 오름차순)
text6 <- sort(table(text5), decreasing = T)

# 상위 300 단어
text7 <- head(text6, 300)

install.packages("wordcloud2")
library(wordcloud2)
wordcloud2(text7, size = 1)



