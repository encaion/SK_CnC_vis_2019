options(stringsAsFactors = FALSE)
library("ggplot2")

#### [[ 1. 개요 ]] ####
#### __ 01) 시각화의 중요성 #### 
#### ____ ● 데이터 시각화 ####
#### ____ ● Table vs Plot ####

#### __ 02) 자료의 표현 #### 
#### ____ ● 정보의 밀도 ####
#### ____ ● 자료 표현의 3요소 ####
#### ____ ● dataviscatalogue ####
# https://datavizcatalogue.com/

#### __ 03) 잘못된 시각화 사례 #### 
#### ____ ● bbc.com ####
# https://www.bbc.com/sport/football/tables

#### ____ ● kmib.co.kr ####
# http://news.kmib.co.kr/article/view.asp?arcid=0923813493

# https://www.facebook.com/statisticallyinconvenient/

#### __ 04) 관련 언어 및 도구 #### 
#### ____ ● Etc ####


#### [[ 2. 준비 ]] ####
#### __ 01) 시각화를 위한 데이터 가공 #### 
#### ____ ● 자료의 요약 ####
library("ggplot2")
data("diamonds")
df = as.data.frame(diamonds)
head(df, 3)

# Q1. unique
unique(df$cut)
unique(df$color)
unique(df$clarity)

# Q2. length()
length(unique(df$cut))
length(unique(df$color))
length(unique(df$clarity))

# Q3. table()
table(df$cut, df$clarity)
head(df, 3)

prop.table(table(df$cut, df$clarity), margin = 1)
prop.table(table(df$cut, df$clarity), margin = 2)

# Q4. aggregate()
aggregate(data = df, price ~ cut, FUN = "mean")
aggregate(data = df, price ~ cut + color, FUN = "mean")


#### ____ ● 피보팅 ####

#### __ 02) ggplot 문법 #### 
#### ____ ● 제작자 ####
#### ____ ● 특징 ####
#### ____ ● 기초 문법 ####
# 스타일 1

# 스타일 2

df = data.frame(xx = 1:10,
                yy = 1:10)
ggplot(data = df,
       mapping = aes(x = xx, y = yy)) + 
  geom_point()

ggplot(data = df, aes(x = xx, y = yy)) + 
  geom_point()

# 2)
ggplot(data = df, aes(x = xx, y = yy)) + 
  geom_point(size = 15)

# 3)
ggplot(data = df, 
       aes(x = xx, y = yy,
           size = xx)) + 
  geom_point()

# 4)
df[, "size"] = df$xx * 2 + 2
ggplot(data = df, 
       aes(x = xx, y = yy,
           size = size)) + 
  geom_point()

# 5)
ggplot(data = df, aes(x = xx, y = yy)) + 
  geom_point(size = 15,
             color = "darkolivegreen3")
colors()

# 6)
ggplot(data = df, aes(x = xx, y = yy)) + 
  geom_point(size = 15,
             color = "#999999")

# 7)
ggplot(data = df, aes(x = xx, y = yy,
                      color = xx)) + 
  geom_point(size = 15)

# 8)
ggplot(data = df, 
       aes(x = xx, y = yy,
       color = as.character(xx))) + 
  geom_point(size = 15)

# 선 그래프 - geom_line()
# 1)
ggplot(data = df, 
       aes(x = xx, y = yy)) + 
  geom_line()

# 2)
ggplot(data = df, 
       aes(x = xx, y = yy)) + 
  geom_line(size = 3)

# 3)
ggplot(data = df, 
       aes(x = xx, y = yy)) + 
  geom_line(size = 3,
            color = "#FF0000")

# 4)
ggplot(data = df, 
       aes(x = xx, y = yy,
           color = xx)) + 
  geom_line(size = 3)

# 5)
ggplot(data = df, 
       aes(x = xx, y = yy)) + 
  geom_line(size = 3, 
            linetype = 6)
# linetype: 1 ~ 6

# 막대 그래프 - geom_bar(), geom_col()
# 1)
ggplot(data = df, 
       aes(x = xx)) + 
  geom_bar()

table(df$xx)

ggplot(data = df, 
       aes(x = xx)) + 
  geom_bar(stat = "count")

# 2)
ggplot(data = df, 
       aes(x = xx, y = yy)) + 
  geom_bar(stat = "identity")

# 3)
ggplot(data = df, 
       aes(x = xx, y = yy)) + 
  geom_col()

# 4)
ggplot(data = df, 
       aes(x = xx, y = yy)) + 
  geom_col(color = "blue")

# 5)
ggplot(data = df, 
       aes(x = xx, y = yy)) + 
  geom_col(color = "blue",
           size = 4)

# 6)
ggplot(data = df, 
       aes(x = xx, y = yy)) + 
  geom_col(fill = "blue")

# 7)
ggplot(data = df, 
       aes(x = xx, y = yy,
           fill = xx)) + 
  geom_col()
  
