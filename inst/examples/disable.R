
ui <- function() {
    tagList(
        SunEditoR::sun_editor_input(
            input_id = "text",
            label = NULL,
            width = "100%",
            rows = 5
        ),
        actionButton(
            inputId = "disable",
            label = "Disable"
        )
    )
}

server <- function(input, output) {
    observeEvent(input$disable, {
        SunEditoR::update_sun_editor_input(
            input_id = "text",
            disable = TRUE
        )
    })
}

shiny::shinyApp(ui, server)
