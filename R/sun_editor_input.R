
#' sun_editor_input
#' 
#' Create a textarea input with sun editor
#' 
#' @param input_id The `input` slot that will be used to access the value.
#' @param label Display label for the control, or `NULL` for no label.
#' @param value Initial value.
#' @param width The width of the input, e.g. `'400px'`, or `'100%'`; see `validateCssUnit()`.
#' @param height The height of the input, e.g. `'400px'`, or `'100%'`; see `validateCssUnit()`.
#' @param cols Value of the visible character columns of the input, e.g. `80`.
#'     This argument will only take effect if there is not a CSS `width` rule
#'     defined for this element; such a rule could come from the `width`
#'     argument of this function or from a containing page layout such as
#'     `fluidPage()`.
#' @param rows The value of the visible character rows of the input, e.g.
#'     `6`. If the `height` argument is specified, this argument will be
#'     take precedence in the browser's rendering.
#' @param placeholder A character string giving the user a hint as to what can
#'     be entered into the control. Internet Explorer 8 and 9 do not support
#'     this option.
#' @param resize Which directions the textarea box can be resized. Can be one
#'     of `"both"`, `"none"`, `"vertical"`, and `"horizontal"`. The default,
#'     `NULL`, will use the client browser's default setting for resizing
#'     textareas.
#' 
#' @return A textarea input control with sun editor that can be added to a UI definition. 
#' 
#' @importFrom htmltools singleton tagList tags
#' 
#' @export
#' 
#' @examples
#' 
#' if (interactive()) {
#' 
#' ui <- fluidPage(
#'     sun_editor_input("editor", "Editor", "Type here", width = "800px"),
#'     textOutput("text")
#' )
#' server <- function(input, output) {
#'     output$text <- renderText({ input$editor })
#' }
#' shinyApp(ui, server)
#' 
#' }

sun_editor_input <- function(
    input_id, 
    label, 
    value = "",
    width = NULL,
    height = NULL,
    cols = NULL,
    rows = NULL,
    placeholder = NULL,
    resize = NULL
) {

    tagList(

        # Import JS and CSS files
        singleton(tags$head(
            tags$link(
                href = "https://cdn.jsdelivr.net/npm/suneditor@latest/dist/css/suneditor.min.css",
                rel = "stylesheet"
            ),
            tags$script(
                src = "https://cdn.jsdelivr.net/npm/suneditor@latest/dist/suneditor.min.js"
            ),
            tags$script(
                src = "suneditorjs/sun_editor_input_binding.js"
            )
        )),

        # Create the textarea
        tags$div(
            class = "form-group shiny-input-container sun-editor-editable",
            id = input_id,
            style = "width: 100%",
            shiny::textAreaInput(
                inputId = input_id,
                label = label,
                value = value,
                width = width,
                height = height,
                cols = cols,
                rows = rows,
                placeholder = placeholder,
                resize = resize
            )
        )


    )

}