# 8) 
ggplot(data = df, 
       aes(x = xx, y = yy,
           fill = as.character(xx))) + 
  geom_col()

# 9)
ggplot(data = df, 
       aes(x = xx, y = yy,
           fill = xx)) + 
  geom_col(color = "#000000",
           size = 1.2) + 
  theme_bw()

# 10)
ggplot(data = df, 
       aes(x = xx, y = yy,
           fill = xx)) + 
  geom_col(color = "#000000",
           width = 0.5,
           size = 1.2) + 
  theme_bw()

# 막대 + 점
ggplot(data = df, 
       aes(x = xx, y = yy)) + 
  geom_col(width = 0.1) + 
  geom_point(size = 8) + 
  geom_point(size = 6.5, 
             color = "#FFFFFF") + 
  theme_bw()

# 막대 + 점 + 선
ggplot(data = df, 
       aes(x = xx, y = yy)) + 
  geom_col(fill = "skyblue") + 
  geom_line(size = 2) + 
  geom_point(size = 6) + 
  geom_point(size = 4, color = "#FFFFFF")

# 축 설정.
# 1)
ggplot(data = df, 
       aes(x = xx, y = yy)) + 
  geom_col(fill = "skyblue") + 
  coord_flip()

# 2)
ggplot(data = df, 
       aes(x = xx, y = yy)) + 
  geom_col(fill = "skyblue") + 
  coord_polar()

ggplot(data = df, 
       aes(x = xx, y = yy)) + 
  geom_col(fill = "skyblue", width = 1,
           color = "#000000") + 
  coord_polar()

ggplot(data = df, 
       aes(x = xx, y = yy,
           fill = xx)) + 
  geom_col(color = "#000000", width = 1) + 
  coord_polar()

ggplot(data = df, 
       aes(x = xx, y = yy,
           fill = as.character(xx))) + 
  geom_col(color = "#000000", width = 1) + 
  coord_polar()

# 덧그리기
gg = ggplot(data = df, 
       aes(x = xx, y = yy)) + 
  geom_col()

# 1)
gg + 
  geom_hline(yintercept = 8,
             size = 2, color = "red")

# 2)
gg + 
  geom_hline(yintercept = 7:9,
             size = 2, color = "red",
             linetype = 3)

# 3) 
gg + 
  geom_vline(xintercept = 3:5,
             size = 2, color = "blue")

# 4) 
gg +
  annotate(geom = "text",
           x = 2, y = 8, label = "Aaa",
           size = 8)
  
# 5) 
gg +
  annotate(geom = "text",
           x = 2, y = 8, label = "aaaaaaaaaaaaaaaaaaaaaa",
           size = 8, fontface = "bold")

# 6)
gg + 
  annotate(geom = "rect",
           xmin = 2, xmax = 4,
           ymin = 7, ymax = 9,
           fill = "orange")

# 7)
gg + 
  annotate(geom = "rect",
           xmin = 2, xmax = 4,
           ymin = 7, ymax = 9,
           fill = "orange", size = 2,
           color = "#000000")

# 8)
ggplot(data = df,
       aes(x = xx, y = yy)) + 
  annotate(geom = "rect",
           xmin = 5, xmax = 7,
           ymin = 0, ymax = 10,
           fill = "orange",
           alpha = 0.4) + 
  geom_col() + 
  scale_y_continuous(expand = c(0, 0)) +
  theme_bw()

# 9)
gg + 
  annotate(geom = "segment",
           x = 2, xend = 4,
           y = 7, yend = 9,
           size = 2, color = "red")

# geom_hline() + annotate()
gg + 
  geom_hline(yintercept = 6, size = 2,
             color = "blue") + 
  annotate(geom = "text", x = 1, y = 6.5,
           label = "Value", size = 6)

# geom_text()
gg + 
  geom_text(aes(label = xx),
            size = 6, fontface = "bold",
            color = "#FFFFFF")

gg + 
  geom_text(aes(label = LETTERS[1:10],
                y = yy - 0.5),
            size = 8, fontface = "bold",
            color = "#FFFFFF")

gg + 
  geom_text(aes(label = LETTERS[1:10],
                y = yy - 0.5),
            size = 8, fontface = "bold",
            color = "#FFFFFF") + 
  coord_flip()

gg + 
  geom_text(aes(label = rep("■", 10),
                x = xx + 0.23,
                y = yy - 0.5),
            size = 20, fontface = "bold",
            color = "#FFFFFF") + 
  geom_text(aes(label = LETTERS[1:10],
                y = yy - 0.5),
            size = 8, fontface = "bold",
            color = "#000000") + 
  coord_flip()

# 축설정
gg + 
  scale_y_continuous(breaks = c(1, 3, 9),
                     labels = c("A", "B", "C"))
  
  
#### __ 03) 그래프 세부 설정 #### 
#### ____ ● 색상 ####
# 준비
df = as.data.frame(diamonds)

