import delimited "WDI_raw1.csv"
##let's browse through the data
browse
##let us start by cleaning the data. Upon inspection, it seems like the missing values in this dataset are denoted by ".." let's remove them
drop if v5 == ".." | v6 == ".." | v7 == ".." | v8 == ".."
##let's also look if there are any actual missings
drop if missing(v5) | missing(v6) | missing(v7) | missing(v8)
##now, we will look at variables in our dataset
describe
##first of all, however, let us rename the variables in a sensible way
rename v1 year
browse
##as the second variable basically contains the same thing as the first one, we can remove it
drop v2
##let's rename all the remaining vars in one step
rename (v3 v4 v5 v6 v7 v8) (country_name country_code infant_mortality immunization population gdp)
##the first row in our dataset includes the description of vars, so we can get rid of it
drop in 1
##let's now see what types our variables are
describe
##we can see that all of them are strings, but that does not seem right. let us turn them to numeric
destring year, replace
destring infant_mortality, replace
destring immunization, replace
destring population, replace
destring gdp, replace
describe
##all of our variables now have the correct form
##in the next do-file, we will transform the variables and make them ready for analysis
##save the cleaned file
export delimited using "WDI_data_cleaned"