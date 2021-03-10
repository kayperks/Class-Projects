Hereditas - Project


1) webScrapeJournal.R
webScrapeJournal is the main function where year as an input is passed through the function. volumeYearMapping, createVolumeUrls, getArticleUrls, extractAllArticlesData and writeArticlesData functions are called by the file. 

2) volumeYearMapping.R
volumeYearMapping function takes the url [https://hereditasjournal.biomedcentral.com/articles] as an input and web scrapes volume dropdown from url. It then returns a data frame of volumne and year mapping.

3) createVolumeUrls.R
createVolumeUrls function takes year, year-volume mapping as input. Creates volume url's for, in/after that given year and returns them.

4) getArticleUrls.R
createVolumeUrls function takes volume url's as input. Web scrapes article url's from each volumeUrl and collects all article url's for all volume url's and returns them.

5) crawlArticles.R
crawlArticles function takes articleUrls as input, then creates html pages of articles and stores them in an /Crawled_articles/ folder, labelling each article as DOI.html.
"/" is not allowed for file names and will be replaced with "-".

6) extractArticlesdata.R
extractArticleData function takes articleUrl as input and extracts DOI, Title, Authors, Author Affiliations, Correspondence Author, Publish Date, Abstract, Keywords, Full Paper. 
Text fields are returned for each article and returned in a tibble. 
extractAllArticlesData function takes articleUrls as input, and calls extractArticleData function for all artcileUrls. Each tibble will be combined to form one tibble, and a final tibble will be returned.

7) writeArticlesData.R
writeArticlesData function writes articles data into Hereditas.txt file.

8) readArticlesData.R
readArticlesData function reads the Hereditas.txt file