ggplot(data = df,
       aes(x = cut, y = price)) + 
  geom_boxplot()

# 관련 인자(argument)
# ▶ color: 점, 선, 글자
# ▶ fill: 면 색상
# ▶ alpha: 투명도

# 관련 함수(function)
# ▶ scale_color_manual() – 선색상 수동 설정
# ▶ scale_fill_manual() – 면색상 수동 설정
# ▶ scale_alpha_manual() – 투명도 수동 설정
# ▶ scale_color_gradient() – 부드러운 선 색칠(2색)
# ▶ scale_color_gradient2() – 부드러운 선 색칠(3색)
# ▶ scale_color_gradientn() – 부드러운 선 색칠(n색)

# 선색상(color) - auto
ggplot(data = df,
       aes(x = cut, y = price)) + 
  geom_boxplot()

# 선색상(color) - manual

# 면색상(fill) - auto

# 면색상(fill) - manual

# 면색상(fill) - stat variable

# 선색상(fill) - stat variable


#### ____ ● 범례 ####
# 제거

# panel 밖 위치

# panel 내 위치

# 개별 제목 변경

# 범례 속성 재정의

#### ____ ● 격자 ####
# 관련 인자 및 함수


#### 실전 문제 ####
#### __ 1) 문제 01 ####
puby = read_excel("Article_year_count.xlsx")
puby = as.data.frame(puby)
head(puby)

ggplot(data = puby,
       aes(x = year, y = count,
           fill = count)) + 
  geom_col() + 
  scale_x_continuous(expand = c(0.01, 0.01)) + 
  scale_y_continuous(expand = c(0, 0),
                     limits = c(0, max(puby$count) * 1.1)) + 
  labs(y = "Count", x = "Year") + 
  theme_bw() + 
  theme(legend.position = "none",
        axis.title = element_text(size = 16),
        axis.text = element_text(size = 13),
        panel.grid.major.y = element_line(size = 2))

#### 문제 02 ####
fund = read_excel("fund.xlsx", col_names = "name")
fund = as.data.frame(fund) 

fund[, "count"] = gsub(pattern = "^.*? \\(", replacement = "", fund$name)
fund[, "count"] = gsub(pattern = "[[:punct:]]", replacement = "", fund[, "count"])
fund[, "count"] = as.numeric(fund[, "count"])
head(fund)

fund[, "name"] = gsub(pattern = " \\(.*?$", replacement = "" , fund$name)
head(fund)

ggplot(data = fund[1:10, ],
       aes(x = reorder(name, count), 
           y = count, fill = count)) + 
  geom_col() + 
  scale_x_discrete(expand = c(0.05, 0.05)) + 
  scale_y_continuous(expand = c(0, 0),
                     limits = c(0, max(fund$count) * 1.1)) +
  coord_flip() + 
  labs(y = "Count", x = "Year") + 
  theme_bw() + 
  theme(legend.position = "none",
        axis.title = element_text(size = 16),
        axis.text = element_text(size = 13),
        panel.grid.major.y = element_line(size = 2))

#### [[ 3. 자료형별 시각화 ]] ####
#### __ 01) 범주형 자료의 시각화 #### 
#### ____ ● 막대 그래프 ####
# 기본 그래프
data("diamonds")
df = as.data.frame(diamonds)


# position 조정

# 데이터 준비

# 기본 그래프
library("highcharter")
data("diamonds", package = "ggplot2")

# 1)
hchart(object = diamonds$cut, 
       colorByPoint = TRUE)

# 2)
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


#### ____ ● 파이 차트 ####
# geom_rect() + coord_polar()
browsers = read.csv("browsers.csv", stringsAsFactors = FALSE)
head(browsers)
ggplot(data = browsers) + 
  geom_rect(aes(fill = version,
                ymax = ymax, ymin = ymin,
                xmax = 4,    xmin = 3)) + 
  geom_rect(aes(fill = browser,
                ymax = ymax, ymin = ymin,
                xmax = 3,    xmin = 0)) + 
  xlim(c(0, 4)) + 
  coord_polar(theta = "y") + 
  theme_void()
  

#### ____ ● 레이더 차트 ####
# radarchart + chartJSRadar()
library("radarchart")
labs = c("리스크", "매출", "자본", "규모", "시장", "부채")
scores = list("values" = c(6, 3, 8, 6, 9, 1))
chartJSRadar(scores = scores,
             labs = labs,
             width  = 5, 
             height = 5,
             addDots = FALSE, 
             maxScale = 10,
             lineAlpha = 0,
             showLegend = FALSE)


#### ____ ● 흐름도 - ggalluvial ####
library("ggplot2")
library("ggalluvial")
major = read.csv("majors.csv")
ggplot(data = majors,
       aes(x = semester, 
           stratum = curriculum,
           alluvium = student,
           fill = curriculum, 
           label = curriculum)) +
  geom_flow(stat = "alluvium", 
            lode.guidance = "rightleft") +
  geom_stratum() + theme_bw()


