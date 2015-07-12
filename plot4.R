plot4=function(){
  
  ##Extract the .txt file into working directory
  x=read.table("household_power_consumption.txt",sep=";")
  matrix1=x[which(as.Date(x[2:length(x[,1]),1],"%d/%m/%Y")=="2007-02-01"),]
  matrix2=x[which(as.Date(x[2:length(x[,1]),1],"%d/%m/%Y")=="2007-02-02"),]
  matrix=rbind(matrix1,matrix2)
  sub1=as.numeric(as.character(matrix[,7]))
  sub2=as.numeric(as.character(matrix[,8]))
  sub3=as.numeric(as.character(matrix[,9]))
  act=as.numeric(as.character(matrix[,3]))
  volt=as.numeric(as.character(matrix[,5]))
  reac=as.numeric(as.character(matrix[,4]))
  datetime=strptime(paste(matrix[,1],matrix[,2]),"%d/%m/%Y %H:%M:%S")
  
  par(mfrow=c(2,2))
  with(matrix,{
    plot(datetime,act,type="l",ylab="Global Active Power",xlab="")
    plot(datetime,volt,type="l",ylab="Voltage")
    plot(datetime,sub1,type="l",ylim=c(0.0,40.0),ylab="Energy sub metering",xlab="")
    par(new=T)
    plot(datetime,sub2,type="l",ylim=c(0.0,40.0),col="red",ylab="",xlab="")
    par(new=T)
    plot(datetime,sub3,type="l",ylim=c(0.0,40.0),col="blue",ylab="",xlab="")
    legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),cex=c(0.75,0.75,0.75),bty="n")
    plot(datetime,reac,type="l",ylab="Global_reactive_power")
  })
  
  ##Code to create .png file
  png(filename="plot4.png")
  par(mfrow=c(2,2))
  with(matrix,{
    plot(datetime,act,type="l",ylab="Global Active Power",xlab="")
    plot(datetime,volt,type="l",ylab="Voltage")
    plot(datetime,sub1,type="l",ylim=c(0.0,40.0),ylab="Energy sub metering",xlab="")
    par(new=T)
    plot(datetime,sub2,type="l",ylim=c(0.0,40.0),col="red",ylab="",xlab="")
    par(new=T)
    plot(datetime,sub3,type="l",ylim=c(0.0,40.0),col="blue",ylab="",xlab="")
    legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),cex=c(0.75,0.75,0.75),bty="n")
    plot(datetime,reac,type="l",ylab="Global_reactive_power")
  })
  dev.off()
 
  
}