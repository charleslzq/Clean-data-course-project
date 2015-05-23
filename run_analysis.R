X_train <- read.table(file.path("train","X_train.txt"), stringsAsFactors = FALSE);
Y_train <- read.table(file.path("train","Y_train.txt"), stringsAsFactors = FALSE);
subject_train <- read.table(file.path("train","subject_train.txt"), stringsAsFactors = FALSE);

X_test <- read.table(file.path("test","X_test.txt"), stringsAsFactors = FALSE);
Y_test <- read.table(file.path("test","y_test.txt"), stringsAsFactors = FALSE);
subject_test <- read.table(file.path("test","subject_test.txt"), stringsAsFactors = FALSE);

features <- read.table("features.txt", stringsAsFactors = FALSE);
labels <- read.table("activity_labels.txt", stringsAsFactors = FALSE);

X <- rbind(X_train, X_test);
Y <- rbind(Y_train, Y_test);
subject <- rbind(subject_train, subject_test);



names(X) <- features[,2];
Y[,1] <- labels[Y[,1],2];
names(Y) <- "Activity";
names(subject) <- "Subject";

x_mean_sd <- X[,grep("-(mean|std)\\(\\)", features[, 2])];

all <- cbind(x_mean_sd,Y,subject);

library(plyr);
new_data <- ddply(all, .(Subject, Activity), function(e) colMeans(e[,1:66]));
write.table(new_data, "averages_data.txt", row.name=FALSE);