#### ____ ● networkD3 ####
library("networkD3")
df_node_link = data.frame(node = c("A", "B", "C", "D"),
                          source = c( 0,  0,  1,  2),
                          target = c( 1,  2,  3,  3),
                          value  = c(10, 20, 30, 40))

sankeyNetwork(Links = df_node_link, Nodes = df_node_link,
              Source = "source", Target = "target",
              Value = "value", NodeID = "node",
              fontSize= 12, nodeWidth = 30)


library("networkD3")
df_link = read.csv("sankey_energy_link.csv", stringsAsFactors = FALSE)
df_node = read.csv("sankey_energy_node.csv", stringsAsFactors = FALSE)

sankeyNetwork(Links = df_link,
              Nodes = df_node,
              Source = "source",
              Target = "target",
              Value = "value",
              NodeID = "name",
              width = 700,
              nodeWidth = 30)


#### ____ ● Tree map - highcharter ####
library("highcharter")
data("diamonds", package = "ggplot2")
df_dia = as.data.frame(table(diamonds$color))
hchart(object = df_dia,
       hcaes(x = Var1, value = Freq, color = Freq), 
       type = "treemap")


#### __ 02) 수치형 자료의 시각화 #### 
#### ____ ● 이산형 자료의 시각화 ####
# ggplot2 - geom_col()
library("ggplot2")
ggplot() + 
  geom_col(aes(x = 1:20, y = dbinom(x = 1:20, size =  5, prob = 0.5)),
           color = "#AAAAAA", fill = "#225378", alpha = 0.6) +
  geom_col(aes(x = 1:20, y = dbinom(x = 1:20, size = 10, prob = 0.5)),
           color = "#AAAAAA", fill = "#1695A3", alpha = 0.6) + 
  geom_col(aes(x = 1:20, y = dbinom(x = 1:20, size = 15, prob = 0.5)),
           color = "#AAAAAA", fill = "#ACF0F2", alpha = 0.6) + 
  geom_col(aes(x = 1:20, y = dbinom(x = 1:20, size = 20, prob = 0.5)),
           color = "#AAAAAA", fill = "#EB7F00", alpha = 0.6) + 
  labs(x = NULL, y = NULL) +
  theme_bw()


# 흠?
df = data.frame(xx = rep(1:20, times = 4),
                size = as.character(rep((1:4) * 5, each = 20)),
                value = c(dbinom(x = 1:20, size =  5, prob = 0.5),
                          dbinom(x = 1:20, size = 10, prob = 0.5),
                          dbinom(x = 1:20, size = 15, prob = 0.5),
                          dbinom(x = 1:20, size = 20, prob = 0.5)))

ggplot(data = df,
       aes(x = xx,
           y = value,
           group = factor(size, levels = c("5", "10", "15", "20")),
           fill = size)) + 
  geom_col(alpha = 0.6, color = "#AAAAAA") + 
  scale_fill_manual(values = c("5" = "#225378", "10" = "#1695A3",
                               "15" = "#ACF0F2", "20" = "#EB7F00")) + 
  labs(x = NULL, y = NULL) + 
  theme(legend.position = "none")


#### ____ ● 연속형 자료의 시각화 ####
# ggplot2 - geom_ribbon()
df = read.csv("bike.csv", stringsAsFactors = FALSE)
head(df)

df[, "year_month"] = substr(df$datetime, 1, 7)
ggplot(data = df, 
       aes(x = year_month,
           y = count)) + 
  geom_boxplot()

df_agg = aggregate(data = df, 
                   count ~ year_month,
                   FUN = "mean")
head(df_agg)

ggplot(data = df_agg,
       aes(x = 1:nrow(df_agg),
           y = count)) + 
  geom_vline(xintercept = 12.5,
             size = 2, color = "blue") + 
  # annotate(geom = "rect",
  #          xmin = 13, xmax = 24,
  #          ymin = 0,  ymax = max(df_agg$count),
  #          fill = "orange", alpha = 0.4) +
  geom_line() + 
  scale_x_continuous(breaks = 1:nrow(df_agg),
                     labels = substr(df_agg$year_month, 6, 7)) + 
  theme_bw() + 
  scale_y_continuous(expand = c(0, 0))

head(df_agg)

df_agg[, "max"] = aggregate(data = df, 
                            count ~ year_month,
                            FUN = "max")[, 2]
df_agg[, "min"] = aggregate(data = df, 
                            count ~ year_month,
                            FUN = "min")[, 2]
head(df_agg, 3)

ggplot(data = df_agg,
       aes(x = 1:24)) + 
  geom_ribbon(aes(ymin = min, ymax = max),
              fill = "#BBBBBB") + 
  geom_line(aes(y = count))



  



# ggplot2 - geom_tile()
df = read.csv("calendar_heatmap.csv", stringsAsFactors = FALSE)

