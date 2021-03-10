
writeArticlesData = function(articles_data) {
  write.table(
    articles_data,
    "C:\\Users\\###\\Documents\\Hereditas file\\Hereditas.txt",
    append = FALSE,
    sep = "\t",
    dec = ".",
    row.names = TRUE,
    col.names = TRUE
  )
}
