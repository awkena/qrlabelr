#' Make QR codes
#'
#' A helper function for QR code generation using the 'qrencoder' library for faster QR code generation.
#' It converts the generated QR code into a raster grob image that can
#' be plotted using the `grid.draw()` function in the 'grid' package.
#'
#' @param my_id Unique ID string to be encoded to QR code.
#' @param ec_level The error correction level (`0` - `3`, lowest to highest).
#'
#' @returns A QR code as a raster grob image object that can be plotted with the `grid.draw()` 
#' function in the 'grid' package.
#'
#' @examplesIf rlang::is_installed(c("raster", "qrencoder", "assertthat", "grid"))
#' library(qrlabelr)
#' qr <- make_qrcode("KUMASI2023_PYT_101_1_1", ec_level = 1)
#' 
#' # Plot QR code using the grid package
#' grid::pushViewport(grid::viewport(x = grid::unit(0.5, "npc"),
#'                                   y = grid::unit(0.5, "npc"),
#'                                   width = grid::unit(1, "in"),
#'                                   height = grid::unit(1, "in")))
#' grid::grid.draw(qr)
#' # clean up any open graphical device
#' # grDevices::graphics.off()
#'
#' @export
make_qrcode <- function(my_id, ec_level = 3){

  assertthat::assert_that(!missing(my_id),
                          msg = "Please provide a unique ID.")
  assertthat::assert_that(ec_level >= 0 && ec_level <= 3, msg = "Please provide an error
                          correction level value in the range 0 - 3.")
  # Create qrcode and store as a rasterGrob image
  aa <- raster::raster(qrencoder::qrencode_raw(as.character(my_id), ec_level))
  qr <- grid::rasterGrob(raster::as.raster(aa, col = c('white','black')),
                         interpolate = FALSE)
  return(qr)
} # end of make_qrcode function



#' Create custom machine- and human-readable rectangular plot labels
#'
#' @description
#' Create print-ready customized plot labels affixed with QR codes given the page setup,
#'  label dimensions, the number of rows and columns of labels to print per page.
#'
#' @returns A PDF file containing experimental plot labels affixed with QR codes, saved to the default or working directory.
#'
#' @param wdt  The label width in inches.
#' @param hgt The label height in inches.
#' @param page_wdt The page width in inches.
#' @param page_hgt The page height in inches.
#' @param top_mar The page top margin in inches.
#' @param bot_mar The page bottom margin in inches.
#' @param left_mar The page left margin in inches.
#' @param right_mar The page right margin in inches.
#' @param numrow The number of label rows per page. It should be an integer.
#' @param numcol The number of label columns per page. It should be an integer.
#' @param filename A character prefix or path for the pdf file to be created. Default path
#' is working directory.
#' @param font_sz The font size to use.
#' @param Treetag Set to TRUE if creating a treetag label.
#' @param family The font style to use to print labels.
#' @param rounded Set to TRUE if label has round corners; set to false if label has
#' square corners.
#' @param top_left_1 String for top-left row 1 position on a rectangular label.
#' @param top_left_2 String for top-left row 2 position on a rectangular label.
#' @param top_right_1 String for top-right row 1 position on a rectangular label.
#' @param top_right_2 String for top-right row 2 position on a rectangular label.
#' @param center_right_1 String for center-right row 1 position on a rectangular label.
#' @param center_right_2 String for center-right row 2 position on a rectangular label.
#' @param center_right_3 String for center-right row 3 position on a rectangular label.
#' @param bottom_left_1 String for bottom-left row 1 position on a rectangular label.
#' @param bottom_left_2 String for bottom-left row 2 position on a rectangular label.
#' @param unique_id A vector containing unique identifiers or strings to generate QR codes.
#' @param ec_level The error correction level (`0` - `3`, lowest to highest) for QR codes.
#' @param ... Additional optional arguments to be supplied.
#' 
#' @seealso \code{\link{field_label}} and \code{\link{gp_label}}
#' 
#' @examples
#' library(qrlabelr)
#' file <- tempfile()
#' \donttest{
#' if(file.exists(file)) 
#' # Create rectangular plot labels based on the Avery 94220 template-- the default template
#' create_label(
#' font_sz = 10,
#' filename = file, 
#' top_left_1 = paste("Plot:", 101:105), 
#' top_left_2 = paste("Row:", c(rep(1, 3), rep(2, 2))), 
#' top_right_1 = paste("Rep:", rep(1, 5)), 
#' top_right_2 = paste("Col:", c(1:3, 1:2)), 
#' center_right_1 = paste("iBLOCK:", c(rep(1, 3), rep(2, 2))), 
#' center_right_2 = paste("Seed:", rep("OFF_NUR", 5)), 
#' center_right_3 = rep("AWk", 5), 
#' bottom_left_1 = paste("Loc:", rep("BAMBEY", 5)), 
#' bottom_left_2 = paste0("G-", 1:5),
#' unique_id = paste("KUMASI2023_PYT", c(101:105), 
#'                   c(rep(1, 3), rep(2, 2)), c(1:3, 1:2),
#'                   sep = "_"), 
#' ec_level = 1)
#' }
#' 
#' 
#' 
#' @export
create_label <- function(
    wdt = 2, # label width
    hgt = 1, # Label height
    page_wdt = 8.5, # page width
    page_hgt = 11, # page height
    top_mar = 0.625, # top margin
    bot_mar = 0.625, # bottom margin
    left_mar = 0.625, # left margin
    right_mar = 0.625, # right margin
    numrow = 8L, # number of label rows per page
    numcol = 3L, # number of label columns per page
    filename = 'PlotLabel', # name for pdf file to be created
    font_sz = 8,
    Treetag = FALSE,
    family = 'sans', # Font style to use
    rounded = TRUE, # Rounded corners
    top_left_1 = NULL, # Text for top-left row 1
    top_left_2 = NULL, # Text for top-left row 2
    top_right_1 = NULL, # Text for top-right row 1
    top_right_2 = NULL, # Text for top-right row 2
    center_right_1 = NULL, # Text for center-right row 1
    center_right_2 = NULL, # Text for center-right row 2
    center_right_3 = NULL, # Text for center-right row 3
    bottom_left_1 = NULL, # Text for bottom-left row 1
    bottom_left_2 = NULL, # Text for bottom-left row 2
    unique_id = NULL, # Unique ids for QR codes
    ec_level = 3,
    ...){

  error_numeric <- "must be a positive numeric value."
  error_flag <- "must be a logical or boolean value."
  error_string <- "must be string value."

  # Function to check for positive values -- may have to be relocated
  is.valid_number <- function (x) {
    if (x >= 0 && assertthat::is.number(x)) return (TRUE) else return (FALSE)
  }

  # Used in assertions to check if number is an integer and positive
  is.valid_count <- function (x) {
    if (x > 0 && assertthat::is.count(x)) return (TRUE) else return (FALSE)
  }

  ## Assertions start --

  # Checking all numeric inputs
  assertthat::assert_that(is.valid_number(wdt),
                          msg = paste("'wdt'", error_numeric))
  assertthat::assert_that(is.valid_number(hgt),
                          msg = paste("'hgt'",  error_numeric))
  assertthat::assert_that(is.valid_number(page_wdt),
                          msg = paste("'page_wdt'", error_numeric))
  assertthat::assert_that(is.valid_number(page_hgt),
                          msg = paste("'page_hgt'", error_numeric))
  assertthat::assert_that(is.valid_number(top_mar),
                          msg = paste("'top_mar'", error_numeric))
  assertthat::assert_that(is.valid_number(bot_mar),
                          msg = paste("'bot_mar'", error_numeric))
  assertthat::assert_that(is.valid_number(left_mar),
                          msg = paste("'left_mar'", error_numeric))
  assertthat::assert_that(is.valid_number(right_mar),
                          msg = paste("'right_mar'", error_numeric))
  assertthat::assert_that(is.valid_count(numrow),
                          msg = paste("'numrow'", "must be a positive integer."))
  assertthat::assert_that(is.valid_count(numcol),
                          msg = paste("'numcol'", "must be a positive integer."))
  assertthat::assert_that(is.valid_number(font_sz),
                          msg = paste("'font_sz'", error_numeric))

  # Checking all flag inputs

  assertthat::assert_that(assertthat::is.flag(Treetag),
                          msg = paste("'Treetag'", error_flag))

  assertthat::assert_that(assertthat::is.flag(rounded),
                          msg = paste("'rounded'", error_flag))


  # Checking all string inputs

  assertthat::assert_that(assertthat::is.string(filename),
                          msg = paste("'filename'", error_string))

  assertthat::assert_that(assertthat::is.string(family),
                          msg = paste("'family'", error_string))

  # assertthat::assert_that(assertthat::is.string(top_left_1),
  #                         msg = paste("'top_left_1'", error_string))
  #
  # assertthat::assert_that(assertthat::is.string(top_left_2),
  #                         msg = paste("'top_left_2'", error_string))
  #
  # assertthat::assert_that(assertthat::is.string(top_right_1),
  #                         msg = paste("'top_right_1'", error_string))
  #
  # assertthat::assert_that(assertthat::is.string(top_right_2),
  #                         msg = paste("'top_right_2'", error_string))
  #
  # assertthat::assert_that(assertthat::is.string(center_right_1),
  #                         msg = paste("'center_right_1'", error_string))
  #
  # assertthat::assert_that(assertthat::is.string(center_right_2),
  #                         msg = paste("'center_right_2'", error_string))
  #
  # assertthat::assert_that(assertthat::is.string(center_right_3),
  #                         msg = paste("'center_right_3'", error_string))
  #
  # assertthat::assert_that(assertthat::is.string(bottom_left_1),
  #                         msg = paste("'bottom_left_1'", error_string))
  #
  # assertthat::assert_that(assertthat::is.string(bottom_left_2),
  #                         msg = paste("'bottom_left_2'", error_string))

  ## -- Assertions end

  # Calculate space between label columns if any
  if (numcol == 1) {
    col_space <- 0
  } else {
    col_space <- (page_wdt - left_mar - right_mar - numcol*wdt)/(numcol-1)
  }

  # Calculate space between label rows if any
  if (numrow == 1) {
    row_space <- 0
  } else {
    row_space <- (page_hgt - top_mar - bot_mar - numrow*hgt)/(numrow-1)
  }

  # Check if page setup matches label setup per page.
  # Error message if either column spaces or the row spaces between labels 
  # are less than zero
  
  if (col_space < 0 | row_space < 0) {
    stop("Page setup does not match label setup per page.")
  }

  # clean up any open graphical devices if function fails
  on.exit(grDevices::graphics.off())


  # Create text for top-left row 1 -- plot id
  if (!is.null(top_left_1)) {
    plotid <- top_left_1
  } else {
    plotid <- NULL
  }

  # Create text for top-left row 2 -- row id
  if (!is.null(top_left_2)) {
    rowid <- top_left_2
  } else {
    rowid <- NULL
  }

  # Create text for top-right row 1 -- rep id
  if (!is.null(top_right_1)) {
    repid <- top_right_1
  } else {
    repid <- NULL
  }

  # Create text for top-right row 2 -- col id
  if (!is.null(top_right_2)) {
    colid <- top_right_2
  } else {
    colid <- NULL
  }


  # Create text for center-right row 1 -- iblock id
  if (!is.null(center_right_1)) {
    blkid <- center_right_1
  } else {
    blkid <- NULL
  }

  # Create text for center-right row 2 -- seed source id
  if (!is.null(center_right_2)) {
    sds <- center_right_2
  } else {
    sds <- NULL
  }

  # Create text for center-right row 3 -- researcher's name id
  if (!is.null(center_right_3)) {
    rname <- center_right_3
  } else {
    rname <- NULL
  }

  # Create text for bottom-left row 1 -- loc id
  if (!is.null(bottom_left_1)) {
    loc1 <- bottom_left_1
  } else {
    loc1 <- NULL
  }

  # Create text for bottom-left row 2 -- loc id
  if (!is.null(bottom_left_2)) {
    entry <- bottom_left_2
  } else {
    entry <- NULL
  }

  # Create QR codes from unique ids
  if (!is.null(unique_id)) {
    bb <- unique_id |> purrr::map(\(x) make_qrcode(ec_level = ec_level, x))
    nn <- length(bb) # total number of labels to generate
  } else {
    stop("Unique IDs for generating QR codes are missing!!")
  }


  # Generate label positions -- prints across rows of grid layout
  pos <- expand.grid(x = 1:numcol, y = 1:numrow)

  duplication <- ceiling(nn/nrow(pos))

  label_pos <- do.call("rbind", replicate(duplication, pos, simplify = FALSE))

  corx <- label_pos$x # label x coordinate

  cory <- label_pos$y # label y coordinate


  # Create pdf file to be saved in working directory

  filename <- paste0(filename, paste0(wdt,'in'), 'x',
                     paste0(hgt,'in'), Sys.time()) # name of pdf file

  filename <- paste0(gsub(":","_", filename), ".pdf")

  # Font size to print text on labels
  fsize <- font_sz

  # Define new coordinates for QR code
  wdt1 <- 0.5 * wdt
  hgt1 <- 0.5 * hgt

  qry <- hgt1/1.2

  # Create pdf file
  # The argument family specifies the initial/default font family to be
  # used. Device independent fonts that can be used include 'sans', 'serif' and
  # 'mono', default is sans.

  grDevices::pdf(filename,
                 width = page_wdt,
                 height = page_hgt,
                 onefile = TRUE,
                 family = family) # Letter size paper from Avery

  # Grid layout for labels
  label_layout <- grid::grid.layout(numrow, numcol,
                                    widths = grid::unit(c(rep(wdt + col_space, numcol-1), wdt), "in"),
                                    heights = grid::unit(c(rep(hgt + row_space, numrow-1), hgt), "in"))

  if (Treetag == TRUE) {
    # Viewport for first QR codes
    qq <- grid::viewport(x = grid::unit(0.57, "npc"),
                         y = grid::unit(0.3, "npc"),
                         angle = 90,
                         width = grid::unit(wdt1, "in"),
                         height = grid::unit(qry, "in"),
                         just = c('right','center'))

    # Viewport for IBlock
    bl <- grid::viewport(x = grid::unit(0.1, "npc"),
                         y = grid::unit(0.3, "npc"),
                         angle = 90,
                         width = grid::unit(0.55*wdt, "in"),
                         height = grid::unit(0.8*hgt1, "in"),
                         just = "left")

    # Viewport for second QR code
    qq2 <- grid::viewport(x = grid::unit(0.5, "npc"),
                          y = grid::unit(0.9, "npc"),
                          width = grid::unit(wdt1, "inches"),
                          height = grid::unit(qry, "inches"),
                          just = c('center'))

    px <- 0.11*wdt # x coordinate for plot

    py <- 0.05*hgt # y coordinate for plot

    rx <- 0.27*wdt # x coordinate for row

    ry <- 0.4*hgt # y coordinate for Rep

    lx <- 0.9*wdt # x coordinate for location

    ly <- 0.4*hgt # y coordinate for location

    ex <- 0.9*wdt # x coordinate for first entry

    ee <- 0.85*wdt # x coordinate for second entry

    ey <- 0.83*hgt # y coordinate for second entry

    nx <- 0.6*wdt # x coordinate for researcher's name


  } else {

    # Create a viewport for each label
    aa <- grid::viewport(x = grid::unit(0, "npc"),
                         y = grid::unit(1, "npc"),
                         width = grid::unit(wdt, "in"),
                         height = grid::unit(hgt, "in"),
                         just = c('left','top'))

    # Define viewport for QR code; note coordinates and dimension

    qq <- grid::viewport(x = grid::unit(0.5, "npc"),
                         width = grid::unit(wdt1, "in"),
                         height = grid::unit(qry, "in"),
                         just = c('right','center'))

    # Define viewport for Block ID if it is an incomplete block design

    bl <- grid::viewport(x = grid::unit(0.47, "npc"),
                         width = grid::unit(0.55*wdt, "in"),
                         height = grid::unit(0.8*hgt1, "in"),
                         just = "left")

    # Coordinates for adding text labels to grids
    px <- 0.1*wdt # x coordinate for plot

    py <- 0.92*hgt # y coordinate for plot

    rx <- 0.6*wdt # x coordinate for rep

    ry <- 0.78*hgt # y coordinate for row

    ly <- 0.22*hgt # y coordinate for location

    ex <- 0.05*wdt # x coordinate for entry

    ey <- 0.1*hgt # y coordinate for entry

  }

  # Viewport for a new page
  new.page <- grid::viewport(width = grid::unit(page_wdt, "in"),
                             height = grid::unit(page_hgt, "in"))

  # Create a viewport for each page using grid layout
  lab_vp <- grid::viewport(layout = label_layout)
  grid::pushViewport(lab_vp)

  bold_font <- grid::gpar(fontface = "bold", fontsize = fsize)
  bold_font2 <- grid::gpar(fontface = "bold", fontsize = fsize-2)
  plain_font2 <- grid::gpar(fontface = "plain", fontsize = fsize-2)
  plain_font3 <- grid::gpar(fontface = "plain", fontsize = fsize-4)
  bold_font3 <- grid::gpar(fontface = "bold", fontsize = fsize-4)
  plain_font4 <- grid::gpar(fontface = "plain", fontsize = floor(fsize/2.5))

  # Define progres bar parameters
  pro_bar <- txtProgressBar(min = 0, max = nn, style = 3, char = '=')

  for (i in seq_len(nn)) {

    # set progress bar to chromosome indexing
    setTxtProgressBar(pro_bar, value = i)

    label_posn <- c(x = corx[i], y = cory[i])


    if (all(i != 1 & label_posn == c(1, 1))) {
      grid::grid.newpage()

      grid::pushViewport(new.page)
      grid::pushViewport(lab_vp)

    }

    if (Treetag == TRUE) {
      tt <- grid::viewport(layout.pos.row=label_posn['y'],
                           layout.pos.col=label_posn['x'])

      grid::pushViewport(tt)

      if (rounded == TRUE) {
        grid::grid.roundrect(gp = grid::gpar(lwd = 0.5))
      } else (grid::grid.rect(gp = grid::gpar(lwd = 0.5)))

      # Add Plot ID to label; note coordinates
      grid::grid.text(label = plotid[i],
                      x = grid::unit(px, "in"),
                      y = grid::unit(py, "in"), rot = 90,
                      gp = bold_font, hjust = 0, vp = tt)

      # Add Rep ID to label; note coordinates
      grid::grid.text(label = repid[i],
                      x = grid::unit(px, "in"),
                      y = grid::unit(ry, "in"), rot = 90,
                      gp = bold_font, hjust = 0, vp = tt)

      # Add Row ID to label; note coordinates
      grid::grid.text(label = rowid[i],
                      x = grid::unit(rx, "in"),
                      y = grid::unit(py, "in"), rot = 90,
                      gp = bold_font2, hjust = 0, vp = tt)

      # Add column ID to label; note coordinates
      grid::grid.text(label = colid[i],
                      x = grid::unit(rx, "in"),
                      y = grid::unit(ry, "in"), rot = 90,
                      gp = bold_font2, hjust = 0, vp = tt)


      # Define viewport for QR code; note coordinates and dimension

      grid::pushViewport(qq)

      # Add first QR code
      grid::grid.draw(bb[[i]])
      grid::popViewport()

      # Define viewport for Block ID if it is an incomplete block design

      grid::pushViewport(bl)

      # Add Block ID to label; note coordinates
      grid::grid.text(label = blkid[i],
                      x = grid::unit(0.2, "npc"),
                      y = grid::unit(0.35, "npc"),
                      rot = 360, gp = plain_font2, hjust = 0)


      # Go back to label viewport
      grid::upViewport()

      # Add location of experiment to label
      grid::grid.text(label = loc1[i], rot = 90,
                      x = grid::unit(lx, "in"),
                      y = grid::unit(ly, "in"),
                      gp = plain_font4, hjust = 0, vp = tt)

      # Add seed source to label; note coordinates
      grid::grid.text(label = sds[i],
                      x = grid::unit(0.6, "npc"),
                      y = grid::unit(0.35, "npc"),
                      rot = 90, vp = tt,
                      gp = plain_font3, hjust = 0, )

      # Add researcher's name to label; note coordinates
      grid::grid.text(label = rname,
                      x = grid::unit(0.72, "npc"),
                      y = grid::unit(0.35, "npc"),
                      rot = 90, vp = tt,
                      gp = plain_font3, hjust = 0, )


      # Add entry or treatment name to label
      grid::grid.text(label = entry[i], rot = 90,
                      x = grid::unit(ex, "in"),
                      y = grid::unit(py, "in"),
                      gp = bold_font3, hjust = 0, vp = tt)

      # Add entry or treatment name to label tear-off
      grid::grid.text(label = entry[i], rot = 90,
                      x = grid::unit(ee, "in"),
                      y = grid::unit(ey, "in"),
                      gp = plain_font4, hjust = 0, vp = tt)

      grid::pushViewport(qq2)

      # Add second QR code
      grid::grid.draw(bb[[i]])

      grid::popViewport(2)

    } else {

      grid::pushViewport(grid::viewport(layout.pos.row=label_posn['y'],
                                        layout.pos.col=label_posn['x']))
      grid::pushViewport(aa)

      if (rounded == TRUE) {
        grid::grid.roundrect(gp = grid::gpar(lwd = 0.5))
      } else (grid::grid.rect(gp = grid::gpar(lwd = 0.5)))

      # Add Plot ID to label; note coordinates
      grid::grid.text(label = plotid[i],
                      x = grid::unit(px, "in"),
                      y = grid::unit(py, "in"),
                      gp = bold_font, hjust = 0, vp = aa)

      # Add Rep ID to label; note coordinates
      grid::grid.text(label = repid[i],
                      x = grid::unit(rx, "in"),
                      y = grid::unit(py, "in"),
                      gp = bold_font, hjust = 0, vp = aa)

      # Add Row ID to label; note coordinates
      grid::grid.text(label = rowid[i],
                      x = grid::unit(px, "in"),
                      y = grid::unit(ry, "in"),
                      gp = bold_font2, hjust = 0, vp = aa)

      # Add column ID to label; note coordinates
      grid::grid.text(label = colid[i],
                      x = grid::unit(rx, "in"),
                      y = grid::unit(ry, "in"),
                      gp = bold_font2, hjust = 0, vp = aa)

      # Add seed source to label; note coordinates
      grid::grid.text(label = sds[i],
                      x = grid::unit(0.42, "npc"),
                      y = grid::unit(0.47, "npc"),
                      gp = plain_font3, hjust = 0, vp = aa)

      # Add researcher's name to label; note coordinates
      grid::grid.text(label = rname,
                      x = grid::unit(0.42, "npc"),
                      y = grid::unit(0.35, "npc"),
                      gp = plain_font3, hjust = 0, vp = aa)

      # Push viewport for qr code

      grid::pushViewport(qq)

      # Add QR code
      grid::grid.draw(bb[[i]])
      grid::popViewport()

      # Define viewport for Block ID if it is an incomplete block design

      grid::pushViewport(bl)

      # Add Block ID to label; note coordinates
      # Add Block ID to label; note coordinates

      grid::grid.text(label = blkid[i],
                      x = grid::unit(0.01, "npc"),
                      y = grid::unit(0.8, "npc"),
                      gp = plain_font3, hjust = 0)

      # Go back to label viewport
      grid::upViewport()

      # Add location of experiment to label
      grid::grid.text(label = loc1[i],
                      x= grid::unit(px, "in"),
                      y = grid::unit(ly, "in"),
                      gp = plain_font4, hjust = 0, vp = aa)

      # Add entry or treatment name to label
      grid::grid.text(label = entry[i],
                      x= grid::unit(ex, "in"),
                      y = grid::unit(ey, "in"),
                      gp = bold_font3, hjust = 0, vp = aa)

      grid::popViewport(2)
    }

  }

} # End of create_label ()


#' Create field plot labels embossed with QR codes
#' @description
#' Create machine- and human-readable plot labels that are well-suited for field experiments.
#'  
#' @returns A PDF file containing field plot labels affixed with QR codes, and a
#'  data frame of an updated field book; all saved to the default or working directory.
#'
#' @param dat  An input data frame of field book that contains plot attributes.
#' To design field plot labels, the imported field book must have LOCATION, PLOT,
#' ROW, COLUMN/RANGE, REP, TREATMENT columns. The order of the columns in the field book
#' is not important, and the columns can be any name the user desires.
#' @param get_unique_id Set to 'ruid' if reproducible and informative unique ids
#' are to be generated from imported field book. Set to 'uuid' if universal unique ids
#' are to be generated from imported field book. Set to 'custom' if imported field book
#' already has unique IDs for each plot.
#' @param unique_id The column identifier for UNIQUE_ID in the imported field book.
#' @param filename A character prefix or path for the pdf file to be created. Default path
#' is working directory.
#' @param Year The year of experiment or trial.
#' @param rname The researcher's name. Initials or initials of first and middle
#' names and the last name.
#' @param Trial The name of the trial to use.
#' @param seed_source Set to TRUE if seed source is included in the imported field book,
#' FALSE if otherwise.
#' @param IBlock Set to TRUE if \code{dat} contains incomplete blocks within replications.
#' @param rep_id The column identifier for REP in the imported field book.
#' @param plot_id The column identifier for PLOT in the imported field book.
#' @param row_id The column identifier for ROW in the imported field book.
#' @param col_id The column identifier for COLUMN in the imported field book.
#' @param loc_id The column identifier for LOCATION in the imported field book.
#' @param entry_id The column identifier for ENTRY/TREATMENT in the imported field book.
#' @param IBlock_id The column identifier for IBLOCK in the imported field book.
#' It must be provided if \code{IBlock} is set to TRUE.
#' @param seed_source_id The column identifier for SEED_SOURCE in the imported field book.
#' It must be provided if \code{seed_source} is set to TRUE.

#' @param ... Additional arguments passed to the \code{create_label()} function.
#' 
#' @details
#' The default column identifiers for LOCATION, PLOT, ROW, COLUMN/RANGE, REP, TREATMENT
#' are based on the column IDs of a field book generated using the 'FielDHub' package.
#' If user imports any field book generated with other programs,
#' the user must specify the equivalent column identifiers used for LOCATION, PLOT, REP,
#' ROW, COLUMN, and TREATMENT/ENTRY in the imported field book.
#' 
#' if \code{get_unique_id = 'ruid'} (i.e. Reproducible Unique IDs), the function concatenates
#' location, year, trial name, plot, row and column IDs. if \code{get_unique_id = 'uuid'} 
#' (i.e. Universal Unique IDs), the function generates UUIDs by time randomly. 
#' Note that UUIDs are uninformative and not reproducible.
#' 
#' If input field book already has unique IDs for each plot, the \code{get_unique_id} 
#' argument should be set to 'custom'; and the \code{unique_id}
#' argument must be specified as a string using the column name in the input field book
#' that denotes plot unique IDs.
#' 
#' if \code{Year} is NULL, the function uses the current year as defined in the `sys.time()`.
#'
#' If the user is printing labels for any incomplete block design, the imported
#' field book must include an IBLOCK column if the users wishes to display intra-blocking
#' information for experimental plots on the label.
#'
#' Set the \code{IBlock} argument to TRUE if the field layout has incomplete
#' blocks within replications. The imported  field book must include an IBLOCK column if
#' the \code{IBlock} argument is set to TRUE.
#'
#' @seealso \code{\link{create_label}} and \code{\link{gp_label}}
#' 
#' @examples
#' 
#' library(qrlabelr)
#' df <- data.frame(LOCATION = rep("BAMBEY", 5),
#'                 PLOT = 1001:1005,
#'                 ROW = c(rep(1, 3), rep(2, 2)),
#'                 COLUMN = c(1:3, 1:2),
#'                 REP = rep(1, 5),
#'                 IBLOCK = c(rep(1, 3), rep(2, 2)),
#'                 TREATMENT = paste0("G-", 1:5),
#'                 SEED_SOURCE = rep("OFF_NUR", 5))

#' df$ids <- paste0(df$LOCATION,'2023', '_PYT', '_', df$PLOT, '_', df$ROW, '_',
#'                  df$COLUMN)
#' file <- tempfile()
#' \donttest{
#' if(file.exists(file)) 
#' field_label(
#'   dat = df,
#'   wdt = 5, 
#'   hgt = 2,
#'   page_wdt = 8.5, 
#'   page_hgt = 11,
#'   top_mar = 0.75, 
#'   bot_mar = 0.75, 
#'   left_mar = 1.75, 
#'   right_mar = 1.75, 
#'   numrow = 4L, 
#'   numcol = 1L, 
#'   filename = file, 
#'   font_sz = 20, 
#'   Trial = "PYT", 
#'   Year = 2023, 
#'   family = "sans", 
#'   rounded = TRUE, 
#'   IBlock = TRUE,
#'   get_unique_id = "ruid", 
#'   rname = "AW Kena", 
#'   seed_source = TRUE, 
#'   seed_source_id = "SEED_SOURCE",
#'   ec_level = 1)
#'  }
#' 
#' @export
field_label <- function(dat,
                        get_unique_id = c("ruid", "uuid", "custom"), # Generate unique ids for QR codes
                        unique_id = NULL,
                        filename = "PlotLabel",
                        Year = NULL,
                        rname = NULL,
                        Trial = 'PYT',
                        seed_source = FALSE,
                        IBlock = FALSE, # Set to TRUE if it is an incomplete block design
                        rep_id = 'REP',# Input id for REP
                        plot_id = 'PLOT', # Input id for PLOT
                        row_id = 'ROW', # Input id for ROW
                        col_id = 'COLUMN', # Input for COLUMN
                        loc_id = 'LOCATION', # Input id for LOCATION
                        entry_id = 'TREATMENT', # Input id for TREATMENT
                        IBlock_id = 'IBLOCK', # Input id for IBLOCK
                        seed_source_id = NULL,
                        ...){

  error_numeric <- "must be a positive numeric value."
  error_flag <- "must be a logical or boolean value."
  error_string <- "must be string value."

  # Function to check for positive values -- may have to be relocated
  is.valid_number <- function (x) {
    if (x >= 0 && assertthat::is.number(x)) return (TRUE) else return (FALSE)
  }

  # Used in assertions to check if number is an integer and positive
  is.valid_count <- function (x) {
    if (x > 0 && assertthat::is.count(x)) return (TRUE) else return (FALSE)
  }

  # Assertion for dat argument
  assertthat::assert_that(!missing(dat),
                          msg = "Fieldbook is missing, please provide a fieldbook as a data frame.")
  
  # Checking all flag inputs
  assertthat::assert_that(assertthat::is.flag(seed_source),
                          msg = paste("'seed_source'", error_flag))

  assertthat::assert_that(assertthat::is.flag(IBlock),
                          msg = paste("'IBlock'", error_flag))

  # Checking all string inputs
  assertthat::assert_that(get_unique_id %in% c("ruid", "uuid", "custom"),
                          msg = paste("'get_unique_id' must be a string value",
                                      "of one of these: 'ruid','uuid' or 'custom'"))
  if (get_unique_id == "custom" & is.null(unique_id)) {
    stop(paste("Use the 'unique_id' argument to specify the column name in your fieldbook containing unique ids."))

  }

  if (seed_source == TRUE & is.null(seed_source_id)) {
    stop(paste("Use the 'seed_source_id' argument to specify the column name in your fieldbook containing seed source ids."))
  }


  # Checking all flag inputs

  assertthat::assert_that(assertthat::is.string(Trial),
                          msg = paste("'Trial'", error_string))
  assertthat::assert_that(assertthat::is.string(rep_id),
                          msg = paste("'rep_id'", error_string))
  assertthat::assert_that(assertthat::is.string(plot_id),
                          msg = paste("'plot_id'", error_string))
  assertthat::assert_that(assertthat::is.string(row_id),
                          msg = paste("'row_id'", error_string))
  assertthat::assert_that(assertthat::is.string(col_id),
                          msg = paste("'col_id'", error_string))
  assertthat::assert_that(assertthat::is.string(loc_id),
                          msg = paste("'loc_id'", error_string))
  assertthat::assert_that(assertthat::is.string(entry_id),
                          msg = paste("'entry_id'", error_string))
  assertthat::assert_that(assertthat::is.string(IBlock_id),
                          msg = paste("'IBlock_id'", error_string))

  # Assert inputs with NULL arguments as default if overwritten by the user
  if (!is.null(Year)) {
    assertthat::assert_that((assertthat::is.string(Year) || is.valid_number(Year)) && nchar(Year) == 4,
                            msg = "Year must be a string or numeric value of four characters.")
  }

  if (!is.null(seed_source_id)) {
    assertthat::assert_that(assertthat::is.string(seed_source_id),
                            msg = "Seed source ID must be a string value.")
  }

  if (!is.null(rname)) {
    assertthat::assert_that(assertthat::is.string(rname),
                            msg = "Researcher name must be a string value.")
  }

  # if (!is.null(unique_id)) {
  #   assertthat::assert_that(assertthat::is.string(unique_id),
  #                           msg = "'unique_id' must be a string value.")
  # }

  # Define year for experiment
  if (is.null(Year) == TRUE) {
    yr <- format(Sys.time(),'%Y')
  } else {
    yr <- as.character(Year)
  }

  plotid <- paste("Plot ID:", dat[, plot_id]) # Plot ids

  repid <- paste("Rep ID:", dat[, rep_id]) # Rep ids

  loc1 <- paste("Loc:", dat[, loc_id]) # Location ids

  rowid <- paste("Row ID:", dat[, row_id]) # Row ids

  colid <- paste("Col. ID:", dat[, col_id]) # Column ids

  entry <-  dat[, entry_id]

  rnames <- rep(rname, nrow(dat)) # Researcher's name

  # Block ids if it is an incomplete block design
  if (IBlock == TRUE) {
    iblock <- dat[, IBlock_id]
    blkid <- paste("IBlock ID:", iblock)
  } else {
    blkid <- rep('No IBlock', nrow(dat))
  }


  # Show seed source on label
  if (seed_source == TRUE) {

    sds <- paste("Seed:", dat[, seed_source_id])

  } else {
    sds <- NULL
  }

  # Create unique id: if 'ruid' (i.e. Reproducible Unique IDs), the function concatenates
  # loc, year, trial name, plot, row and column. if 'uuid' (i.e. Universal Unique IDs),
  # the function generates UUIDs by time randomly. Note that UUIDs are uninformative and not reproducible.
  # If 'custom', user must use the 'unique_id' argument to specify the column name
  # in field book that denotes custom generated unique IDs.

  if (get_unique_id == "ruid"){

    trial_name <- gsub(" ", "_", Trial)

    loc <- dat[, loc_id]
    plott <- dat[, plot_id]
    roww <- dat[, row_id]
    coll <- dat[, col_id]

    UNIQUE_ID <- paste(paste0(gsub(" ", "", loc), yr),
                       trial_name, plott, roww, coll, sep = "_" )

  } else if (get_unique_id == "uuid") {
    UNIQUE_ID <- uuid::UUIDgenerate(use.time = TRUE, n = nrow(dat), output = "string")

  } else if (get_unique_id == "custom") {
    UNIQUE_ID <- dat[, unique_id]
  }

  # Create an augmented field book containing unique IDs
  updat <- dplyr::mutate(dat, UNIQUE_ID)
  colnames(updat)[ncol(updat)] <- 'UNIQUE_ID'

  if (colnames(updat)[1] == 'ID') {
    colnames(updat)[1] <- 'SN'
  } else {
    colnames(updat)[1] <- colnames(updat)[1]
  }
  
  # File name and timestamp for updated fieldbook
  ts <- Sys.time() |> format(format = "%H_%M_%S") |> 
    paste0("Updated_Fieldbook_", ... = _, ".csv")
  
  utils::write.csv(updat, file = paste0(filename, ts), row.names = FALSE)

  # Send updated fieldbook from package environment to global environment
  #.GlobalEnv$updated_fieldbook <- list(updated_fieldbook = updat)

  do.call(create_label, args = list(top_left_1 = plotid,
                                    top_left_2 = rowid,
                                    top_right_1 = repid,
                                    top_right_2 = colid,
                                    center_right_1 = blkid,
                                    center_right_2 = sds,
                                    center_right_3 = rnames,
                                    bottom_left_1 = loc1,
                                    bottom_left_2 = entry,
                                    unique_id = UNIQUE_ID, 
                                    filename = filename, ...))

  #cat("\n\n\tGenerated labels and updated fieldbook saved to working directory.")
}


#' Create a general-purpose (gp) label with text aligned in a landscape orientation.
#' @description
#' This is a wrapper that gives more flexibility to the user to design 
#' any general-purpose label affixed with QR codes. It gives nine(9) text 
#' positions in landscape orientation that can be filled with human-readable text
#' items as specified by the user. Arguments are passed to the `create_label()` function.
#' 
#' @returns A PDF file containing plot labels affixed with QR codes, and a data frame of
#'  an updated field book; all saved to the default or working directory. 
#'  
#' @param dat An input data frame or field book that contains plot or label attributes.
#' The order of the columns is not important, and the columns can be any name 
#' the user desires.
#' @param get_unique_id Set to 'uuid' if universal unique ids are to be generated.
#' @param unique_id The column identifier in \code{dat} containing unique identifiers or strings to generate QR codes.
#'  Set to 'custom' if imported field book already has unique IDs for each plot.
#' @param filename A character prefix or path for the pdf file to be created. Default path
#' is working directory.
#' @param top_left_txt1 The prefix text for top-left row 1.
#' @param top_left_txt2 The prefix text for top-left row 2.
#' @param top_right_txt1 The prefix text for the top-right row 1.
#' @param top_right_txt2 The prefix text for the top-right row 2.
#' @param center_right_txt1 The prefix text for center-right row 1.
#' @param center_right_txt2 The prefix text for center-right row 2.
#' @param center_right_txt3 The prefix text for center-right row 3.
#' @param bottom_left_txt1 The column identifier in \code{dat} containing text for bottom-left row 1.
#' @param bottom_left_txt2 The column identifier in \code{dat} containing text for bottom-left row 2.
#' @param top_left_id1 The column identifier in \code{dat} containing text for top-left row 1.
#' @param top_left_id2 The column identifier in \code{dat} containing text for top-left row 2.
#' @param top_right_id1 The column identifier in \code{dat} containing text for top-right row 1.
#' @param top_right_id2 The column identifier in \code{dat} containing text for top-right row 2.
#' @param center_right_id1 The column identifier in \code{dat} containing text for center-right row 1.
#' @param center_right_id2 The column identifier in \code{dat} containing text for center-right row 2.
#' @param center_right_id3 The column identifier in \code{dat} containing text for center-right row 3.
#' @param bottom_left_id1 The column identifier in \code{dat} containing text for bottom-left row 1.
#' @param bottom_left_id2 The column identifier in \code{dat} containing text for bottom-left row 2.
#' @param ... Additional arguments passed to the \code{create_label} function.
#'
#'@seealso \code{\link{create_label}} and \code{\link{field_label}}
#'
#' @examples
#' library(qrlabelr)
#' df <- data.frame(LOCATION = rep("BAMBEY", 5),
#'                  PLOT = 1001:1005,
#'                  ROW = c(rep(1, 3), rep(2, 2)),
#'                  COLUMN = c(1:3, 1:2),
#'                  REP = rep(1, 5),
#'                  IBLOCK = c(rep(1, 3), rep(2, 2)),
#'                  TREATMENT = paste0("G-", 1:5),
#'                  SEED_SOURCE = rep("OFF_NUR", 5))
#' 
#' df$ids <- paste0(df$LOCATION,'2023', '_PYT', '_', df$PLOT, '_', df$ROW, '_',
#'                  df$COLUMN)
#' file <- tempfile()
#' \donttest{
#' if(file.exists(file)) 
#' gp_label(dat = df,
#'          wdt = 5,
#'          hgt = 2,
#'          page_wdt = 8.5,
#'          page_hgt = 11,
#'          top_mar = 0.75,
#'          bot_mar = 0.75,
#'          left_mar = 1.75,
#'          right_mar = 1.75,
#'          numrow = 4L,
#'          numcol = 1L,
#'          filename = file,
#'          font_sz = 20,
#'          rname = "Adoma",
#'          get_unique_id = "custom",
#'          unique_id = 'ids',
#'          family = "sans",
#'          top_left_txt1 = 'Plot:',
#'          top_left_txt2 = 'Row:',
#'          top_right_txt1 = 'Rep:',
#'          top_right_txt2 = 'Col:',
#'          center_right_txt1 = 'iBlock:',
#'          center_right_txt2 = 'Seed:',
#'          center_right_txt3 = 'Adoma',
#'          top_left_id1 = 'PLOT',
#'          top_left_id2 = 'ROW',
#'          top_right_id1 = 'REP',
#'          top_right_id2 = 'COLUMN',
#'          center_right_id1 = 'IBLOCK',
#'          center_right_id2 = 'SEED_SOURCE',
#'          bottom_left_id1 = 'ids',
#'          bottom_left_id2 = 'TREATMENT',
#'          ec_level = 1)
#' }
#' 
#' @export
gp_label <- function(dat,
                     get_unique_id = c("uuid", "custom"), # Generate unique ids for QR codes
                     unique_id = NULL,
                     filename = "PlotLabel",
                     top_left_txt1 = NULL, # Prefix text for top-left row 1
                     top_left_txt2 = NULL, # Prefix text for top-left row 2
                     top_right_txt1 = NULL, # prefix text for top-right row 1
                     top_right_txt2 = NULL, # Prefix text for top-right row 2
                     center_right_txt1 = NULL, # Prefix text for center-right row 1
                     center_right_txt2 = NULL, # prefix text for center-right row 2
                     center_right_txt3 = NULL, # prefix text for center-right row 3
                     bottom_left_txt1 = NULL, # Prefix text for bottom-left row 1
                     bottom_left_txt2 = NULL, # Prefix text for bottom-left row 2
                     top_left_id1 = NULL, # column id in dat containing text for top-left row 1
                     top_left_id2 = NULL, # column id in dat containing text for top-left row 2
                     top_right_id1 = NULL, # column id in dat containing text for top-right row 1
                     top_right_id2 = NULL, # column id in dat containing text for top-right row 2
                     center_right_id1 = NULL, # column id in dat containing text for center-right row 1
                     center_right_id2 = NULL, # column id in dat containing text for center-right row 2
                     center_right_id3 = NULL, # column id in dat containing text for center-right row 3
                     bottom_left_id1 = NULL, # column id in dat containing text for bottom-left row 1
                     bottom_left_id2 = NULL, # column id in dat containing text for bottom-left row 2
                     ...
){
  
  # Assertion for dat argument
  assertthat::assert_that(!missing(dat),
                          msg = "Fieldbook is missing, please provide a fieldbook as a data frame.")

  error_prompt <- "Invalid string entered for"

  # Text for top-left row 1
  if (!is.null(top_left_id1)) {
    assertthat::assert_that(assertthat::is.string(top_left_id1),
                            msg = paste(error_prompt, "'top_left_id1'"))
    topleft1 <- paste(top_left_txt1, dat[, top_left_id1])
  } else {
    topleft1 <- top_left_txt1
  }

  # Text for top-left row 2
  if (!is.null(top_left_id2)) {
    assertthat::assert_that(assertthat::is.string(top_left_id2),
                            msg = paste(error_prompt, "'top_left_id2'"))
    topleft2 <- paste(top_left_txt2, dat[, top_left_id2])
  } else {
    topleft2 <- top_left_txt2
  }

  # Text for top-right row 1
  if (!is.null(top_right_id1)) {
    assertthat::assert_that(assertthat::is.string(top_right_id1),
                            msg = paste(error_prompt, "'top_right_id1'"))
    topright1 <- paste(top_right_txt1, dat[, top_right_id1])
  } else {
    topright1 <- top_right_txt1
  }

  # Text for top-right row 2
  if (!is.null(top_right_id2)) {
    assertthat::assert_that(assertthat::is.string(top_right_id2),
                            msg = paste(error_prompt, "'top_right_id2'"))
    topright2 <- paste(top_right_txt2, dat[, top_right_id2])
  } else {
    topright2 <- top_right_txt2
  }

  # Text for center-right row 1
  if (!is.null(center_right_id1)) {
    assertthat::assert_that(assertthat::is.string(center_right_id1),
                            msg = paste(error_prompt, "'center_right_id1'"))
    centerright1 <- paste(center_right_txt1, dat[, center_right_id1])
  } else {
    centerright1 <- center_right_txt1
  }

  # Text for center-right row 2
  if (!is.null(center_right_id2)) {
    assertthat::assert_that(assertthat::is.string(center_right_id2),
                            msg = paste(error_prompt, "'center_right_id2'"))
    centerright2 <- paste(center_right_txt2, dat[, center_right_id2])
  } else {
    centerright2 <- center_right_txt2
  }

  # Text for center-right row 3
  if (!is.null(center_right_id3)) {
    assertthat::assert_that(assertthat::is.string(center_right_id3),
                            msg = paste(error_prompt, "'center_right_id3'"))
    centerright3 <- paste(center_right_txt3, dat[, center_right_id3])
  } else {
    centerright3 <- center_right_txt3
  }

  # Text for bottom-left row 1
  if (!is.null(bottom_left_id1)) {
    assertthat::assert_that(assertthat::is.string(bottom_left_id1),
                            msg = paste(error_prompt, "'bottom_left_id1'"))
    bottomleft1 <- paste(bottom_left_txt1, dat[, bottom_left_id1])
  } else {
    bottomleft1 <- bottom_left_txt1
  }

  # Text for bottom-left row 2
  if (!is.null(bottom_left_id2)) {
    assertthat::assert_that(assertthat::is.string(bottom_left_id2),
                            msg = paste(error_prompt, "'bottom_left_id2'"))
    bottomleft2 <- paste(bottom_left_txt2, dat[, bottom_left_id2])
  } else {
    bottomleft2 <- bottom_left_txt2
  }

  # Create unique id: if 'uuid' (i.e. Universal Unique IDs),
  # the function generates UUIDs by time randomly. Note that UUIDs are uninformative and not reproducible.
  # If 'custom', user must use the 'unique_id' argument to specify the column name
  # in fieldbook that denotes custom generated unique IDs.

  if (get_unique_id == "uuid") {
    UNIQUE_ID <- uuid::UUIDgenerate(use.time = TRUE, n = nrow(dat), output = "string")

  } else if (get_unique_id == "custom") {
    UNIQUE_ID <- dat[, unique_id]
  }

  # Create an augmented fieldbook containing unique IDs
  updat <- dplyr::mutate(dat, UNIQUE_ID)
  colnames(updat)[ncol(updat)] <- 'UNIQUE_ID'

  if (colnames(updat)[1] == 'ID') {
    colnames(updat)[1] <- 'SN'
  } else {
    colnames(updat)[1] <- colnames(updat)[1]
  }
  
  # File name and timestamp for updated fieldbook
  ts <- Sys.time() |> format(format = "%H_%M_%S") |> 
    paste0("Updated_Fieldbook_", ... = _, ".csv")

  utils::write.csv(updat, file = paste0(filename, ts), row.names = FALSE)

  # Send updated fieldbook from package environment to global environment
  #.GlobalEnv$updated_fieldbook <- list(updated_fieldbook = updat)

  do.call(create_label, args = list(top_left_1 = topleft1, 
                                    top_left_2 = topleft2,
                                    top_right_1 = topright1, 
                                    top_right_2 = topright2,
                                    center_right_1 = centerright1,
                                    center_right_2 = centerright2,
                                    center_right_3 = centerright3,
                                    bottom_left_1 = bottomleft1,
                                    bottom_left_2 = bottomleft2,
                                    unique_id = UNIQUE_ID, 
                                    filename = filename, ...))

  #cat("\n\n\tGenerated labels and updated fieldbook saved to working directory.")
}




#' Create a general-purpose (gp) label with text aligned in a portrait orientation.
#' @description
#' This is a standalone function that gives more flexibility to the user to 
#' design any general-purpose label affixed with QR codes. It gives 10 text 
#' positions in portrait orientation that can be filled with human-readable text
#' items as specified by the user. 
#' 
#' This function creates print-ready customized plot labels affixed with QR codes 
#' given the page setup, label dimensions, the number of rows and columns of labels 
#' to print per page.
#'
#' @returns A PDF file containing labels affixed with QR codes, saved to the
#' default or working directory.
#'
#' @param dat An input data frame or field book that contains plot attributes.
#' The order of the columns is not important, and the columns can be any name 
#' the user desires.
#' @param wdt  The label width in inches.
#' @param hgt The label height in inches.
#' @param page_wdt The page width in inches.
#' @param page_hgt The page height in inches.
#' @param top_mar The page top margin in inches.
#' @param bot_mar The page bottom margin in inches.
#' @param left_mar The page left margin in inches.
#' @param right_mar The page right margin in inches.
#' @param numrow The number of label rows per page. It should be an integer.
#' @param numcol The number of label columns per page. It should be an integer.
#' @param filename A character prefix or path for the pdf file to be created. Default path
#' is working directory.
#' @param font_sz The font size to use.
#' @param family The font style to use to print labels.
#' @param rounded Set to TRUE if label has round corners; set to false if label has
#' square corners.
#' @param bot_txt1 The prefix text for bottom text position 1.
#' @param bot_txt2 The prefix text for bottom text position 2.
#' @param bot_txt3 The prefix text for bottom text position 3.
#' @param cent_txt1 The prefix text for center text position 1.
#' @param cent_txt2 The prefix text for center text position 2.
#' @param cent_txt3 The prefix text for center text position 3.
#' @param cent_txt4 The prefix text for center text position 4.
#' @param top_txt1 The prefix text for top text position 1.
#' @param top_txt2 The prefix text for top text position 2.
#' @param top_txt3 The prefix text for top text position 3.
#' @param bot_txt1_id The column identifier in \code{dat} containing text for bottom text position 1.
#' @param bot_txt2_id The column identifier in \code{dat} containing text for bottom text position 2.
#' @param bot_txt3_id The column identifier in \code{dat} containing text for bottom text position 3.
#' @param cent_txt1_id The column identifier in \code{dat} containing text for center text position 1.
#' @param cent_txt2_id The column identifier in \code{dat} containing text for center text position 2.
#' @param cent_txt3_id The column identifier in \code{dat} containing text for center text position 3.
#' @param cent_txt4_id The column identifier in \code{dat} containing text for center text position 4.
#' @param top_txt1_id The column identifier in \code{dat} containing text for top text position 1.
#' @param top_txt2_id The column identifier in \code{dat} containing text for top text position 2.
#' @param top_txt3_id The column identifier in \code{dat} containing text for top text position 3.
#' @param unique_id The column identifier in \code{dat} containing unique identifiers or strings to generate QR codes.
#' @param ec_level The error correction level (`0` - `3`, lowest to highest) for QR codes.
#' 
#' @seealso \code{\link{field_label}} and \code{\link{gp_label}}
#' 
#' @examples
#' # Create a general-purpose label in a portrait text orientation based on the 
#' # 2 x 1 inch Avery 94220 template for laser-jet printers
#' library(qrlabelr)
#' df <- data.frame(LOCATION = rep("BAMBEY", 5),
#'                  PLOT = 1001:1005,
#'                  ROW = c(rep(1, 3), rep(2, 2)),
#'                  COLUMN = c(1:3, 1:2),
#'                  REP = rep(1, 5),
#'                  IBLOCK = c(rep(1, 3), rep(2, 2)),
#'                  TREATMENT = paste0("G-", 1:5),
#'                  SEED_SOURCE = rep("OFF_NUR", 5))
#' 
#' df$ids <- paste0(df$LOCATION,'2023', '_PYT', '_', df$PLOT, '_', df$ROW, '_',
#'                  df$COLUMN)
#' file <- tempfile()
#' \donttest{
#' if(file.exists(file)) 
#' gp_label_portrait(
#' dat = df,
#' wdt = 2,
#' hgt = 1,
#' page_wdt = 8.5,
#' page_hgt = 11,
#' top_mar = 0.625,
#' bot_mar = 0.625,
#' left_mar = 0.625,
#' right_mar = 0.625,
#' numrow = 8L,
#' numcol = 3L,
#' filename = file,
#' font_sz = 10,
#' family = 'sans',
#' rounded = TRUE,
#' bot_txt1 = 'Rubi',
#' cent_txt2 = 'Rep:',
#' cent_txt3 = 'R:',
#' cent_txt4 = 'r:',
#' top_txt1 = 'P:',
#' top_txt2 = 'B:',
#' bot_txt2_id = 'ids',
#' bot_txt3_id = 'LOCATION',
#' cent_txt1_id = 'TREATMENT',
#' cent_txt2_id = 'REP',
#' cent_txt3_id = 'COLUMN',
#' cent_txt4_id = 'ROW',
#' top_txt1_id = 'PLOT',
#' top_txt2_id = 'IBLOCK',
#' top_txt3_id = 'SEED_SOURCE',
#' unique_id = 'ids',
#' ec_level = 1)
#' }
#' 
#' @export

gp_label_portrait <- function(
    dat,
    wdt = 2, # label width
    hgt = 1, # Label height
    page_wdt = 8.5, # page width
    page_hgt = 11, # page height
    top_mar = 0.625, # top margin
    bot_mar = 0.625, # bottom margin
    left_mar = 0.625, # left margin
    right_mar = 0.625, # right margin
    numrow = 8L, # number of label rows per page
    numcol = 3L, # number of label columns per page
    filename = 'PlotLabel', # name for pdf file to be created
    font_sz = 8,
    family = 'sans', # Font style to use
    rounded = TRUE, # Rounded corners
    bot_txt1 = NULL, # Bottom position position text 1
    bot_txt2 = NULL, # Bottom position text 2
    bot_txt3 = NULL, # Bottom position text 3
    cent_txt1 = NULL, # Center position text 1 
    cent_txt2 = NULL, # Center position text 2
    cent_txt3 = NULL, # Center position text 3 
    cent_txt4 = NULL, # Center position text 4
    top_txt1 = NULL, # Top position text 1
    top_txt2 = NULL, # Top position text 2 
    top_txt3 = NULL, # Top position text 3
    bot_txt1_id = NULL, # Bottom position text 1 column ID
    bot_txt2_id = NULL, # Bottom position text 2 column ID
    bot_txt3_id = NULL, # Bottom position text 3 column ID
    cent_txt1_id = NULL, # Center position text 1 column ID
    cent_txt2_id = NULL, # Center position text 2 column ID
    cent_txt3_id = NULL, # Center position text 3 column ID
    cent_txt4_id = NULL, # Center position text 4 column ID
    top_txt1_id = NULL, # Top position text 1 column ID
    top_txt2_id = NULL, # Top position text 2 column ID
    top_txt3_id = NULL, # Top position text 3 column ID
    unique_id = NULL, # Column ID for Unique ids for QR codes
    ec_level = 3 # qr code error correction level
    
) {
  
  error_numeric <- "must be a positive numeric value."
  error_flag <- "must be a logical or boolean value."
  error_string <- "must be string value."
  
  # Function to check for positive values -- may have to be relocated
  is.valid_number <- function (x) {
    if (x >= 0 && assertthat::is.number(x)) return (TRUE) else return (FALSE)
  }
  
  # Used in assertions to check if number is an integer and positive
  is.valid_count <- function (x) {
    if (x > 0 && assertthat::is.count(x)) return (TRUE) else return (FALSE)
  }
  
  # Assertion for dat argument
  assertthat::assert_that(!missing(dat),
                          msg = "Input data frame is missing, please provide a one.")
  
  error_prompt <- "Invalid string entered for"
  
  
  ## Assertions start
  
  # Checking all numeric inputs
  assertthat::assert_that(is.valid_number(wdt),
                          msg = paste("'wdt'", error_numeric))
  assertthat::assert_that(is.valid_number(hgt),
                          msg = paste("'hgt'",  error_numeric))
  assertthat::assert_that(is.valid_number(page_wdt),
                          msg = paste("'page_wdt'", error_numeric))
  assertthat::assert_that(is.valid_number(page_hgt),
                          msg = paste("'page_hgt'", error_numeric))
  assertthat::assert_that(is.valid_number(top_mar),
                          msg = paste("'top_mar'", error_numeric))
  assertthat::assert_that(is.valid_number(bot_mar),
                          msg = paste("'bot_mar'", error_numeric))
  assertthat::assert_that(is.valid_number(left_mar),
                          msg = paste("'left_mar'", error_numeric))
  assertthat::assert_that(is.valid_number(right_mar),
                          msg = paste("'right_mar'", error_numeric))
  assertthat::assert_that(is.valid_count(numrow),
                          msg = paste("'numrow'", "must be a positive integer."))
  assertthat::assert_that(is.valid_count(numcol),
                          msg = paste("'numcol'", "must be a positive integer."))
  assertthat::assert_that(is.valid_number(font_sz),
                          msg = paste("'font_sz'", error_numeric))
  
  # Checking all flag inputs
  
  assertthat::assert_that(assertthat::is.flag(rounded),
                          msg = paste("'rounded'", error_flag))
  
  # Checking all string inputs
  
  assertthat::assert_that(assertthat::is.string(filename),
                          msg = paste("'filename'", error_string))
  
  assertthat::assert_that(assertthat::is.string(family),
                          msg = paste("'family'", error_string))
  
  ## -- Assertions end
  
  # Calculate space between label columns if any
  if (numcol == 1) {
    col_space <- 0
  } else {
    col_space <- (page_wdt - left_mar - right_mar - numcol*wdt)/(numcol-1)
  }
  
  # Calculate space between label rows if any
  if (numrow == 1) {
    row_space <- 0
  } else {
    row_space <- (page_hgt - top_mar - bot_mar - numrow*hgt)/(numrow-1)
  }
  
  # Check if page setup matches label setup per page.
  # Error message if either column spaces or the row spaces between labels 
  # are less than zero
  
  if (col_space < 0 | row_space < 0) {
    stop("Page setup does not match label setup per page.")
  }
  
  # Get number of labels
  n_row <- nrow(dat)
  
  # Bottom text position 1 field
  if (!is.null(bot_txt1_id)) {
    assertthat::assert_that(assertthat::is.string(bot_txt1_id),
                            msg = paste(error_prompt, "'bot_txt1_id'"))
    text1 <- paste(bot_txt1, dat[, bot_txt1_id])
  } else {
    text1 <- rep(bot_txt1, n_row) 
  }
  
  
  # Bottom text position 2 field
  if (!is.null(bot_txt2_id)) {
    assertthat::assert_that(assertthat::is.string(bot_txt2_id),
                            msg = paste(error_prompt, "'bot_txt2_id'"))
    text2 <- paste(bot_txt2, dat[, bot_txt2_id])
  } else {
    text2 <- rep(bot_txt2, n_row) 
  }
  
  # Bottom text position 3 field
  if (!is.null(bot_txt3_id)) {
    assertthat::assert_that(assertthat::is.string(bot_txt3_id),
                            msg = paste(error_prompt, "'bot_txt3_id'"))
    text3 <- paste(bot_txt3, dat[, bot_txt3_id])
  } else {
    text3 <- rep(bot_txt3, n_row) 
  }
  
  
  # Center text position 1
  if (!is.null(cent_txt1_id)) {
    assertthat::assert_that(assertthat::is.string(cent_txt1_id),
                            msg = paste(error_prompt, "'cent_txt1_id'"))
    text4 <- paste(cent_txt1, dat[, cent_txt1_id])
  } else {
    text4 <- rep(cent_txt1, n_row) 
  }
  
  
  # Center text position 2
  if (!is.null(cent_txt2_id)) {
    assertthat::assert_that(assertthat::is.string(cent_txt2_id),
                            msg = paste(error_prompt, "'cent_txt2_id'"))
    text5 <- paste(cent_txt2, dat[, cent_txt2_id])
  } else {
    text5 <- rep(cent_txt2, n_row) 
  }
  
  # Center text position 3
  if (!is.null(cent_txt3_id)) {
    assertthat::assert_that(assertthat::is.string(cent_txt3_id),
                            msg = paste(error_prompt, "'cent_txt3_id'"))
    text6 <- paste(cent_txt3, dat[, cent_txt3_id])
  } else {
    text6 <- rep(cent_txt3, n_row) 
  }
  
  # Center text position 4
  if (!is.null(cent_txt4_id)) {
    assertthat::assert_that(assertthat::is.string(cent_txt4_id),
                            msg = paste(error_prompt, "'cent_txt4_id'"))
    text7 <- paste(cent_txt4, dat[, cent_txt4_id])
  } else {
    text7 <- rep(cent_txt4, n_row) 
  }
  
  # Top text position 1
  if (!is.null(top_txt1_id)) {
    assertthat::assert_that(assertthat::is.string(top_txt1_id),
                            msg = paste(error_prompt, "'top_txt1_id'"))
    text8 <- paste(top_txt1, dat[, top_txt1_id])
  } else {
    text8 <- rep(top_txt1, n_row) 
  }
  
  # Top text position 2
  if (!is.null(top_txt2_id)) {
    assertthat::assert_that(assertthat::is.string(top_txt2_id),
                            msg = paste(error_prompt, "'top_txt2_id'"))
    text9 <- paste(top_txt2, dat[, top_txt2_id])
  } else {
    text9 <- rep(top_txt2, n_row) 
  }
  
  # Top text position 3
  if (!is.null(top_txt3_id)) {
    assertthat::assert_that(assertthat::is.string(top_txt3_id),
                            msg = paste(error_prompt, "'top_txt3_id'"))
    text10 <- paste(top_txt3, dat[, top_txt3_id])
  } else {
    text10 <- rep(top_txt3, n_row) 
  }
  
  # Create QR codes from unique ids
  if (!is.null(unique_id)) {
    bb <- dat[, unique_id] |> purrr::map(\(x) make_qrcode(ec_level = ec_level, x))
    nn <- length(bb) # total number of labels to generate
  } else if (is.null(unique_id)) {
    stop("Unique IDs for generating QR codes are missing!!")
  }
  
  
  # clean up any open graphical devices if function fails
  on.exit(grDevices::graphics.off())
  
  
  # Generate label positions -- prints across rows of grid layout
  pos <- expand.grid(x = 1:numcol, y = 1:numrow)
  
  duplication <- ceiling(nn/nrow(pos))
  
  label_pos <- do.call("rbind", replicate(duplication, pos, simplify = FALSE))
  
  corx <- label_pos$x # label x coordinate
  
  cory <- label_pos$y # label y coordinate
  
  
  # Create pdf file to be saved in working directory
  
  filename <- paste0(filename, paste0(wdt,'in'), 'x',
                     paste0(hgt,'in'), Sys.time()) # name of pdf file
  
  filename <- paste0(gsub(":","_", filename), ".pdf")
  
  # Font size to print text on labels
  fsize <- font_sz
  
  # Define new coordinates for QR code
  wdt1 <- 0.5 * wdt
  hgt1 <- 0.5 * hgt
  
  qry <- hgt1/1.2
  
  # Create pdf file
  # The argument family specifies the initial/default font family to be
  # used. Device independent fonts that can be used include 'sans', 'serif' and
  # 'mono', default is sans.
  
  grDevices::pdf(filename,
                 width = page_wdt,
                 height = page_hgt,
                 onefile = TRUE,
                 family = family) # Letter size paper from Avery
  
  # Grid layout for labels
  label_layout <- grid::grid.layout(numrow, numcol,
                                    widths = grid::unit(c(rep(wdt + col_space, numcol-1), wdt), "in"),
                                    heights = grid::unit(c(rep(hgt + row_space, numrow-1), hgt), "in"))
  
  qq <- grid::viewport(x = grid::unit(1, "npc"),
                       width = grid::unit(wdt1, "in"),
                       height = grid::unit(qry, "in"),
                       just = c('right','center'))
  
  # Create a viewport for each label
  aa <- grid::viewport(x = grid::unit(0, "npc"),
                       y = grid::unit(1, "npc"),
                       width = grid::unit(wdt, "in"),
                       height = grid::unit(hgt, "in"),
                       just = c('left','top'))
  
  txt1x <- 0.95*wdt # x coordinate for txt1
  
  txt1y <- 0.05*hgt # y coordinate for txt1
  
  txt2x <- 0.9*wdt # x coordinate for txt2
  
  txt3x <- 0.6*wdt # y coordinate for txt3
  
  txt4x <- 0.5*wdt # y coordinate for txt4
  
  txt5x <- 0.4*wdt # x coordinate for txt5
  
  txt6x <- 0.3*wdt # x coordinate for txt6 and 7
  
  txt7y <- 0.55*hgt # y coordinate for txt7 and 9
  
  txt8x <- 0.2*wdt # x coordinate for txt8 and txt9
  
  txt10x <- 0.05*wdt # y coordinate for txt10
  
  
  
  # Viewport for a new page
  new.page <- grid::viewport(width = grid::unit(page_wdt, "in"),
                             height = grid::unit(page_hgt, "in"))
  
  # Create a viewport for each page using grid layout
  lab_vp <- grid::viewport(layout = label_layout)
  grid::pushViewport(lab_vp)
  
  bold_font <- grid::gpar(fontface = "bold", fontsize = fsize)
  bold_font2 <- grid::gpar(fontface = "bold", fontsize = fsize-2)
  plain_font2 <- grid::gpar(fontface = "plain", fontsize = fsize-2)
  plain_font3 <- grid::gpar(fontface = "plain", fontsize = fsize-4)
  bold_font3 <- grid::gpar(fontface = "bold", fontsize = fsize-4)
  bold_font4 <- grid::gpar(fontface = "plain", fontsize = floor(fsize/2.5))
  
  
  # Define progres bar parameters
  pro_bar <- txtProgressBar(min = 0, max = nn, style = 3, char = '=')
  
  for (i in seq_len(nn)) {
    
    # set progress bar to chromosome indexing
    setTxtProgressBar(pro_bar, value = i)
    
    label_posn <- c(x = corx[i], y = cory[i])
    
    
    if (all(i != 1 & label_posn == c(1, 1))) {
      grid::grid.newpage()
      
      grid::pushViewport(new.page)
      grid::pushViewport(lab_vp)
      
    }
    
    
    grid::pushViewport(grid::viewport(layout.pos.row=label_posn['y'],
                                      layout.pos.col=label_posn['x']))
    grid::pushViewport(aa)
    
    if (rounded == TRUE) {
      grid::grid.roundrect(gp = grid::gpar(lwd = 0.5))
    } else (grid::grid.rect(gp = grid::gpar(lwd = 0.5)))
    
    # Add text1 to label (bottom position 1); note coordinates
    grid::grid.text(label = text1[i],
                    x = grid::unit(txt1x, "in"),
                    y = grid::unit(txt1y, "in"), rot = 90,
                    gp = bold_font2, hjust = 0, vp = aa)
    
    # Add text2 to label (bottom position 2); note coordinates
    grid::grid.text(label = text2[i],
                    x = grid::unit(txt2x, "in"),
                    y = grid::unit(txt1y, "in"), rot = 90,
                    gp = bold_font4, hjust = 0, vp = aa)
    
    
    # Add text3 to label (bottom position 3); note coordinates
    grid::grid.text(label = text3[i],
                    x = grid::unit(txt3x, "in"),
                    y = grid::unit(txt1y, "in"), rot = 90,
                    gp = plain_font3, hjust = 0, vp = aa)
    
    # Add text4 to label (center position 1); note coordinates
    grid::grid.text(label = text4[i],
                    x = grid::unit(txt4x, "in"),
                    y = grid::unit(txt1y, "in"), rot = 90,
                    gp = plain_font3, hjust = 0, vp = aa)
    
    # Add text5 to label (center position 2); note coordinates
    grid::grid.text(label = text5[i],
                    x = grid::unit(txt5x, "in"),
                    y = grid::unit(txt1y, "in"), rot = 90,
                    gp = bold_font2, just = c(-0.5, 0.5), vp = aa)
    
    
    # Define viewport for QR code; note coordinates and dimension
    
    grid::pushViewport(qq)
    
    # Add first QR code
    grid::grid.draw(bb[[i]])
    # grid::popViewport()
    
    
    # Go back to label viewport
    grid::upViewport()
    
    # Add text6 to label (center position 3); note coordinates
    grid::grid.text(label = text6[i],
                    x = grid::unit(txt6x, "in"),
                    y = grid::unit(txt1y, "in"), rot = 90,
                    gp = bold_font3, hjust = 0, vp = aa)
    
    
    # Add text7 to label (center position 4); note coordinates
    grid::grid.text(label = text7[i],
                    x = grid::unit(txt6x, "in"),
                    y = grid::unit(txt7y, "in"), rot = 90,
                    gp = bold_font3, hjust = 0, vp = aa)
    
    
    # Add text8 to label (top position 1); note coordinates
    grid::grid.text(label = text8[i],
                    x = grid::unit(txt8x, "in"),
                    y = grid::unit(txt1y, "in"), rot = 90,
                    gp = bold_font3, hjust = 0, vp = aa)
    
    
    # Add text9 to label (top position 2); note coordinates
    grid::grid.text(label = text9[i],
                    x = grid::unit(txt8x, "in"),
                    y = grid::unit(txt7y, "in"), rot = 90,
                    gp = bold_font3, hjust = 0, vp = aa)
    
    
    # Add text10 to label (top position 3); note coordinates
    grid::grid.text(label = text10[i],
                    x = grid::unit(txt10x, "in"),
                    y = grid::unit(txt1y, "in"), rot = 90,
                    gp = bold_font, hjust = 0, vp = aa)
    
    
    grid::popViewport(2)
    
    
  } # End of create_label ()
  
  #cat("\n\n\tGenerated labels saved to working directory as a PDF file.")
} 



#' Make an enhanced field layout plot with border rows. 
#' 
#' @description
#' A helper function that adds border rows to the entire perimeter of a
#' field laid out in a rectangular or square grid. Each experimental plot must
#' have a coordinate that is specified by row and column numbers in the 
#' grid layout. 
#' 
#' @param x The input data frame of field book that has row and column 
#' coordinates of each plot. 
#' 
#' @param row_id The string column identifier for ROW in the input field book.
#' 
#' @param col_id The string column identifier for COLUMN in the input field book.
#' @param rep_id The string column identifier for REP in the input field book.
#' @param trt_id The string column identifier for TREATMENT in the input field book.
#' @param title The title of the field layout plot.
#' @param text_sz The text size to print treatment names on the tiles.
#' @param axis_title_sz The text size for axis titles.
#' @param xlab A string to label x axis; default is 'Column'.
#' @param ylab A string to label y axis; default is 'Row'.
#' @param border_bg A string specifying the background color for the border rows.
#' @param text_col A string specifying the text color for the border rows.
#' 
#' 
#' @note
#' This function works best with input field books generated with the 'FielDHub' package
#' 
#' @examplesIf rlang::is_installed(c("ggplot2", "desplot"))
#' # Plot a field layout with border rows
#' library(qrlabelr)
#' 
#' set.seed(123)
#' 
#' add_border(x = data.frame(LOCATION = rep("BAMBEY", 12), 
#'                          PLOT = c(1001:1012),
#'                          ROW = c(rep(1, 6), rep(2, 6)),
#'                          COLUMN = c(1:6, 1:6),
#'                          REP = rep(1, 12),
#'                          TREATMENT = sample(paste0("G-", 1:12))),
#' text_sz = 3)
#' 
#' 
#' 
#' @returns A 'ggplot2' graphical object of field layout with border rows around the entire perimeter.
#' 
#' @export
#' 
add_border <- function (x, 
                        row_id = "ROW",
                        col_id = "COLUMN",
                        rep_id = "REP", 
                        trt_id = "TREATMENT",
                        title = "Field layout",
                        text_sz = 3,
                        axis_title_sz = 12,
                        xlab = "Column",
                        ylab = "Row",
                        border_bg = "grey80",
                        text_col = "grey10"
) {
  
  if (!inherits(x, what = "data.frame")) {
    stop("Input field book must be a data frame object.")
  }
  
  # Subset relevant columns from input field book 
  
  ROW <- x[, row_id]
  
  COLUMN <- x[, col_id]
  
  REP <- x[, rep_id]
  
  TREATMENT <- x[, trt_id]
  
  dat <- data.frame(ROW, COLUMN, REP, TREATMENT)
  
  # Get the number of rows, columns, reps and trts
  nrows <- length(unique(dat$ROW))
  ncols <- length(unique(dat$COLUMN))
  nrep <- length(unique(dat$REP))
  ntrt <- length(unique(dat$TREATMENT))
  
  
  # Row and column ids for border rows
  # bottom border row = 0, top border row = max row number + 1
  # left border row = 0, right border row = max col number + 1
  
  start_row_bor <- start_col_bor <- 0
  
  end_row_bor <- nrows + 1
  
  end_col_bor <- ncols + 1
  
  # Generate border rows
  bb <- data.frame(ROW = start_row_bor, 
                   COLUMN = c(0, unique(dat$COLUMN), end_col_bor),
                   REP = NA,
                   TREATMENT = 'Border')
  
  tb <- data.frame(ROW = end_row_bor, 
                   COLUMN = c(0, unique(dat$COLUMN), end_col_bor),
                   REP = NA,
                   TREATMENT = 'Border')
  
  lb <- data.frame(ROW = c(unique(dat$ROW)), 
                   COLUMN = start_col_bor,
                   REP = NA,
                   TREATMENT = 'Border')
  
  rb <- data.frame(ROW = c(unique(dat$ROW)), 
                   COLUMN = end_col_bor,
                   REP = NA,
                   TREATMENT = 'Border')
  
  # Plot field layout
  pp <- ggplot2::ggplot(dat, ggplot2::aes(x = COLUMN, y = ROW)) + 
    ggplot2::theme_classic() +
    ggplot2::geom_tile(ggplot2::aes(fill = TREATMENT), col = "white") +
    ggplot2::geom_text(ggplot2::aes(label = TREATMENT), size = text_sz, col = "grey5") +
    desplot::geom_tileborder(ggplot2::aes(group = 1, grp = REP), lwd = 1.5) +
    ggplot2::scale_x_continuous(breaks = 1:max(dat$COLUMN)) +
    ggplot2::scale_y_continuous(breaks = 1:max(dat$ROW)) +
    ggplot2::labs(x = xlab, y = ylab, title = title) + 
    ggplot2::theme(axis.title = ggplot2::element_text(size = axis_title_sz),
                   legend.position = 'none',
                   axis.line = ggplot2::element_blank(),
                   axis.ticks = ggplot2::element_blank(),
                   axis.text.x = ggplot2::element_blank(),
                   axis.text.y=  ggplot2::element_blank())
  
  # Add bottom border
  pp <- pp + ggplot2::annotate(geom = "tile", x = bb$COLUMN, y = bb$ROW, fill = border_bg) +
    ggplot2::annotate(geom = "text", x = max(bb$COLUMN)/2, y = min(bb$ROW), 
                      label = "Bottom border", color = text_col, size = text_sz+1, fontface = 'bold')
  
  # Add top border
  pp <- pp + ggplot2::annotate(geom = "tile", x = tb$COLUMN, y = tb$ROW, fill = border_bg) +
    ggplot2::annotate(geom = "text", x = max(tb$COLUMN)/2, y = min(tb$ROW), 
                      label = "Top border", color = text_col, size = text_sz+1, fontface = 'bold')
  
  # Add left border
  pp <- pp + ggplot2::annotate(geom = "tile", x = lb$COLUMN, y = lb$ROW, fill = border_bg) +
    ggplot2::annotate(geom = "text", x = min(bb$COLUMN), y = max(tb$ROW)/2, 
                      label = "Left border", color = text_col, size = text_sz+1, 
                      fontface = 'bold', angle = 90)
  
  # Add right border
  pp <- pp + ggplot2::annotate(geom = "tile", x = rb$COLUMN, y = rb$ROW, fill = border_bg) +
    ggplot2::annotate(geom = "text", x = max(bb$COLUMN), y = max(tb$ROW)/2, 
                      label = "Right border", color = text_col, size = text_sz+1, 
                      fontface = 'bold', angle = 90)
  
  return(pp)
  
}