# 1)
ggplot(data = df, 
       aes(x = monthweek, 
           y = weekdayf, 
           fill = VIX.Close)) + 
  geom_tile(color = "white") + 
  facet_grid(year ~ monthf)

# 2)
df[, "weekdayf"] = factor(df$weekdayf, 
                          labels = c("Mon", "Tue", "Wed",
                                     "Thu", "Fri"))
ggplot(data = df, 
       aes(x = monthweek, 
           y = weekdayf, 
           fill = VIX.Close)) + 
  geom_tile(color = "white") + 
  facet_grid(year ~ monthf)

# 3)
ggplot(data = df, 
       aes(x = monthweek, 
           y = weekdayf, 
           fill = VIX.Close)) + 
  geom_tile(color = "white") + 
  facet_grid(year ~ monthf) + 
  scale_fill_gradient(low = "#FF0000", high = "#00FF00") +
  labs(x = "Week of Month", y = NULL,
       title = "Time-Series Calendar Heatmap", 
       subtitle = "Yahoo Closing Price", 
       fill = "Close")

# 4)
gg_heat = ggplot(data = df, 
                 aes(x = monthweek, 
                     y = weekdayf, 
                     fill = VIX.Close)) + 
  geom_tile(color = "white") + 
  facet_grid(year ~ monthf) + 
  scale_fill_gradient(low = "#FF0000", high = "#00FF00") +
  labs(x = "Week of Month", y = NULL,
       title = "Time-Series Calendar Heatmap", 
       subtitle = "Yahoo Closing Price", 
       fill = "Close")
gg_heat + 
  theme_bw() + 
  theme(panel.border = element_rect(size = 2),
        panel.grid = element_blank())


# highcharter - hchart()

#### __ 03) 복합 시각화 #### 
#### ____ ● ggpairs ####

#### ____ ● Heatmap의 응용 ####
# superheat - superheat()
library("dplyr")
library("superheat")
library("RColorBrewer")
options(stringsAsFactors = FALSE)
df = read.csv("keywords_count_year.csv")
df_sub = df[2:51, ]

col_bar_df = data.frame(type = c("Disease", "Cell&gene", "Therapy", "etc"),
                        color_line = c("#a6d854", "#fc8d62", "#8da0cb", "#66c2a5"),
                        color_fill = c("#e6f5c9", "#fdcdac", "#cbd5e8", "#b3e2cd"))
df_sub = left_join(x = df_sub,
                   y = col_bar_df,
                   by = c("type" = "type"))

plot_matrix = as.matrix(df_sub[, 2:21])

# 1)
superheat(X = plot_matrix)
          
# 2)
superheat(X = plot_matrix,
          heat.pal = brewer.pal(5, "BuPu"))

# 3)
superheat(X = plot_matrix,
          heat.pal = brewer.pal(5, "BuPu"),
          bottom.label.text.size = 3,
          bottom.label.text.angle = -90)

# 4)
superheat(X = plot_matrix,
          heat.pal = brewer.pal(5, "BuPu"),
          bottom.label.text.size = 3,
          bottom.label.text.angle = -90,
          membership.cols = 1999:2018)

# 5)
rownames(plot_matrix) = df_sub$Var1
superheat(X = plot_matrix,
          heat.pal = brewer.pal(5, "BuPu"),
          bottom.label.text.angle = -90,
          membership.cols = 1999:2018)

# 6)
superheat(X = plot_matrix,
          heat.pal = brewer.pal(5, "BuPu"),
          bottom.label.text.size = 3,
          bottom.label.text.angle = -90,
          membership.cols = 1999:2018,
          left.label.text.size = 2.5,
          left.label.size = 0.25)

# 7)
superheat(X = plot_matrix,
          heat.pal = brewer.pal(5, "BuPu"),
          bottom.label.text.size = 3,
          bottom.label.text.angle = -90,
          membership.cols = 1999:2018,
          left.label.text.size = 2.5,
          left.label.size = 0.25,
          left.label.col = df_sub$color_fill)

# 8)
superheat(X = plot_matrix,
          heat.pal = brewer.pal(5, "BuPu"),
          bottom.label.text.size = 3,
          bottom.label.text.angle = -90,
          membership.cols = 1999:2018,
          left.label.text.size = 2.5,
          left.label.size = 0.25,
          left.label.col = df_sub$color_fill,
          yr.axis.name = "  Total Count\n\n",
          yr = df_sub$total,
          yr.plot.type = "bar",
          yr.bar.col = df_sub$color_line,
          yr.obs.col = df_sub$color_fill)

