setwd("C:/Users/94050/Desktop/git/R_Project") # �� ��ŷ ���丮 ����
list.files() # �� ��ŷ ���丮 �ȿ� ���ϸ�Ϻ���

library(KoNLP)
useNIADic()

# ������ ���� �ܾ� �߰��Ѵ�.
mergeUserDic(data.frame(c("û��"), c("ncn")))

text1 <- readLines("ANSI.txt")
text2 <- extractNoun(text1)
text2

# ����Ʈ �ȿ� ����Ʈ�� ����ֱ⿡ unlist���ش�.
text3 <- unlist(text2)

# �ҿ�� ��ó�� �� -> "" ����
text4 <- gsub("��", "", text3)

# 2 ���� �̻� 4 ���� ���� �ܾ�
text5 <- text4[nchar(text4) < 5]
text5 <- text5[nchar(text5) > 1]

# ������������ ���� (default ��������)
text6 <- sort(table(text5), decreasing = T)

# ���� 300 �ܾ�
text7 <- head(text6, 300)

install.packages("wordcloud2")
library(wordcloud2)
wordcloud2(text7, size = 1)


