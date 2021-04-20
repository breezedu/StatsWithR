

library(statsr)
library(dplyr)
library(ggplot2)


data(nycflights)
names(nycflights)


str(nycflights)

ggplot(data = nycflights, aes(x = dep_delay)) +
  geom_histogram()

ggplot(data = nycflights, aes(x = dep_delay)) +
  geom_histogram(binwidth = 15)

ggplot(data = nycflights, aes(x = dep_delay)) +
  geom_histogram(binwidth = 150)

rdu_flights <- nycflights %>%
  filter(dest == "RDU")
ggplot(data = rdu_flights, aes(x = dep_delay)) +
  geom_histogram()


rdu_flights %>%
  summarise(mean_dd = mean(dep_delay), sd_dd = sd(dep_delay), n = n())

sfo_feb_flights <- nycflights %>%
  filter(dest == "SFO", month == 2)

dim( sfo_feb_flights)

ggplot( data = sfo_feb_flights, aes( x = arr_delay)) +
  geom_histogram(binwidth = 1)


summary( sfo_feb_flights$arr_delay)

sfo_feb_flights %>%
  group_by(carrier) %>%
  summarise( mean_dd = mean(arr_delay), IQR_dd = IQR( arr_delay), n = n())



nycflights %>% 
  group_by(month) %>%
  summarise( mean_dd = mean(dep_delay) ) %>%
  arrange( desc( mean_dd))


nycflights %>% 
  group_by(month) %>%
  summarise( median_dd = median(dep_delay) ) %>%
  arrange( desc(median_dd))


nycflights <- nycflights %>%
  mutate(dep_type = ifelse(dep_delay < 5, "on time", "delayed"))

head( nycflights )


nycflights %>%
  group_by(origin) %>%
  summarise(ot_dep_rate = sum(dep_type == "on time") / n()) %>%
  arrange(desc(ot_dep_rate))


nycflights <- nycflights %>%
  mutate( avg_speed = distance/(air_time * 60))

nycflights[ which.max( nycflights$avg_speed), ]

plot( nycflights$avg_speed, nycflights$distance)

nycflights <- nycflights %>%
  mutate(arr_type = ifelse(arr_delay < 5, "on time", "delayed"))

nycflights$arr_type <- as.factor(nycflights$arr_type)
summary( nycflights$arr_type)
21210/(21210 + 11525)

11525/( 21210 + 11525)


# Q10 
nycflights %>%
  group_by(dep_type, arr_type) %>%
  summarise( n = n())