# 9)
superheat(X = plot_matrix, 
          heat.pal = brewer.pal(5, "BuPu"),
          membership.cols = 1999:2018,
          yt = sample(1:20, 20),
          yt.plot.type = "line",
          yt.axis.name = "\n\n\n\n\n\n  Articles",
          yt.plot.size = 0.15,
          yt.line.size = 1.5, 
          yt.line.col = "#555555",
          yr.axis.name = "  Total Count\n\n",
          yr = df_sub$total,
          yr.plot.type = "bar",
          yr.bar.col = df_sub$color_line,
          yr.obs.col = df_sub$color_fill,
          left.label.text.size = 2.5,
          left.label.size = 0.25,
          left.label.col = df_sub$color_fill,
          bottom.label.text.size = 3,
          bottom.label.text.angle = -90,
          legend.height = 0.05, 
          legend.width = 0.75,
          legend.text.size = 9)


#### [[ 4. 지도의 활용 ]] ####
#### ____ ● 한국 행정경계지도 ####
library("rgdal")
library("maps")
library("ggsn")
library("scatterpie")

map = readOGR("2013_si_do.shp", verbose = FALSE)
map_kor = fortify(map)
head(map_kor)

# 1)
ggplot(data = map_kor, 
       aes(x = long, 
           y = lat, 
           group = group)) + 
  geom_polygon(fill = "#FFFFFF", 
               color = "#000000")

# 2)
ggplot(data = map_kor, 
       aes(x = long, 
           y = lat, 
           group = group,
           fill = id)) + 
  geom_polygon(color = "#000000")

# 3)
ggplot(data = map_kor[map_kor$id == "2", ], 
       aes(x = long, 
           y = lat, 
           group = group,
           fill = id)) + 
  geom_polygon(color = "#000000")

# 4)
df_cl = read.csv("clusters_origin.csv")
head(df_cl)

gg = ggplot(data = df_cl) + 
  geom_polygon(data = map_kor, 
               aes(x = long, 
                   y = lat, 
                   group = group),
               fill = "#FFFFFF", 
               color = "#000000") + 
  geom_scatterpie(data = df_cl,
                  aes(x = long, 
                      y = lat,
                      group = obs, 
                      r = 0.13),
                  cols = c("cl_1", "cl_2"), 
                  color = NA)
gg

# 5)
gg1 = gg +
  scale_fill_manual(values = c("cl_1" = "#3171FF", "cl_2" = "#E86815")) + 
  facet_wrap(~ year, ncol = 2) +
  labs(x = "Longitude", y = "Latitude") + 
  theme_bw() + 
  theme(legend.position = "none",
        strip.text = element_text(size = 20)) 
gg1

# 5)
gg1 + 
  scalebar(data = df_cl,
           dist = 100, model = "WGS84",
           location = "bottomright", transform = TRUE,
           st.size = 3.6, dist_unit = "km",
           anchor = c(x = 131.5,
                      y = 33.25),
           facet.lev = "year")


#### [[ 5. 통계 자료의 시각화 ]] ####
#### ____ ● 선형 회귀 모델 ####
# https://github.com/encaion/R_edu/tree/master/30_visualization/ggplot/statVis
kidney = read.csv("kidney_data.csv")
head(kidney)

model = lm(RAIV ~ Exophytic_rate_PADUA + Urinarycollectingsystem_PADUA 
           + Tumor_size__PADUA + Renal_rim_PADUA + Renal_sinus_PADUA
           + polarlocation_PADUA,
           data = kidney)
model_summary = summary(model)

range_1 = confint(model, level = 0.99)
range_2 = confint(model, level = 0.95)
range_3 = confint(model, level = 0.90)
colnames(range_1) = c("range_0005", "range_0995")
colnames(range_2) = c("range_0025", "range_0975")
colnames(range_3) = c("range_0050", "range_0950")


df = as.data.frame(cbind(vars = rownames(model_summary$coefficients),
                         model_summary$coefficients,
                         range_1,
                         range_2,
                         range_3,
                         VIF = c(-1, car::vif(model)) ))
rownames(df) = NULL

for(n in 2:ncol(df)){
  df[, n] = round(as.numeric(df[, n]), 4)
}
df[1, "VIF"] = " "
df[, "stars"] = c("***", ".", "***", "***", ".", "", "")

library("ggplot2")
ggplot(data = df, aes(x = vars)) +
  geom_hline(yintercept = 0, size = 1.5, color = "#040072", alpha = 0.4) + 
  geom_linerange(aes(ymin = range_0005,
                     ymax = range_0995),
                 size = 4,
                 color = "#86DED7",
                 alpha = 0.4) +
  geom_linerange(aes(ymin = range_0025,
                     ymax = range_0975),
                 size = 4,
                 color = "#A6ACFF",
                 alpha = 0.6) + 
  geom_linerange(aes(ymin = range_0050,
                     ymax = range_0950),
                 size = 4,
                 color = "#86DED7") + 
  geom_point(aes(y = Estimate),
             color = "#FF0000",
             size = 3) + 
  geom_text(data = df[c(1, 3, 4), ],
            aes(y = Estimate,
                label = stars),
            vjust = 0.2,
            size = 7) + 
  geom_text(data = df[c(2, 5, 6), ],
            aes(y = Estimate,
                label = stars),
            vjust = -0.4,
            size = 10) + 
  geom_text(aes(y = Estimate,
                label = VIF),
            vjust = 1.6,
            size = 3) + 
  scale_y_continuous(breaks = seq(-25, 45, by = 5),
                     labels = seq(-25, 45, by = 5),
                     expand = c(0.03, 0.03)) +
  labs(x = "Variables", y = NULL) + 
  theme(axis.title = element_text(size = 12, face = "bold"),
        axis.text = element_text(size = 10)) +
  coord_flip()

