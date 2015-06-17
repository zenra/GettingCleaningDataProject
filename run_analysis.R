run_analysis <- function () {
    ## Set up directory and file names as variables for reading later
    projdir <- './CourseProject/'
    projfilename <- 'projectdata.zip'
    fileurl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
    projfileurl <- paste(projdir, projfilename, sep='')
    datasetdir <- paste(projdir, 'UCI HAR Dataset/', sep='')
    datasettesty <- paste(datasetdir, 'test/y_test.txt', sep='')
    datasettestx <- paste(datasetdir, 'test/X_test.txt', sep='')
    datasettestsubjects <- paste(datasetdir, 'test/subject_test.txt', sep='')
    datasettrainy <- paste(datasetdir, 'train/y_train.txt', sep='')
    datasettrainx <- paste(datasetdir, 'train/X_train.txt', sep='')
    datasettrainsubjects <- paste(datasetdir, 'train/subject_train.txt', sep='')
    datasetfeaturenames <- paste(datasetdir, 'features.txt', sep='')
    outputfile <- paste(projdir, 'tidydataset.txt', sep='')
    
    ## The bandsEnergy() feature names omitted -XYZ so they will appear as
    ## duplicates when being used as column names. Recording them here to 
    ## be changed later
    featurenamesx1dup <- c(303:316)
    featurenamesy1dup <- c(317:330)
    featurenamesz1dup <- c(331:344)
    featurenamesx2dup <- c(382:395)
    featurenamesy2dup <- c(396:409)
    featurenamesz2dup <- c(410:423)
    featurenamesx3dup <- c(461:474)
    featurenamesy3dup <- c(475:488)
    featurenamesz3dup <- c(489:502)
    
    ## Creates project directory if it doesn't exist, and downloads and unzips
    ## the data files
    if (!file.exists(projdir)) {
        dir.create(projdir)
    }
    download.file(fileurl, destfile = projfileurl, method = "curl")
    unzip(projfileurl, exdir = projdir)
    
    ## Checks if the packages data.table and dplyr are loaded and installs
    ##  and loads them if not
    if (!require(data.table)) {
        install.packages("data.table")
    }
    library(data.table)
    if (!require(dplyr)) {
        install.packages("dplyr")
    }
    library(dplyr)
    
    ## Read the feature names, cleaning up special characters
    ## and resolve duplications in bandEnergy() labels
    featurenames <- fread(datasetfeaturenames)
    featurenames[, V2:=gsub('-', '.', V2)]
    featurenames[, V2:=gsub('\\(\\)', '', V2)]
    featurenames[featurenamesx1dup, V2:=paste(V2, '.X', sep='')]
    featurenames[featurenamesy1dup, V2:=paste(V2, '.Y', sep='')]
    featurenames[featurenamesz1dup, V2:=paste(V2, '.Z', sep='')]
    featurenames[featurenamesx2dup, V2:=paste(V2, '.X', sep='')]
    featurenames[featurenamesy2dup, V2:=paste(V2, '.Y', sep='')]
    featurenames[featurenamesz2dup, V2:=paste(V2, '.Z', sep='')]
    featurenames[featurenamesx3dup, V2:=paste(V2, '.X', sep='')]
    featurenames[featurenamesy3dup, V2:=paste(V2, '.Y', sep='')]
    featurenames[featurenamesz3dup, V2:=paste(V2, '.Z', sep='')]
    
    ## Read the test Subjects, Activities and data set into a data table
    DTtest <- fread(datasettestsubjects)
    temp <- fread(datasettesty)
    DTtest[, Activity := temp$V1]
    temp2 <- read.table(datasettestx)
    DTtest[, featurenames$V2 := temp2]
    setnames(DTtest, 1, 'Subject')
    setkey(DTtest, Subject)
    
    ## Read the training Subjects, Activities and data set into a data table
    DTtrain <- fread(datasettrainsubjects)
    temp <- fread(datasettrainy)
    DTtrain[, Activity := temp$V1]
    temp2 <- read.table(datasettrainx)
    DTtrain[, featurenames$V2 := temp2]
    setnames(DTtrain, 1, 'Subject')
    setkey(DTtrain, Subject)
    
    ## Combine test and train data sets into one data table, ordered by
    ## Subject ID
    DTall <- rbind(DTtest, DTtrain)
    DTall <- arrange(DTall, Subject)
    
    ## Subset only the Subject, Activity, mean() and std() values for
    ## measurements. Make Subject and Activity factors.
    DTall <- select(DTall, Subject, Activity, matches('mean()'), matches('std()'))
    DTall[, Activity := factor(Activity, 1:6, labels=c('WALKING', 'WALKING_UPSTAIRS', 'WALKING_DOWNSTAIRS', 'SITTING', 'STANDING', 'LAYING'))]
    DTall[, Subject:=as.factor(Subject)]
    
    ## Calculate the average of each variable grouped by Subject AND Activity,
    ## store in new data table, and write it in a txt file
    DTtidy <- ddply(DTall, c('Subject', 'Activity'), function(x) unlist(lapply(select(x, -Subject, -Activity), mean)))
    write.table(DTtidy, file=outputfile, row.name=FALSE)
}