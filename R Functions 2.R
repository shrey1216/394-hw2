#1
#(a) P(W<10) W~N(12,16)
#N(mean, variance)
pnorm(9, mean = 12, sd = 4)

#(b) P(X<7) X ∼ X(2)(8)
#lower tail TRUE gives probability at or below Z. 
#That is why we should use 6 instead of 7, so the value at 7 is not included. 
#TRUE BY DEFAULT
pchisq(6, df = 8)
#lower.tail = TRUE, log.p = FALSE)

#(c) P(Y = 6) Binomial(8,0.7)
dbinom(6, size=8, prob=0.7)

#(d) P(Z=4) Z~Poisson(4)
dpois(4,4)

#2
#Use the R script to plot a histogram for the react data set in the ISwR package
#(a) by using the hist function
hist(react)

#(b) by using the truehist function from the MASS package
truehist(react)

#3 
#Use the R script to generate 100 exponentially distributed random variables with rate 3, 
#and plot the empirical cumulative distribution function
x <- rexp(100,3)
plot(ecdf(x))

#4 
#Use the R script to construct the following table that summarizes the number of
#people who have car accidents in a school
accidents <- matrix(c(25, 121, 18, 92, 13, 130, 6, 87), nrow = 4, byrow = TRUE)
colnames(accidents) <- c("Yes", "No")
rownames(accidents) <- c("18-20", "21-23", "24-25", ">25")
names(dimnames(accidents)) <- c("Age", "Accidents")
accidents

#5 
#Use the d logret 6stocks.txt data set to answer the following questions
#(a) Use the R script to perform a one-sample t-test for Intel with the null hypothesis
#that the mean of its log return is 0 at the 5% level
stocks <- read.table("/Users/shreyanwankavala/Desktop/AMS\ 394\ /Homework\ 2/d_logret_6stocks.txt", header = TRUE)
t.test(stocks$Intel, mu = 0)

#(b) Use the R script to perform a Wilcoxon signed-rank test for Intel with the null
#hypothesis that the mean of its log return is 0 at the 5% level
wilcox.test(stocks$Intel, mu = 0)

#(c) Use the R script to compare the variances of log returns for Pfizer and Intel
var.test(stocks$Pfizer, stocks$Intel)

#(d) Use the R script to perform a two-sample t-test to conclude if the mean log
#returns of Pfizer and Intel are the same or not at the 5% level
t.test(stocks$Pfizer, stocks$Intel)

#(e)Use the R script to perform a two-sample Wilcoxon test to conclude if the mean
#log returns of Pfizer and Intel are the same or not at the 5% level.
wilcox.test(stocks$Pfizer, stocks$Intel)

#6
#Production lines in a manufacturing plant are set to make steel ball bearings with a diameter of
#1 micron. Ten ball bearings were randomly selected from two production lines. The diameters
#of the ball bearings measured in microns were as follows:
bearings <- matrix(c(1.18, 1.42, 0.69, 0.88, 1.62, 1.09, 1.53, 1.02, 1.19, 1.32, 1.72, 1.62, 1.69, 0.79, 1.79, 0.77, 1.44, 1.29, 1.96, 0.99), nrow = 2, byrow = TRUE)
rownames(bearings) <- c("First Line", "Second Line")
bearings

#(a) Use the R script to calculate a 95% confidence interval for the difference
#between the mean diameters of ball bearings from the two production lines, assuming the
#variances of the diameters of ball bearings from the two production lines are the same. Is
#there a statistically significant difference at α = 0.05?
t.test(bearings[1,], bearings[2,], var.equal = TRUE)

#There is not a statistically significant difference at α = 0.05, because the p-value from the test
#is 0.2112 which is greater than 0.05.

#(b) Repeat (a) without assuming the variances of the diameters of ball bearings
#from the two production lines are the same. Compare the results.
t.test(bearings[1,],bearings[2,])

#This time, we did not assume the variances of the diameters of ball bearings were the same. 
#The p-value increased from 0.2112 to 0.2134. The new p-value is still greater than 0.05, which means
#there is not a statistically significant difference between the mean diameters.

#7
#To determine whether glaucoma affects the corneal thickness, measurements were made in 8
#people affected by glaucoma in one eye but not in the other. The corneal thicknesses (in
#microns) were as follows:
eyes <- matrix(c(488, 478, 480, 426, 440, 410, 459, 460,484, 478, 492, 444, 436, 398, 464, 476), nrow = 2, byrow = TRUE)
rownames(eyes) <- c("Eye affected by glaucoma", "Eye not affected by glaucoma")
colnames(eyes) <- c("1", "2", "3", "4", "5", "6", "7", "8")
names(dimnames(eyes)) <- c("Person", "")
eyes

#(a) Use the R script to test whether the mean corneal thickness is different for
#people affected by glaucoma in one eye but not in the other at α = 0.10.
t.test(eyes[1,], eyes[2,], conf.level = 0.90)

#(b) Calculate a 90% confidence interval for the mean difference in thickness.
#From the script from 7(a), the 90% confidence interval for the mean difference in thickness 
#is -29.94056 to 22.19056. 

