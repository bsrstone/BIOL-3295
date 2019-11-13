# ANALYSIS OF DUCK COUNT DATA
# This lab is an introduction to data science in biology.

# tidyr is a package written for data cleaning https://tidyr.tidyverse.org/
# Perhaps you are not familiar with messy data... to give you an example,
# the way we recorded dates as DD-MM-YYYY within a single cell was giving
# me major headaches: R considers this a word, so I need to
# exact all the information as numbers while telling it that dashes
# separate the relevant numbers. We use tidyr for its features to resolve
# this challenge.
# Make sure you install the package, i.e., >type install.packages("tidyr")
# into the console.
require(tidyr)
# I also really like the chron package. It easily calculates things like
# how many days from Jan 1 to July 30 and what day of the week will my
# birthday be in 2025. This functionality is useful because I would like to make
# a plot with dates on the x-axis and duck counts and the y-axis. The plot() function
# however requires numbers on the x-axis and Nov 9 is a combination of numbers and words
# so I will have problems. Alternatively, I could treat the dates as discrete data
# and make a bar chart, but then the x-axis wouldn't reflect the uneven number of 
# days between our duck counts.
# You'll want to install this package too: type >install.packages("chron")
# in the console.
require(chron)

# Uploading your data
#--------------
# You need to download Duck_Dates.csv from the class Github. It is in Labs>Duck_data
# You will need to correctly set this path.
# One trick is to 'source()' this file and look at the printout to the console
# This will help you if Duck_Dates.csv is saved in the same folder as this R code.
Duck.dataF19 = read.csv('~/Desktop/BIOL-3295/Labs/Duck_data/Duck_Dates.csv')

# Let's take a look at our duck data
head(Duck.dataF19)

# Note that something weird has happened in the 'Time' column that would need to be
# fixed if we were to work with this column. We, however, will only work with
# the columns 'Date' and 'Count'. We want to make a graph with time in
# days since Jan 1, 2017 on the x-axis and count on the y-axis.

# Let's start with 'Count'
Duck.dataF19$Count

# Observe that some rows have no data: 'NA'. We should remove these rows:
Data.v1 = na.omit(Duck.dataF19)

# Let's check if this worked out okay. One problem might be if the entire row
# containing the NA wasn't removed.
head(Data.v1)
# Our data looks okay.

# Now let's look at 'Dates'. Remember, we'll be working with Data.v1 now because
# Duck.dataF19 still contains the rows with the missing data.
head(Data.v1$Date)

# Clearly, these need to be converted into a more useable format. That package
# 'chron' is helpful for working with dates. It took me ages to figure out how to
# deal with our awful DD-MM-YYYY formats of our dates, but I eventually got this suggestion
# to clean this up:
# https://community.rstudio.com/t/converting-dates-year-month-day-to-3-separate-columns-year-month-day/8585/5
New.Dates = data.frame(date = Data.v1$Date, stringsAsFactors = FALSE)
# This %>% is from the tidyr package
New.Dates = New.Dates %>% separate(date, sep="-", into = c("day", "month", "year"))
New.Dates$day = as.numeric(New.Dates$day)
New.Dates$month = as.numeric(New.Dates$month)
New.Dates$year = as.numeric(New.Dates$year)

# Those few lines of code above are aimed at getting the data into the correct
# format so that the data can be used in the julian() function to determine
# how many days since Jan 1, 2017 our observations have been taken from. I choose
# 2017 because I first started doing this duck lab in 2017.
Days.Since = julian(New.Dates$month,New.Dates$day, New.Dates$year, c(month = 1,day= 1,year = 2017))

# 75 lines of code later (the struggle is real!) and we're now ready to make our
# graph:
plot(Days.Since, Data.v1$Count, xlab = "Days since Jan 1, 2017", ylab = "Ducks counted", main="Fall 2019", pch=19, ylim = c(0,35))

# Super graph - looks like it shows no change in the number of ducks reported this
# semester. Let's do a linear regression and look at if the slope is zero.
F19 = lm(Data.v1$Count~Days.Since)
summary(F19)
# Super. The intercept is bit misleading here because the x-axis starts at >900.
# The slope is -0.14 ducks per day, but the variability around the regression line
# suggests that the slope could also quite easily be 0 (only p=0.289 that the slope is
# different from zero). In addition, to the slope not being statistically significant
# it is also only moderately biologically significant: a decrease of 0.14 ducks per day. Therefore,
# the 60 days we recorded data for, would only suggest a decline of 8 ducks.

# Let's add the regression line to the graph.
abline(F19)

# Aside: Possibly, you are thinking, that I really should have deleted the "-", replaced
# them with "," in the original .csv file to save myself a lot of hassle. (1) it is 
# good practicle to process the data in R, but leave the original data alone, to prevent
# accidental, inadvertant changes, and (2) cleaning data is the life of a data scientist!
# ... and I wanted to show you that this is an important part of that career.

# Now let's compare with prior years of BIOL 3295 and their data collection.
# Of course, you will need to download 'Duck_All_Data.csv' and get the path correct
Duck.data=read.csv('~/Desktop/BIOL-3295/Labs/Lab 8/Duck_All_Data.csv')

# Analysis of data collected in Winter 2017 only
Duck.dataW17 = Duck.data[Duck.data$Day<250,]
# In the plot, I want to colour code the times of the collection
T1=which(Duck.data$Time=="1pm")
T2=which(Duck.data$Time=="2pm")
T3=which(Duck.data$Time=="5pm")

# Making the plot
par(mfrow=c(1,3))
plot(Duck.data$Day[T1], Duck.data$Count[T1], pch=15, col="orange", xlim=c(min(Duck.data$Day), 100),ylim = c(0,80), main = "Winter 2017", xlab= "days since Jan 1, 2017", ylab = "duck count")
points(Duck.data$Day[T2], Duck.data$Count[T2], pch=16, col="red")
points(Duck.data$Day[T3], Duck.data$Count[T3], pch=17, col="blue")

# Performing the linear regression
duck.modelW17 = lm(Count ~ Day, data = Duck.dataW17)
abline(duck.modelW17)
# To see the results of your linear regression type this into the console
summary(duck.modelW17)

# Analysis of data collected in Fall 2017 only
Duck.dataF17 = Duck.data[Duck.data$Day>250,]

# Plotting the data for Fall 2017 only
plot(Duck.dataF17$Day, Duck.dataF17$Count,xlab="days since Jan 1, 2017", ylab="duck count", pch=19, main="Fall 2017", ylim=c(0,80))

# Performing the linear regression
duck.modelF17 = lm(Count ~ Day, data = Duck.dataF17)
abline(duck.modelF17)

# Type this command into the console to see the results of your linear regression.
summary(duck.modelF17)

# Let's plot our data from Fall 2019 too.
plot(Days.Since, Data.v1$Count, xlab = "Days since Jan 1, 2017", ylab = "Ducks counted", main="Fall 2019", pch=19, ylim = c(0,80))
abline(F19)

# Neat! It looks like Fall 2019 may have a lower average
# number of ducks than Fall 2017, but I wonder if we got organized
# to count the ducks earlier in the year in Fall 2017. I would like
# to aggregate the Fall data and have model which is:
# Count ~ Days Since Jan 1 of given Year + Year. Also, it seems like November, December
# and January are big months for Burton's Pond to receive ducks.
# Somehow, it was possiblee to see >60 ducks in February and March of 2017
# but during the fall semesters in early November we were seeing ~30 ducks.
# I think we really need to start counting the ducks in December and January
# because it seems like currently we are not sampling when all the action
# happens!
# ----------

# Diagnostic plots (commented out - unnecessary for Lab)
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
