MQ <- filter(cancelled,AIRLINE=="MQ")
MQ %>% group_by(CANCELLATION_REASON) %>% summarise(count=n(),percent=count/(2475+9164+3385+1)*100) 

ggplot(MQ,aes(CANCELLATION_REASON))+geom_bar()

# MQ는 B>C>A의 순으로 점점 줄어드는 추세를 보여주고 있다. 원래 모든 항공사에서는 B>A>C순이므로 이 항공사에서 C의 이유가 생각보다 많이 발생했다는 것을 알 수 있다.

EV <- filter(cancelled,AIRLINE=="EV")
EV %>% group_by(CANCELLATION_REASON) %>% summarise(count=n(),percent=count/(2475+9164+3385+1)*100) 
  ggplot(EV,aes(CANCELLATION_REASON))+geom_bar()
  
# EV는 C의 이유가 가장 많이 도출되었다. 이는 매우 신기한 결과이다. 원래 이유는 B>A>C 순서인데 EV는 확실히 C인 NATIONAL AIR SYSTEM의 문제가 크다는 것을 알게 되었다.

