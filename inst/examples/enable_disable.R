
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
        ),
        actionButton(
            inputId = "enable",
            label = "Enable"
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
    observeEvent(input$enable, {
        SunEditoR::update_sun_editor_input(
            input_id = "text",
            enable = TRUE
        )
    })
}

shiny::shinyApp(ui, server)
