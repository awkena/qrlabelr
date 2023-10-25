# qrlabelr 0.1.1
The following minor patches have been made to qrlabelr since the release of version 0.1.0:
* Added new options to  to allow users to print labels row-wise from left to right or column-wise from top to bottom to customizable functions and shiny app.
* Added new options to draw rectangles around labels to customizable functions and Shiny app.
* Simplified the Shiny app by disabling subset functionality.
* Field plot label option in shiny app and `field_label()` function can now show unique ID text on the label.
* Field plot label option in shiny app and `field_label()` function shows no human-readable text if input field book does not have incomplete intra-blocks.
* `Seed` prefix in the seed source delineated text position removed to allow users to pass any human-readable text to this position apart from seed source n the `field_label()` function and shiny app.
* `iBlock ID` prefix in the iBlock delineated text position truncated to `B` in the `field_label()` function and shiny app.
* Field plot label option in shiny app now allows users to blank any delineated human-readable text position with NULL text.
* Fixed a font size bug in Treetag label option in Shiny app.

# qrlabelr 0.1.0

* Initial CRAN submission.

# qrlabelr 0.0.0.9000

## Initial public release

* Initial Release to GitHub
* Prior to this it was a private package

## NEWS set up