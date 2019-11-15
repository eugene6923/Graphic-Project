cancelled <-filter(flights1,CANCELLED=="1")
head(cancelled)

# 그리고 취소된 이유는 다음과 같다. 
cancelled %>%
  group_by(CANCELLATION_REASON) %>%
  summarise(count=n())

##1)  월별 취소된 비행 분석

flights1 %>% 
  group_by(MONTH)%>%
  summarise(count=n())
ggplot(flights1,aes(MONTH))+geom_bar()+scale_x_continuous(breaks=c(1:12))

ggplot(cancelled, aes(MONTH)) +geom_histogram()+scale_x_continuous(breaks=c(1:12))
cancelled %>% group_by(MONTH)%>% summarise(count=n())

#특히 1월, 2월, 3월에서 10000번이 넘어가면서 다른 달보다 월등히 많이 취소된 것을 확인할 수 있다. 그런데 이것만으로는 판단하기 정확하지 않아 전체 항공과의 비율을 나타내서 보도록 하겠다.

all_percentage <-(flights1 %>% 
   group_by(MONTH)%>%
   summarise(count2=n()))
cancel_percentage <- (cancelled %>%
 group_by(MONTH)%>%
 summarise(count1=n()))
percentage <-(cancel_percentage %>%
 left_join(all_percentage) %>% mutate (cancelled_percent=count1/count2*100))

  ggplot(percentage,aes(MONTH,cancelled_percent))+geom_line()+geom_point()+scale_x_continuous(breaks=c(1:12))
  
  #1,2,3월 달이 취소된 비율이 많고 2월이 특히나 많다는 것을 확신할 수 있다.
  
  ggplot(cancelled, aes(MONTH,color=CANCELLATION_REASON,fill=CANCELLATION_REASON)) +geom_histogram()+scale_x_continuous(breaks=c(1:12))
  
  또한 1월, 2월, 3월달에 날씨상의 이유로 많은 비행기가 취소됐다는 것을 알 수 있다. 특히 2월에 비행취소가 많은 이유가 특히나 날씨 때문에 일어난 것을 알 수 있었다.
  
  ##2) 항공사에 따른 취소 비행
  
  all_percentage1 <- flights1 %>% group_by(AIRLINE) %>% summarise(count1=n())
ggplot(flights1,aes(AIRLINE))+geom_bar()

ggplot(cancelled,aes(AIRLINE))+geom_bar()  #공항

  cancel_percentage1 <- (cancelled %>% group_by(AIRLINE)) %>% summarise(count2=n())
percentage1 <- all_percentage1 %>% left_join(cancel_percentage1,by="AIRLINE") %>%
mutate(cancel_percent1=count2/count1*100) %>% arrange(desc(cancel_percent1))
ggplot(percentage1,aes(AIRLINE,cancel_percent1))+geom_point()+geom_line(group="AIRLINE")

#첫 번째 그래프를 통해 보았을 때 놀라운 결과를 확인할 수 있다. WN회사와 MQ회사는 약 4배정도 전체 항공횟수가 차이가 나지만, MQ의 취소 하는 개수가 15025개고 WN의 개수는 16043개로 약 1000개 밖에 차이가 나지 않는다는 것을 확인할 수 있다.
두 번째 그래프를 통해서 MQ의 항공사가 5. 0995819%로 월등하게 가장 높은 취소비율을 나타내고 있다는 것을 알 수 있다. MQ항공사는 13개의 항공사 중 7위의 항공횟수를 자랑했는데 가장 큰 비율로 취소 중이다. 그에 반해 항공횟수가 가장 많은 WN항공사는 생각보다 많은 취소 비율을 보이고 있지 않았다.
이를 모두 통합해서 볼 때 MQ항공사의 취소비율은 실로 놀라운 것이라 볼 수 있다. 취소비율 2위를 차지한 EV항공사도 취소횟수가 15231개로 엄청난 횟수를 자랑한다는 것을 알 수 있다.

ggplot(cancelled,aes(AIRLINE,color=CANCELLATION_REASON,fill=CANCELLATION_REASON))+geom_bar() #취소이유


  
  
