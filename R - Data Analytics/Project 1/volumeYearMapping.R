
volumeYearMapping = function(url) {
  article = xml2::read_html(url)
  
  title_nodes = html_nodes(article, xpath = "//form[@id='citation-search']/div/select[@name='volume']/option")
  title = html_text(title_nodes)
  
  year = c()
  volume = c()
  for (i in 2:length(title)) {
    yearPos = regexpr("[(](.*?)[)]" , title[i])
    yearMatch = regmatches(title[i], yearPos)
    year = append(year, gsub("[(]|[)]", "", yearMatch))
    
    volumePos = regexpr("[0-9](.*)[(]" , title[i])
    volumeMatch = regmatches(title[i], volumePos)
    volume = append(volume, str_trim(gsub("[(]", "", volumeMatch)))
  }
  
  return(data.frame(
    volume = volume,
    year = year,
    stringsAsFactors = FALSE
  ))
  
}