#### [[ 6. 네트워크 자료의 시각화 ]] ####
#### ____ ● 용어 정리 ####
#### ____ ● 네트워크 자료 구조 ####
#### ____ ● hchart() + igraph ####
library("highcharter")
library("igraph")
N = 40

set.seed(123)
net = sample_gnp(N, p = 2/N)
wc = cluster_walktrap(net)

V(net)$label = seq(N)
V(net)$name = paste("I'm #", seq(N))
V(net)$page_rank = round(page.rank(net)$vector, 2)
V(net)$betweenness = round(betweenness(net), 2)
V(net)$degree = degree(net)
V(net)$size = V(net)$degree
V(net)$comm = membership(wc)
V(net)$color = colorize(membership(wc))

hchart(net, layout = layout_with_fr)


#### ____ ● simpleNetwork ####
library("networkD3")
source = c(rep("A",4), rep("B", 2), rep("C", 2), "D")
target = LETTERS[2:10]
networkData = data.frame(source, target)
simpleNetwork(Data = networkData, 
              linkDistance = 30)


#### ____ ● forceNetwork####
library("networkD3")
library("data.table")
library("dplyr")
fund_count = fread("network_fund_count_stage2.csv", data.table = FALSE)
fund_count = fund_count[order(fund_count$Freq, decreasing = TRUE), ]
df = fread("network_df_funds_stage2_ordered.csv", data.table = FALSE)
head(df)

top_10_fund_name = fund_count[1:10, "Var1"]
top_10_fund_name

# 노드 크기
df_agg = aggregate(data = cbind(df, count = 1), 
                   count ~ from + to, 
                   FUN = "sum")
df_agg[, "point_size"] = sqrt(df_agg$count) + 1
df_agg = df_agg[order(df_agg$count, decreasing = TRUE), ]

filter_cnt = 20
filtered_list = fund_count[fund_count$Freq >= filter_cnt, "Var1"]
df_agg_sub = df_agg[!((df_agg$from %in% filtered_list) | (df_agg$to %in% filtered_list)), ]
# df_agg_sub = df_agg_sub[(df_agg_sub$from %in% top_10_fund_name) & (df_agg_sub$to %in% top_10_fund_name), ]
head(df_agg_sub)

df = unique(df[(df$from %in% top_10_fund_name) & (df$to %in% top_10_fund_name), 2:3])
colnames(df_agg_sub)[1:2] = c("node_from", "node_to")
node_names = unique(c(df_agg_sub$node_from, df_agg_sub$node_to))
df_nodes = data.frame(name = node_names,
                      group = 1,
                      no = 1:length(node_names))
df_nodes[df_nodes$name %in% top_10_fund_name, "group"] = 2
df_nodes[, "size"] = df_nodes$group^2 * 3 + 2
head(df_nodes)

df_agg_sub_join = left_join(x = df_agg_sub, y = df_nodes[, -2], by = c("node_from" = "name"))
df_agg_sub_join = left_join(x = df_agg_sub_join, y = df_nodes[, -2], by = c("node_to" = "name"))

df_links = df_agg_sub_join[, c("no.x", "no.y", "count")]
colnames(df_links)[1:2] = c("from", "to")
df_links_main = df_links
df_links_main[, 1] = df_links_main[, 1] - 1
df_links_main[, 2] = df_links_main[, 2] - 1
head(df_links_main)
head(df_nodes)

forceNetwork(Links = df_links_main, Nodes = df_nodes,
             Source = "from", Target = "to", 
             Value = "count", NodeID = "name",
             Group = "group", 
             opacity = 0.6, Nodesize = "size", linkWidth = 0.7,
             linkDistance = JS("function(d){return d.value * 2 + 3}"),
             colourScale = JS("d3.scaleOrdinal(['#69C242', '#64BBE3']);"),
             fontSize = 15, radiusCalculation = JS("d.nodesize"))



#### ____ ● ggnetwork ####
library("igraph")
library("ggnetwork")
library("data.table")

listt_count = fread("network_author_count_stage2.csv", data.table = FALSE)
df = fread("network_df_author_stage2.csv", data.table = FALSE)

