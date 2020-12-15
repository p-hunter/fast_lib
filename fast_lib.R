



InstalledPackage <- function(package) {
  
  available <- suppressMessages(
    suppressWarnings(
      sapply(package, 
             FUN = require, 
             quietly = TRUE, 
             character.only = TRUE, 
             warn.conflicts = FALSE)
    )
  )
  
  missing <- package[!available]
  
  if (length(missing) > 0) {
    
    return(FALSE)
    
  } else{
    
    return(TRUE)
    
  }
  
}

load_library <- function(
  package, 
  defaultCRANmirror = "http://cran.at.r-project.org"
) {
  if(!InstalledPackage(package)){
    
    options(repos = c(CRAN = defaultCRANmirror))
    
    suppressMessages(
      suppressWarnings(
        install.packages(package)
      )
    )
    
    if(!InstalledPackage(package)) {
      
      return(FALSE)
      
    }
    
  }
  
  return(TRUE)
}

fast_lib <- function(libs) {
  
  lapply(libs, function(library) {
    
    if(!load_library(library)){
      
      stop("Error!")
      
    }
    
  })
  
}



r_libraries <-  c("tidyverse", "magrittr", "lubridate",
                  "broom", "hms", "openxlsx", "splines",
                  "pscl", "poissonreg", "tidymodels", "vroom",
                  "kableExtra", "knitr")

fast_lib(r_libraries)
