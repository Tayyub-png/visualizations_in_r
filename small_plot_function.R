mypdf = function(pdfname, mypattern = "MYTEMPPNG", ...) {
  fname = paste0(mypattern, "%05d.png")
  gpat = paste0(mypattern, ".*\\.png")
  takeout = list.files(path = tempdir(), pattern = gpat, full.names = TRUE)
  if (length(takeout) > 0) 
    file.remove(takeout)
  pngname = file.path(tempdir(), fname)
  png(pngname, ...)
  return(list(pdfname = pdfname, mypattern = mypattern))
}
# copts are options to sent to convert
mydev.off = function(pdfname, mypattern, copts = "") {
  dev.off()
  gpat = paste0(mypattern, ".*\\.png")
  pngs = list.files(path = tempdir(), pattern = gpat, full.names = TRUE)
  mystr = paste(pngs, collapse = " ", sep = "")
  system(sprintf("convert %s -quality 100 %s %s", mystr, pdfname, copts))
}
