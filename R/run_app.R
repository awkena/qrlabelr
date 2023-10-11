#' Launch 'EasyQrlabelr'.
#'
#' @description An interface function to launch the 'EasyQrlabelr' 'shiny' app.
#' @returns No return value, called for side effects. Opens the 'EasyQrlabelr' 'shiny' app in your default browser.
#'
#' @examples
#' library(qrlabelr)
#' if(interactive())
#' qrlabelr::run_app()
#' 
#' @concept "plot labels"
#'
#' @export
#' @importFrom shinyBS bsPopover
#' @importFrom shinyBS popify
run_app <- function() {
  # Find and launch the app
  appDir <- system.file("shinyapps", paste0("qrlabelr"), package = "qrlabelr")
  shiny::runApp(appDir, launch.browser = TRUE)
}
