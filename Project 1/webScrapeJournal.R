
install.packages("RCurl")
install.packages("XML")
install.packages("rvest")
install.packages("stringr")
install.packages("magrittr")
install.packages("tidyverse")
install.packages("httr")

library(RCurl)
library(XML)
library(rvest)
library(stringr)
library(magrittr)
library(tidyverse)
library(httr)

source(
  paste0(
    "C:\\Users\\###\\Documents\\R scripts\\volumeYearMapping.R"
  )
)
source(
  paste0(
    "C:\\Users\\###\\Documents\\R scripts\\createVolumeUrls.R"
  )
)
source(
  paste0(
   "C:\\Users\\###\\Documents\\R scripts\\getArticleUrls.R"
  )
)
source(paste0(
   "C:\\Users\\###\\Documents\\R scripts\\crawlArticles.R"
))
source(
  paste0(
   "C:\\Users\\###\\Documents\\R scripts\\extractArticlesData.R"
  )
)
source(
  paste0(
    "C:\\Users\\###\\Documents\\R scripts\\writeArticlesData.R"
  )
)

webScrapeJournal = function(year) {
  volumeYear = volumeYearMapping("https://hereditasjournal.biomedcentral.com/articles")
  volumeUrls = createVolumeUrls(year, volumeYear)
  articleUrls = getArticleUrls(volumeUrls)
  crawlArticles(articleUrls)
  articlesData = extractAllArticlesData(articleUrls)
  writeArticlesData(articlesData)
  
}

webScrapeJournal(2018)
