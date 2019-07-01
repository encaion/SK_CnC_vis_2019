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
#### ____ ● 피보팅 ####
data("iris")
head(iris)
unique(iris$Species)
quantile(iris$Sepal.Length)
quantile(iris$Sepal.Length, probs = 0.99)
table(iris$Species)
plot(iris[, c("Sepal.Length", "Sepal.Width")])
# install.packages("ggplot2")

# SELECT AVG(Sepal.Length) FROM table GROUP BY Species
aggregate(data = iris, Sepal.Length ~ Species, FUN = "mean")

#### __ 02) ggplot 문법 #### 
#### ____ ● 제작자 ####
#### ____ ● 특징 ####
#### ____ ● 기초 문법 ####
# 스타일 1

# 스타일 2

df = data.frame(xx = 1:10,
                yy = 1:10)
library("ggplot2")

# 1)
ggplot(data = df,
       aes(x = xx, y = yy)) +
  geom_line(size = 1.5) +
  geom_point(size = 8) + 
  geom_point(size = 6, color = "#FFFFFF") + 
  geom_text(aes(label = LETTERS[1:10])) + 
  geom_vline(xintercept = 5, color = "red") +
  geom_hline(yintercept = 5, color = "blue")

# 2)
ggplot(data = df,
       aes(x = xx, y = yy)) + 
  geom_col()

# ggplot(data = df,
#        aes(x = xx, y = yy)) + 
#   geom_bar(stat = "identity")

ggplot(data = df,
       aes(x = xx, y = yy,
           color = yy)) + 
  geom_col(size = 3)

ggplot(data = df,
       aes(x = xx, y = yy,
           fill = yy)) + 
  geom_col()

ggplot(data = df,
       aes(x = xx, y = yy,
           fill = yy)) + 
  geom_col(color = "#000000",
           size = 2)

ggplot(data = df,
       aes(x = xx, y = yy,
           fill = yy)) + 
  geom_col(color = "#000000",
           size = 2) + 
  theme_bw()

ggplot(data = df,
       aes(x = xx, y = yy,
           fill = yy)) + 
  geom_col(color = "#000000",
           size = 2) + 
  theme_bw() + 
  coord_flip()

ggplot(data = df,
       aes(x = xx, y = yy,
           fill = yy)) + 
  geom_col(color = "#000000",
           size = 2) + 
  theme_void() + 
  coord_polar()






#### __ 03) 그래프 세부 설정 #### 
#### ____ ● 색상 ####
# 준비

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

data("diamonds", package = "ggplot2")
df = as.data.frame(diamonds)
head(df)
# 선색상(color) - auto
ggplot(data = df,
       aes(x = cut, y = price,
           color = cut)) + 
  geom_boxplot()

ggplot(data = df,
       aes(x = cut, y = price,
           color = cut)) + 
  geom_boxplot(outlier.size = 5,
               outlier.alpha = 0.05)

colors()

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
ggplot(data = df,
       aes(x = cut, y = price,
           color = cut)) + 
  geom_boxplot() + 
  labs(title = "title",
       subtitle = "subtitle",
       caption = "caption",
       x = "x axis", y = "y axis",
       color = "☆☆☆☆")

# 범례 속성 재정의

#### ____ ● 격자 ####
# 관련 인자 및 함수
ggplot(data = df,
       aes(x = price)) + 
  geom_histogram(bins = 100) + 
  theme_bw() + 
  theme(panel.grid = element_line(size = 1,
                          color = "#0000FF"))


#### 실전 문제 ####
#### __ 1) 문제 01 ####
library("readxl")
puby = read_excel("Article_year_count.xlsx")

#### __ 2) 문제 02 ####
fund = read_excel("fund.xlsx", col_names = "name")

#### [[ 3. 자료형별 시각화 ]] ####
#### __ 01) 범주형 자료의 시각화 #### 
#### ____ ● 막대 그래프 ####
# 기본 그래프
data("diamonds")
df = as.data.frame(diamonds)

# position 조정

# 데이터 준비

# 기본 그래프

# highcharter - hchart()

# 1)

# 2)
name = c("Animals", "Fruits", "Cars")
df = data.frame(name = name,
                y = c(5, 2, 4),
                drilldown = tolower(name))

hc = highchart() %>%
  hc_chart(type = "column")

# 3)
dfani = data.frame(name = c("Cats", "Dogs", "Cows", "Sheep", "Pigs"),
                   value = c(4, 3, 1, 2, 1))

dffru = data.frame(name = c("Apple", "Organes"),
                   value = c(4, 2))

dfcar = data.frame(name = c("Toyota", "Opel", "Volkswage"),
                   value = c(4, 2, 2))


#### ____ ● 파이 차트 ####
# geom_rect() + coord_polar()

#### ____ ● 레이더 차트 ####
# radarchart + chartJSRadar()

#### ____ ● 흐름도 - ggalluvial ####

#### ____ ● networkD3 ####

#### ____ ● Tree map - highcharter ####


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


#### ____ ● 연속형 자료의 시각화 ####
# ggplot2 - geom_ribbon()
data("LakeHuron")
huron = data.frame(year = 1875:1972,
                   level = LakeHuron)
head(huron)

# ggplot2 - geom_tile()
df = read.csv("calendar_heatmap.csv", stringsAsFactors = FALSE)

# 1)
ggplot(data = df, 
       aes(x = monthweek, 
           y = weekdayf, 
           fill = VIX.Close)) + 
  geom_tile(color = "white") + 
  facet_grid(year ~ monthf)


# highcharter - hchart()
library("highcharter")
data("diamonds", "mpg", package = "ggplot2")


#### __ 03) 복합 시각화 #### 
#### ____ ● ggpairs ####


#### ____ ● Heatmap의 응용 ####
# superheat - superheat()
library("dplyr")
library("superheat")
df = read.csv("keywords_count_year.csv", stringsAsFactors = FALSE)
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

# 3)

# 4)

# 5)

# 6)

# 7)

# 8)

# 9)


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

# 3)

# 4)

# 5)
gg1 + 
  scalebar(data = df_cl,
           dist = 100, model = "WGS84",
           location = "bottomright", transform = TRUE,
           st.size = 3.6, dist_unit = "km",
           anchor = c(x = 131.5,
                      y = 33.25),
           facet.lev = "year")

# 6)
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


#### ____ ● ggnetwork ####
library("igraph")
library("ggnetwork")
library("data.table")

listt_count = fread("network_author_count_stage2.csv", data.table = FALSE)
# df = fread("network_df_author_stage2.csv", data.table = FALSE)
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
