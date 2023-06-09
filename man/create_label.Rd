% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/all_new_functions.R
\name{create_label}
\alias{create_label}
\title{Create custom machine and human-readable rectangular plot labels}
\usage{
create_label(
  wdt = 2,
  hgt = 1,
  page_wdt = 8.5,
  page_hgt = 11,
  top_mar = 0.625,
  bot_mar = 0.625,
  left_mar = 0.625,
  right_mar = 0.625,
  numrow = 8L,
  numcol = 3L,
  filename = "PlotLabel",
  font_sz = 8,
  Treetag = FALSE,
  family = "sans",
  rounded = TRUE,
  top_left_1 = NULL,
  top_left_2 = NULL,
  top_right_1 = NULL,
  top_right_2 = NULL,
  center_right_1 = NULL,
  center_right_2 = NULL,
  center_right_3 = NULL,
  bottom_left_1 = NULL,
  bottom_left_2 = NULL,
  unique_id = NULL,
  ec_level = 3,
  ...
)
}
\arguments{
\item{wdt}{is the label width in inches.}

\item{hgt}{is the label height in inches.}

\item{page_wdt}{is the page width in inches.}

\item{page_hgt}{is the page height in inches.}

\item{top_mar}{is the page top margin in inches.}

\item{bot_mar}{is the page bottom margin in inches.}

\item{left_mar}{is the page left margin in inches.}

\item{right_mar}{is the page right margin in inches.}

\item{numrow}{is the number of label rows per page. It should be an integer.}

\item{numcol}{is the number of label columns per page. It should be an integer.}

\item{filename}{is a prefix for the pdf file to be created.}

\item{font_sz}{is the font size to use.}

\item{Treetag}{Set to TRUE if creating a treetag label.}

\item{family}{is the font style to use to print labels.}

\item{rounded}{Set to TRUE if label has round corners; set to false if label has
square corners.}

\item{top_left_1}{String for top-left row 1 position on a rectangular label.}

\item{top_left_2}{String for top-left row 2 position on a rectangular label.}

\item{top_right_1}{String for top-right row 1 position on a rectangular label.}

\item{top_right_2}{String for top-right row 2 position on a rectangular label.}

\item{center_right_1}{String for center-right row 1 position on a rectangular label.}

\item{center_right_2}{String for center-right row 2 position on a rectangular label.}

\item{center_right_3}{String for center-right row 3 position on a rectangular label.}

\item{bottom_left_1}{String for bottom-left row 1 position on a rectangular label.}

\item{bottom_left_2}{String for bottom-left row 2 position on a rectangular label.}

\item{unique_id}{is a vector containing unique identifiers or strings to generate QR codes.}

\item{ec_level}{error correction level (`0` - `3`, lowest to highest)}

\item{...}{additional optional arguments to be supplied.}
}
\value{
a PDF file containing experimental plot labels affixed with QR codes, and
 saved to the default or set working directory.
}
\description{
This function creates print-ready customized plot labels affixed with QR codes given the page setup,
 label dimensions, the number of rows and columns of labels to print per page.
}
\examples{

\dontrun{
# Create rectangular plot labels based on the Avery 94220 template-- the default template
library(qrlabelr)
 
create_label( 
font_sz = 10,
top_left_1 = paste("Plot:", 101:110), 
top_left_2 = paste("Row:", c(rep(1, 6), rep(2, 4))), 
top_right_1 = paste("Rep:", rep(1, 10)), 
top_right_2 = paste("Col:", c(1:6, 1:4)), 
center_right_1 = paste("iBLOCK:", c(rep(1, 6), rep(2, 4))), 
center_right_2 = paste("Seed:", rep("OFF_NUR", 10)), 
center_right_3 = rep("AWk", 10), 
bottom_left_1 = paste("Loc:", rep("BAMBEY", 10)), 
bottom_left_2 = paste0("G-", 1:10),
unique_id = paste("KUMASI2023_PYT", c(101:110), 
                  c(rep(1, 6), rep(2, 4)), c(1:6, 1:4),
                  sep = "_"), 
ec_level = 3)
}

 
\dontrun{
Create treetag plot labels
library(qrlabelr)
create_label(
wdt = 1, 
hgt = 6, 
page_wdt = 4, 
page_hgt = 6, 
top_mar = 0, 
bot_mar = 0, 
left_mar = 0, 
right_mar = 0, 
numrow = 1L, 
numcol = 4L, 
filename = 'PlotLabel', 
font_sz = 10,
Treetag = TRUE,
family = 'sans', 
rounded = FALSE, 
top_left_1 = paste("Plot:", 101:110), 
top_left_2 = paste("Row:", c(rep(1, 6), rep(2, 4))), 
top_right_1 = paste("Rep:", rep(1, 10)), 
top_right_2 = paste("Col:", c(1:6, 1:4)), 
center_right_1 = paste("iBLOCK:", c(rep(1, 6), rep(2, 4))), 
center_right_2 = paste("Seed:", rep("OFF_NUR", 10)), 
center_right_3 = rep("AWK", 10), 
bottom_left_1 = paste("Loc:", rep("BAMBEY", 10)), 
bottom_left_2 = paste0("G-", 1:10),
unique_id = paste("KUMASI2023_PYT", c(101:110), 
                  c(rep(1, 6), rep(2, 4)), c(1:6, 1:4),
                  sep = "_"),
ec_level = 3)
 }

}
\seealso{
\code{\link{field_label}} and \code{\link{gp_label}}
}
