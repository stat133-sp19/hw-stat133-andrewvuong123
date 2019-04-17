##################################################
## Title: Data Preparation
## Description: Contains the required variables used in the visualization phase
## Input: The 5 data frames for each player 
## Output: Summary text files of each player and a total summary
##################################################


# Read in data sets -------------------------------------------------------
iguodala <- read.csv("data/andre-iguodala.csv", stringsAsFactors = FALSE)
green <- read.csv("data/draymond-green.csv", stringsAsFactors = FALSE)
durant <- read.csv("data/kevin-durant.csv", stringsAsFactors = FALSE)
thompson <- read.csv("data/klay-thompson.csv", stringsAsFactors = FALSE)
curry <- read.csv("data/stephen-curry.csv", stringsAsFactors = FALSE)

# Add column names --------------------------------------------------------

iguodala$name <- "Andre Iguodala"
green$name <- "Draymond Green"
durant$name <- "Kevin Durant"
thompson$name <- "Klay Thompson"
curry$name <- "Stephen Curry"

# Descriptive values shot_made_flag ---------------------------------------

iguodala$shot_made_flag[iguodala$shot_made_flag == "n"] <- "shot_no"
iguodala$shot_made_flag[iguodala$shot_made_flag == "y"] <- "shot_yes"
green$shot_made_flag[green$shot_made_flag == "n"] <- "shot_no"
green$shot_made_flag[green$shot_made_flag == "y"] <- "shot_yes"
durant$shot_made_flag[durant$shot_made_flag == "n"] <- "shot_no"
durant$shot_made_flag[durant$shot_made_flag == "y"] <- "shot_yes" 
thompson$shot_made_flag[thompson$shot_made_flag == "n"] <- "shot_no"
thompson$shot_made_flag[thompson$shot_made_flag == "y"] <- "shot_yes"
curry$shot_made_flag[curry$shot_made_flag == "n"] <- "shot_no"
curry$shot_made_flag[curry$shot_made_flag == "y"] <- "shot_yes"

# Minute Column -----------------------------------------------------------

iguodala$minute <- (iguodala$period * 12) - iguodala$minutes_remaining 
green$minute <- (green$period * 12) - green$minutes_remaining 
durant$minute <- (durant$period * 12) - durant$minutes_remaining 
thompson$minute <- (thompson$period * 12) - thompson$minutes_remaining 
curry$minute <- (curry$period * 12) - curry$minutes_remaining 

# Summary -----------------------------------------------------------------

sink(file = 'output/andre-iguodala-summary.txt')
summary(iguodala)
sink()
sink(file = 'output/draymond-green-summary.txt')
summary(green)
sink()
sink(file = 'output/kevin-durant-summary.txt')
summary(durant)
sink()
sink(file = 'output/klay-thompson-summary.txt')
summary(thompson)
sink()
sink(file = 'output/stephen-curry-summary.txt')
summary(curry)
sink()

# Stack tables to single data frame ------------------------------------------------------------
total <- rbind(iguodala, green, durant, thompson, curry)

# Export assembled table ------------------------------------------------------------------
write.csv(total, file = 'data/shots-data.csv')

# Total Summary -----------------------------------------------------------------
sink(file = 'output/shots-data-summary.txt')
summary(total)
sink()

