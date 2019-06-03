require(shiny)

server <- function(input, output) {
  
  load("../assets/ST.RData")
  
  # doesn't work don't know why.
  # for(i in 1:n_st) {
  #   table_name <- paste0("mytable", i)
  #   input_name <- paste0("show_vars", i)
  #   output[[table_name]] <- DT::renderDataTable({
  #     DT::datatable(st[[i]][, input[[input_name]], drop = FALSE])
  #   })
  # }
  
  output$mytable1 <- DT::renderDataTable({
    DT::datatable(st[[1]][, input$show_vars1, drop = FALSE])
  })
  output$mytable2 <- DT::renderDataTable({
    DT::datatable(st[[2]][, input$show_vars2, drop = FALSE])
  })
  output$mytable3 <- DT::renderDataTable({
    DT::datatable(st[[3]][, input$show_vars3, drop = FALSE])
  })
  output$mytable4 <- DT::renderDataTable({
    DT::datatable(st[[4]][, input$show_vars4, drop = FALSE])
  })
  output$mytable5 <- DT::renderDataTable({
    DT::datatable(st[[5]][, input$show_vars5, drop = FALSE])
  })
  output$mytable6 <- DT::renderDataTable({
    DT::datatable(st[[6]][, input$show_vars6, drop = FALSE])
  })
  output$mytable7 <- DT::renderDataTable({
    DT::datatable(st[[7]][, input$show_vars7, drop = FALSE])
  })
  output$mytable8 <- DT::renderDataTable({
    DT::datatable(st[[8]][, input$show_vars8, drop = FALSE])
  })
}
