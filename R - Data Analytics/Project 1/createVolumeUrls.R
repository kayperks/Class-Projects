
createVolumeUrls = function(year , volumeYear) {
  VolumeMapping = volumeYear[volumeYear$year == year ,]
  givenVolume = VolumeMapping$volume
  volumeUrls = paste0(
    "https://hereditasjournal.biomedcentral.com/articles?query=&volume=",
    str_trim(givenVolume:max(as.numeric(
      volumeYear$volume
    ))),
    "&searchType=&tab=keyword"
  )
  volumeUrls
}
