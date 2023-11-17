
library(shiny)
devtools::load_all()
ui <- fluidPage(
    fluidRow(
        column(
            width = 6,
            sun_editor_input(
                input_id = "editor_with_value", 
                label = "Editor with default value",
                value = "This is the default value",
                width = "100%",
                height = "400px"
            )
        ),
        column(
            width = 6,
            sun_editor_input(
                input_id = "editor_with_placeholder", 
                label = "Editor with placeholder", 
                placeholder = "This is the placeholder",
                width = "100%",
                height = "400px"
            )
        )
    ),
    textAreaInput(
        inputId = "test",
        label = "Test of normal textarea"
    ),
    actionButton(
        "update_value",
        "Update value of SunEditor"
    ),
    textOutput("text")
)
server <- function(input, output, session) {
    output$text <- renderText({ input$editor })
    observeEvent(input$update_value, {
        update_sun_editor_input(
            session = session,
            input_id = "editor",
            label = "Updated Editor",
        )
    })
}
shinyApp(ui, server)
