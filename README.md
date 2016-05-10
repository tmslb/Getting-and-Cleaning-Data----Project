# Getting-and-Cleaning-Data----Project

This is the course project for the Getting and Cleaning Data course. As a part of this project, we were required to create an R script, run_analysis.R - which helps us in coming up with a tidy dataset that is in a consumable format. The steps followed for this analysis are as follows:

-Download the dataset if it does not already exist in the working directory </br>
-Load the activity and feature info <br />
-Loads both the training and test datasets, keeping only those columns which reflect a mean or standard deviation<br />
-Loads the activity and subject data for each dataset, and merges those columns with the dataset<br />
-Merges the two datasets<br />
-Converts the activity and subject columns into factors<br />
-Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.<br />
-The end result is shown in the file ucitidy.txt.<br />
