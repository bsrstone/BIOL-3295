# DUCK COUNTS
require(chron)
require(tidyr)
# When this code will produce:
# 1) A linear regression of the number of ducks counted versus time

# Uploading your data
#--------------
# You will need to correctly set this path.
# One trick is to 'source()' this file and look at the printout to the console
Duck.dataF19 = read.csv('~/Desktop/BIOL-3295/Labs/Duck_data/Duck_Dates.csv')

# Let's take a look at our duck
head(Duck.dataF19)

# Note that something weird has happed in the 'Time' column that would need to be
# fixed if we were to work with is column. We, however, will only work with
# the columns 'Date' and 'Count'. We want to make a graph with time since
# days since Jan 1, 2017 on the x-axis and count on the y-axis

# Let's start with 'Count'
Duck.dataF19$Count

# Observe that some rows have no data: 'NA'. We should remove these rows:
Data.v1 = na.omit(Duck.dataF19)

# Let's check this worked out okay. One problem might be if the entire row
# containing the NA wasn't removed.
head(Data.v1)
# Our data looks okay.

# Now let's look at 'Dates'. Remember, we'll be working with Data.v1 now because
# Duck.dataF19 still contains the rows with the missing data.
head(Data.v1$Date)

# Clearly, these need to be converted into a more useable format. That package 'chron'
# is helpful for working with dates.
# https://community.rstudio.com/t/converting-dates-year-month-day-to-3-separate-columns-year-month-day/8585/5
New.Dates = data.frame(date = Data.v1$Date, stringsAsFactors = FALSE)
New.Dates = New.Dates %>% separate(date, sep="-", into = c("day", "month", "year"))
New.Dates$day = as.numeric(New.Dates$day)
New.Dates$month = as.numeric(New.Dates$month)
New.Dates$year = as.numeric(New.Dates$year)

Days.Since = julian(New.Dates$month,New.Dates$day, New.Dates$year, c(month = 1,day= 1,year = 2017))

Duck.data=read.csv('~/Desktop/BIOL-3295/Labs/Lab 8/Duck_All_Data.csv')

# Analysis of data collect in Winter 2017 only
Duck.dataW17 = Duck.data[Duck.data$Day<250,]
T1=which(Duck.data$Time=="1pm")
T2=which(Duck.data$Time=="2pm")
T3=which(Duck.data$Time=="5pm")

# Making the plot
par(mfrow=c(1,2))
plot(Duck.data$Day[T1], Duck.data$Count[T1], pch=15, col="orange", xlim=c(min(Duck.data$Day), 100),ylim = c(0,80), main = "Winter 2017", xlab= "days since Jan 1, 2017", ylab = "duck count")
points(Duck.data$Day[T2], Duck.data$Count[T2], pch=16, col="red")
points(Duck.data$Day[T3], Duck.data$Count[T3], pch=17, col="blue")

# Performing the linear regression
duck.modelW17 = lm(Count ~ Day, data = Duck.dataW17)
abline(duck.modelW17)
# To see the results of your linear regression type this into the console
print(summary(duck.modelW17))

# Analysis of data collected in Fall 2017 only
Duck.dataF17 = Duck.data[Duck.data$Day>250,]

# Plotting the data for Fall 2017 only
plot(Duck.dataF17$Day, Duck.dataF17$Count,xlab="days since Jan 1, 2017", ylab="duck count", pch=19, main="Fall 2017", ylim=c(0,80))

# Performing the linear regression
duck.modelF17 = lm(Count ~ Day, data = Duck.dataF17)
abline(duck.modelF17)
# Type this command into the console to see the results of your linear regression.
summary(duck.modelF17)

# Diagnostic plots (commented out - unnecessary for Lab 8 in Fall 2017)
#----------------
# A linear regression assumes that the data follow a linear relationship
# (a straight line) and that deviations from this linear relationship follow
# a normal distribution.

# Residuals are the distance from each data point to the fitted line
# If the residuals show a pattern when plotted against the fitted values
# this suggests that the data do not follow a linear relationship and that 
# a different type of line (i.e. a quadratic) should be fit to the data.
# Let's check this assumption for the the Winter 2017 data
#plot(resid(duck.modelW17) ~ fitted(duck.modelW17), xlab = "Fitted values", ylab="Residuals", pch=16, main = "Residuals vs. fitted values")

# The linear regression assumes that the residuals follow a normal distribution.
# The QQ plot plots the quantiles of the residuals against the quantiles of the
# normal distribution. If these quantiles are the same the points in the graph
# will be in a straight line. If not, then the model formulation should be revisted
# and a different error distribution considered for the model.
#qqnorm(resid(duck.modelW17), xlab = "Theoretical Quantiles", ylab = "Residuals", pch=16)