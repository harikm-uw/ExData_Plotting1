plot1=function(){
  
  ##Extract the .txt file into working directory
  x=read.table("household_power_consumption.txt",sep=";")
  matrix1=x[which(as.Date(x[2:length(x[,1]),1],"%d/%m/%Y")=="2007-02-01"),]
  matrix2=x[which(as.Date(x[2:length(x[,1]),1],"%d/%m/%Y")=="2007-02-02"),]
  matrix=rbind(matrix1,matrix2)
  act=as.numeric(as.character(matrix[,3]))
  
  hist(act,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
  
  ##Code to create .png file
  png(filename="plot1.png")
  hist(act,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
  dev.off()
}