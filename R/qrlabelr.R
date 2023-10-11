#' @title Generate Machine- And Human-Readable Plot Labels for Experiments.
#'
#' @import argonDash
#' @import argonR
#' @import bslib
#' @import reactable
#' @import readxl
#' @import shinyBS
#' @import shinyWidgets
#' @import tools
#' @import ggplot2
#' @importFrom purrr map
#' @importFrom dplyr mutate
#' @importFrom assertthat assert_that is.number is.count is.string
#' @importFrom shinycssloaders withSpinner
#' @importFrom shinyjs disabled hidden runjs enable disable addClass removeClass hide
#' @importFrom shinyjs show hideElement useShinyjs
#' @importFrom utils setTxtProgressBar txtProgressBar write.csv
#' @importFrom uuid UUIDgenerate
#' @importFrom desplot geom_tileborder

#'
#'
#' @docType package
#'
#' @name qrlabelr
#'
#' @description
#' A no-frills open-source solution for designing experimental or trial plot labels
#' affixed with QR codes. 'qrlabelr' is an R package that features 'EasyQrlabelr',
#' a Shiny app that simplifies the complicated process of plot label design for non-R users.
#' It also offers easily 'customizable' functions that enable plot label generation outside the Shiny app.
#' It generates field plot labels that are compatible with the widely used
#' digital data collection mobile app, Field Book. Our software builds on the foundation
#' of an existing open-source program to offer more flexibility in plot label creation steps;
#' guarantees true string fidelity after QR encoding; and provides faster label generation to users..
#'
#' @section Available vignettes:
#' This package comes with one vignette to get users up to speed as soon as possible. It
#' provides a more thorough guide on how to use qrlabelr, from the data import
#' stage to the generation of labels and saving it for printing. To access the vignette,
#' run the command:
#' \code{browseVignettes("qrlabelr")}
#'
#' @author Alexander Kena | Ebenezer Ogoe
NULL
