#' Make QR codes
#'
#' A helper function for QR code generation using the qrencoder library.
#' The function converts the generated QR code into a raster grob image that can
#' be plotted using the grid.draw function in the grid package.
#'
#' @param my_id unique ID string to be encoded to QR code
#' @param ec_level error correction level (`0` - `3`, lowest to highest)
#'
#' @return a raster grob image of QR code.
#'
#' @examples
#'
#' \dontrun{
#' make_qrcode("KUMASI2023_PYT_101_1_1", ec_level = 3)
#' }
#'
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



#' Create custom human and machine readable field plot labels
#'
#' @description
#' This function creates print-ready customized plot labels affixed with QR codes given the page setup (including
#' page margins), label dimensions and the number of rows and columns of labels
#' to print per page.
#'
#' @return A PDF file containing experimental plot labels affixed with QR codes, and
#'  saved to the default or set working directory.
#'
#' @param wdt  is the label width in inches.
#' @param hgt is the label height in inches.
#' @param page_wdt is the page width in inches.
#' @param page_hgt is the page height in inches.
#' @param top_mar is the page top margin in inches.
#' @param bot_mar is the page bottom margin in inches.
#' @param left_mar is the page left margin in inches.
#' @param right_mar is the page right margin in inches.
#' @param numrow is the number of label rows per page. It should be an integer.
#' @param numcol is the number of label columns per page. It should be an integer.
#' @param filename is a prefix for the pdf file to be created.
#' @param font_sz is the font size to use.
#' @param Treetag Set to TRUE if creating a treetag label.
#' @param family is the font style to use to print labels.
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
#' @param unique_id is a vector containing unique identifiers or strings to generate QR codes.
#' @param ec_level error correction level (`0` - `3`, lowest to highest)
#' @param ... additional optional arguments to be supplied.
#' 
#' @examples
#'
#' \dontrun{
#' Create rectangular plot labels based on the Avery 94220 template
#' library(qrlabelr)
#' create_label(
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
#' filename = 'PlotLabel', 
#' font_sz = 10,
#' Treetag = FALSE,
#' family = 'sans', 
#' rounded = TRUE, 
#' top_left_1 = paste("Plot:", 101:110), 
#' top_left_2 = paste("Row:", c(rep(1, 6), rep(2, 4))), 
#' top_right_1 = paste("Rep:", rep(1, 10)), 
#' top_right_2 = paste("Col:", c(1:6, 1:4)), 
#' center_right_1 = paste("iBLOCK:", c(rep(1, 6), rep(2, 4))), 
#' center_right_2 = paste("Seed:", rep("OFF_NUR", 10)), 
#' center_right_3 = rep("AWK", 10), 
#' bottom_left_1 = paste("Loc:", rep("BAMBEY", 10)), 
#' bottom_left_2 = paste0("G-", 1:10),
#' unique_id = paste("KUMASI2023_PYT", c(101:110), 
#'                   c(rep(1, 6), rep(2, 4)), c(1:6, 1:4),
#'                   sep = "_"), 
#' ec_level = 3)
#'  }
#'  
#' \dontrun{
#' Create treetag plot labels
#' library(qrlabelr)
#' create_label(
#' wdt = 1, 
#' hgt = 6, 
#' page_wdt = 4, 
#' page_hgt = 6, 
#' top_mar = 0, 
#' bot_mar = 0, 
#' left_mar = 0, 
#' right_mar = 0, 
#' numrow = 1L, 
#' numcol = 4L, 
#' filename = 'PlotLabel', 
#' font_sz = 10,
#' Treetag = TRUE,
#' family = 'sans', 
#' rounded = FALSE, 
#' top_left_1 = paste("Plot:", 101:110), 
#' top_left_2 = paste("Row:", c(rep(1, 6), rep(2, 4))), 
#' top_right_1 = paste("Rep:", rep(1, 10)), 
#' top_right_2 = paste("Col:", c(1:6, 1:4)), 
#' center_right_1 = paste("iBLOCK:", c(rep(1, 6), rep(2, 4))), 
#' center_right_2 = paste("Seed:", rep("OFF_NUR", 10)), 
#' center_right_3 = rep("AWK", 10), 
#' bottom_left_1 = paste("Loc:", rep("BAMBEY", 10)), 
#' bottom_left_2 = paste0("G-", 1:10),
#' unique_id = paste("KUMASI2023_PYT", c(101:110), 
#'                   c(rep(1, 6), rep(2, 4)), c(1:6, 1:4),
#'                   sep = "_"),
#' ec_level = 3)
#'  }
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
  bold_font2 <- grid::gpar(fontface = "bold", fontsize = fsize-1)
  bold_font3 <- grid::gpar(fontface = "bold", fontsize = fsize-2)
  bold_font4 <- grid::gpar(fontface = "bold", fontsize = fsize-4)

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
                      rot = 360, gp = bold_font2, hjust = 0)


      # Go back to label viewport
      grid::upViewport()

      # Add location of experiment to label
      grid::grid.text(label = loc1[i], rot = 90,
                      x = grid::unit(lx, "in"),
                      y = grid::unit(ly, "in"),
                      gp = bold_font3, hjust = 0, vp = tt)

      # Add seed source to label; note coordinates
      grid::grid.text(label = sds[i],
                      x = grid::unit(0.6, "npc"),
                      y = grid::unit(0.35, "npc"),
                      rot = 90, vp = tt,
                      gp = bold_font3, hjust = 0, )

      # Add researcher's name to label; note coordinates
      grid::grid.text(label = rname,
                      x = grid::unit(0.72, "npc"),
                      y = grid::unit(0.35, "npc"),
                      rot = 90, vp = tt,
                      gp = bold_font3, hjust = 0, )


      # Add entry or treatment name to label
      grid::grid.text(label = entry[i], rot = 90,
                      x = grid::unit(ex, "in"),
                      y = grid::unit(py, "in"),
                      gp = bold_font3, hjust = 0, vp = tt)

      # Add entry or treatment name to label tear-off
      grid::grid.text(label = entry[i], rot = 90,
                      x = grid::unit(ee, "in"),
                      y = grid::unit(ey, "in"),
                      gp = bold_font4, hjust = 0, vp = tt)

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
                      gp = bold_font3, hjust = 0, vp = aa)

      # Add researcher's name to label; note coordinates
      grid::grid.text(label = rname,
                      x = grid::unit(0.42, "npc"),
                      y = grid::unit(0.35, "npc"),
                      gp = bold_font3, hjust = 0, vp = aa)

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
                      gp = bold_font2, hjust = 0)

      # Go back to label viewport
      grid::upViewport()

      # Add location of experiment to label
      grid::grid.text(label = loc1[i],
                      x= grid::unit(px, "in"),
                      y = grid::unit(ly, "in"),
                      gp = bold_font3, hjust = 0, vp = aa)

      # Add entry or treatment name to label
      grid::grid.text(label = entry[i],
                      x= grid::unit(ex, "in"),
                      y = grid::unit(ey, "in"),
                      gp = bold_font3, hjust = 0, vp = aa)

      grid::popViewport(2)
    }

  }

} # End of create_label ()


