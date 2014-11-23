## UCI HAR Dataset Analysis

The script `run_analysis.R` contains functions for reading,
combining and meaning the UCI HAR dataset.

For more information regarding the initial dataset, see 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The original dataset contains information on how the data were
measures. With this script is included a code book for additional
information on the combined and summarised dataset.

## Contents of `run_analysis.R`

There are two main functions:

* `create.combined.dataset()`
* `create.summary.dataset()`

plus a wrapper function, `run()`.

### `create.combined.dataset()`

Arguments:

* `datadir`: the path to the directory containing the UCI HAR dataset.

Output:

* Returns a dataframe containing both the test and train subsets of
  data with the activity names given in plain english.

Description:

* Reads and filters boths sets of data (only looking at mean and std of
  measurements).

### `create.summary.dataset()`

Arguments:

* `all.data`: a dataframe with at least 'subject' and 'activity' columns.

Output:

* Returns a dataframe with the mean value of every distinct combination
  of 'subject' and 'activity'.

### `run()`

Arguments:

* `datadir`: the path to the directory containing the UCI HAR dataset.
  This defaults to the directory `UCI HAR Dataset` in the current working
  directory.

Output:

* The summary dataset as produced by `create.summary.dataset()`.
* Also writes this to a file `summary_data.txt` in the current working
  directory.
