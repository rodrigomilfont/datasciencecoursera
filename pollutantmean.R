pollutantmean <- function(directory, pollutant, id){
  dir <- directory
  allFiles <- list.files(dir, pattern="*.csv", full.names=TRUE)
  selectFiles <- allFiles[id]
  qtdFiles <- length(selectFiles)
  
  allFiles <-lapply(selectFiles, read.csv)
  total <- do.call(rbind, allFiles)
  
  good <- complete.cases(total)
  
  finalFile <- total[good,]
  
  meanByPollutant <- lapply(subset(finalFile, select = pollutant), mean)
  
  return(round(meanByPollutant[[1]],3))
  
}