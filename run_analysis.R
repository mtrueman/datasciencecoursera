# Read the file `features.txt` from a given data directory.
# Manipulates any features with 'mean' or 'std' in the string to be more
# variable-friendly.
read.features <- function(datadir) {
    filename <- file.path(datadir, 'features.txt')
    features <- read.table(filename, colClasses=c('NULL', 'character'))[,1]
    features <- sub("^(.+)-(mean|std)\\(\\)-?(X|Y|Z)?$", "\\1.\\2\\3",
                    features, fixed=F)
    return(features)
}

# Creates a vector of character vectors based on a vector of features.
# The values are 'numeric' if the feature contains '.mean' or '.std',
# 'NULL' otherwise.
filter.features <- function(features) {
    colClasses <- rep('NULL', length(features))
    colClasses[grepl("\\.(mean|std)", features)] <- 'numeric'
    return(colClasses)
}

# With a given data directory and subdirectory, reads the files
# `X_<subdir>.txt`, 'y_<subdir>.txt` and `subject_<subdir>.txt`
# and merges them into a single data frame.
read.files <- function(subdir, datadir, ...) {
    fnames <- file.path(datadir, subdir, paste(c('X_', 'y_', 'subject_'),
                                               subdir, '.txt', sep=''))
    
    x.data <- read.table(fnames[1], sep='', ...)
    y.data <- read.table(fnames[2], sep='', colClasses='numeric', col.names='activity')
    s.data <- read.table(fnames[3], sep='', colClasses='numeric', col.names='subject')
    data <- cbind(s.data, y.data, x.data)
    return(data)
}

# Reads the file `activity_labels.txt` from the given data directory
# and returns as a vector.
read.activities <- function(datadir) {
    filename <- file.path(datadir, 'activity_labels.txt')
    activities <- read.table(filename, colClasses=c('NULL', 'character'),
                             col.names=c('', 'activityname'))[,1]
    return(activities)
}

# Reads and combines the data from the 'test' and 'train'
# subdirectories of the given data directory, replacing activity
# ids with plain-english activity names.
create.combined.dataset <- function(datadir) {
    
    # Read data
    features <- read.features(datadir)
    colClasses <- filter.features(features)
    test.data <- read.files('test', col.names=features, colClasses=colClasses,
                            datadir=datadir)
    train.data <- read.files('train', col.names=features, colClasses=colClasses,
                             datadir=datadir)
    
    # Combine data
    data <- rbind(test.data, train.data)
        
    # Replace activity id with activity name
    activities <- read.activities(datadir)
    data$activity <- activities[data$activity]
    
    return(data)    
}

# Takes a dataset with 'subject' and 'activity' as the first two columns
# and produces the mean of all other columns.
create.summary.dataset <- function(all.data) {
    by <- list(all.data$subject, all.data$activity)
    names(by) <- list('subject', 'activity')
    return(aggregate(all.data[3:length(names(all.data))], by, mean))
}

# Wrapper for running `create.summary.dataset` with the output from
# `create.combined.dataset` using a defaul datadir. Also, writes
# the output into a file called `summary_data.txt` in the current
# working directory.
run <- function(datadir='UCI HAR Dataset') {
    all.data <- create.combined.dataset(datadir)
    summ.data <- create.summary.dataset(all.data)
    write.table(summ.data, file="summary_data.txt", row.names=F)
    return(summ.data)
}
