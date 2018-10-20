require(shiny)
require(shinythemes)

percent_display <- 90
load("../assets/ST.RData")

ui <- fluidPage(theme = shinytheme("paper"),
                title = "Supplementary Tables",
                sidebarLayout(
                  do.call(sidebarPanel, c(lapply(1:n_st, function(i) 
                    conditionalPanel(
                      paste0("input.dataset == ", i),
                      div(checkboxGroupInput(paste0("show_vars", i),  
                                             HTML(paste(vec_names[i],
                                                        vec_desc[i], 
                                                        "Column types:", sep = "<br/><br/>")),
                                             names(st[[i]]), selected = names(st[[i]])), 
                          tyle = paste0("font-size:", percent_display,"%"))
                    )
                  ),  width = 3)
                  ),
                  mainPanel(
                    do.call(tabsetPanel, c(
                      id = 'dataset',
                      lapply(1:n_st, function(i) 
                        tabPanel(names(st)[i],
                                 value = i,
                                 div(DT::dataTableOutput(paste0("mytable", i)), 
                                     style = paste0("font-size:", percent_display, "%")))
                      )))
                  )
                )
)
