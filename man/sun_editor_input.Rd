% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sun_editor_input.R
\name{sun_editor_input}
\alias{sun_editor_input}
\title{sun_editor_input}
\usage{
sun_editor_input(
  input_id,
  label,
  value = "",
  width = NULL,
  height = NULL,
  cols = NULL,
  rows = NULL,
  placeholder = NULL,
  resize = NULL,
  toolbar = c("default", "minimal", "custom"),
  options = NULL
)
}
\arguments{
\item{input_id}{The \code{input} slot that will be used to access the value.}

\item{label}{Display label for the control, or \code{NULL} for no label.}

\item{value}{Initial value.}

\item{width}{The width of the input, e.g. \code{'400px'}, or \code{'100\%'}; see \code{validateCssUnit()}.}

\item{height}{The height of the input, e.g. \code{'400px'}, or \code{'100\%'}; see \code{validateCssUnit()}.}

\item{cols}{Value of the visible character columns of the input, e.g. \code{80}.
This argument will only take effect if there is not a CSS \code{width} rule
defined for this element; such a rule could come from the \code{width}
argument of this function or from a containing page layout such as
\code{fluidPage()}.}

\item{rows}{The value of the visible character rows of the input, e.g.
\code{6}. If the \code{height} argument is specified, this argument will be
take precedence in the browser's rendering.}

\item{placeholder}{A character string giving the user a hint as to what can
be entered into the control. Internet Explorer 8 and 9 do not support
this option.}

\item{resize}{Which directions the textarea box can be resized. Can be one
of \code{"both"}, \code{"none"}, \code{"vertical"}, and \code{"horizontal"}. The default,
\code{NULL}, will use the client browser's default setting for resizing
textareas.}

\item{toolbar}{Toolbar mode, one of \code{"default"}, \code{"minimal"}, or \code{"custom"}. The default,
NULL, will use the default buttons.}

\item{options}{List of options to be passed to \code{data-options}, e.g. 'buttonList',
see details. Only used if \verb{toolbar`` is set to }"custom"`.}
}
\value{
A textarea input control with sun editor that can be added to a UI definition.
}
\description{
Create a textarea input with sun editor
}
\details{
The option \code{toolbar = "minimal"} reduces the number of formatting buttons:
\code{undo}, \code{redo}, \code{list}, \code{formatBlock} (\code{Paragraph}, \code{h1}, \code{h2}, \code{h3}),
\code{bold}, \code{underline}, \code{italic}, \code{removeFormat}.

Custom options can be added e.g. to change the layout, add or remove buttons.

\if{html}{\out{<div class="sourceCode">}}\preformatted{options = list(
    buttonList = list(
        list("undo", "redo"),
        list("list"),
        list("formatBlock"),
        list("bold", "underline", "italic"),
        list("removeFormat")
    ),
    formats = list(
        "p", "h1", "h2", "h3"
    )
)
}\if{html}{\out{</div>}}

See more details at \url{https://www.jsdelivr.com/package/npm/suneditor}.
}
\examples{

if (interactive()) {
library(shiny)

ui <- fluidPage(
    sun_editor_input("editor", "Editor", "Type here", width = "800px"),
    textOutput("text")
)
server <- function(input, output) {
    output$text <- renderText({ input$editor })
}
shinyApp(ui, server)

}
}
