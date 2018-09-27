# Analises preliminares Desafio Data Science
# Carlos Tonhatti

# Carregar dados 

Dados_brutos<-read.csv2("bank-full.csv")
head(Dados_brutos)
dim(Dados_brutos)

# profissoes

job_per_category<-table(Dados_brutos$job)
personal_loan_job<-table(Dados_brutos$job,Dados_brutos$loan)
housing_loan_job<-table(Dados_brutos$job,Dados_brutos$housing)
both<-table(Dados_brutos$job, Dados_brutos$housing=="yes" & Dados_brutos$loan=="yes")

## Número de emprestimos por categoria excluindo aqueles que fazem ambos emprestimos
grouping_positive_loan_job<-data.frame(personal=personal_loan_job[,2], housing=housing_loan_job[,2])
Total_emprestimos<-rowSums(grouping_positive_loan_job)-both[,2]
Total_emprestimos_percent<-Total_emprestimos/job_per_category
Total_emprestimos_percent<-as.data.frame(Total_emprestimos_percent)

both[,2]/job_per_category
library(ggplot2)
ggplot(Total_emprestimos_percent,aes(reorder(Var1,Freq),y=Freq))+geom_col()+ coord_flip()+
    labs(x="Empregos", y="Probabilidade de fazer um empréstimo ")

# Dividindo por categoria
grouping_percent<-grouping_positive_loan_job/job_per_category
plot(grouping_percent$personal,grouping_percent$housing)
ggplot(grouping_percent, aes(personal, housing)) + geom_text(aes(label=rownames(grouping_percent)))


### Contatos 

ggplot(Dados_brutos,aes(x=campaign, fill=y))+ geom_bar(position = "dodge")

ggplot(Dados_brutos, aes(x=y, y=campaign))+geom_boxplot()

Sucess<-Dados_brutos[Dados_brutos$y=="yes",]
Fail<-Dados_brutos[Dados_brutos$y=="no",]

plot(density(Sucess$campaign))

quantile(Sucess$campaign, probs = seq(0,1, 0.05))

#Cor

previa_atual<-data.frame(previa=Dados_brutos$poutcome, atual= Dados_brutos$y)

ss<-ifelse(previa_atual$previa=="other" | previa_atual$previa=="unknown",F,T)
  
  
JustCamp<- previa_atual[ss,]

JustCamp<-data.frame(previa=factor(JustCamp$previa),atual=factor(JustCamp$atual))

table(JustCamp)

X2test<-chisq.test(table(JustCamp))


## Caracteristicas do emprestimo imobiliario 
# apenas dados que interessam. Excluir os dados sobre as campanhas de marketing

Dados_relevantes<-Dados_brutos[,1:8]


library(caret)


model<- train(housing ~ ., data = Dados_relevantes, 
                 method = "rpart")
library(rattle)
fancyRpartPlot(model$finalModel)





library(lattice)
splom(~Dados_relevantes,groups=as.factor(default),data=Dados_relevantes,pch=20,type="p",cex=1)

ggplot(Dados_relevantes, aes(x=age, fill=default)) + geom_density()
