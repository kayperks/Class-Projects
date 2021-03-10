
readArticlesData = function(fileUrl) {
  allArticlesData = read.table(fileUrl ,
                               header = TRUE,
                               sep = "\t",
                               dec = ".")
  allArticlesData
}


readArticlesData("C:\\Users\###\\Documents\\Heriditas file\\Heriditas.txt")