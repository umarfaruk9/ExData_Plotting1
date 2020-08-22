library("data.table")

getwd()
setwd("/Users/umarfaruk/Desktop/Coursera R Programming/ExData_Plotting1")

#I wil read in data from file then subsets data for specified dates
electricDT <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)


## Reading column names and viewing the data
electricDT
colnames(electricDT)
head(electricDT)
summary(electricDT)
str(electricDT)

# Prevents histogram from printing in scientific notation
electricDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Change Date Column to Date Type
electricDT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filter Dates for 2007-02-01 and 2007-02-02
electricDT <- electricDT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

## Plot 1
hist(electricDT[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()


