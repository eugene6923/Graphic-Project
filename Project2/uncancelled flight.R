not_cancelled <- flights1 %>% filter(CANCELLED=="0")
head(not_cancelled)

#1) 지연 살펴보기

departuretime <- not_cancelled %>% filter(DEPARTURE_DELAY>0)
flighttime <- not_cancelled %>% filter(DEPARTURE_TIME>SCHEDULED_TIME)
airsystem <- not_cancelled %>% filter(AIR_SYSTEM_DELAY>0)
security <- not_cancelled %>% filter(SECURITY_DELAY>0)
airline <- not_cancelled %>% filter(AIRLINE_DELAY>0)
late_aircraft <- not_cancelled %>% filter(LATE_AIRCRAFT_DELAY>0)
weather <- not_cancelled %>% filter(WEATHER_DELAY>0)
delay <- data.frame(x=c("departuretime","flighttime","airsystem","security","airline","late_craft","weather"),y=c(nrow(departuretime),nrow(flighttime),nrow(airsystem),nrow(security),nrow(airline),nrow(late_aircraft),nrow(weather)))
ggplot(delay,aes(x,y))+geom_point()+geom_line(group="x")

#이것으로 운행시간에서 운행에서 지연이 가장 많다는 것을 알게 되었다. 그 뒤로는 출발시간의 지연이 뒤를 따랐다. 그래서 이 두 가지를 좀 더 살펴보도록 하겠다.

departuredelay <- departuretime %>% group_by(AIRLINE) %>% summarise(count5=n()) %>% arrange(desc(count5))
departuredelay #출발시간이 가장 늦는 공항
ggplot(departuredelay,aes(AIRLINE,count5))+geom_line(group="AIRLINE")+geom_point()

#WN항공사가 가장 delay가 많다는 것을 알 수 있었다. 그 뒤로는 DL항공사가 따르는데 무려 약 400000번의 차이로 WN이 압승을 거뒀다. 그런데 사실 다시 취소되지 않고 운행한 전체적인 횟수를 따져볼 때와 다르다. 다음은 전체적인 그래프이다.

notcancelleddelay <-not_cancelled %>% group_by(AIRLINE) %>% summarise(count6=n()) %>% arrange(desc(count6))
ggplot(notcancelleddelay,aes(AIRLINE,count6))+geom_point()+geom_line(group="MONTH")
percentage_departure_delay <- notcancelleddelay %>% left_join(departuredelay,by="AIRLINE") %>% mutate(percent3=count5/count6*100)
percentage_departure_delay %>% arrange(desc(percent3))
ggplot(percentage_departure_delay,aes(AIRLINE,percent3))+geom_line(group="AIRLINE")+geom_point()

#이것을 볼 때 가장 지연이 많은 항공사는 UA이고 가장 비율이 적은 항공사는 AS라는 것을 확인할 수 있다.

#2) 시기별 비행횟수

##month
ggplot(not_cancelled, aes(MONTH)) +geom_histogram()+scale_x_continuous(breaks=c(1:12))+scale_y_continuous(limits=c(0,550000))

not_cancelled <- filter(flights1,CANCELLED=="0")
cancelled %>%
 group_by(MONTH) %>%
 summarise(count=n())

#2월이 가장 조금

## 요일별

not_cancelled %>%
  group_by(DAY_OF_WEEK) %>%
  summarise(count=n())
  
  ggplot(not_cancelled,aes(DAY_OF_WEEK))+geom_histogram()+scale_x_continuous(breaks=c(1:7),labels=c("Mon","Tue","Wed","Thu","Fri","Sat","Sun"))
  
  #토요일이 가장 적음
  
  
  #3) 각종 변수를 이용한 비행 분석
  
  notcancelleddelay <-not_cancelled %>% group_by(AIRLINE) %>% summarise(count6=n()) %>% arrange(desc(count6))
ggplot(notcancelleddelay,aes(AIRLINE,count6))+geom_point()+geom_line(group="MONTH")


not_cancelled %>% group_by(TAIL_NUMBER) %>% summarise(count=n()) %>% arrange(count) %>% head()
not_cancelled %>% group_by(TAIL_NUMBER) %>% summarise(count=n()) %>% arrange(desc(count)) %>% head()

#첫 번째 결과에서 볼 때 N121UA, N175UA, N180UA, N7LBAA, N7LEAA, N840NW, N852NW, N860NW 비행기 모두 1번 비행으로 가장 낮은 비행횟수를 달성했다. 그리고 두 번째 결과에서 볼 때 N480HA가 3766번으로 가장 많이 비행했고 N484HA가 3723번으로 뒤를 이었다.

##공항별

not_cancelled %>% group_by(ORIGIN_AIRPORT) %>% summarise(count=n()) %>% arrange(count) %>% head()

not_cancelled %>% group_by(ORIGIN_AIRPORT) %>% summarise(count=n()) %>% arrange(desc(count)) %>% head()
