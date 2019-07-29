library("ggplot2")

df = data.frame(xx = 1:10,
                yy = 1:10)
ggplot(data = df,
       aes(x = xx, y = yy)) + 
  geom_point()

ggplot() + 
  geom_point(data = df,
             aes(x = xx, y = yy))


ggplot(data = df,
       aes(x = xx, y = yy)) + 
  geom_point() + 
  geom_line()


ggplot(data = df,
       aes(x = xx, y = yy)) + 
  geom_line(size = 1.5) + 
  geom_point(size = 9) +
  geom_point(size = 7,
             color = "#FFFFFF") + 
  geom_text(aes(label = LETTERS[1:10],
                x = xx + 1)) +
  geom_vline(xintercept = 6, size = 2) +
  geom_hline(yintercept = 6, size = 2) + 
  annotate(geom = "text", x = 3, y = 8,
           label = "AAAAAA", size = 12) +
  theme_bw()

colors()

gg = ggplot(data = df,
       aes(x = xx, y = yy)) + 
  geom_col()
gg
class(gg)

gg2 = gg + 
  theme(axis.title = element_text(size = 16),
        axis.title.y = element_text(face = "bold"),
        axis.text = element_text(size = 12),
        axis.text.x = element_text(angle = 90,
                                   hjust = 0,
                                   vjust = 0.5))
gg2 + 
  labs(title = "Title",
       subtitle = "sub title",
       x = "X axis!!!", y = "Y axis!!!",
       caption = "caption?")

# Q. 제목과 부제목을 가운데로 배치하시오.
gg2 + 
  labs(title = "Title",
       subtitle = "sub title",
       x = "X axis!!!", y = "Y axis!!!",
       caption = "caption?") + 
  theme(plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5))

ggplot(data = df,
       aes(x = xx, y = yy)) + 
  geom_col() + 
  theme(axis.text = element_text(size = 15)) + 
  scale_x_continuous(breaks = 1:10,
                     labels = 1:10)

ggplot(data = df,
       aes(x = xx, y = yy)) + 
  geom_col() + 
  theme(axis.text = element_text(size = 15)) + 
  scale_x_continuous(breaks = 1:10,
                     labels = LETTERS[1:10],
                     expand = c(0.01, 0.01)) + 
  scale_y_continuous(breaks = 1:10,
                     labels = paste0(1:10, "M"),
                     expand = c(0, 0),
                     limits = c(0, 10.3))




df = as.data.frame(diamonds)
head(df)

ggplot(data = df,
       aes(x = price, fill = ..count..)) + 
  geom_histogram(bins = 50)

ggplot(data = df,
       aes(x = price, fill = ..count..)) + 
  geom_histogram(binwidth = 2500)


ggplot(data = df,
       aes(x = price, fill = ..count..)) + 
  geom_histogram(binwidth = 2500) + 
  theme(axis.title.x = element_blank())

#


# 


df = data.frame(xx = 1:10,
                yy = 1:10)
# coord_flip()



ggplot(data = df,
       aes(x = xx,
           y = yy,
           fill = yy)) + 
  geom_col() +
  geom_text(aes(label = yy,
                y = yy - 0.5),
            color = "#FFFFFF",
            fontface = "bold") +
  scale_x_continuous(expand = c(0, 0)) +
  scale_y_continuous(expand = c(0, 0),
                     limits = c(0, 11)) + 
  labs(x = NULL, y = NULL) +
  coord_flip() +
  theme_bw() + 
  theme(legend.position = "none")

#### bike ####
df = read.csv("bike.csv", stringsAsFactors = FALSE)
head(df)

library("lubridate")
df[1, 1]
year(df[1, 1])
month(df[1, 1])
day(df[1, 1])
hour(df[1, 1])
wday(df[1, 1], week_start = 1)



# Q1. 시간대별 casual 변수의 평균값을
#    막대그래프로 표현하시오
df[, "hour"] = hour(df$datetime)
df_agg = aggregate(data = df, casual ~ hour,
                   FUN = "mean")
head(df_agg)

