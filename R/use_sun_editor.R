
#' Use Sun Editor
#'
#' This function imports the necessary JS and CSS files for the Sun Editor.
#' It uses the singleton function to ensure that the files are only imported once.
#' The function does not take any parameters and does not return any value.
#' @export

use_sun_editor <- function() {
    # Import JS and CSS files
    singleton(tags$head(
        tags$link(
            href = "https://cdn.jsdelivr.net/npm/suneditor@latest/dist/css/suneditor.min.css",
            rel = "stylesheet"
        ),
        tags$script(
            src = "https://cdn.jsdelivr.net/npm/suneditor@latest/dist/suneditor.min.js"
        )
    ))
}