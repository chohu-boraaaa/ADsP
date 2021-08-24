# mxnet 다운로드
install.packages("DiagrammeR")
install.packages("https://s3.ca-central-1.amazonaws.com/jeremiedb/share/mxnet/CPU/mxnet.zip", repos = NULL)

# 추가 패키지 설치
install.packages("XML")
install.packages("DiagrammeR")
install.packages("devtools")

library("XML")
library("DiagrammeR")
library("devtools")
library("mxnet")

# iris 데이터 로딩
attach(iris)

iris[,5] = as.numeric(iris[,5])-1
table(Species)
head(iris)

# 학습데이터와 검증데이터 추출
set.seed(1000)
N <- nrow(iris)
tr.idx <- sample(1:N, size=N*2/3, replace=FALSE)
train <- data.matrix(iris[tr.idx,])
test<-data.matrix(iris[-tr.idx,])

# train_feature에 5번째 컬럼 제외하고 저장. 5번째 컬럼은 iris 꽃 이름이 있는 Species
train_feature <- train[,-5]
trainLabels <- train[,5]
test_feature <- test[,-5]
testLabels <- test[,5]

# trainLabels에 있는 데이터 확인
head(trainLabels)

# 신경망 분석을 위해 첫 번째 계층 생성. 은닉 영역은 300개로 하고 활성화 함수는 "ReLU" 사용
# 신경망 분석 수행
require(mxnet)

# 첫번째 계층
my_input = mx.symbol.Variable('data')
FC1 = mx.symbol.FullyConnected(data=my_input, num.hidden=300, name='FC1')
relu1 = mx.symbol.Activation(data=FC1, act.type='relu', name='relu1')
# 은닉 계층은 300개로 설정

# 두번째 계층
FC2 = mx.symbol.FullyConnected(data=relu1, num.hidden=100, name='FC2')
relu2 = mx.symbol.Activation(data=FC2, act.type='relu', name='relu2')

# 세번째 계층
FC3 = mx.symbol.FullyConnected(data=relu2, num.hidden=3, name='FC3')
# 최종 출력변수(Species)가 3가지 종류이므로 은닉영역 3으로 함

# 신경망 학습 및 가시화
softmax = mx.symbol.SoftmaxOutput(data=FC3, name='sm')

# 신경망 학습
mx.set.seed(1000)
device <- mx.cpu()
model <- mx.model.FeedForward.create(softmax, optimizer="sgd", array.batch.size=25, num.round=500, learning.rate=0.1, X=train_feature, y=trainLabels, ctx=device, eval.metric = mx.metric.accuracy, array.layout = "rowmajor", epoch.end.callback=mx.callback.log.train.metric(100))
graph.viz(model$symbol)

# 신경망 모델 검증
predict_probs <- predict(model, test_feature, array.layout="rowmajor")
predicted_labels <- max.col(t(predict_probs))-1
table(testLabels,predicted_labels)
sum(diag(table(testLabels, predicted_labels)))/length(predicted_labels)
# 98%의 정확도