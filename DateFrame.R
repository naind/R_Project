No <- c(1,2,3,4)
Name <- c("Apple","Peach","Banana","Grape")
Price <- c(500,200,100,50)
Qty <- c(5,2,4,7)

sales <- data.frame(No,Name,Price,Qty)
sales

View(sales)


sales[,2]
sales[,3]

sales$Price
sales$Name

sales[c(1,2),]


#특정 조건에 맞는 행 추출
subset(sales, Qty >3)
subset(sales, Name == "Apple")

#특정 컬럼만 조회하고 싶을때
subset(sales, Price >= 100, select = Name)
subset(sales, Qty >=2, select = -Price)
subset(sales, Qty >=3, select = c(Name,Price))

