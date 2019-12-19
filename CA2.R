setwd("/users/pgrad/sarangia/Downloads")
library(readxl)
data <- read_excel("Project Data.xlsx")
data
data <- data[,-1]
data
library(rpart)
library("partykit")
Target = ifelse(data$Response==1,'Y','N')
data = data.frame(data,Target)
data
data1 = data[,-1]
data1

# X01
DT_ModelX01 <- rpart(Target~X1+X2+X3+X4+X5+X6+X7+Group,data=data1)
print(DT_ModelX01)
plot(as.party(DT_ModelX01))

# Y01
DT_ModelY01 <- rpart(Target~Y1+Y2+Y3+Y4+Y5+Y6+Y7+Group,data=data1)
print(DT_ModelY01)
plot(as.party(DT_ModelY01))

# XY01
DT_ModelXY01 <- rpart(Target~.,data=data1)
print(DT_ModelXY01)
plot(as.party(DT_ModelXY01))

# X0
data2 = data1[data1$Group==0,]
data2
DT_ModelX0 <- rpart(Target~X1+X2+X3+X4+X5+X6+X7+Group,data=data2)
print(DT_ModelX0)
plot(as.party(DT_ModelX0))

# Y1
data2 = data1[data1$Group==1,]
data2
DT_ModelY1 <- rpart(Target~Y1+Y2+Y3+Y4+Y5+Y6+Y7+Group,data=data2)
print(DT_ModelY1)
plot(as.party(DT_ModelY1))

# Y0
data2 = data1[data1$Group==0,]
data2
DT_ModelY0 <- rpart(Target~Y1+Y2+Y3+Y4+Y5+Y6+Y7+Group,data=data2)
print(DT_ModelY0)
plot(as.party(DT_ModelY0))

# X1
data2 = data1[data1$Group==1,]
data2
DT_ModelX1 <- rpart(Target~X1+X2+X3+X4+X5+X6+X7+Group,data=data2)
print(DT_ModelX1)
plot(as.party(DT_ModelX1))

# XY0
data2 = data1[data1$Group==0,]
data2
DT_ModelXY0 <- rpart(Target~.,data=data2)
print(DT_ModelXY0)
plot(as.party(DT_ModelXY0))

#XY1
data2 = data1[data1$Group==1,]
data2
DT_ModelXY1 <- rpart(Target~.,data=data2)
print(DT_ModelXY1)
plot(as.party(DT_ModelXY1))
