<!-- 
  -->
  ```{r setup, include=FALSE}
rm(list = ls())
knitr::opts_chunk$set(echo = FALSE, warning = FALSE, message = FALSE)
library(tidyverse)

```

-->
  > The purpose of this document is to simulataneously analyze data on netflix titles. This data was given to us as a practice to become more familiar with datasets and give reports on our own. 

```{r include=TRUE}
knitr::opts_chunk$set(echo = TRUE)

library(tidyverse)

netflix_titles <-read_csv(file = "netflix_titles.csv")

summary(netflix_titles)

```# Shape and Structure of the Data
-->
  The data set contains statistics of Netflix movies and shows that were relased between 1925-2021. 

```{r graph, echo=FALSE}
print(str(netflix_titles))

```--> The data set has 8,807 observations with 12 columns, the column categories consist of `show_id` `type` `title` `director` `cast` `country` `date_added` `relase_year` `rating` `duration` `listed_in` and `description`. We can see that all our varibales are character types except for `release_year` this is a numeric type. Because our varibales are categorical types we can use models such as logistic regression, and decision trees. 

## Missing data 


```{r include=TRUE}
which(is.na(data))

``````{r include=TRUE}
sum(is.na(netflix_titles))


```

--> 
  The data set contains 4,307 missing values. We can create a function to deal with NAs for the variable we assign into the function. Then we assign multiple variables to the function at the same time. The result would clean up the data set to replace the NAs to "UNK".


```{r include=TRUE}

NAs <- function(x) (x = as.factor(ifelse(is.na(as.character(x)),'UNK',as.character(x))))


```

```{r include=TRUE}

netflix_titles <- netflix_titles %>% 
  mutate_at(c('show_id','type','title','director','cast', 'country', 'date_added', 'release_year', 'rating', 'duration', 'listed_in', 'description'), NAs)

```

```{r include=TRUE}
netflix_titles %>%
  keep(is.factor) %>% 
  summary()

```## Visualization
-->
  
  ```{r include=TRUE}
netflix_titles %>%
  ggplot() +
  geom_bar(mapping = aes(x = release_year, fill = type), color = "black") +
  labs(title = "Stacked Bar Chart of Type released by Year", x = "release_year", y = "Number of types") +
  coord_flip() +
  theme_minimal() + 
  theme(text = element_text(size = 14))

```-->
  This graph tells us how many movies/ tv shows netflix has released throughout the years. This is a good understanding for Netflix to understand how they have been performing throughout the years and the amount of volume they have been releasing. An improvement Netflix can include in this data is too compare the amount of volume released compared to positive or negative reviews they have received throughout the years. For example out of the 300 TV shows they released in 2021 how many of those TV shows performed well and what type of rating did they receive. Does it make sense for Netflix to continue releasing more TV shows then Movies?
  
  ## Summary Statistics 
  
  -->
  I will select the columns in the data set and get the summary of them.


```{r include=TRUE}

df = netflix_titles
view(df)
summary(df)
```-->
  The summary tells us the number of values in each category and what those values consist of. This gives Netflix insight of what they are putting on their platform, for example there were 3,207 TV-MA ratings being put out throughout the years making it the most rating being put released. Netflix also put out more Movies then they did TV shows. There were 6,131 movies released and 2,676 TV shows released.

