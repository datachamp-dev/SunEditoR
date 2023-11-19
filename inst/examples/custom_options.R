
ui <- function() {
    SunEditoR::sun_editor_input(
        input_id = "text",
        label = NULL,
        width = "100%",
        rows = 5,
        toolbar = "custom",
        options = list(
            buttonList = list(
                list("bold", "underline", "italic")
            )
        )
    )
}

server <- function(input, output) {}

shiny::shinyApp(ui, server)
