rm(list = ls())
setwd("~/Dropbox/PhD_private/Papers/Paper_3/shiny_pqtl/config/")

load("../assets/ST_db.RData")

require(xlsx) 


list_trans <- list(3, 
                   8:9, 
                   c(7:12, 14:15, 18:20, 22:23), 
                   11, 
                   c(1, 5:6, 13:14),
                   c(1, 5:6, 14:16),
                   NULL,
                   4:5, 
                   7:10,
                   4:5)

vec_names <- gsub(" - ", "-", vec_names)

bool_app <- FALSE
for (ii in 1:n_st) {
  
  if (!is.null(list_trans[ii])) 
    st[[ii]][, list_trans[[ii]]] <- lapply(list_trans[[ii]], function(jj) as.numeric(st[[ii]][,jj]))
  
  # write.xlsx2(st[[ii]], file = file.path("../assets/Suppl_tables.xlsx"),
  #            sheetName = vec_names[ii],
  #            col.names = TRUE,
  #            row.names = FALSE,
  #            append = bool_app,
  #            characterNA="")
  bool_app <- TRUE
  
}
