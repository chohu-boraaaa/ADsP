# R 기초와 데이터 마트

# R data type
x1 = 1
x2 = "chohu"
x3 = FALSE
x4 = 3.14

# 데이터 타입 확인
mode(x1)
mode(x2)
mode(x3)
mode(x4)

# 형변환
as.integer(x4)
as.numeric(x3)

# 벡터 생성
# c() 함수
x1 = c(1, 5, 10)
x2 = c("갑", "을", "병")
x3 = c(TRUE, FALSE)
x4 = c(3.14, 2.5, 4.10)

# 벡터의 결합
x5 = c(x1, x4)
x5

# 콜론
x1 = 1:10
x2 = -1:1
x3 = 10:1
x1
x2
x3

# seq함수
x1 = seq(from=1, to=10, by=1)
x2 = seq(from=1, to=10, by=2)
x1
x2

# sequence()함수 : 1부터 10까지 1씩 증가, 소수를 입력해도 정수까지만 증가, 음수는 오류
x1 = sequence(10)
x2 = sequence(8.6)
x3 = sequence(-10)
x1
x2

# rep() 함수
x1 = rep("test", times=3)
x1
x2 = rep("바보", times=6)
x2
x3 = rep(c("갑", "을"), times=2)
x3

# cbind() : 열을 기준으로 벡터 결합
x1 <- c(1, 2, 3, 4)
x2 <- c(5, 6, 7, 8)
cbind(x1, x2)

# rbind() : 행을 기준으로 벡터 결합
rbind(x1, x2)

# factor() : 범주형 데이터의 집단을 확인
gender = c("m", "m", "f", "f", "m")
factor(gender)

# 행렬
x1 <- matrix(c(1:10), ncol=2)
x1
x2 <- matrix(c(1:20), nrow=4)
x2

# 행렬의 연산(곱셈)
x1 <- matrix(c(1:10), ncol=2)
x1 * 2

# 역행렬구하기
x2 <- matrix(c(2, 5, 6, 1, 3, 4, 5, 6, 7), ncol=3, nrow=3)
x2
solve(x2)

# 배열
# 1차원 배열 구성
x1 = array(1:10, dim=10)
x1
x1[2]

# 2차원 배열 구성
x2 = array(1:10, dim=c(2,5))
x2
x2[2][1]

# 리스트
x1 = 1:5
x2 = matrix(1:6, nrow=2, ncol=3)
x3 = list(x1, x2)
x3
x3[1]
x3[2]

# 데이터프레임
# 데이터 프레임의 하나의 열은 하나의 데이터 타임만 가질수 있다!!
x1 = 1:5
x2 = c(10, 20, 30, 40, 50)
x3 = c("m", "f", "m", "f", "f")
df = data.frame(x1, x2, x3)
df

# str() : 데이터 프레임 구조 확인 (행 수, 열 수, 변수 명, 데이터 타입 확인)
str(df)

# 데이터 프레임 사용하기
nrow(df) # 저장된 행수 알려줌
ncol(df) # 저장된 열수 알려줌
dim(df) # 행수와 컬럼수 알려줌

# 조건문
# if문 사용
x = 100
y = 50
if(x>=100){
  print("x는 100보다 크거나 같다")
}else if(y<50){
  print("y는 50보다 작다")
}else{
  print("x는 100보다 작다")
}

# ifelse문 사용
ifelse(x>=100, print("x는 100보다 크거나 같다"), print("x는 100보다 작다"))

# 반복문 사용
# i를 1부터 5까지 반복
for(i in 1:5){
  print("ADsP 합격")
}

for(i in 1:3){
  cat("test", i, "\n")
}

# while문 예제
x = 0
while(x<5){
  cat("test", x+1, "\n")
  x<-x+1
}

# 함수
plusone <- function(k){
  return(k+1)
}
plusone(10)

# 패키지 설치
# install.packages("패키지명")
# 패키지 사용
# library("패키지명")
# 패키지 업데이터
# undate.packages("패키지명")
# 패키지 삭제
# remove.packages("패키지명")
# 패키지 검색
# search()
# 패키지 경로 확인
# searchpaths()
# 패키지 어떤 경로에 설치되는지 확인
# .libPaths()

# 외부파일 읽기
# 텍스트 파일 읽기
# text = read.table(file="test.txt", header=TRUE, sep=" ")
# sep=" "(공백), sep=","(쉼표구분), sep="\t"(TAB 구분)

# CSV 파일 읽기
# setwd() :파일이 있는 디렉토리 위치 지정
# read.csv("test.csv")

# 엑셀 파일 읽기
# install.pcakges("readxl")
# library("readxl")
# excel = read_excel(path="test.xlsx", Sheet="test", col_names=TRUE)

# 일변량 질적자료
# 빈도
Orange
# 빈도수 확인
table(InsectSprays$spray)
# sort함수로 내림차순 조회
sort(table(InsectSprays$spray), decreasing=TRUE)

# 백분율
prop.table(table(InsectSprays$count))
prop.table(table(InsectSprays$count))*100
# round() 함수로 반올림하여 표현
round(prop.table(table(InsectSprays$count))*100, digits=1)

# 빈도와 백분율 한번에 계산
# freq()함수 : 결측값이 있는 경우 제거하고 계산
# install.packages("prettyR")
# library(prettyR)
# freq(InsectSprays$count, display.na=FALSE) # display.na=FALSE : 결측값 제외

# 막대그래프
type = c("A", "B", "O", "AB", "A", "A", "A", "AB", "O", "O", "O", "O", "B", "B", "B", "B", "AB", "O", "B")
blood = data.frame(type)
blood
table(blood)
# 단순한 막대그래프
barplot(table(blood$type), col="red", ylab="빈도", ylim=c(0,10), main="blood type barchart")