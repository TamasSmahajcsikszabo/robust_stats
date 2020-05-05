library(tidyverse)
library(ggplot2)

means <- c()
medians <- c()
resamples <- c()
for (i in seq(1:4000)) {
  data <- sample(x = rnorm(m = 0, n = 2000), size = 30)
  m <- mean(data)
  means <- c(means, m)
  med <- median(data)
  resample <- i
  resamples <- c(resamples, resample)
  medians <- c(medians, med)
}

datafr <- data.frame(med = medians, mean = means, lay = resamples) %>%
  arrange(med, mean)

ggplot(datafr) +
  geom_density(aes(x = med)) +
  geom_density(aes(x = mean), linetype = "dashed")
