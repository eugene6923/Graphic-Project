library(tidyverse)
library(nycflights13)

# 자료 읽어들이기
flights0 <-read.csv("c:/temp/project-data.csv")
flights1 <-as.tibble(flights0)

#취소된 비행 개수 찾기
 flights1 %>%
 count(CANCELLED)
