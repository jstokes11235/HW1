

library("tidyverse")

#question 1
su <- read.delim("Su_raw_matrix.txt")
# turn file into data frame
liver_mean <- mean(su$Liver_2.CEL)
liver_sd <-sd(su$Liver_2.CEL)
# find the average and standard deviation for that column
total_mean <- colMeans(su)
total_sum <- colSums(su)
#find the total for each column 

#question 2
stuff1 <-data.frame( value =rnorm(10000, mean = 0, sd = 0.2))
stuff2 <- data.frame( value2 = rnorm(10000, mean = 0, sd = 0.5))

ggplot(stuff1, aes(x=value)) +
  geom_histogram(binwidth=.5)
ggplot(stuff2, aes(x=value2)) +
  geom_histogram(binwidth=.5)
# these two graphs have different tails. Not surprisingly the graph with the higher standard deviation
# also has larger tails. 

#question 3 
dat <- data.frame(cond = factor(rep(c("A","B"), each=200)),
                  rating = c(rnorm(200),rnorm(200, mean=.8)))
# Overlaid histograms
ggplot(dat, aes(x=rating, fill=cond)) +
  geom_histogram(binwidth=.5, alpha=.5, position="identity")
# Interleaved histograms
ggplot(dat, aes(x=rating, fill=cond)) + geom_histogram(binwidth=.5, position="dodge")
# Density plots
ggplot(dat, aes(x=rating, colour=cond)) + geom_density()
# Density plots with semitransparent fill
ggplot(dat, aes(x=rating, fill=cond)) + geom_density(alpha=.3)
#this is all showing how multiple different graph types work in R


diabetes <- read.csv("diabetes_train.csv")
#now running the same graphs for different data sets. 
# Overlaid histograms
ggplot(diabetes, aes(x=mass, fill=class)) +
  geom_histogram(binwidth=.5, alpha=.5, position="identity")
# Interleaved histograms
ggplot(diabetes, aes(x=mass, fill=class)) + geom_histogram(binwidth=.5, position="dodge")
# Density plots
ggplot(diabetes, aes(x=mass, fill=class)) + geom_density()
# Density plots with semitransparent fill
ggplot(diabetes, aes(x=mass, fill=class)) + geom_density(alpha=.3)
#this is all showing how multiple different graph types work in R



# question 4
passengers <- read.csv("titanic.csv")
passengers %>% drop_na() %>% summary()
# remove blank rows
passengers %>% filter(Sex == "male")
#look at only the males
 passengers %>% arrange(desc(Fare))
#order largest to smallest fare
 passengers %>% mutate(FamSize = Parch + SibSp)
 #total people in family column added to end
passengers %>% group_by(Sex) %>% summarise(meanFare = mean(Fare), numSurv = sum(Survived))
#average cost and number who survived grouped by sex


# question 5

quantile(diabetes$skin,probs = c(0.10,0.30,0.50,0.60))
#using the probs allows quantile to pull in specific percentiles. 
