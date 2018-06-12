#system("bash dir_sizes_owners.sh")
library(rio)
library(tidyr)
library(dplyr)
library(ggplot2)
library(lubridate)

data <- import("dir_owners_and_sizes.tsv")
our_ids <- c("rdk4","rsk27","mm573","lp113","jnh7","mjs65","mp298","as695","vb83","sh234")

data <- data %>%
  tbl_df() %>%
  mutate(., last_date=as.Date(last_date , format="%Y-%m-%d")) %>%
  separate(., size_human, into=c("size", "modifier"), sep=-2) %>%

  mutate(size=as.numeric(size)) %>%

  mutate(., gigabytes=ifelse(modifier=="G", size,
                             ifelse(modifier=="T", size*1000,
                                    ifelse(modifier=="M", size/1000,
                                           ifelse(modifier=="K", size/1e6, NA))))) %>%
  mutate(., terabytes=ifelse(modifier=="G", size/1000,
                             ifelse(modifier=="T", size,
                                    ifelse(modifier=="M", size/1e6,
                                           ifelse(modifier=="K", size/1e9, NA))))) %>%
  filter(., owner %in% our_ids) %>%
  arrange(desc(gigabytes))

totals <- data %>% summarize(gigabytes=sum(gigabytes), terabytes=sum(terabytes))

owner_totals <- data %>% group_by(owner) %>% summarize(gigabytes=sum(gigabytes), terabytes=sum(terabytes)) %>% arrange(terabytes)


large_folders <- filter(data, terabytes>0.5)


filter(data, owner=="mm573")



old_projects <- data %>% filter(ymd(last_date)<ymd("2015-01-01"))
