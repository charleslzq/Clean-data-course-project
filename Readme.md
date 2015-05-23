Firstly, each txt file will be read into a variable with the same name, like X_train will contains data read from X_train.txt.
Then, train set and test set for X, Y, and subject will be merged into one set, namely X, Y and subject.
Now, the names of X will be assigned according to data in the variable feature.
Also, the integer in Y will be replaced by the corresponding lables acoording to the relation between them provided by lables data frame.
At the same time, the column name of Y will be changed to "activity" and the column name of subject will be changed to "subject".
Then, those columns with "mean" or "std" in their columns names will be extracted and stored in a new table x_mean_sd.
Now, we can combine x_mean_sd, Y and subject into a new table named "all".
With table "all", we can calculate the mean of each variable for each subject and each activity and store it in a new table "new_data".
At last, we can write "new_data" into a txt file named "new_data".