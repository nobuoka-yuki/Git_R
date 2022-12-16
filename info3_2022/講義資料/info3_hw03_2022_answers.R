## info3_hw03_answers.R
##
## R codes to create figures for Assignment 3
##
## 2022-11-05 Yuki Yanai

library(tidyverse)

## 1. 

data(mpg)
p1a <- ggplot(mpg, aes(x = displ, y = cty, color = class)) +
  geom_point() +
  labs(x = "Engine displacement (litter)",
       y = "City miles per gallon") +
  scale_color_brewer(palette = "Dark2", 
                     name = "Class")
plot(p1a)

p1b <- ggplot(mpg, aes(x = displ, y = cty)) +
  geom_point() +
  labs(x = "Engine displacement (litter)",
       y = "City miles per gallon") +
  facet_wrap(vars(class))
plot(p1b)


## 2. 

data(economics)
data(presidential)

p2 <- ggplot(economics) +
  geom_rect(aes(xmin = start, xmax = end, fill = party),
            ymin = -Inf, ymax = Inf, alpha = 0.2,
            data = presidential) +
  geom_vline(aes(xintercept = as.numeric(start)),
             data = presidential,
             color = "gray50", alpha = 0.5) +
  geom_text(aes(x = start, y = 2500, label = name),
            data = presidential,
            size = 3, vjust = 0, hjust = 0, nudge_x = 50) +
  geom_line(aes(x = date, y = unemploy)) +
  labs(x = "Date", y = "Unemployment",
       title = "Unemployment in the US") +
  scale_fill_brewer(palette = "Set1",
                    direction = -1,
                    name = "Government")
plot(p2)



