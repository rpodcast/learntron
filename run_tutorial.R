# execute the tutorial from an R process
library(shiny)
library(rmarkdown)

withr::with_dir("tron", {
  rmarkdown::run(
    file = "index.Rmd", 
    shiny_args = list(port = 80, host = '0.0.0.0')
  )
})
