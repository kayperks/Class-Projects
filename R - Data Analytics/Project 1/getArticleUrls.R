
getArticleUrls = function(volumeUrls) {
  articleUrls = c()
  
  Url = sapply(volumeUrls, function(x) {
    x %>% as.character() %>% read_html() %>%
      html_nodes(xpath = '//a[@itemprop="url"]') %>%
      html_attr('href')
  },simplify = FALSE)
 
  for (i in 1:length(Url)) {
    articleUrls = append(articleUrls, Url[[i]] [-1])
  }
  
  articleUrls = paste0("https://hereditasjournal.biomedcentral.com", articleUrls)
  
  
}