#' Create field plot label function embossed with QR codes
#' @description
#' Create machine and human-readable plot labels that are well-suited for field experiments.
#'  
#' @return A PDF file containing field plot labels affixed with QR codes, and
#'  an updated fieldbook-- all saved to the default or set working directory.
#'
#' @param dat is an input data frame of fieldbook that contains plot attributes.
#' To design field plot labels, the imported fieldbook must have LOCATION, PLOT,
#' ROW, COLUMN/RANGE, REP, TREATMENT columns. The order of the columns in the fieldbook
#' is not important, and the columns can be any name the user desires.
#' @param rep_id is the column identifier for REP in the imported field book.
#' @param plot_id is the column identifier for PLOT in the imported field book.
#' @param row_id is the column identifier for ROW in the imported field book.
#' @param col_id is the column identifier for COLUMN in the imported field book.
#' @param loc_id is the column identifier for LOCATION in the imported field book.
#' @param entry_id is the column identifier for ENTRY/TREATMENT in the imported field book.
#' @param IBlock_id is the column identifier for IBLOCK in the imported field book.
#' It must be provided if \code{IBlock} is set to TRUE.
#' @param unique_id is the column identifier for UNIQUE_ID in the imported field book
#' @param seed_source_id is the column identifier for SEED_SOURCE in the imported field book.
#' It must be provided if \code{seed_source} is set to TRUE.
#' @param Year is the year of experiment or trial.
#' @param rname is the researcher's name. Initials or intials of first and middle
#' names and the last name.
#' @param Trial is the name of the trial to use.
#' @param seed_source set to TRUE if seed source is included in the imported fieldbook,
#' FALSE if otherwise.
#' @param IBlock set to TRUE if \code{dat} contains incomplete blocks within REPs.
#' @param get_unique_id Set to 'ruid' if reproducible and informative unique ids
#' are to be generated from imported fieldbook. Set to 'uuid' if universal unique ids
#' are to be generated from imported fieldbook. Set to 'custom' if imported fieldbook
#' already has unique IDs for each plot.
#' @param ... additional arguments passed to the \code{create_label()} function.
#' 
#' @details
#' The default column identifiers for LOCATION, PLOT, ROW, COLUMN/RANGE, REP, TREATMENT
#' are based on the column IDs of a fieldbook generated using the FieldHub package.
#' If user imports any fieldbook generated with other programs,
#' the user must specify the equivalent column identifiers used for LOCATION, PLOT, REP,
#' ROW, COLUMN, and TREATMENT/ENTRY in the imported fieldbook.
#' 
#' if \code{get_unique_id = 'ruid'} (i.e. Reproducible Unique IDs), the function concatenates
#' location, year, trial name, plot, row and column IDs. if \code{get_unique_id = 'uuid'} 
#' (i.e. Universal Unique IDs), the function generates UUIDs by time randomly. 
#' Note that UUIDs are uninformative and not reproducible.
#' 
#' If input fieldbook already has unique IDs for each plot, the \code{get_unique_id} 
#' argument should be set to 'custom'; and the \code{unique_id}
#' argument must be specified as a string using the column name in the input fieldbook
#' that denotes plot unique IDs.
#' 
#' if \code{Year} is NULL, the function uses the current year as defined in the sys.time().
#'
#' If the user is printing labels for any incomplete block design, the imported
#' fieldbook must include an IBLOCK column if the users wishes to display intra-blocking
#' information for experimental plots on the label.
#'
#' Set the \code{IBlock} argument to TRUE if the field layout has incomplete
#' blocks within replications. The imported  fieldbook must include an IBLOCK column if
#' the \code{IBlock} argument is set to TRUE.
#'
#' 
#'
#' @examples
#'
#' \dontrun{
#' Generate simple field plot labels using the square_lattice sample fieldbook
#' library(qrlabelr)
#' field_label(
#' dat = square_lattice,
#' font_sz = 10,
#' IBlock = FALSE,
#' get_unique_id = "ruid",
#' rname = "Adoma",
#' family = "sans",
#' seed_source = FALSE)
#' }
#'
#' \dontrun{
#' Generate treetag labels using the square_lattice sample fieldbook
#' field_label(
#' dat = square_lattice,
#' wdt = 1,
#' hgt = 6,
#' top_mar = 0,
#' bot_mar = 0,
#' left_mar = 0,
#' right_mar = 0,
#' page_hgt = 6,
#' page_wdt = 4,
#' numrow = 1,
#' numcol = 4,
#' get_unique_id = "ruid",
#' font_sz = 10,
#' IBlock = TRUE,
#' rounded = FALSE,
#' rname = "AWK",
#' family = "sans",
#' Treetag = TRUE,
#' seed_source = TRUE,
#' seed_source_id = "SEED_SOURCE")
#' }
#'
#' @export
field_label <- function(dat,
                        get_unique_id = c("ruid", "uuid", "custom"), # Generate unique ids for QR codes
                        unique_id = NULL,
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
  # in fieldbook that denotes custom generated unique IDs.

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

  # Create an augmented fieldbook containing unique IDs
  updat <- dplyr::mutate(dat, UNIQUE_ID)
  colnames(updat)[ncol(updat)] <- 'UNIQUE_ID'

  if (colnames(updat)[1] == 'ID') {
    colnames(updat)[1] <- 'SN'
  } else {
    colnames(updat)[1] <- colnames(updat)[1]
  }

  utils::write.csv(updat, file = "Updated_Fieldbook.csv", row.names = FALSE)

  # Send updated fieldbook from package environment to global environment
  .GlobalEnv$updated_fieldbook <- list(updated_fieldbook = updat)

  do.call(create_label, args = list(top_left_1 = plotid, top_left_2 = rowid,
                                            top_right_1 = repid,
                                            top_right_2 = colid,
                                            center_right_1 = blkid,
                                            center_right_2 = sds,
                                            center_right_3 = rnames,
                                            bottom_left_1 = loc1,
                                            bottom_left_2 = entry,
                                            unique_id = UNIQUE_ID, ...))

  cat("\n\n\tGenerated labels and updated fieldbook saved to working directory.")
}


