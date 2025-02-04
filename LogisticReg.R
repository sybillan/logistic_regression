#Logistic Regression

library(datasets)
library(ggplot2)
Titanic_df<-data.frame(Titanic)
Titanic_df$Class<-as.factor(Titanic_df$Class)
regre<-glm(Survived~Class+Age+Sex+Freq,data=Titanic_df, family="binomial")
summary(regre)


Y<-data.frame("Crew","Adult","Female",as.numeric("50"))

Y[2,]<-data.frame("1st","Adult","Female",as.numeric("50"))

Y[3,]<-data.frame("2nd","Adult","Female",as.numeric("50"))

Y[4,]<-data.frame("3rd","Adult","Female",as.numeric("50"))

names(Y)<-c("Class","Age","Sex","Freq")

Y$pred<-predict(regre,Y, type="response")
ggplot( Y, aes(x=Class, y=pred)) +
  geom_point() 
