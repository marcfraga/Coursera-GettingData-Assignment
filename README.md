# Coursera: Getting and Cleaning Data

**Repository for Coursera's "Getting and Cleaning Data" final assignment**

This document contains information about the "Getting and Cleaning Data" final assignment. **PLEASE READ THROUGH BEFORE GRADING.**

In this repo, you will find the following documents:

* README.md => This file. Contains detailed information about the asignment. 
* run_analysis.R => The R script for tidying the dataset. Contains additional, code-related information.
* Codebook.md => A new codebook, designed for the new, tidy dataset. Variable info comes from the original codebooks.
* tidy_Dataset.txt => The resulting, tydied dataset. You should obtain this exact same file by running the "run_analysis.R" script above.

## The Final Assignment:

Here you will find a rationale for each choice made, according to the course page and the [suggested guide](https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/) by David Hood. Also, the excellent paper from Hadley Wickham regarding [tidy data](https://www.jstatsoft.org/article/view/v059i10), was pivotal in understanding what tidy data should look and like. (Being from the relational database world, it sound very conter-intuitive at first. But it makes sense.)

The author talks about how data can be tidyied in different ways, according to the purpose intended. In this assignment, it is possible to arrange data in the "wide" and "narrow" forms. After a lot of consideration -- which included reading [this post](https://www.coursera.org/learn/data-cleaning/discussions/forums/h8cjA78DEeWtFA5RrsHG3Q/threads/-Cjtsip5Eea0DRLrrvCCTQ) at the course forum, I have made a choice to display the data in its "wide" form, with one subject per row and each variable in a column.

*Why is that?*

My understanding is that, in this assignment, we are arranging the dataset for future analysis/exploration. Therefore, if need be, we can subset the variables we want without much effort. Further calculations can be done by selecting activities with 

`[tidydataset$activity == "(desired activity)"]`

and variables (columns) can be selected either with the 

`[, (desired column)]` 

or by using, for instance, the select() command from dplyr. Therefore, I believe the "narrow" form, with stacked variables, would make it harder to select an individual, an activity (or any combination of these), and the desired activity. In my understanding, it would also potentially require an extra variable to code the measurements so as to reduce error. (Again, I am the relational database person, feel free to respond and criticize this approach.)

### Getting the Data

**This portion is entirely commented. Since all reviewers have already downloaded the data, you may proceed to Step 1.**

I've built this portion for training purposes, and/or for those who'd like to see a script working from the very beginning. 

I've followed the example given in the very first lecture and repeated thoughout the course: using a "data" directory, using that little script to check if it's there already and, if not, creating it. 

I've used the `unzip()` command to extract the files to the "/data" directory. Then, because the files open inside a directory named "UCI HAR Dataset," there's a command to set the working directory to that directory. 

**Important**: While acquiring data, it is very helpful to give variables a meaningful name, if there isn't one, for the sake of joining tables in the future. You may end up with two "V1" variables, and it might be complicated to sort out which is which. I do that on line 34 of my script, so I can tell the activity code from the subject code. 

#### 1. Building a full dataset from the individual files

Here, I take the X, Y, and subject files and collapse them using `rbind()`. This is also per David Hood's advice. It could also be done with `merge()`, which appeals to database people more than `rbind()`, but I felt the former would be more appropriated for this assignment.

After X, Y, and subjects are all joined, the whole set is combined with the `cbind()` command. 

(Some people might know these commands by the names *append* and *aggregate*, that is, joining by rows or columns, respectively.)

#### 2. Selecting the mean() and std() variables

I've found that to be quite challenging and tricky. There are two dangers here:

a) I believe the assignment calls for the mean() variables. There are variables called freqmean(), and if a selection is made using the `*mean()*` argument, these will be collected;
b) it is easy to collect a number vector from the 'features' list with the numbers of the desired variables. However, applying them to the columns of the data frame built in the previous section is tricky, since we have added the subject and activity variables (columns) to the table. 

*How are these issues addressed?*

A is addressed using the code

`grep("-mean\\(\\)|-std\\(\\))`, 

about which I've learned in an excellent tutorial [here](https://stat.ethz.ch/R-manual/R-devel/library/base/html/grep.html) and by reading through the [regex](https://stat.ethz.ch/R-manual/R-devel/library/base/html/regex.html) page in the R Base package guide.

B is addressed by craeting a new dataset. The vector with the desired variables is applied to the initial dataset and assigned to a new variable "filteredData," which searches the column names of the initial dataset. In this porcess, the *subject* and *activity* variables are removed -- they were "filtered". Then a new dataset is build with only the first two columns of the original dataset and all the columns of the filtered dataset.

#### 3. Using descriptive names for the activities.

I've tried a number of approaches to this, and after a lot of searching, I've found [this answer](http://stackoverflow.com/questions/11817371/replace-numbers-in-data-frame-column-in-r) on StackOverflow, and it saved me. We have done this in the R course, but I didn't know it could be applied to a variable in a table. 

#### 4. Assigning descriptive names to the variables

Since step 2, the variables are already "named." In this case, I just apply the gsub command to make names clearer.

*Why not use 'accellerator' in lieu of 'accel'?*

Technically, it is not right or wrong. Descriptive variable names are always good. However, it is a good practice to make them clear enough but not excessively long. That comes from that time when file names could only have so many characters, computer memory cost the price of gold, and processors were 10 times more expensive and 10000 slower than today.

However, a variable name such as "TimeBodyAngularAccellerometerMean()-X" might make it hard to visualize data. And visualising data is very, very important to someone analysing data. Therefore, whereas 'acc' might be confused with accuracy or accent, 'accel' can be easily related to acceleration or, in this case, to the accelerometer. Therefore, I believe the name 'TimeBodyGyroMeanX' is meaningful and clean, and helps tidying the dataset by not extending it laterally too much.

#### 5. Creating a new dataset with averages for each subject and each activity

This was clearly the most challeging part of the assignment. Since the table. at this stage, has character values (the activity names) and integer values (the subject IDs), it is not possible to calculate means without splitting the table again. Therefore, in this section I create a new variable with only the columns with measurement variables. Then, the new set is created using the `aggregate()` function. Here again, the folks of ETZ in Zürick saved the day. [This post](https://stat.ethz.ch/pipermail/r-help/2010-February/227899.html) was all I needed. The column names on the new dataset -- from the 'list' argument -- would turn into "Group.1" and "Group.2." In that post, they show how to build the list argument and assign the names you want!

Also, [this post](http://www.onthelambda.com/2014/02/10/how-dplyr-replaced-my-most-common-r-idioms/) from data scientist Tony Fischetti gave me numerous examples on how to use aggregate(). 

Finally, the tidy dataset is output with the `write.table()` command. In my script, there's a commented line for anyone who wants to load the resulting dataset.

*Why didn't I reorganise the data?*

My initial thought was to do so using the `arrange()` command from dplyr. It would be neatier to have the dataset by ascending order of subject and activity. But it might cause problems for peer reviewing, since it would be somewhat different than the resulting dataset from step 4. 

I appreciate you looking at my script and dataset, and wish you luck in your assignment.