#' Create a general-purpose (gp) label
#' @description
#' This function gives more flexibility to the user to design any general-purpose
#' label affixed with QR codes. It gives a lot of control to the user with 
#' respect to what human-readable text items gets displayed on the label. 
#' Arguments are passed to the `create_label()` function.
#' 
#' @return A PDF file containing plot labels affixed with QR codes, and
#'  an updated fieldbook-- all saved to the default or set working directory. 
#'
#' @param dat is an input data frame of fieldbook that contains plot attributes.
#' @param get_unique_id is to be set to 'uuid' if universal unique ids are to be generated.
#' @param unique_id is a vector containing unique identifiers or strings to generate QR codes.
#' from imported fieldbook. Set to 'custom' if imported fieldbook already has unique IDs for each plot.
#' @param top_left_txt1 is the prefix text for top-left row 1.
#' @param top_left_txt2 is the prefix text for top-left row 2.
#' @param top_right_txt1 is the prefix text for the top-right row 1.
#' @param top_right_txt2 is the prefix text for the top-right row 2.
#' @param center_right_txt1 is the prefix text for center-right row 1.
#' @param center_right_txt2 is the prefix text for center-right row 2.
#' @param center_right_txt3 is the prefix text for center-right row 3.
#' @param bottom_left_txt1 is the column identifier in dat containing text for bottom-left row 1.
#' @param bottom_left_txt2 is the column identifier in dat containing text for bottom-left row 2.
#' @param top_left_id1 is the column identifier in dat containing text for top-left row 1.
#' @param top_left_id2 is the column identifier in dat containing text for top-left row 2.
#' @param top_right_id1 is the column identifier in dat containing text for top-right row 1.
#' @param top_right_id2 is the column identifier in dat containing text for top-right row 2.
#' @param center_right_id1 is the column identifier in dat containing text for center-right row 1.
#' @param center_right_id2 is the column identifier in dat containing text for center-right row 2.
#' @param center_right_id3 is the column identifier in dat containing text for center-right row 3.
#' @param bottom_left_id1 is the column identifier in dat containing text for bottom-left row 1.
#' @param bottom_left_id2 is the column identifier in dat containing text for bottom-left row 2.
#' @param ... additional arguments passed to the \code{create_label} function.
#'
#' @examples
#'
#' \dontrun{
#' Generate general-purpose label using the square_lattice sample fieldbook.
#' library(qrlabelr)
#' gp_label(dat = square_lattice,
#' get_unique_id = "uuid",
#' font_sz = 10,
#' family = "sans",
#' top_left_txt1 = 'Plot:',
#' top_left_txt2 = 'Row:',
#' top_right_txt1 = 'Rep:',
#' top_right_txt2 = 'Col:',
#' center_right_txt1 = 'iBlock:',
#' center_right_txt2 = 'Seed:',
#' center_right_txt3 = 'AWK',
#' bottom_left_txt1 = 'Loc:',
#' top_left_id1 = 'PLOT',
#' top_left_id2 = 'ROW',
#' top_right_id1 = 'REP',
#' top_right_id2 = 'COLUMN',
#' center_right_id1 = 'IBLOCK',
#' center_right_id2 = 'SEED_SOURCE',
#' bottom_left_id1 = 'LOCATION',
#' bottom_left_id2 = 'TREATMENT'
#' )
#' }
#'
#' @export
gp_label <- function(dat,
                     get_unique_id = c("uuid", "custom"), # Generate unique ids for QR codes
                     unique_id = NULL,
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

  utils::write.csv(updat, file = "Updated_Fieldbook.csv", row.names = FALSE)

  # Send updated fieldbook from package environment to global environment
  .GlobalEnv$updated_fieldbook <- list(updated_fieldbook = updat)

  do.call(create_label, args = list(top_left_1 = topleft1, top_left_2 = topleft2,
                                            top_right_1 = topright1, top_right_2 = topright2,
                                            center_right_1 = centerright1,
                                            center_right_2 = centerright2,
                                            center_right_3 = centerright3,
                                            bottom_left_1 = bottomleft1,
                                            bottom_left_2 = bottomleft2,
                                            unique_id = UNIQUE_ID, ...))

  cat("\n\n\tGenerated labels and updated fieldbook saved to working directory.")
}
