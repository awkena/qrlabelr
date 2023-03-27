#' Launch EasyPlotLabelR.
#'
#' @description An interface function to launch the EasyPlotLabelR Shiny app.
#'
#' @concept "plot labels"
#'
#' @export
run_app <- function() {
  # Find and launch the app
  appDir <- system.file("shinyapps", paste0("qrlabelr"), package = "qrlabelr")
  shiny::runApp(appDir, launch.browser = TRUE)
}
