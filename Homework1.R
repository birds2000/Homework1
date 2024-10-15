Bird is so cool!! #bestorientationbuddy!!!!
#1.

#First, we import the data into RStudio. Yay!
#Because the data in 'bonddata' already has them labeled either 'Carried' or 'Defeated', we run the table function with Result to find both values.
table(bonddata$Result)
prop.table(table(bonddata$Result,bonddata$Type),2)
#Column percentages add up to 1 for each column, allowing us to see the rates in approved bonds for each individual government type. 

#2.

#To calculate a new variable that is the sum of the votes for and against the bond measure, we created a variable called 'Votes_Total'.
Votes_Total <- bonddata$VotesFor+bonddata$VotesAgainst
head(Votes_Total) #Utilized head to check that the code worked!

#Now we used max to find the highest voter turnout count.
max(Votes_Total, na.rm = TRUE)
[1] 1030414

#Next, we created a subset of every row of the highest voter turnout column so that we could see all information.
maxvote <- bonddata[Votes_Total==1030414,]
head(maxvote) #This gives us all informaton we need to answer the question.
bonddata$Votes_Total <- Votes_Total #This moves the total voter turnout count to the data set to be used in future questions.

#3.

#Created a subset that is made of all bonds that were carried and had a combined voter turnout count of 100 or higher. 
highcarriedbonds <- bonddata[bonddata$Result=='Carried'&Votes_Total>=100,]
head(highcarriedbonds)
#Utilized head to check that we were pulling correct values.

#Then, we created a variable that calculated the proportion of votes that were for the bond measure.
forbondpercent <- highcarriedbonds$VotesFor/highcarriedbonds$Votes_Total

#Now we used a graph to show the distribution of this new variable.
hist(forbondpercent,main='Total Votes In Favor of Bond Measure',xlab='For the Bond',col='dark green',xlim=c(0.5,1),ylim=c(0,800))

IQR(forbondpercent)
fivenum(forbondpercent) #We used the five number summary to get descriptive statistics like Q1, Median, and Q3.

#4.

#In order to create a graph, we need to move the forbondpercent variables into the dataset. 
#Since we have two numerical values, we want to use a scatterplot to compare our data.
plot(highcarriedbonds$Amount,forbondpercent,main='Cost v.s. For Bond Percent',xlab='Cost ($)',ylab='Percentage',pch=20)
cor(highcarriedbonds$Amount,forbondpercent) #This code is to find the correlation of the cost of the bond and the margin bond was approved. We want to know if the the margin a bond was approved by is related to its cost. 
#This value gives us a very small correlation, which is also displayed in the graph. 

