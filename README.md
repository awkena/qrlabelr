


# qrlabelr <img src='inst/extdata/qrlabelr.JPG' width = "140px" align="right"/>  

<br>  

<!-- badges: start -->

[![R-CMD-check](https://github.com/awkena/qrlabelr/actions/workflows/OScheck.yml/badge.svg)](https://github.com/awkena/qrlabelr/actions/workflows/OScheck.yml)
[![test-coverage](https://github.com/awkena/qrlabelr/actions/workflows/codecov3.yml/badge.svg)](https://github.com/awkena/qrlabelr/actions/workflows/codecov3.yml)

<!-- badges: end -->

# Create Plot Labels Easily With qrlabelr

A no-frills open-source solution for designing experimental or trial plot labels 
    affixed with QR codes. qrlabelr is an R package that features EasyPlotLabelR, 
    a Shiny app that simplifies the complicated process of plot label design for non-R users. 
    It also offers easily customizable functions that enable plot label generation outside the Shiny app.
    It generates field plot labels that are compatible with the widely used 
    digital data collection mobile app, Field Book. Our software builds on the foundation 
    of an existing open-source program to offer more flexibility in plot label creation steps; 
    guarantees true string fidelity after QR encoding; and provides faster label generation to users.

Submit bug reports and feature suggestions, or track changes on the
[issues page](https://github.com/awkena/qrlabelr/issues).

## Table of contents

-   Requirements
-   Recommended modules
-   Installation
-   Usage
-   Troubleshooting
-   FAQ
-   Authors
-   License
-   Features
-   Tech stack
-   Support and Feedback
-   Related

## Requirements

To run this package locally on a machine, the following R packages are
required:

-   [argonDash](https://rinterface.github.io/argonDash/): Argon Shiny
    Dashboard Template

-   [argonR](https://cran.r-project.org/package=argonR): R Interface to
    Argon HTML Design

-   [bslib](https://rstudio.github.io/bslib/): Custom 'Bootstrap' 'Sass'
    Themes for 'shiny' and 'rmarkdown'

-   [dplyr](https://www.rdocumentation.org/packages/dplyr/versions/0.7.8):
    A fast, consistent tool for working with data frame like objects,
    both in memory and out of memory

-   [grid](https://stat.ethz.ch/R-manual/R-devel/library/grid/html/00Index.html):
    A rewrite of the graphics layout capabilities, plus some support for
    interaction

-   [purrr](https://CRAN.R-project.org/package=purrr): A complete and
    consistent functional programming toolkit for R.

-   [qrencoder](https://CRAN.R-project.org/package=qrencoder): Quick Response          Code (QR Code) / Matrix Barcode Creator

-   [raster](https://rspatial.org/raster/pkg/index.html): Geographic
    Data Analysis and Modeling. Reading, writing, manipulating,
    analyzing and modeling of spatial data

-   [reactable](https://glin.github.io/reactable/): Interactive data
    tables for *R*, based on the React Table JavaScript library

-   [shiny](https://shiny.rstudio.com/): Makes it incredibly easy to
    build interactive web applications with *R*

-   [shinycssloaders](https://github.com/daattali/shinycssloaders): Add
    loading animations to a 'shiny' output while it is recalculating

-   [shinyjs](https://deanattali.com/shinyjs/): Easily improve the user
    experience of your Shiny apps in seconds

-   [shinyBS](https://CRAN.R-project.org/package=shinyBS): Twitter Bootstrap           Components for Shiny

-   [shinyWidgets](https://github.com/dreamRs/shinyWidgets): Collection
    of custom input controls and user interface components for 'Shiny'
    applications
    
-   [uuid](https://CRAN.R-project.org/package=uuid): Tools for Generating and       Handling of UUIDs

-   [tools](https://www.rdocumentation.org/packages/tools/versions/3.6.2):
    Tools for package development, administration and documentation.

## Recommended packages

-   [Rtools](https://cran.r-project.org/bin/windows/Rtools/rtools43/rtools.html):      Needed for package development.

-   [rmarkdown](https://CRAN.R-project.org/package=rmarkdown): When
    installed, display of the project's README.md help will be rendered
    with R Markdown.

## Installation

To install qrlabelr, you will first need to have R and the RStudio IDE installed on your computer. Once you have these tools installed, you can open RStudio and enter the following command in the console to install the package from GitHub:
``` r
install.packages("devtools")
```

Now, install the package by running the following commands: 
``` r
library("devtools")
install_github("awkena/qrlabelr")
```

Alternatively, you can install the package together with its vignettes as follows:
``` r
devtools::install_github("awkena/qrlabelr", build_vignettes = TRUE)
```

The method described above will download and install the `qrlabelr` package on your computer. Once the installation is complete, you can load the package by entering the following command in the console:

``` r
library(qrlabelr)
```

## Usage
### Generating field books
To use qrlabelr, one must first generate a field book that shows the layout information for all experimental plots. Typically, layout information for all plots are obtained based on the experimental design and treatment randomization. There are free open-source software such as FieldHub (https://github.com/DidierMurilloF/FielDHub), which users can use to easily generate an input field book for plot label design in qrlabelr.  

Other user-preferred software such as BMS can equally be used to generate an input field book if desired.  

**Input field books must be imported as a data frame into qrlabelr for use. We recommend that users save input field books as csv or as xls or xlsx files for easy import to qrlabelr **  

### Creating labels
Creating field plot and general-purpose labels is easy. The qrlabelr package offers two user-centered options for creating plot labels affixed with QR codes.  

The first option involves the use of customizable functions to create rectangular field plot labels or any rectangular general-purpose plot labels embossed with QR codes. This option is for users who find working in R comfortable.  

The package also provides a helper function to access a user-friendly Shiny app (EasyPlotLabelR) for non-R users who may find working in R not so comfortable. This option allows users to run the Shiny app using their computer as host without the need for an internet.  

**Both the customizable functions and Shiny app were created to deliver the exact same features, so it all boils down to a user's preference.**  

### Label design and content
Figure 1 shows 10 delineated positions available to users to be filled with human-readable text items (positions 1 - 9) and machine-readable QR code (position 10).  

|<img src='inst/extdata/label_design.JPG' style="width: 400px;" />|
|:--:| 
| *Fig. 1. Label design by qrlabelr showing 9 delineated text positions and 1 QR code position* |  

### Creating field plot labels with customizable function

To create field plot labels with functions, use the `field_label()` function. The versatility and flexibility of the function allow for the creation of rectangular labels based on any template, where the page setting and label dimension parameters can be defined by the user using specific arguments.  

For instance, to create field plot labels based on the the Avery 94241 template (https://www.avery.com/blank/labels/94241), the `field_label()` function can be modified by supplying all required information as arguments to the function's parameters, as seen in the code snippet below:  

``` r 
library(qrlabelr)

field_label(dat = qrlabelr::square_lattice,
            wdt = 5, 
            hgt = 2,
            page_wdt = 8.5, 
            page_hgt = 11,
            top_mar = 0.75, 
            bot_mar = 0.75, 
            left_mar = 1.75, 
            right_mar = 1.75, 
            numrow = 4L, 
            numcol = 1L, 
            filename = 'PlotLabel', 
            font_sz = 20, 
            Trial = 'PYT', 
            Year = 2023, 
            family = 'sans', 
            rounded = TRUE, 
            IBlock = TRUE,
            get_unique_id = "ruid", 
            rname = "AW Kena", 
            rep_id = 'REP',
            plot_id = 'PLOT',
            row_id = 'ROW', 
            col_id = 'COLUMN', 
            loc_id = 'LOCATION',
            entry_id = 'TREATMENT', 
            IBlock_id = 'IBLOCK', 
            seed_source = TRUE, 
            seed_source_id = "SEED_SOURCE" 
            )
```

The above example creates field plot labels using a sample fieldbook named `square_lattice` generated with the FielDHub package. The `square_lattice` sample fieldbook is available in the `qrlabelr` package, and it was generated based on a Square Lattice Design layout at two locations.  

It follows from the above example that to create any custom rectangular label based on a template, users must specify page setting and label dimension parameters using the following arguments:  
- `wdt`: label width in inches  
- `hgt`: label height in inches  
- `page_wdt`: page width in inches  
- `page_hgt`: page height in inches  
- `top_mar`: top page margin in inches  
- `bot_mar`: bottom page margin in inches  
- `left_mar`: left page margin in inches  
- `right_mar`: right page margin in inches  
- `numrow`: number of label rows per page  
- `numcol`: number of label columns per page  

The example above creates labels with QR codes generated using the reproducible unique IDs method (`get_unique_id = "ruid"`); researcher's name = `AW Kena`; intra-blocks (`IBlock = TRUE`); and a font family = `sans`.  

The arguments `Trial = 'PYT'` and `Year = 2023` are required if the method for generating unique IDs for QR codes is set to `get_unique_id = "ruid"`.  Users can set the font size for the label using the `font_sz` argument. Rectangular labels with rounded corners are generated with the argument `rounded = TRUE`, else set it to `rounded = FALSE`. 

The following arguments must also be specified if the input field book was not generated with the FieldHub package:  
`rep_id`: column id in input field book for REP; default is 'REP'  
`plot_id`: column id in input field book for PLOT; default is 'PLOT'  
`row_id`: column id in input field book ROW; default is 'ROW'  
`col_id`: column id in input field book for COLUMN; default is 'COLUMN'  
`loc_id`: column id in input field book for LOCATION; default is 'LOCATION'  
`entry_id`: column id in input field book for TREATMENT OR ENTRY; default is 'TREATMENT'  
`IBlock_id`: column id in input field book for IBLOCK; default is 'IBLOCK'  
`seed_source_id`: column id in input field book for SEED_SOURCE; default is 'SEED_SOURCE'  

The arguments `seed_source = TRUE` and `seed_source_id = "SEED_SOURCE" ` are optional and should be used only when the user intends to show seed source on the field label.


The function creates a pdf file with a name prefix of `PlotLabel` that is saved to the user's working directory. The function also saves an updated fieldbook to the  user's working directory which can be exported to the Field Book mobile app for digital data collection.  

For a field plot label, the 9 text positions are mapped by default to the following human- readable text items as shown in Figure 2.  

1. Top-left row 1 text position is mapped to Plot ID      
2. Top-left row 2 text position is mapped to Row ID   
3. Top-right row 1 text position is mapped to Rep ID    
4. Top-right row 2 text position is mapped to Column ID    
5. Center-right row 1 text position is mapped to intra-block ID number if the field    layout is based on an incomplete block design     
6. Center-right row 2 text position is mapped to seed source for entries (optional)  
7. Center-right row 3 text position is mapped to name of researcher (optional)    
8. Bottom-left row 1 text position is mapped to Location of experiment or trial    
9. Bottom-left row 2 text position is mapped to Entry name   

|<img src='inst/extdata/label_4x2in.JPG' style="width: 400px;" />|
|:--:| 
| *Fig. 2. A field plot label design by qrlabelr showing 9 human-readable text items and 1 machine-readable QR code* |  

### Creating general-purpose labels with customizable function
The `gp_label()` function allows for specific user-defined human-readable text items that can be used to fill out the nine (9) delineated text positions on the label. This function gives a lot of control to the user with respect to what human-readable text items gets displayed on the label.  

To create any general-purpose labels other than a field plot label, invoke the `gp_label()` function as has been done in the code snippet below:

``` r
library(qrlabelr)

gp_label(dat = qrlabelr::square_lattice,
         get_unique_id = "uuid",
         font_sz = 10,
         family = "sans",
         top_left_txt1 = 'Plot:',
         top_left_txt2 = 'Row:', 
         top_right_txt1 = 'Rep:',
         top_right_txt2 = 'Col:',
         center_right_txt1 = 'iBlock:',
         center_right_txt2 = 'Seed:',
         center_right_txt3 = 'Adepa',
         bottom_left_txt1 = 'Loc:',
         top_left_id1 = 'PLOT',
         top_left_id2 = 'ROW',
         top_right_id1 = 'REP',
         top_right_id2 = 'COLUMN',
         center_right_id1 = 'IBLOCK',
         center_right_id2 = 'SEED_SOURCE',
         bottom_left_id1 = 'LOCATION',
         bottom_left_id2 = 'TREATMENT')
```

The above arguments are passed to the `create_label` function to generate the desired labels based on the defined page setting and label dimension parameters.  

**Note that the default label template for both the `field_label()` and the `gp_label()` functions is Avery 94220 (https://www.avery.com/blank/labels/94220).**


Run the following code in the RStudio console to launch the
EasyPlotLabelR Shiny app:

``` r
  library(qrlabelr)
  qrlabelr::run_app()
```

## Troubleshooting

If the app does not run as expected, check the following:

-   Was the package properly installed?

-   Were any warnings or error messages returned during package
    installation?

-   Do you have the required dependencies installed?

-   Are all packages up to date?

## FAQ

#### How much does it cost to use this app?

This app is free of charge.

#### Can I use fieldbooks generated with FielDHub?

Yes, you can. This is in fact the recommended approach.

#### Can I use my own generated fieldbooks?

Yes, you can. However, you would have to manually select the input ID
for the various column names/ parameters in the app.

#### How do I access my generated labels?

On the Generate labels page, there is a download button which can be
used to save all generated labels to a local machine.

#### Are generated labels compatible with popular page templates?

Yes. We have gone the extra mile to ensure generated labels can be
printed on papers from Avery, Uline, and other paper template
manufacturers.

## Authors

-   [Alexander Wireko Kena](https://www.github.com/awkena)
-   [Ebenezer Ogoe](https://github.com/Ebenezer-007)
-   [Clara
    Cruet-Burgos](https://www.morrislab.org/people/clara-cruet-burgos)
-   [Geoffrey Preston
    Morris](https://www.morrislab.org/people/geoff-morris)

## License

[GNU GPLv3](https://choosealicense.com/licenses/gpl-3.0/)

## Features

-   Simplifies the process of plot label design.
-   Generates plot labels compatible with the widely used digital data
    collection mobile app, FielD Book.
-   Uses a reproducible or universal unique ID to generate QR codes with           different error correction levels.
-   Allows for both preset common label templates and custom rectangular
    label design.
-   Outputs a downloadable PDF file for printing and allows for
    downloading an updated field book.

## Tech Stack

R, HTML, CSS, JavaScript

## Support and Feedback

For support and submission of feedback, email the maintainer **Alexander
Kena** at
[alex.kena24\@gmail.com](mailto:alex.kena24@gmail.com){.email}

## Roadmap

-   Add more features
-   Find and fix bugs

## Related

Below are some related projects

[FielDHub](https://didiermurillof.github.io/FielDHub/index.html): A
Shiny App for Design of Experiments in Life Sciences
