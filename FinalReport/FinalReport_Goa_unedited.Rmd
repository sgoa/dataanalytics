---
title: "Final Report"
author: "O Steve Goa"
date: "4/16/2019"
output: html_document
---


## The file and the data frame
```{r, echo=TRUE}
data <- read.csv("C:/rpractice/bikeVendors.csv")
data = na.omit(data)
head(data)
```

##The data frame
```{r, echo=TRUE}
df <- data.frame(data)
```


## Finding the median price of a bike
```{r}
median(data$price)
```

price is in dollars

## Finding the median price of an aluminium bike


## Finding the median price of bike by frames

```{r, echo=TRUE}
aggregate(formula = price ~ frame, data = df, FUN = mean)
```

## The most expensive category 1 Mountain bike 
```{r}
max(data$price[data$category1 == "Mountain"])
```


## The most expensive category 1 Mountain bike
```{r, echo=TRUE}
max(data$price[data$category1 == "Mountain"])
```


## The least expensive category 2 Sport bike
```{r, echo=TRUE}
min(data$price[data$category2 == "Sport"])

```


## The lease expensive category 2 Sport bike 

```{r, echo=TRUE}
max(data$price[data$category2 == "Sport"])

```


## Study of the regresssion line

```{r, echo=FALSE}
str(data)
```


## Ploting the data (frame by price )

We see here that carbon bikes are by far the most expensive bikes. 
They can cost $10,000 and more


Ploting the data (frame by mode )

```{r, echo=TRUE}
ggplot(data, aes(x=price, y=model, frame = TRUE)) + geom_point(shape=18)
```

```{r, echo=TRUE}
 m1 <- lm(price ~ model, data= data)
```
```{r}
summary(m1)
head(m1)
```

# Making a test hypothesis 
```{r, echo=TRUE}
data.carbon <- subset(x = data,
subset = frame == "carbon"
)
```


```{r, echo=TRUE}
data.aluminum <- subset(x = data,
subset = frame == "aluminum"
)
```

```{r, echo=TRUE}
dat <- data.frame(data.carbon, data.aluminum)
```

```{r}
plot(price~model,data=data)
```


```{r, echo=TRUE}
result= aov(price~model,data=data)
```

```{r}
summary(result)
```

## In-depth and more detailed summary of the findings
```{r, echo=FALSE}
summary(data)
```


## Grouping by City
```{r, echo=TRUE}
aggregate(data$price, by=list(data$Dallas.Cycles), FUN=mean)[2]
```

Dallas Cycle shop

```{r, echo=TRUE}
aggregate(data$price, by=list(data$San.Francisco.Cruisers), FUN=mean)[2]

```

SanFrancisco Crusisers

#Agglomerate Coefficient

```{r, echo=TRUE}
agnes (data)
```

#Data Visualization by City

```{r, echo=TRUE}
ggplot(data = data) +
  geom_histogram(mapping = aes(x = San.Francisco.Cruisers), bins = 10)
```

```{r, echo=TRUE}
ggplot(data = data) +
  geom_histogram(mapping = aes(x = data$Dallas.Cycles), bins = 10)
```
```