# df = fread("network_df_author_stage2.csv", data.table = FALSE)
# list_no = df$list_no
# 
# df_split = split(x = df[, 2:3], f = 1:nrow(df))
# df_split = lapply(X = df_split, FUN = "pair_ordering")
# df = bind_rows(df_split)
# head(df)
# # fwrite(df, "network_df_authors_stage2_ordered.csv")
df = fread("network_df_authors_stage2_ordered.csv", data.table = FALSE)
head(df)

n_cnt = 10
top_n_listt_name = listt_count[order(listt_count$Freq, decreasing = TRUE), "Var1"][1:n_cnt]
top_n_listt_name

# 노드 크기
df_agg = aggregate(data = cbind(df, count = 1),
                   count ~ from + to,
                   FUN = "sum")
df_agg[, "point_size"] = sqrt(df_agg$count) + 1
df_agg = df_agg[order(df_agg$count, decreasing = TRUE), ]
head(df_agg, 20)

filter_cnt = 20
filtered_list = listt_count[1:filter_cnt, "Var1"]
df_agg_sub = df_agg[(df_agg$from %in% filtered_list) & (df_agg$to %in% filtered_list), ]
head(df_agg_sub)

node_names = unique(c(df_agg_sub$from, df_agg_sub$to))
df_nodes = data.frame(name = node_names,
                      group = 1,
                      no = 1:length(node_names))
df_nodes[df_nodes$name %in% top_n_listt_name, "group"] = "2"
df_nodes[, "vertex.names"] = as.character(df_nodes$no - 1)
df_nodes = left_join(x = df_nodes, y = listt_count,
                     by = c("name" = "Var1"))
df_nodes[, "size"] = df_nodes$Freq %/% 200 * 4 + 2
df_nodes[which(df_nodes$group == 2), "group"] = as.character(2:11)
head(df_nodes)

colnames(df_agg_sub)[1:2] = c("node_from", "node_to")
df_agg_sub_join = left_join(x = df_agg_sub, y = df_nodes[, -2], by = c("node_from" = "name"))
df_agg_sub_join = left_join(x = df_agg_sub_join, y = df_nodes[, -2], by = c("node_to" = "name"))

df_links = df_agg_sub_join[, c("no.x", "no.y", "count")]
colnames(df_links)[1:2] = c("from", "to")
df_links_main = df_links
df_links_main[, 1] = df_links_main[, 1] - 1
df_links_main[, 2] = df_links_main[, 2] - 1
head(df_links_main)

edges = matrix(unlist(df_links_main[, 1:2]), nrow = 2, byrow = TRUE)
edges = as.character(as.vector(edges))

sample_g = graph(edges = edges, 
                 directed = FALSE) 

set.seed(124)
sample_ggn = ggnetwork(sample_g)
sample_ggn = left_join(x = sample_ggn, y = df_nodes,
                       by = c("vertex.names" = "vertex.names"))
head(sample_ggn)

col_list = c("#225378", "#1695A3", "#ACF0F2", "#F3FFE2", "#F29B38",
             "#63CF9F", "#F2E1AC", "#F2836B", "#F2AC4B", "#CD2C8A")

gg = ggplot() +
  geom_edges(data = sample_ggn[sample_ggn$group == 1, ],
             aes(x = x, 
                 y = y, 
                 xend = xend, 
                 yend = yend),
             alpha = 0.05) 

for(n in 2:11){
  gg = gg + 
    geom_edges(data = sample_ggn[sample_ggn$group == n, ],
               aes(x = x, 
                   y = y, 
                   xend = xend, 
                   yend = yend),
               color = col_list[n-1],
               size = 1.1,
               alpha = 0.3)
}

gg = gg + 
  geom_nodes(data = sample_ggn,
             aes(x = x + 0.002, 
                 y = y - 0.003,
                 size = size))

for(n in 2:11){
  gg = gg +
    geom_nodes(data = sample_ggn[sample_ggn$group == n, ],
               aes(x = x, 
                   y = y, 
                   size = size),
               color = col_list[n-1],
               alpha = 1)
}


gg + 
  geom_nodetext(data = sample_ggn[sample_ggn$group == "1", ],
                aes(x = x,
                    y = y + 0.02,
                    label = name),
                color = "#000000",
                size = 2.5) +
  geom_nodetext(data = sample_ggn[sample_ggn$group == "1", ],
                aes(x = x - 0.0015,
                    y = y + 0.0215,
                    label = name),
                color = "#EEEEEE",
                size = 2.5) +
  geom_nodetext(data = sample_ggn[sample_ggn$group != "1", ],
                aes(x = x,
                    y = y + 0.04,
                    label = name),
                color = "#000000",
                size = 4) +
  geom_nodetext(data = sample_ggn[sample_ggn$group != "1", ],
                aes(x = x - 0.002,
                    y = y + 0.043,
                    label = name),
                color = "#EEEEEE",
                size = 4) +
  theme_blank() + 
  guides(size = guide_legend(override.aes = list(color = "#000000"))) + 
  theme(legend.position = c(0.90, 0.85))

