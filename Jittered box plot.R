install.packages("ggplot2")
install.packages("pacman")
library(ggplot2)
library (pacman)
pacman::p_load_gh("trinker/wakefield")
pacman::p_load(dplyr, tidyr, ggplot2)


#Set the theme to white background and just y-axis

theme_update(axis.ticks.x = element_blank(), axis.line.y=element_line(colour="black"), axis.line.x = element_blank(), axis.text = element_text(colour="black"), panel.grid.major = element_blank(),
             panel.grid.minor = element_blank(),  panel.background = element_blank(), axis.text.x  = element_text(size=20), axis.text.y  = element_text(size=20), axis.title.x  = element_text(size=22, vjust=0.1, face="bold"),
             axis.title.y  = element_text(size=22, face = "bold", vjust=0.9, angle = 90), axis.line = element_line(size = 1.2, linetype = "solid"), axis.ticks = element_line(size = 1), legend.position="none") 

#Create dummy data, n=1000, IQ values, split into groups

test<-r_data_frame(n=1000,
                   iq,
                   group(x=c("X", "Y", "C", "D"))
)

#Flag some of the IQ values to show as different colours in dot plot later

test$Cat<-as.factor(ifelse(test$IQ>(sample(110:125,1000,replace=TRUE)),"Normal", "Abnormal"))

#Transparent box plots (Groups X and Y) with jittered data points coloured as red or blue according to the "Cat" flag set above.

ggplot(na.omit(test[,c("Group", "IQ", "Cat")]), aes(factor(Group), IQ)) +
  geom_jitter(alpha=I(0.3), position=position_jitter(width=0.1, height=0.1), aes(color=factor(Cat)), size=4) +
  xlab("\nGroups") +
  ylab("\nArbitray scale") +
  geom_boxplot(outlier.shape=NA, fill= NA,  colour="black", width=0.15, lwd=1) + scale_colour_manual(values=c("lightskyblue1", "red")) +
  scale_y_continuous (limits=c(50,150), expand=c(0,0.2)) +
  ggtitle (" ")
