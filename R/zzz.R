
# Register the resource path so that resources can be loaded by `tags$script()`

.onLoad <- function(libname, pkgname) {
    shiny::addResourcePath("suneditorjs", system.file("js", package = "SunEditoR"))
}
