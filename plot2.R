plot2=function(){
  
  ##Extract the .txt file into working directory
  x=read.table("household_power_consumption.txt",sep=";")
  matrix1=x[which(as.Date(x[2:length(x[,1]),1],"%d/%m/%Y")=="2007-02-01"),]
  matrix2=x[which(as.Date(x[2:length(x[,1]),1],"%d/%m/%Y")=="2007-02-02"),]
  matrix=rbind(matrix1[1:1440,],matrix2[1:1440,])
  act=as.numeric(as.character(matrix[,3]))
  datetime=strptime(paste(matrix[,1],matrix[,2]),"%d/%m/%Y %H:%M:%S")
  
  plot(datetime,act,type="l",ylab="Global Active Power (kilowatts)",xlab="")
  
  ##Code to create .png file
  png(filename="plot2.png")
  plot(datetime,act,type="l",ylab="Global Active Power (kilowatts)",xlab="")
  dev.off()
  }