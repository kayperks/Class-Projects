
extractArticleData = function(articleUrl) {
  article = xml2::read_html(articleUrl)
  
  DOI = gsub("https://hereditasjournal.biomedcentral.com/articles/",
             "",
             articleUrl)

  title_nodes = html_nodes(article, ".c-article-title")
  title = html_text(title_nodes)
  
  author_nodes = html_nodes(article, xpath = '//meta[@name="dc.creator"]')
  author_text = html_attr(author_nodes , "content")
  authors = paste0(author_text, collapse = ", ")
  
  affiliation_nodes = html_nodes(article, ".c-article-author-affiliation__address")
  affiliation_text = html_text(affiliation_nodes)
  author_affiliations = paste0(affiliation_text, collapse = "||")
  
  correspodence_str = c()
  for (i in 1:20) {
    correspodence_nodes = html_nodes(article, str_c("#corresp-c", i))
    correspodence_text = html_text(correspodence_nodes)
    correspodence_str = c(correspodence_str, correspodence_text)
    
  }
  correspodence_authors = paste0(correspodence_str, collapse = ",")

  correspodence_email_str = c()
  for (i in 1:20) {
    correspodence_email_nodes = html_nodes(article, str_c("#corresp-c", i))
    correspodence_email_attr = html_attr(correspodence_email_nodes,"href") 
    correspodence_email_str = c(correspodence_email_str, correspodence_email_attr)
  }
  correspodence_email_authors = paste0("https://hereditasjournal.biomedcentral.com",correspodence_email_str, collapse = " ,")
  
  published_date_nodes = html_nodes(article, ".c-article-identifiers__item time")
  published_date_text = html_text(published_date_nodes)
  
  abstract_nodes = html_nodes(article,  xpath = '//meta[@name="citation_abstract"]')
  abstract = html_attr(abstract_nodes , "content")
 
  keyword_nodes = html_nodes(article, ".c-article-subject-list__subject")
  keywords_text = html_text(keyword_nodes)
  keywords_str = str_trim(str_replace_all(keywords_text, "[\n]", " "))
  keywords = paste0(keywords_str, collapse = ", ")
  
  doc = htmlParse(article , asText = TRUE)
  text = xpathSApply(
    doc,
    "//text()[not(ancestor::script)][not(ancestor::style)][not(ancestor::noscript)][not(ancestor::form)]",
    xmlValue
  )
  txt = paste(text, collapse = " ")
  txt = str_replace_all(txt, "[\n]", "")
  full_paper_text = gsub("^ *|(?<= ) | *$", "", txt, perl = TRUE)

  ##Excel contains a limit of around 32000 character in a cell, this function serves to break the text into multiple columns 
  num.chars <- nchar(full_paper_text)
  starts <- seq(1,num.chars, by=20000)
  full_paper_text= sapply(starts, function(ii) {
    substr(full_paper_text, ii, ii+20000)
  })
  
  
  tibble(
    DOI,
    title ,
    authors ,
    author_affiliations ,
    correspodence_authors ,
    correspodence_email_authors,
    published_date_text ,
    abstract ,
    keywords ,
    full_paper_text[1] ,
    full_paper_text[2] ,
    full_paper_text[3] ,
    full_paper_text[4]
  )
  
}

extractAllArticlesData = function(articleUrls) {
  articles_data = articleUrls %>%
    # Apply to all URLs
    map(extractArticleData) %>%
    # Combine the tibbles into one tibble
    bind_rows()
  
}
