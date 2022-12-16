## info3_truth.R
##
## 2022-11-03 Yuki Yanai
##
## Replicate figures appeared in Ch. 2 of Grant (2019)

library(tidyverse)

myd <- read_csv("data/info3_trains.csv")


## Scatter plot
p1 <- ggplot(myd, aes(x = caltime, y = london_se)) +
  geom_point() +
  labs(x = "4-week period",
       y = "Delays and cancellations (%)") +
  scale_x_continuous(breaks = seq(1997, 2017, by = 5),
                     minor_breaks = 1997 : 2017) +
  scale_y_continuous(breaks = seq(0, 14, by = 2),
                     limits = c(0, 15)) +
  geom_hline(yintercept = 0, color = "gray")
plot(p1)

## Line chart
p2 <- ggplot(myd, aes(x = caltime, y = london_se)) +
  geom_line() +
  labs(x = "4-week period",
       y = "Delays and cancellations (%)") +
  scale_x_continuous(breaks = seq(1997, 2017, by = 5),
                     minor_breaks = 1997 : 2017) +
  scale_y_continuous(breaks = seq(0, 14, by = 2),
                     limits = c(0, 15)) +
  geom_hline(yintercept = 0, color = "gray")
plot(p2)


## Line chart with fall observations marked
p3 <- ggplot(myd, aes(x = caltime, y = london_se)) +
  geom_line() +
  geom_point(data = filter(myd, calperiod > 9, calperiod < 13), color = "red") +
  labs(x = "4-week period",
       y = "Delays and cancellations (%)") +
  scale_x_continuous(breaks = seq(1997, 2017, by = 5),
                     minor_breaks = 1997 : 2017) +
  scale_y_continuous(breaks = seq(0, 14, by = 2),
                     limits = c(0, 15)) +
  geom_hline(yintercept = 0, color = "gray")
plot(p3)

## Line chart with fall colored
p4 <- ggplot(myd, aes(x = caltime, y = london_se)) +
  geom_vline(data = filter(myd, calperiod > 9, calperiod < 13), 
             aes(xintercept = caltime),
             size = 1,
             color = "pink") +
  geom_line() +
  labs(x = "4-week period",
       y = "Delays and cancellations (%)") +
  scale_x_continuous(breaks = seq(1997, 2017, by = 5),
                     minor_breaks = 1997 : 2017) +
  scale_y_continuous(breaks = seq(0, 14, by = 2),
                     limits = c(0, 15)) +
  geom_hline(yintercept = 0, color = "gray")
plot(p4)


## Compare years by scatter plot
p5 <- ggplot(myd, aes(x = calperiod, y = london_se)) +
  geom_point(alpha = 1/3) +
  labs(x = "4-week period",
       y = "Delays and cancellations (%)") +
  scale_x_continuous(breaks = seq(1, 13, by = 3)) +
  scale_y_continuous(breaks = seq(0, 14, by = 2),
                     limits = c(0, 15)) +
  geom_hline(yintercept = 0, color = "gray")
plot(p5)  


## Compare years by line chart 
p6 <- ggplot(myd, aes(x = calperiod, y = london_se)) +
  geom_line(aes(group = calyear), alpha = 1/3) +
  labs(x = "4-week period",
       y = "Delays and cancellations (%)") +
  scale_x_continuous(breaks = seq(1, 13, by = 3)) +
  scale_y_continuous(breaks = seq(0, 14, by = 2),
                     limits = c(0, 15)) +
  geom_hline(yintercept = 0, color = "gray")
plot(p6)  


## p5 with years distinguished
p5b <- ggplot(myd, aes(x = calperiod, y = london_se, 
                       color = as.factor(calyear))) +
  geom_point(alpha = 1/3) +
  labs(x = "4-week period",
       y = "Delays and cancellations (%)",
       color = "Year") +
  scale_x_continuous(breaks = seq(1, 13, by = 3)) +
  scale_y_continuous(breaks = seq(0, 14, by = 2),
                     limits = c(0, 15)) +
  geom_hline(yintercept = 0, color = "gray")
plot(p5b)  


## p6 with years distinguished
p6b <- ggplot(myd, aes(x = calperiod, y = london_se)) +
  geom_line(aes(color = as.factor(calyear)), alpha = 1/3) +
  labs(x = "4-week period",
       y = "Delays and cancellations (%)",
       color = "Year") +
  scale_x_continuous(breaks = seq(1, 13, by = 3)) +
  scale_y_continuous(breaks = seq(0, 14, by = 2),
                     limits = c(0, 15)) +
  geom_hline(yintercept = 0, color = "gray")
plot(p6b)  


## Heatmap
p7 <- ggplot(myd, aes(x = calyear, 
                      y = calperiod, 
                      fill = as.factor(worst))) +
  geom_tile() +
  scale_fill_manual(values = c(c("white","#f7e1de","#e4988f","#ad3829")),
                    name = "Worst 3 periods",
                    labels = c("", "Worst 3", "Worst 2", "Worst")) +
  scale_x_continuous(breaks = seq(1997, 2017, by = 5),
                     expand = c(0, 0),
                     minor_breaks = 1997 : 2017) +
  scale_y_continuous(breaks = 1:13,
                     expand = c(0, 0),
                     limits = c(0, 13)) +
  labs(x = "Year", y = "4-week period") +
  theme_bw()
plot(p7)
