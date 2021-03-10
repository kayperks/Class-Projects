
dir.create("Crawled_articles")
crawlArticles = function(articleUrls) {
  for (i in 1:length(articleUrls)) {
    article = read_html(articleUrls[i])
    articleName = paste0(gsub("https://hereditasjournal.biomedcentral.com/articles/", "", articleUrls[i]),
                  ".html")
    articleName=gsub("/","-",articleName)
        write_xml(article,
              paste0(getwd() , "/Crawled_articles/", articleName))
  }
}
