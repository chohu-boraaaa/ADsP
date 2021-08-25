# PAM 알고리즘
library(cluster)
library(DAAG)

# 결측치 제거
dat<-wages1833
dat<-na.omit(dat)

pamout <- pam(dat,3)
pamout

table(pamout$clustering)

fviz_cluster(pamout, data=dat, ellipse.type="convex", repel=FALSE)