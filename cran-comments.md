## Changes made since first submission
Following suggestions by Beni Altmann, we have made these changes before resubmitting the package to CRAN:

❯ The 'shiny' package name used in the description field has been placed in single   quotes and changed all letters to lowercase. 

❯ Extra spaces in the description field of DESCRIPTION removed and formatted to     comply with best practices.
  
❯ Methods used in the package as described by Wu et al. (2020)                      doi:10.1111/2041-210X.13405> added to the description field.
  
❯ Added \value and example to run_app.Rd. 

❯ All \dontrun{} in examples replaced with \donttest{}. To make examples pass on    Windows platforms, we added an if statement to check if tempfile or tempdir       exists before running examples. 

❯ Messages written to console by functions suppressed except for progress bar.

❯ All examples in vignette write to tempdir() instead of user's home file space.


## R CMD check results from the terminal in R 

0 errors | 0 warnings | 1 note

* This is a new release.

## Test environments
### R-hub
- R-hub windows-x86_64-devel (r-devel)
- R-hub ubuntu-gcc-release (r-release)
- R-hub fedora-clang-devel (r-devel)

0 errors ✔ | 0 warnings ✔ | 7 notes 

## R CMD check results in R-hub
❯ On windows-x86_64-devel (r-devel)
  checking CRAN incoming feasibility ... [19s] NOTE
  
  New submission
  Maintainer: 'Alexander Wireko Kena <alex.kena24@gmail.com>'

❯ On windows-x86_64-devel (r-devel)
  checking for non-standard things in the check directory ... NOTE

❯ On windows-x86_64-devel (r-devel)
  checking for detritus in the temp directory ... NOTE
  Found the following files/directories:
    'lastMiKTeXException'
    
  This NOTE appears to be a bug in the R-hub platform and has been reported by many.

❯ On ubuntu-gcc-release (r-release)
  checking CRAN incoming feasibility ... [7s/28s] NOTE
  Maintainer: ‘Alexander Wireko Kena <alex.kena24@gmail.com>’
  
  New submission

❯ On ubuntu-gcc-release (r-release), fedora-clang-devel (r-devel)
  checking examples ... NOTE
  Examples with CPU (user + system) or elapsed time > 5s
               user system elapsed
  make_qrcode 5.918  0.108   6.026
  
  Example runs in less than 3s when tested on windows-x86_64-devel (r-devel).

❯ On ubuntu-gcc-release (r-release), fedora-clang-devel (r-devel)
  checking HTML version of manual ... NOTE
  Skipping checking HTML validation: no command 'tidy' found
  
  This NOTE arose from the test environment and cannot be fixed from my end.

❯ On fedora-clang-devel (r-devel)
  checking CRAN incoming feasibility ... [8s/33s] NOTE
  Maintainer: ‘Alexander Wireko Kena <alex.kena24@gmail.com>’
  
  New submission
  
### GitHub Action workflows
- {os: macos-latest,   r: 'release'}
- {os: windows-latest, r: 'release'}
- {os: ubuntu-latest,   r: 'devel', http-user-agent: 'release'}
- {os: ubuntu-latest,   r: 'release'}
- {os: ubuntu-latest,   r: 'oldrel-1'}

All tests passed on GitHub.

For the tests to pass on `windows-latest, r: 'release'`, examples for the `create_label()`, `field_label()`, `gp_label()`, and `gp_label_portrait()` functions were placed in a `dontrun` tag, as these functions return PDF files that are written to tempfiles or tempdirs. 
