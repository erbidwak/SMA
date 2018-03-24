## This function load csv files from the directory specified in the argument
## It then subset the dataset to keep columns containing information related to power production and 
## consumption
## Return the subset dataset
loadFile <- function (directory){
  
  # Initializing data frame
  data = data.frame()
  
  #Conctruction of the csv path on the local computer
  filePath = paste(getwd(), directory, sep = "/")
  
  #Check the existance of the path
  if (dir.exists(filePath)){
  
    #Make the list of files from the return value of the "list.files() function for further 
    #exploration
    fileList <- list.files(filePath)
    
    # Iterate in the list to load and append csv file
    # We use the read.table for its performance over read.csv and for the "skip" attribute
    # In this function "skip" attribute helps us clean the first 5 rows coz there are not important
    # for our analysis. 
    for (f in fileList){
      
      #Load and bind csv files 
      data <- rbind(data, read.table(paste(filePath,f, sep="/"), skip = 5, sep = ";", header = TRUE))
      
    }
  }
    # return the data set containing the needs columns
  returnedData <- data[, c(1, 7, 36, 49, 64, 90, 116)]
  colnames(returnedData) <- c("Date", "ClusterControler", "SunnyIsland37", "SunnyIsland53", "T1", "T2", "T3")
  returnedData
  
}