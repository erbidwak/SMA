productionInverter <- function(List){
  #Set apart NAs
  NAs <- is.na(List)
  #Replace NAs by 0s as the values were not recorded
  #But we could also extrapolate the values if we wish 
  List[NAs]  <- 0
  
  postiveSITemp <- List > 0 
  List[!postiveSITemp] <- List[!postiveSITemp] * 0
  List[postiveSITemp] <- List[postiveSITemp]
  List
}

loadInverter <- function(List){
  #Set apart NAs
  NAs <- is.na(List)
  #Replace NAs by 0s as the values were not recorded
  #But we could also extrapolate the values if we wish 
  List[NAs]  <- 0
  
  negativeSI37Temp <- List < 0 
  List[!negativeSI37Temp] <- List[!negativeSI37Temp] * 0
  List[negativeSI37Temp] <- List[negativeSI37Temp] * -1
  List
}
#Compute the sum of the power consummed to charge batteries
#Return the list containing the sum to be binded to the main dataframe
sumSunnyIsland <- function(List1, List2){
 
  Map("+", List1, List2)
}

#Compute the sum of the power consummed to 
#Return the list containing the sum to be binded to the main dataframe
sumTripower <- function(List1, List2, List3){
  Map("+", List1, Map("+",List2, List3))
}

