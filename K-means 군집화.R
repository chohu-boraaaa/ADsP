install.packages("factoextra")
install.packages("DAAG")
library(factoextra)
library(DAAG)

# 결측치 제거
dat<-wages1833
dat<-na.omit(dat)

# wss는 그룹내부의 합계제곱 산출
# 그래프에서 완만해지는 지점을 최적 K로 추정
fviz_nbclust(dat, kmeans, method="wss")
# 최적 k=3으로 추정

# K-means 알고리즘 실행(k=3)
set.seed(200)
km<-kmeans(dat, 3, nstart=25)

# 시각화, Convex 모양, Repel은 관측치를 표기
fviz_cluster(km, data=dat, ellipse.type="convex", repel=TRUE)