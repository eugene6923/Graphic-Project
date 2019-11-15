library(tidyverse)

diamonds
ggplot(diamonds,aes(carat,price))+geom_point()+labs(x=NULL,y=NULL)
ggplot(diamonds,aes(depth,price))+geom_point()+labs(x=NULL,y=NULL)
ggplot(diamonds,aes(table,price))+geom_point()+labs(x=NULL,y=NULL)
ggplot(diamonds,aes(x,price))+geom_point()+labs(x=NULL,y=NULL)
ggplot(diamonds,aes(y,price))+geom_point()+labs(x=NULL,y=NULL)
ggplot(diamonds,aes(z,price))+geom_point()+labs(x=NULL,y=NULL)
ggplot(diamonds,aes(carat,price))+geom_point(alpha=0.1)+xlim(0,2.5)+stat_smooth(method=lm)+ggtitle("price vs carat")


ggplot(diamonds,aes(price))+geom_histogram()+ggtitle("price histogram")
gplot(diamonds,aes(price))+geom_histogram()+ggtitle("log10(price) histogram")+scale_x_log10()
ggplot(diamonds,aes(carat))+geom_histogram()+ggtitle("carat histogram")
ggplot(diamonds,aes(carat))+geom_histogram()+scale_x_log10()+ggtitle("log10(carat) histogram")
ggplot(diamonds,aes(log10(carat),log10(price)))+geom_point(alpha=0.1)+xlim(-0.8,0.8)+ylim(2.5,4.3)+ggtitle("log10(price) vs log10(carat)")+stat_smooth(method=lm)


ggplot(diamonds,aes(log10(carat),log10(price),color=cut))+geom_point(alpha=0.3)+xlim(-0.8,0.8)+ylim(2.5,4.3)+ggtitle("log10(price) vs log10(carat) & cut")+guides(color=guide_legend(override.aes=list(alpha=1)))
ggplot(diamonds,aes(log10(carat),log10(price),color=clarity))+geom_point(alpha=0.3)+xlim(-0.8,0.8)+ylim(2.5,4.3)+ggtitle("log10(price) vs log10(carat) & clarity")+guides(color=guide_legend(override.aes=list(alpha=1)))
ggplot(diamonds,aes(log10(carat),log10(price),color=color))+geom_point(alpha=0.3)+xlim(-0.8,0.8)+ylim(2.5,4.3)+ggtitle("log10(price) vs log10(carat) & color")+guides(color=guide_legend(override.aes=list(alpha=1)))
