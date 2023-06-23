source(file = 'grlib.R', encoding = 'UTF-8')

p1 <- c(10, 20)
p2 <- c(10, 70)
p3 <- c(40, 20)
p4 <- c(40, 70)

library(shiny)

{
  ui <- fluidPage(
    titlePanel(title = 'Буква И'),
    
    br(),
    
    tabsetPanel(
      id = 'tabs',
      
      tabPanel(
        title = 'Область графика',
        value = 'tab1',
        
        br(),
        
        fluidRow(
          column(width = 6,
                 sliderInput(
                   inputId = 'xlim',
                   label = 'Область x',
                   min = -500,
                   max = 1000,
                   value = c(0, 50),
                   step = 10,
                   width = '100%'
                 )),
          
          column(width = 6,
                 sliderInput(
                   inputId = 'ylim',
                   label = 'Область y',
                   min = -500,
                   max = 1000,
                   value = c(-50, 150),
                   step = 50,
                   width = '100%'
                 ))
        )
      ),
      
      tabPanel(
        title = 'Изменение параметров фигуры',
        value = 'tab2',
        
        br(),
        
        fluidRow(
          column(width = 4,
                 sliderInput(
                   inputId = 'dUp',
                   label = 'Растягивание вверх',
                   value = 0,
                   min = -500,
                   max = 500,
                   step = 10,
                   width = '100%'
                 ))
        )
      ),
      
      tabPanel(
        title = 'Перемещение фигуры',
        value = 'tab3',
        
        br(),
        
        fluidRow(
          column(width = 6,
                 sliderInput(
                   inputId = 'moveUp',
                   label = 'Смещение вверх/вниз',
                   value = 0,
                   min = -500,
                   max = 500,
                   step = 10,
                   width = '100%'
                 )),
          
          column(width = 6,
                 sliderInput(
                   inputId = 'moveL',
                   label = 'Смещение влево/вправо',
                   value = 0,
                   min = -500,
                   max = 500,
                   step = 10,
                   width = '100%'
                 ))
        )
      ),
      
      tabPanel(
        title = 'Отражение фигуры',
        value = 'tab4',
        
        br(),
        
        fluidRow(
          column(width = 6,
                 checkboxInput(
                   input = 'mirDn',
                   label = 'Отражения буквы вниз',
                   value = F,
                   width = '100%'
                 )),
          
          column(width = 6,
                 checkboxInput(
                   input = 'mirR',
                   label = 'Отражения буквы вправо',
                   value = F,
                   width = '100%'
                 ))
        )
      ),
      
      tabPanel(
        title = 'Копирование по диагонали',
        value = 'tab5',
        
        br(),
        
        fluidRow(
          column(width = 6,
                 numericInput(
                   input = 'diag',
                   label = 'Копирование по диагонали',
                   value = 1,
                   min = 1,
                   max = 100,
                   step = 1,
                   width = '100%'
                 ))
        )
      ),
      
      tabPanel(
        title = 'Изменение размеров',
        value = 'tab6',
        
        br(),
        
        fluidRow(
          column(width = 6,
                 checkboxInput(
                   input = 'size',
                   label = 'Изменение размеров',
                   value = F,
                   width = '100%'
                 ))
        )
      )
    ),
    
    plotOutput(outputId = 'plot', heigh = '600px')
  )
  
  server <- function(input, output) {
    
    locPlot <- reactive({
      
      drawPic(
        p1 = p1,
        p2 = p2,
        p3 = p3,
        p4 = p4,
        xmin = input$xlim[1],
        xmax = input$xlim[2],
        ymin = input$ylim[1],
        ymax = input$ylim[2],
        dUp = input$dUp,
        moveUp = input$moveUp,
        moveL = input$moveL,
        mirDn = input$mirDn,
        mirR = input$mirR,
        diag = input$diag,
        size = input$size
      )
      
    })
    
    output$plot <- renderPlot(expr = {locPlot()}, res = 72)
    
  }
  
  shinyApp(ui = ui, server = server)
}
