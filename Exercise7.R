#Exercise 7
#Due 11|15
#Reilley Knott, Intro to Biocomputing

#Part 1

#read in the iris.csv file into a dataframe
iriscsv=read.csv(file="iris.csv",header=TRUE,stringsAsFactors=FALSE)

#intialize funciton
oddFunc<-function(x) {
  #get the row and column numbers for the input data structure
  dimNumbers<-dim(x)
  #get only the number of lines in the data structure
  lineNumber<-dimNumbers[1]
  #create a sequence of odd numbers from 1 to the length of the data frame
  odds <- seq.int(from = 1, to = lineNumber, by = 2)
  #print only the odd elements from the input data structure
  for(i in odds) {
    print(x[i,])
  }
}

#function call with dataframe as argument
oddFunc(iriscsv)

#Part 1 alternate solution, prettier & probably better

#initialize funciton
oddFunc2<- function(data) {
  #create a sequence of odd numbers from 1 to the number of rows in data structure
  odds<-seq(1,nrow(data),2)
  #return the rows indexed to the odd numbers from above
  return(data[odds,])
}
#function call with a dataframe as the argument
oddFunc2(iriscsv)

#Part 2

#ensure that the iris.csv file is read into a dataframe in the workspace
iriscsv=read.csv(file="iris.csv",header=TRUE,stringsAsFactors=FALSE)

#1)
#Find number of observations for a given species in the dataset

#initialize the function
observations<-function(species) {
  #create a dataframe with all observations of a species
  speciesSpecific=iriscsv[iriscsv[,5]==species,]
  #get the number of rows in its own variable (number of observations)
  numberObserved<-nrow(speciesSpecific)
  #print the name of the species and the number of observations of that species
  cat(sprintf("The number of %s observations is %i",species,numberObserved))
}
#test case, function does require the string used be in ""
observations("setosa")

#2)
#return a dataframe that contains flowers with a greater Sepal.Width than the value specified by the user

#prompt the user for a width to utilize
desiredWidth<-readline(prompt = "Look for flowers with Sepal Width greater than:")

#initialize function
greaterSepalWidth<- function(w) {
  #find the rows with Sepal.Width > input value, put them into a new data frame
  greaterSepalWidth=iriscsv[iriscsv$Sepal.Width>w,]
  #return new data frame to the output
  return(greaterSepalWidth)
}
#function call utilizing the user input value
greaterSepalWidth(desiredWidth)

#3)
#add data for a given species to .csv file with given species as file name

#initialize function
csvMe<-function(species){
  #create new data frame that only contains desired species information
  specificSpecies<-iriscsv[iriscsv[,5]==species,]
  #make the name of the file that is to be "species.csv"
  name<-paste(species,"csv",sep=".")
  #create the csv file with the name "'species'.csv"
  write.table(specificSpecies, file=name, sep="," )
}

#function call giving name of species with which to create csv file
csvMe("setosa")

#the only bug with this function is that it seems to place the line numbers in the 
#first column of the created csv file
#this could be fixed by removing the first column, but I chose not to do that as it could potentially be helpful