ggplot(data = df_agg,
       aes(x = hour, y = casual, fill = casual)) + 
  geom_col()

ggplot(data = df_agg,
       aes(x = hour, y = casual, fill = casual)) + 
  geom_bar(stat = "identity")

ggplot(data = df_agg,
       aes(x = hour, y = casual, fill = casual)) + 
  geom_col() + 
  theme_bw() + 
  theme(legend.position = "none")



# Q2. 시간대별 registered 변수의 평균값을
#    막대그래프로 표현하시오
df_agg = aggregate(data = df, registered ~ hour,
                   FUN = "mean")
head(df_agg)
ggplot(data = df_agg,
       aes(x = hour, y = registered, 
           fill = registered)) + 
  geom_col() + 
  theme_bw() + 
  theme(legend.position = "none")

# Q3. registered/hour mean, holiday
df_agg = aggregate(data = df,
                   registered ~ holiday + hour,
                   FUN = "mean")
head(df_agg)

ggplot(data = df_agg,
       aes(x = hour, registered, fill = registered)) + 
  geom_col() + 
  facet_wrap(~ holiday) + 
  theme(legend.position = "none")





# Q3. 요일별 casual 변수의 평균값을
#    막대그래프로 표현하시오
df[, "wday"] = wday(df$datetime, week_start = 1)
df_agg = aggregate(data = df, casual ~ wday,
                   FUN = "mean")

ggplot(data = df_agg,
       aes(x = wday, y = casual, fill = casual)) + 
  geom_col() +
  scale_x_continuous(breaks = 1:7,
                     labels = c("월", "화", "수",
                                "목", "금", "토", "일")) +
  theme_bw() + 
  theme(legend.position = "none")



# Q4. 요일별 registered 변수의 평균값을
#    막대그래프로 표현하시오


#### high chart ####
library("highcharter")
hchart(object = diamonds$color,
       colorByPoint = TRUE)

name = c("Animals", "Fruits", "Cars")
df = data.frame(name = name,
                y = c(5, 2, 4),
                drilldown = tolower(name))
ds = list_parse(df)
hc = highchart() %>%
  hc_chart(type = "column") %>%
  hc_title(text = "Basic drilldown") %>%
  hc_xAxis(type = "category") %>%
  hc_legend(enabled = FALSE) %>%
  hc_plotOptions(series = list(boderWidth = 0,
                               dataLabels = list(enabled = TRUE))) %>%
  hc_add_series(name = "Things",
                colorByPoint = TRUE,
                data = ds)

# 3)
dfani = data.frame(name = c("Cats", "Dogs", "Cows", "Sheep", "Pigs"),
                   value = c(4, 3, 1, 2, 1))

dffru = data.frame(name = c("Apple", "Organes"),
                   value = c(4, 2))

dfcar = data.frame(name = c("Toyota", "Opel", "Volkswage"),
                   value = c(4, 2, 2))

hc %>%
  hc_drilldown(allowPointDrilldown = TRUE,
               series = list(list(id = "animals", data = list_parse2(dfani)),
                             list(id = "fruits",  data = list_parse2(dffru)),
                             list(id = "cars",    data = list_parse2(dfcar))))

#### networkD3 ####
library("networkD3")
df_node_link = data.frame(node = c("A", "B", "C", "D"),
                          source = c( 0,  0,  1,  2),
                          target = c( 1,  2,  3,  3),
                          value  = c(10, 20, 30, 40))

sankeyNetwork(Links = df_node_link, Nodes = df_node_link,
              Source = "source", Target = "target",
              Value = "value", NodeID = "node",
              fontSize = 12, nodeWidth = 30)


#### huron ####
ggplot(data = huron, aes(x = year)) + 
  geom_ribbon(aes(ymin = level - 2,
                  ymax = level + 2),
              fill = "#FFE8B2") + 
  geom_ribbon(aes(ymin = level - 1,
                  ymax = level + 1),
              fill = "#CCCCCC",
              alpha = 0.5) + 
  geom_line(aes(y = level),
            size = 1) + 
  theme_bw()



