rm(list = ls())
setwd("~/Dropbox/PhD_private/Papers/Paper_3/figures/shiny_pqtl/config/")

load("../assets/ST.RData")

require(xlsx) 
vec_names <- gsub(":", "", vec_names) # reduce size of excel name sheets
#vec_names <- gsub("QTLs", "QTL", vec_names)
vec_names <- gsub(" - ", "-", vec_names)

list_trans <- list(c(6, 7), c(5, 6, 7, 9), c(3, 4, 5, 7), 
                   3, c(6:11, 13:14), c(14:16, 18), 
                   NULL, 4, c(5:8))


bool_app <- FALSE
for (ii in 1:n_st) {
  
  if (!is.null(list_trans[ii])) 
    st[[ii]][, list_trans[[ii]]] <- lapply(list_trans[[ii]], function(jj) as.numeric(st[[ii]][,jj]))
  
  write.xlsx2(st[[ii]], file = file.path("../assets/Suppl_tables.xlsx"), 
             sheetName = vec_names[ii], 
             col.names = TRUE, 
             row.names = FALSE, 
             append = bool_app, 
             characterNA="")
  bool_app <- TRUE
  
}
