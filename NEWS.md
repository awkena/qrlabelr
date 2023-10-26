# qrlabelr 0.1.1
This is a patch release. The following patches have been made to 'qrlabelr' since the release of version 0.1.0:
* Fixed a font size bug in Treetag label option in 'shiny' app.
* Added a new argument to the `create_label()` and `gp_label_portrait()` functions to allow users to fill multi-row and column pages with labels horizontally (left to right ) or vertically (top to bottom).
* Added a new argument to the `create_label()` and `gp_label_portrait()` functions to allow users the option to draw rectangles around labels or make labels without rectangular borders.
* Simplified the 'shiny' app by disabling subset functionality on the 'Generate labels' tab.
* Field plot label option in 'shiny' app and `field_label()` function can now show unique ID text on the label.
* Field plot label option in 'shiny' app and `field_label()` function shows no human-readable text if input field book does not have incomplete intra-blocks.
* `Seed` prefix in the seed source delineated text position removed to allow users to pass any human-readable text to this position apart from seed source in the `field_label()` function and 'shiny' app.
* `iBlock ID` prefix in the iBlock delineated text position truncated to `B` in the `field_label()` function and 'shiny' app.
* Field plot label option in 'shiny' app now allows users to blank any delineated human-readable text position with NULL text.

# qrlabelr 0.1.0

* Initial CRAN submission.

# qrlabelr 0.0.0.9000

## Initial public release

* Initial Release to GitHub
* Prior to this it was a private package

## NEWS set up