# Getting-and-Cleaning-Data----Project

##Code Book

This code book summarizes the resulting data fields in ucitidy.txt file.

1. train, train_activities, train_subjects, test, test_activities, test_subjects contain the data from the downloaded files </br>
2. train data is made up of train, train_activities, train_subjects and test data is made up of test, test_activities, test_subjects </br>
3. Train and test combine to form merged data </br>
4. features_wanted uses the grep function to extract only the measurements of mean and standard deviation
5. gsub function was used to make transformations to the data
6. Used descriptive activity names and labels in lines 54 and 55
7. Finally, merged_data.mean contains the relevant averages (asked in the project) which will be later stored in a .txt file. </br>

Identifiers

subject - The ID of the test subject <br />
activity - The type of activity performed when the corresponding measurements were taken <br />

Activity Labels

WALKING (value 1): subject was walking during the test<br />
WALKING_UPSTAIRS (value 2): subject was walking up a staircase during the test<br />
WALKING_DOWNSTAIRS (value 3): subject was walking down a staircase during the test<br />
SITTING (value 4): subject was sitting during the test<br />
STANDING (value 5): subject was standing during the test<br />
LAYING (value 6): subject was laying down during the test<br />
