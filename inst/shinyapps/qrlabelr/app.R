
# Defines site header
argonHeader <- argonDash::argonDashHeader(
  gradient = TRUE,
  color = "primary",
  separator = FALSE,
  separator_color = "secondary",
  
  argonR::argonH1("EasyQrlabelr", display = 3, class = "text-center"),
  
  
  # Add a help info drop down menu to page; positioned at top-right corner
  argonR::argonRow(center = TRUE,
                   shinyWidgets::dropdownButton(
                     inputId = "help1",
                     label = "HELP!",
                     status = "success",
                     size = "default",
                     circle = FALSE,
                     inline = TRUE,
                     margin = "10%",
                     width = "200%",
                     icon = argonR::argonIcon(name="settings", color = "yellow"),
                     
                     # Help menu for import fieldbook tab
                     div(
                       actionLink(inputId = "help2", "Import fieldbook tab"),
                       
                       shinyBS::bsPopover(id = "help2",
                                          title = "Import fieldbook tab",
                                          placement = "bottom",
                                          trigger = "click",
                                          content = paste("<li>Click <strong>Browse</strong> to upload your fieldbook file in csv, xls, or xlsx format.",
                                                          "For programs with no access to BMS, we recommend using the free FieldHub Shiny app to generate a fieldbook.",
                                                          "Users using BMS to generate a fieldbook must remember to add a field map before exporting a study book",
                                                          sep = "<br><li>"),
                                          options = list(container = "body"))),
                     
                     br(),
                     # Help menu for Label information tab
                     div(
                       actionLink(inputId = "help3", "Label information tab"),
                       
                       shinyBS::bsPopover(id = "help3",
                                          title = "Label information tab",
                                          placement = "bottom",
                                          trigger = "click",
                                          content = paste("<li>Users must fill out all fields before generating QR codes.",
                                                          "The program can generate reproducible unique IDs for each plot if this option is selected below.",
                                                          "The program combines location, year, trial name, plot, row and column IDs to generate reproducible unique IDs.",
                                                          "The program can generate universal unique IDs (UUIDs)  for each plot if this option is selected below.",
                                                          "Note that UUIDs are randomly generated, hence, not reproducible and are uninformative.",
                                                          "Users must first generate QR codes before proceeding to other tabs or pages.",
                                                          sep = "<br><li>"),
                                          options = list(container = "body"))),
                     
                     br(),
                     # Help menu for Template setup tab
                     div(
                       actionLink(inputId = "help4", "Template setup tab"),
                       
                       shinyBS::bsPopover(id = "help4",
                                          title = "Template setup tab",
                                          placement = "bottom",
                                          trigger = "click",
                                          content = paste("<li>Select one of the available label templates from popular vendors.",
                                                          "See table below for details of available label templates.",
                                                          "Choose <strong>Custom</strong> if you do not find your template.",
                                                          sep = "<br><li>"),
                                          options = list(container = "body"))),
                     
                     br(),
                     # Help menu for page setup tab
                     div(
                       actionLink(inputId = "help5", "Page setup tab"),
                       
                       shinyBS::bsPopover(id = "help5",
                                          title = "Page setup tab",
                                          placement = "bottom",
                                          trigger = "click",
                                          content = paste("<li>Manually input page margin and size parameters (in inches) if you selected Custom label template in the Template setup widget",
                                                          "The inputed number of rows and columns for labels per page must be intergers.",
                                                          "Check the website of the label vendor to get the these page setting parameters.",
                                                          sep = "<br><li>"),
                                          options = list(container = "body"))),
                     
                     br(),
                     # Help menu for Label setup tab
                     div(
                       actionLink(inputId = "help6", "Label setup tab"),
                       
                       shinyBS::bsPopover(id = "help6",
                                          title = "Label setup tab",
                                          placement = "bottom",
                                          trigger = "click",
                                          content = paste("<li>Manually input label dimensions (in inches) if you selected Custom label template in the Template setup widget",
                                                          "Check the website of the label vendor to get these page setting parameters.",
                                                          "Use the label preview output to set an appropriate font size.",
                                                          sep = "<br><li>"),
                                          options = list(container = "body"))),
                     br(),
                     # Help menu for Generate labels tab
                     div(
                       actionLink(inputId = "help7", "Generate labels tab"),
                       
                       shinyBS::bsPopover(id = "help7",
                                          title = "Generate labels tab",
                                          placement = "bottom",
                                          trigger = "click",
                                          content = paste("<li>By default, the Generate label button is set to print labels by LOCATION subsets",
                                                          "Turn on the corresponding switches below to generate ALL labels or by REP and LOCATION subsets",
                                                          sep = "<br><li>"),
                                          options = list(container = "body")))
                     
                   )
                   
  )
  
)

# Defines site sidebar
argonSidebar <- argonDash::argonDashSidebar(
  vertical = TRUE,
  skin = "light",
  background = "white",
  size = "md",
  brand_logo = "qrlabelr.jpg",
  side = "left",
  
  id = "my_sidebar",
  
  argonDash::argonSidebarHeader(title = "Main Menu"),
  argonDash::argonSidebarMenu(
    argonDash::argonSidebarItem(
      tabName = "welcome",
      icon = argonR::argonIcon(name = "satisfied", color = "green"),
      "Welcome"
    ),
    
    argonDash::argonSidebarItem(
      tabName = "data_import",
      icon = argonR::argonIcon(name = "cloud-upload-96", color = "info"),
      "Import fieldbook"
    ),
    
    argonDash::argonSidebarItem(
      tabName = "label_info",
      icon = argonR::argonIcon(name = "tag", color = "green"),
      "Label information"
    ),
    
    argonDash::argonSidebarItem(
      tabName = "template_setup",
      icon = argonR::argonIcon(name = "palette", color = "default"),
      "Template setup"
    ),
    argonDash::argonSidebarItem(
      tabName = "page_setup",
      icon = argonR::argonIcon(name = "tv-2", color = "info"),
      "Page setup"
    ),
    argonDash::argonSidebarItem(
      tabName = "label_setup",
      icon = argonR::argonIcon(name = "settings", color = "green"),
      "Label setup"
    ),
    
    argonDash::argonSidebarItem(
      tabName = "generate_labels",
      icon = argonR::argonIcon(name = "button-play", color = "primary"),
      "Generate labels"
    )
  ),
  argonDash::argonSidebarDivider()
)

# Defines site footer
argonFooter <- argonDash::argonDashFooter(
  copyrights = "Copyright © 2023 Alexander Kena | Ebenezer Ogoe | Clara Burgos |
  Geoffrey Morris",
  src = NULL,
  argonDash::argonFooterMenu(
    argonDash::argonFooterItem("Submit issues on this Shiny app on GitHub",
                               src = "https://github.com/awkena/qrlabelr")
  )
)


# Welcome page
pg_welcome <- argonDash::argonTabItem(
  tabName = "welcome",
  argonR::argonRow(center = TRUE,
                   
                   argonR::argonColumn(width = 6,
                                       
                                       tags$head(
                                         tags$style(
                                           HTML("#logos {
                         padding-top: 5px;
                         padding-left: 3px;
                         padding-right: 3px;
                         margin-bottom: -15px;
                         max-width: 100%;
                         height: auto;
                       }" ))),
                       
                       argonR::argonCarousel(id = "logos",
                                             floating = TRUE,
                                             width = 12,
                                             
                                             div(style = "margin-bottom: -150px;",
                                                 argonR::argonCarouselItem(
                                                   src = "logos.png",
                                                   active = TRUE)
                                             )
                                             
                       ))
                   
  ),
  
  
  br(),
  
  # Some intro text that may need to be summarized into two paragraphs or less
  argonR::argonH1("Welcome!", display = 4),
  
  p("Welcome to EasyQrlabelR: a BrAPI-compliant shiny app for the qrlabelr package for designing print-ready
    plot labels affixed with QR codes. This app simplifies the complicated process
    of label design. It generates plot labels that are compatible with the
    widely used digital data collection mobile app, Field Book.",
    style = "text-align: justify; margin-top: 10px;"),
  
  p("Users can upload a field/study book either from a local source (csv, xls, or xlsx file format)
    or from a BrAPI database. The supported BrAPI databases are BMS and BreedBase.
    The imported data should contain plot or sample attributes.",
    style = "text-align: justify; margin-top: 10px;"),
  
  p("Users can either choose from a list of preset common label templates or opt to
    design any custom rectangular label given the page and label setting parameters.",
    style = "text-align: justify; margin-top: 10px;"),
  
  p(" The app outputs a downloadable PDF file based on user-defined page
  and label setting parameters. Users can also download an updated fieldbook for
  digital data collection.", style = "text-align: justify; margin-top: 10px;"),
  
  br(),
  
  argonR::argonImage(
    src = "workflow.png",
    card_mode = TRUE,
  ),
  
  br(),
  
  argonR::argonH1("How to use this Shiny app", display = 4),
  
  # Instruction infographic
  argonR::argonImage(
    src = "instructions.png",
    card_mode = TRUE,
  )
  
)

# Fieldbook import tab setup
pg_data_import <- argonDash::argonTabItem(
  tabName = "data_import",
  
  argonR::argonCard(
    width = 12,
    title = "Upload your data",
    src = NULL,
    hover_lift = FALSE,
    shadow = TRUE,
    shadow_size = NULL,
    hover_shadow = FALSE,
    border_level = 0,
    icon = argonR::argonIcon("atom"),
    status = "primary",
    background_color = NULL,
    gradient = FALSE,
    floating = FALSE,
    
    p(tags$strong("Select input data source:")),
    
    argonR::argonRow(
      argonR::argonColumn(width = 6,
                          shinyWidgets::prettySwitch(inputId = "from_local",
                                                     label = "From local source",
                                                     value = FALSE, status = "primary", fill = FALSE))),
    
    argonR::argonRow(
      argonR::argonColumn(width = 6,
                          shinyWidgets::prettySwitch(inputId = "brapi",
                                                     label = "From BrAPI Databases",
                                                     value = FALSE, status = "primary", fill = FALSE))
    ),
    
    br(),
    
    div(id = "local_source",
        # Custom CSS to style the file upload widget. The specific classes and IDs were
        # identified with Mozilla Firefox's Inspect element
        tags$style(HTML('#datUploader_progress {height: 15px !important;}
                    .input-group .form-control:not(:first-child) {
                    padding-left: 10px; border-left: 0;}
                    #my_sidebar > div > a > img {
                    max-height: 8.5rem !important;}
                    ')),
        
        fileInput(inputId = "datUploader", "Upload a Fieldbook file in CSV, XLS, or
              XLSX format:",
              accept = c(".csv", ".xls", ".xlsx"),
              width = '50%',
              placeholder = "  No file selected"),
        
        argonR::argonRow(center = TRUE,
                         argonR::argonColumn(width = 6,
                                             shinyjs::disabled(shinyWidgets::prettySwitch(inputId = "from_fieldhub",
                                                                                          label = "From FieldHub",
                                                                                          value = FALSE, status = "primary", fill = TRUE)),
                                             
                                             shinyBS::bsPopover(id = "from_fieldhub", title = "FieldHub switch",
                                                                content = "Turn on the switch if imported fieldbook was generated using the FieldHub package",
                                                                placement = "top",
                                                                trigger = "focus",
                                                                options = list(container = "body"))
                                             
                                             # shinyjs::disabled(shinyWidgets::prettySwitch(inputId = "from_BMS",
                                             #                                              label = "From BMS",
                                             #                                              value = FALSE, status = "primary", fill = TRUE)),
                                             # 
                                             # shinyBS::bsPopover(id = "from_BMS", title = "BMS switch",
                                             #                    content = "Turn on the switch if imported fieldbook was generated in BMS",
                                             #                    placement = "top",
                                             #                    trigger = "focus",
                                             #                    options = list(container = "body")),
                                             # 
                                             # shinyjs::disabled(shinyWidgets::prettySwitch(inputId = "preview_dat",
                                             #                                              label = "Preview Fieldbook",
                                             #                                              value = FALSE, status = "primary", fill = TRUE)),
                                             # 
                                             # shinyBS::bsPopover(id = "preview_dat", title = "Preview fieldbook switch",
                                             #                    content = "Turn on the switch to preview the imported fieldbook",
                                             #                    placement = "top",
                                             #                    trigger = "focus",
                                             #                    options = list(container = "body"))
                         )
        ))
    
    
    
  ),
  
  # Card for BrAPI
  argonR::argonCard(
    width = 12,
    title = "Import from BrAPI supported databases",
    src = NULL,
    hover_lift = FALSE,
    shadow = TRUE,
    shadow_size = NULL,
    hover_shadow = FALSE,
    border_level = 0,
    icon = argonR::argonIcon("atom"),
    status = "primary",
    background_color = NULL,
    gradient = FALSE,
    floating = FALSE,
    
    
    div(id = "brapi_inputs",
        
        
        argonR::argonRow(
          argonR::argonColumn(width = 4,
                              textInput("login_lk", "Enter link to login page:")),
          
          argonR::argonColumn(width = 4,
                              selectInput("brapi_engine", "Select engine:", choices = c("bms", "breedbase"))),
          
          argonR::argonColumn(width = 4,
                              shinyWidgets::prettyCheckbox(inputId = "no_auth", 
                                                           label = "No authentication?", 
                                                           status = "primary", 
                                                           shape = "curve",
                                                           value = FALSE))
          
          
          
        ),
        
        p("Do not expose your login credentials"),
        p("Use database login credentials to sign in"),
        
        argonR::argonRow(
          argonR::argonColumn(width = 4,
                              textInput("user_name", "User name:")),
          
          argonR::argonColumn(width = 4,
                              passwordInput("pwd", "Password:")),
          
          argonR::argonColumn(width = 4,
                              selectInput("brapi_crops", "Select crop:", choices = "none"))
          
          
        ),
        
        argonR::argonRow(
          
          # After this Shiny app is converted into a package
          argonR::argonColumn(width = 4, center = TRUE,
                              actionButton(inputId = "brapi_login", "Connect", icon = NULL, width = NULL,
                                           span(id="Animate", class=""))),
          
          argonR::argonColumn(width = 4, offset = 4, center = TRUE,
                              actionButton("GET1", "GET program", icon = NULL, width = NULL,
                                           span(id="Animate", class="")))
          
        ),
        
        
        
        br(), br(),
        p("Select program after successful connection"),
        argonR::argonRow(
          
          argonR::argonColumn(width = 4,
                              selectizeInput("brapi_prgs", "Select program:", choices = "none")),
          
          argonR::argonColumn(width = 4,
                              selectInput("brapi_trials", "Select trial:", choices = "none")),
          
          argonR::argonColumn(width = 4,
                              selectizeInput("brapi_studies", "Select study:", choices = "none"))
          
          
        ),
        
        argonR::argonRow(
          
          
          argonR::argonColumn(width = 4, center = TRUE,
                              actionButton("GET2", "GET trial", icon = NULL, width = NULL,
                                           span(id="Animate", class=""))),
          
          argonR::argonColumn(width = 4, center = TRUE,
                              actionButton("GET3", "GET study", icon = NULL, width = NULL,
                                           span(id="Animate", class=""))),
          
          argonR::argonColumn(width = 4, center = TRUE,
                              actionButton("GET4", "GET data", icon = NULL, width = NULL,
                                           span(id="Animate", class="")))
          
          
        )
    )
  ),
  
  div(id = "fieldbookcard",
      argonR::argonCard(
        width = 12,
        title = "Imported Field book",
        src = NULL,
        hover_lift = FALSE,
        shadow = TRUE,
        shadow_size = NULL,
        hover_shadow = FALSE,
        border_level = 0,
        icon = argonR::argonIcon("atom"),
        status = "primary",
        background_color = NULL,
        gradient = FALSE,
        floating = FALSE,
        
        argonR::argonRow(
          argonR::argonColumn(width = 12,
                              shinyjs::disabled(actionButton(inputId = "submit_dat", "Submit Fieldbook")))
        ),
        
        br(), 
        
        # Output for imported field book
        reactable::reactableOutput(outputId = "imported_fieldbook"),
        
        br(), br(), br(),
        
        argonR::argonRow(
          argonR::argonColumn(width = 12, offset = 8,
                              actionButton(inputId = "npg1", label = div("Next", icon("chevron-right")))
                              
                              
          )),
      )
  )
)

# Label information tab setup
warn <- "Submit a Fieldbook first"
warn_2 <- "Upload label data sheet"

# Generate labels tab setup
pg_generate_labels <- argonDash::argonTabItem(
  tabName = "generate_labels",
  
  
  # Mimics a classic ArgonUI card
  argonR::argonCard(
    # Card configuration
    width = 12,
    title = "Page parameters",
    src = NULL,
    hover_lift = FALSE,
    shadow = TRUE,
    shadow_size = NULL,
    hover_shadow = FALSE,
    border_level = 0,
    icon = argonR::argonIcon("atom"),
    status = "primary",
    background_color = NULL,
    gradient = FALSE,
    floating = FALSE,
    
    # Page items
    argonR::argonRow(
      argonR::argonColumn(width = 3,
                          textInput("filename", "Enter pdf file name prefix", value = "PlotLabel"))
    ),
    
    
    actionButton(inputId = "gen_labels", label = ("Generate labels "),
                 icon = NULL, width = NULL, span(id="UpdateAnimate", class="")),
    
    br(), br(), br(),
    
    argonR::argonRow(
      argonR::argonColumn(width = 12,
                          shinyjs::disabled(downloadButton(outputId = "down_labels",
                                                           "Download labels"))
      )),
    
    br(), br(),
    
    argonR::argonRow(center = TRUE,
                     shinyjs::disabled(downloadButton(outputId = "down_fieldbook",
                                                      "Download Fieldbook"))
    )
    
  )
  
)


pg_label_info <- argonDash::argonTabItem(
  tabName = "label_info",
  
  
  # Mimics a classic ArgonUI card
  argonR::argonCard(
    # Card configuration
    width = 12,
    title = "Page parameters",
    src = NULL,
    hover_lift = FALSE,
    shadow = TRUE,
    shadow_size = NULL,
    hover_shadow = FALSE,
    border_level = 0,
    icon = argonR::argonIcon("atom"),
    status = "primary",
    background_color = NULL,
    gradient = FALSE,
    floating = FALSE,
    
    argonR::argonRow(
      argonR::argonColumn(width = 6,
                          
                          shinyBS::popify(shinyWidgets::pickerInput(inputId = "label_type",
                                                                    label = "Select type of label",
                                                                    choices = c("Field plot label" = "field",
                                                                                "General-purpose landscape text label" = "gp",
                                                                                "General-purpose portrait text label" = "gpp"),
                                                                    selected = "Field plot label with QR code",
                                                                    width = "75%",
                                                                    options = list(style = "btn-primary")),
                                          trigger = "focus",
                                          title = "Type of label to design", placement = "top",
                                          content =  "Select from the available options the type of label to design."),
                          
                          shinyBS::popify(shinyWidgets::pickerInput(inputId = "uniqueids",
                                                                    label = "Select method for unique IDs",
                                                                    choices = c("Reproducible Unique IDs" = "get_unique_id",
                                                                                "Universal Unique IDs" = "uuids", "Custom Unique IDs" = "use_my_id"),
                                                                    selected = "Reproducible Unique IDs",
                                                                    width = "75%",
                                                                    options = list(style = "btn-primary")),
                                          
                                          trigger = "focus",
                                          title = "Method for generating unique IDs", placement = "top",
                                          content =  "Select the <strong>Custom</strong> option if imported fieldbook contains a unique ID column for QR codes."),
      ),
      
      argonR::argonColumn(width = 6,
                          shinyBS::popify(
                            shinyjs::disabled(
                              sliderInput(inputId = "ec_level", label = "QR code error level",
                                          min = 0, max = 3, step = 1, value = 3)),
                            
                            trigger = "focus",
                            title = "QR code error correction level", placement = "right",
                            content =  "Use error correction level of 3 if labels will be used in the field."),
                          
                          shinyjs::disabled(actionButton(inputId = "gen_qrcode",
                                                         label = "Generate QR codes",
                                                         icon = NULL, width = NULL,
                                                         span(id="Animate", class=""))
                          ))),
    br(),
    
    argonR::argonRow(center = TRUE,
                     
                     argonR::argonColumn(width = 6,
                                         
                                         shinyBS::popify(shinyWidgets::prettyCheckbox(inputId = "IBlock", label = "Incomplete blocks",
                                                                                      value = FALSE, status = "primary", shape = "curve",
                                                                                      outline = TRUE),
                                                         
                                                         trigger = "focus",
                                                         title = "iBlock switch", placement = "top",
                                                         content = "Turn on the switch if imported fieldbook contains incomplete blocks within REPS"),
                                         
                                         shinyBS::popify(shinyWidgets::prettyCheckbox(inputId = "seed_source", inline = TRUE,
                                                                                      label = "Show seed source",
                                                                                      value = FALSE, status = "primary", shape = "curve",
                                                                                      outline = TRUE),
                                                         
                                                         trigger = "focus",
                                                         title = "Seed Source Switch", placement = "bottom",
                                                         content = "Turn on the switch to show input widget for seed source.")
                     )
    )
  ),
  
  
  argonR::argonCard(
    # Card configuration
    width = 12,
    title = "Page parameters",
    src = NULL,
    hover_lift = FALSE,
    shadow = TRUE,
    shadow_size = NULL,
    hover_shadow = FALSE,
    border_level = 0,
    icon = argonR::argonIcon("atom"),
    status = "primary",
    background_color = NULL,
    gradient = FALSE,
    floating = FALSE,
    
    argonR::argonRow(
      
      argonR::argonColumn(width = 6,
                          
                          numericInput(inputId = "yr", label = "Input year of experiment",
                                       value = "", min = 1970, max = 2050)),
      
      argonR::argonColumn(width = 6,
                          shinyBS::popify(trigger = "focus",
                                          textInput(inputId = "tname", label = "Input trial name",
                                                    value = "PYT"),
                                          title = "Trial name", placement = "top",
                                          content =  "Input a short descriptive name for the trial before generating QR codes."))
    ),
    
    argonR::argonRow(
      
      argonR::argonColumn(width = 6,
                          textInput(inputId = "rname", label = "Input your name",
                                    value = "", placeholder = 'Initial(s) + Last name'),
      ),
      
      argonR::argonColumn(width = 6,
                          
                          selectInput(inputId = "seed", label = "Select seed source ID",
                                      choices = warn))
      
    ),
    
    argonR::argonRow(
      argonR::argonColumn(width = 6,
                          selectInput(inputId = "rep_id", "Select ID for REP", choices = warn),
                          selectInput(inputId = "row_id", "Select ID for ROW", choices = warn),
                          selectInput(inputId = "loc_id", "Select ID for LOCATION", choices = warn),
                          selectInput(inputId = "IBlock_id", "Select ID for IBlock", choices = warn)
      ),
      
      argonR::argonColumn(width = 6,
                          selectInput("plot_id", "Select ID for PLOT", choices = warn),
                          selectInput("col_id", "Select ID for COLUMN", choices = warn),
                          selectInput("entry_id", "Select ID for TREATMENT/ENTRY", choices = warn),
                          selectInput("unique_id", "Select ID for UNIQUE IDs", choices = warn)
      )
    ), # End of input widgets for field plot labels
    
    
    # Input widgets for general purpose labels with QR code (15 widgets)
    argonR::argonRow(center = TRUE,
                     shinyWidgets::pickerInput(inputId = "QRcode_id", label = "Select QR code ID",
                                               choices = warn_2, options = list(style = "btn-primary"))
    ),
    
    br(),
    
    argonR::argonRow(
      argonR::argonColumn(width = 6,
                          shinyWidgets::dropdownButton(
                            inputId = "toplt",
                            label = "Top-left position",
                            status = "success",
                            icon = argonR::argonIcon(name = "tag", color = "yellow"),
                            width = "250%",
                            margin = "5%",
                            circle = FALSE,
                            size = "sm",
                            
                            argonR::argonRow(
                              
                              argonR::argonColumn(width = 6,
                                                  textInput(inputId = "toplt_txt_r1", label = "ROW 1 text prefix",
                                                            value = "", placeholder = "Enter a short text"),
                                                  textInput(inputId = "toplt_txt_r2", label = "ROW 2 text prefix",
                                                            value = "", placeholder = "Enter a short text")),
                              
                              argonR::argonColumn(width = 6,
                                                  selectInput("toplt_sel_r1", "Select ID for ROW 1", choices = warn_2),
                                                  selectInput("toplt_sel_r2", "Select ID for ROW 2", choices = warn_2))
                              
                            ))),
      
      br(), br(), br(),
      
      argonR::argonColumn(width = 6,
                          shinyWidgets::dropdownButton(
                            inputId = "centrt",
                            label = "Center-right position",
                            status = "success",
                            icon = argonR::argonIcon(name = "tag", color = "yellow"),
                            width = "250%",
                            margin = "5%",
                            circle = FALSE,
                            size = "sm",
                            
                            argonR::argonRow(
                              
                              argonR::argonColumn(width = 6,
                                                  textInput(inputId = "centrt_txt_r1", label = "ROW 1 text prefix",
                                                            value = "", placeholder = "Enter a short text"),
                                                  textInput(inputId = "centrt_txt_r2", label = "ROW 2 text prefix",
                                                            value = "", placeholder = "Enter a short text"),
                                                  textInput(inputId = "centrt_txt_r3", label = "ROW 3 text prefix",
                                                            value = "", placeholder = "Enter a short text")),
                              
                              argonR::argonColumn(width = 6,
                                                  selectInput("centrt_sel_r1", "Select ID for ROW 1", choices = warn_2),
                                                  selectInput("centrt_sel_r2", "Select ID for ROW 2", choices = warn_2),
                                                  selectInput("centrt_sel_r3", "Select ID for ROW 3", choices = warn_2))
                              
                            )))
    ),
    
    br(), br(), br(),
    
    argonR::argonRow(
      argonR::argonColumn(width = 6,
                          shinyWidgets::dropdownButton(
                            inputId = "toprt",
                            label = "Top-right position",
                            status = "success",
                            icon = argonR::argonIcon(name = "tag", color = "yellow"),
                            width = "250%",
                            margin = "5%",
                            circle = FALSE,
                            size = "sm",
                            
                            
                            argonR::argonRow(
                              argonR::argonColumn(width = 6,
                                                  textInput(inputId = "toprt_txt_r1", label = "ROW 1 text prefix",
                                                            value = "", placeholder = "Enter a short text"),
                                                  textInput(inputId = "toprt_txt_r2", label = "ROW 2 text prefix",
                                                            value = "", placeholder = "Enter a short text")),
                              
                              argonR::argonColumn(width = 6,
                                                  selectInput("toprt_sel_r1", "Select ID for ROW 1", choices = warn_2),
                                                  selectInput("toprt_sel_r2", "Select ID for ROW 2", choices = warn_2))
                              
                            ))),
      
      br(), br(), br(),
      
      argonR::argonColumn(width = 6,
                          shinyWidgets::dropdownButton(
                            inputId = "botlt",
                            label = "Bottom-left position",
                            status = "success",
                            icon = argonR::argonIcon(name = "tag", color = "yellow"),
                            width = "250%",
                            margin = "5%",
                            circle = FALSE,
                            size = "sm",
                            
                            argonR::argonRow(
                              argonR::argonColumn(width = 6,
                                                  textInput(inputId = "botlt_txt_r1", label = "ROW 1 text prefix",
                                                            value = "", placeholder = "Enter a short text"),
                                                  textInput(inputId = "botlt_txt_r2", label = "ROW 2 text prefix",
                                                            value = "", placeholder = "Enter a short text")),
                              
                              argonR::argonColumn(width = 6,
                                                  selectInput("botlt_sel_r1", "Select ID for ROW 1", choices = warn_2),
                                                  selectInput("botlt_sel_r2", "Select ID for ROW 2", choices = warn_2))
                              
                            )))
    ),
    
    #-----------------------------------------------------------------------------------------------#
    # Input widgets for general purpose labels with portrait text orientation (15 widgets)
    argonR::argonRow(center = TRUE,
                     shinyWidgets::pickerInput(inputId = "QRcode_id2", label = "Select QR code ID",
                                               choices = warn_2, options = list(style = "btn-primary"))
    ),
    
    br(),
    
    argonR::argonRow(
      argonR::argonColumn(width = 6,
                          shinyWidgets::dropdownButton(
                            inputId = "toptxt",
                            label = "Top text positions",
                            status = "success",
                            icon = argonR::argonIcon(name = "tag", color = "yellow"),
                            width = "250%",
                            margin = "5%",
                            circle = FALSE,
                            size = "sm",
                            
                            argonR::argonRow(
                              
                              argonR::argonColumn(width = 6,
                                                  textInput(inputId = "top_txt1", label = "ROW 1 text prefix",
                                                            value = "", placeholder = "Enter a short text"),
                                                  textInput(inputId = "top_txt2", label = "ROW 2 text prefix",
                                                            value = "", placeholder = "Enter a short text"),
                                                  textInput(inputId = "top_txt3", label = "ROW 3 text prefix",
                                                            value = "", placeholder = "Enter a short text")
                              ),
                              
                              argonR::argonColumn(width = 6,
                                                  selectInput("top_sel1", "Select ID for ROW 1", choices = warn_2),
                                                  selectInput("top_sel2", "Select ID for ROW 2", choices = warn_2),
                                                  selectInput("top_sel3", "Select ID for ROW 3", choices = warn_2)
                              )
                              
                            ))),
      
      br(), br(), br(),
      
      argonR::argonColumn(width = 6,
                          shinyWidgets::dropdownButton(
                            inputId = "centtxt",
                            label = "Center text positions",
                            status = "success",
                            icon = argonR::argonIcon(name = "tag", color = "yellow"),
                            width = "250%",
                            margin = "5%",
                            circle = FALSE,
                            size = "sm",
                            
                            argonR::argonRow(
                              
                              argonR::argonColumn(width = 6,
                                                  textInput(inputId = "cent_txt1", label = "ROW 1 text prefix",
                                                            value = "", placeholder = "Enter a short text"),
                                                  textInput(inputId = "cent_txt2", label = "ROW 2 text prefix",
                                                            value = "", placeholder = "Enter a short text"),
                                                  textInput(inputId = "cent_txt3", label = "ROW 3 text prefix",
                                                            value = "", placeholder = "Enter a short text"),
                                                  textInput(inputId = "cent_txt4", label = "ROW 4 text prefix",
                                                            value = "", placeholder = "Enter a short text")),
                              
                              argonR::argonColumn(width = 6,
                                                  selectInput("cent_sel1", "Select ID for ROW 1", choices = warn_2),
                                                  selectInput("cent_sel2", "Select ID for ROW 2", choices = warn_2),
                                                  selectInput("cent_sel3", "Select ID for ROW 3", choices = warn_2),
                                                  selectInput("cent_sel4", "Select ID for ROW 4", choices = warn_2)
                              )
                              
                            )))
    ),
    
    br(), br(), br(),
    
    argonR::argonRow(
      
      argonR::argonColumn(width = 6,
                          shinyWidgets::dropdownButton(
                            inputId = "bottxt",
                            label = "Bottom text positions",
                            status = "success",
                            icon = argonR::argonIcon(name = "tag", color = "yellow"),
                            width = "250%",
                            margin = "5%",
                            circle = FALSE,
                            size = "sm",
                            
                            argonR::argonRow(
                              argonR::argonColumn(width = 6,
                                                  textInput(inputId = "bot_txt1", label = "ROW 1 text prefix",
                                                            value = "", placeholder = "Enter a short text"),
                                                  textInput(inputId = "bot_txt2", label = "ROW 2 text prefix",
                                                            value = "", placeholder = "Enter a short text"),
                                                  textInput(inputId = "bot_txt3", label = "ROW 3 text prefix",
                                                            value = "", placeholder = "Enter a short text")
                              ),
                              
                              argonR::argonColumn(width = 6,
                                                  selectInput("bot_sel1", "Select ID for ROW 1", choices = warn_2),
                                                  selectInput("bot_sel2", "Select ID for ROW 2", choices = warn_2),
                                                  selectInput("bot_sel3", "Select ID for ROW 3", choices = warn_2),
                              )
                              
                            )))
    ),
    
    
    
    #----------------------------------------------------------------------------------------------#   
    
    
    br(),
    
    
    
    argonR::argonRow(
      argonR::argonColumn(width = 4,
                          actionButton(inputId = "npg2", label = div("Next", icon("chevron-right"))))
    )
  )
)

# Label setting tab setup
pg_label_setup <- argonDash::argonTabItem(
  tabName = "label_setup",
  
  
  # Mimics a classic ArgonUI card
  argonR::argonCard(
    # Card configuration
    width = 12,
    title = "Page parameters",
    src = NULL,
    hover_lift = FALSE,
    shadow = TRUE,
    shadow_size = NULL,
    hover_shadow = FALSE,
    border_level = 0,
    icon = argonR::argonIcon("atom"),
    status = "primary",
    background_color = NULL,
    gradient = FALSE,
    floating = FALSE,
    
    # Page items
    h4("Label dimensions"),
    argonR::argonRow(
      argonR::argonColumn(width = 6,
                          numericInput(inputId = "wdt", "Label width (inches)", value = 2, min = 2, max = 4)
      ),
      
      argonR::argonColumn(width = 6,
                          numericInput(inputId = "hgt", "Label height (inches)", value = 1, min = 1, max = 3))
    ),
    
    br(),
    
    argonR::argonRow(
      argonR::argonColumn(width = 6,
                          shinyWidgets::pickerInput(inputId = "family", label = h4("Choose font family"),
                                                    choices = c("Helvetica" = "sans", "Times" = "serif",
                                                                "Courier" = "mono"),
                                                    selected = "sans",
                                                    options = list(title = "None selected", style = "btn-primary"))
      ),
      
      argonR::argonColumn(width = 6,
                          shinyBS::popify(trigger = "focus",
                                          numericInput(inputId = "font_size", h4("Set Font Size:"), value = 8,
                                                       min = 1, max = 28),
                                          title = "Font Size", placement = "top",
                                          content =  "Use the label preview below to choose an appropriate font size.")
      )
    ),
    
    br(),
    
    argonR::argonRow(
      argonR::argonColumn(width = 6,
                          shinyWidgets::prettyCheckbox(inputId = "rounded", label = "Round corner labels",
                                                       value = TRUE, status = "primary", shape = "curve", outline = TRUE)),
      
      argonR::argonColumn(width = 6,
                          shinyWidgets::prettyCheckbox(inputId = "rect", label = "Draw rectangle around label",
                                                       value = TRUE, status = "primary", shape = "curve", outline = TRUE)),
      
      argonR::argonColumn(width = 6,
                          shinyWidgets::prettyCheckbox(inputId = "print_across", label = "Fill page by row",
                                                       value = TRUE, status = "primary", shape = "curve", outline = TRUE))),
    
    br(),
    
    argonR::argonRow(
      argonR::argonColumn(width = 4,
                          actionButton(inputId = "npg5", label = div("Next", icon("chevron-right"))))
    )
  ),
  
  argonR::argonCard(
    width = 12,
    title = "Preview label",
    src = NULL,
    hover_lift = FALSE,
    shadow = TRUE,
    shadow_size = NULL,
    hover_shadow = FALSE,
    border_level = 0,
    icon = argonR::argonIcon("atom"),
    status = "primary",
    background_color = NULL,
    gradient = FALSE,
    floating = FALSE,
    
    #p("Alternatively, launch the FielDHub Shiny app to generate a FieldBook"),
    #p("Currently points to the GitHub's page of package author"),
    argonR::argonRow(
      argonR::argonColumn(width = 6,
                          shinyBS::popify(trigger = "focus",
                                          numericInput(inputId = "lab_sel", h4("Input label to preview:"),
                                                       value = 1, min = 1),
                                          title = "Label to preview", placement = "top",
                                          content =  "Input the row number of any plot in your fieldbook to preview its label.")
                          
      )),
    
    br(),
    # Plot output
    plotOutput(outputId = "preview", height = "800px")
  )
)

# Page settings tab setup
pg_page_setup <- argonDash::argonTabItem(
  tabName = "page_setup",
  
  # Mimics a classic ArgonUI card
  argonR::argonCard(
    # Card configuration
    width = 12,
    title = "Page parameters",
    src = NULL,
    hover_lift = FALSE,
    shadow = TRUE,
    shadow_size = NULL,
    hover_shadow = FALSE,
    border_level = 0,
    icon = argonR::argonIcon("atom"),
    status = "primary",
    background_color = NULL,
    gradient = FALSE,
    floating = FALSE,
    
    # Page items
    # Margins
    argonR::argonRow(argonR::argonColumn(width = 6,
                                         h4("Height margins (inches)"),
                                         numericInput(inputId = "top_mar", "Top", value = 0.625, min = 0.5,
                                                      max = 2),
                                         numericInput(inputId = "bot_mar", "Bottom", value = 0.625, min = 1,
                                                      max = 2)),
                     
                     argonR::argonColumn(width = 6,
                                         h4("Width margins (inches)"),
                                         numericInput(inputId = "left_mar", "Left", value = 0.625,
                                                      min = 0.5, max = 2),
                                         numericInput(inputId = "right_mar", "Right", value = 0.625,
                                                      min = 1, max = 2)
                     )
    ),
    
    br(),
    h4("Labels per page:"),
    argonR::argonRow(
      argonR::argonColumn(width = 6,
                          
                          numericInput(inputId = "numrow", "Number of rows", value = 8,
                                       min = 1, max = 3),
                          
                          numericInput(inputId = "numcol", "Number of columns", value = 3,
                                       min = 1, max = 3)),
      
      argonR::argonColumn(width = 6,
                          numericInput(inputId = "page_wdt", "Page width (inches)", value = 8.5,
                                       min = 1, max = 3, step = 0.1),
                          numericInput(inputId = "page_hgt", "Page height (inches)", value = 11,
                                       min = 1, max = 3, step = 0.1))
    ),
    
    argonR::argonRow(
      argonR::argonColumn(width = 4,
                          actionButton(inputId = "npg4", label = div("Next", icon("chevron-right"))))
    )
  )
)

# Label template tab setup
pg_template_setup <- argonDash::argonTabItem(
  tabName = "template_setup",
  
  
  # Mimics a classic ArgonUI card
  argonR::argonCard(
    # Card configuration
    width = 12,
    title = "Select any of the templates provided. Choose 'Custom' to define desired values.",
    src = NULL,
    hover_lift = FALSE,
    shadow = TRUE,
    shadow_size = NULL,
    hover_shadow = FALSE,
    border_level = 0,
    icon = argonR::argonIcon("atom"),
    status = "primary",
    background_color = NULL,
    gradient = FALSE,
    floating = FALSE,
    
    # Page items
    shinyBS::popify(trigger = "focus",
                    shinyWidgets::pickerInput(inputId = "templates", label = h4("Select a desired template"),
                                              choices = c("Custom","Avery 94220", "Avery 94200", "Avery 94224",
                                                          "Avery 94237", "Avery 94207", "Avery 94241",
                                                          "Avery 94213", "Avery 94242", "OnlineLabel OL5125",
                                                          "OnlineLabel RL778", "OnlineLabel RL2800",
                                                          "OnlineLabel RL782", "Treetag LTS14"),
                                              selected = "Avery 94220",
                                              options = list(style = "btn-primary")),
                    
                    title = "Custom setting", placement = "top",
                    content =  "Choose <strong>Custom</strong> to define your own values in the Page setup and Label setup tabs."),
    
    br(),
    
    argonR::argonRow(
      argonR::argonColumn(width = 4,
                          actionButton(inputId = "npg3", label = div("Next", icon("chevron-right"))))
    ),
    
    br(),
    
    argonR::argonH1("Common labels", display = 4),
    shinycssloaders::withSpinner(reactable::reactableOutput(outputId = "common_labels")),
    
    br(), br(),
    
    
  )
)


# Piece everything together in UI
ui <- function(request) {
  argonDash::argonDashPage(
    title = "EasyQrlabelr",
    author = "Alexander Wireko Kena, Ebenezer Ogoe, Clara Cruet Burgos, Geoffrey Preston Morris",
    description = "A Shiny app to generate custom print-ready plot labels affixed with QR codes",
    sidebar = argonSidebar,
    navbar = NULL,
    header = argonHeader,
    body = argonDash::argonDashBody(
      
      tags$head(
        tags$style(
          HTML(".shiny-notification {
              height: 100px;
              width: 300px;
              position:fixed;
              top: calc(25% - 30px);;
              left: calc(80% - 200px);;
            }
           "
          )
        )
      ),
      
      shinyjs::useShinyjs(),
      argonDash::argonTabItems(
        pg_welcome,
        pg_data_import,
        pg_label_info,
        pg_template_setup,
        pg_page_setup,
        pg_label_setup,
        pg_generate_labels
      ),
      
    ),
    footer = argonFooter
    
    
  )
}

# Server component of app
server <- function(input, output, session) {
  
  error_numeric <- "must be a positive numeric value."
  error_string <- "must be string value."
  
  # stop app when app is closed
  session$onSessionEnded(function() {
    stopApp()
    
  })
  
  
  # Event to navigate from data import tab to label info tab
  
  observeEvent(input$npg1, {
    shinyjs::runjs("$('a[data-value=\"label_info\"]').tab('show');")
    
  })
  
  
  # Event to navigate from label info tab to template setup tab
  
  observeEvent(input$npg2, {
    tryCatch({
      assertthat::assert_that(is.valid_count(input$yr) && nchar(input$yr) == 4,
                              msg = paste("Please provide a valid year."))
      assertthat::assert_that(assertthat::is.string(input$tname),
                              msg = paste("'Trial name'", error_string))
      assertthat::assert_that(assertthat::is.string(input$rname),
                              msg = paste("'Researcher name'", error_string))
      shinyjs::runjs("$('a[data-value=\"template_setup\"]').tab('show');")
      
    },
    warning = function(cond) {
      showModal(modalDialog(title = "Warning",
                            "Warnings were generated. Please double-check the entered
                            values and try again."))
    },
    error = function(cond) {
      showModal(modalDialog(title = "Error",
                            paste("The following error was generated:",
                                  cond$message, "Rectify before proceeding.")))
    })
  })
  
  
  # Event to navigate from template setup page to page setup tab
  
  observeEvent(input$npg3, {
    shinyjs::runjs("$('a[data-value=\"page_setup\"]').tab('show');")
    
  })
  
  # Event to navigate from page setup tab to label setup tab
  
  observeEvent(input$npg4, {
    tryCatch({
      assertthat::assert_that(is.valid_number(input$top_mar),
                              msg = paste("'Top margin'", error_numeric))
      assertthat::assert_that(is.valid_number(input$bot_mar),
                              msg = paste("'Bottom margin'", error_numeric))
      assertthat::assert_that(is.valid_number(input$left_mar),
                              msg = paste("'Left margin'", error_numeric))
      assertthat::assert_that(is.valid_number(input$right_mar),
                              msg = paste("'Right margin'", error_numeric))
      assertthat::assert_that(is.valid_number(input$page_wdt),
                              msg = paste("'Page width'", error_numeric))
      assertthat::assert_that(is.valid_number(input$page_hgt),
                              msg = paste("'Page height'", error_numeric))
      assertthat::assert_that(is.valid_count(input$numrow),
                              msg = paste("'Number of rows'", "must be a positive integer"))
      assertthat::assert_that(is.valid_count(input$numcol),
                              msg = paste("'Number of columns'", "must be a positive integer"))
      
      shinyjs::runjs("$('a[data-value=\"label_setup\"]').tab('show');")
    },
    warning = function(cond) {
      showModal(modalDialog(title = "Warning",
                            "Warnings were generated. Please double-check the entered
                            values and try again."))
    },
    error = function(cond) {
      showModal(modalDialog(title = "Error",
                            paste("The following error was generated:",
                                  cond$message, "Rectify before proceeding.")))
    })
    
  })
  
  # Event to navigate from label setup tab to generate labels tab
  
  observeEvent(input$npg5, {
    tryCatch({
      assertthat::assert_that(is.valid_number(input$wdt),
                              msg = paste("'Label width'", error_numeric))
      assertthat::assert_that(is.valid_number(input$hgt),
                              msg = paste("'Label height'", error_numeric))
      assertthat::assert_that(is.valid_number(input$font_size),
                              msg = paste("'Font size'", error_numeric))
      assertthat::assert_that(is.valid_count(input$lab_sel),
                              msg = paste("'Label to preview'", "must be a positive integer"))
      shinyjs::runjs("$('a[data-value=\"generate_labels\"]').tab('show');")
      
    },
    warning = function(cond) {
      showModal(modalDialog(title = "Warning",
                            "Warnings were generated. Please double-check the entered
                            values and try again."))
    },
    error = function(cond) {
      showModal(modalDialog(title = "Error",
                            paste("The following error was generated:",
                                  cond$message, "Rectify before proceeding.")))
    })
  })
  
  #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
  #                         Section 1. Global variables                                     #
  #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
  dat <- c()
  dat_columns <- c()
  pdf_filename <- c()
  ext <- c()
  
  
  #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
  #                       Section 2. ObserveEvent() Expressions                             #
  #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
  ## Triggered on clicking the 'Upload Fieldbook' button
  observeEvent(input$datUploader, {
    
    # Set 'Generated with FieldHub' switch to false on file upload
    shinyWidgets::updatePrettySwitch(inputId = "from_fieldhub", value = FALSE)
    #shinyWidgets::updatePrettySwitch(inputId = "from_BMS", value = FALSE)
    
    tryCatch({
      dat <<- input$datUploader
      ext <<- tools::file_ext(dat$datapath)
      req(dat)
      
      if (ext == "xls" || ext == "xlsx") {
        dat <<- as.data.frame(readxl::read_excel(dat$datapath))
      } else {
        
        # Read the submitted fieldbook into the global 'dat' variable
        dat <<- read.csv(dat$datapath, header = TRUE) }
      
      # Update input widgets with column names obtained from the data
      dat_columns <<- colnames(dat)
      
      if(input$from_fieldhub == TRUE) {
        autoset_fieldhub()
      } else if(input$from_fieldhub == FALSE) {
        init_label_info()
        
      }
      
      # Enable the initially disabled Preview fieldbook and Generated with FieldHub
      # and BMS switches and submit data action button
      # shinyjs::enable(id = "preview_dat")
      shinyjs::enable(id = "from_fieldhub")
      # shinyjs::enable(id = "from_BMS")
      shinyjs::enable(id = "submit_dat")
      
    },
    warning = function(cond) {
      showModal(modalDialog(title = "Warning",
                            "Warnings were generated. Please double-check the submitted
                            file and try again."))
    },
    error = function(cond) {
      showModal(modalDialog(title = "Error",
                            "An error occurred. Please check to see whether the submitted
                            file is of the accepted type CSV (Comma-Separated Values), XLS,
                            or XLSX.
                            Also confirm if the uploaded fieldbook was generated with
                            FieldHub. Either turn off the 'Generated with FieldHub' switch
                            from the Data import page."))
    })
  })
  
  
  # BrAPI BMS codes
  
  observeEvent(input$brapi_login,{
    
    # Show the spinning animation
    shinyjs::addClass(id = "Animate", class = "fas fa-spinner fa-spin")
    
    tryCatch({
      
      if (input$brapi == TRUE) {
        
        if (input$brapi_engine == "bms") {
          
          # config your BMS connection (by providing your BMS login page URL)
          QBMS::set_qbms_config(input$login_lk, 
                                time_out = 300,
                                no_auth = input$no_auth,
                                engine = "bms")
          
          # login using your BMS account (interactive mode)
          # or pass your BMS username and password as parameters (batch mode)
          QBMS::login_bms(username = input$user_name, password = input$pwd)
          
        } else {
          
          # config your BMS connection (by providing your breedbase login page URL)
          QBMS::set_qbms_config(input$login_lk, 
                                time_out = 300, 
                                no_auth = input$no_auth,
                                engine = "breedbase")
          
        }
        
        
        # list supported crops in the current bms server
        crops <- QBMS::list_crops() # character vector
        
        # Update widget for BMS crops
        updateSelectInput(inputId = "brapi_crops", choices = c(crops))
      }
    },
    
    warning = function(cond) {
      showModal(modalDialog(title = "Warning",
                            paste("Warnings were generated:", cond$message)))
    },
    
    error = function(cond) {
      showModal(modalDialog(title = "Error",
                            paste("The following error was generated:", cond$message)))
    })
    
    # stop the spinning animation
    shinyjs::removeClass(id = "Animate", class = "fas fa-spinner fa-spin")
    
  })
  
  
  # GET programs 
  observeEvent(input$GET1,{
    
    # Show the spinning animation
    shinyjs::addClass(id = "Animate", class = "fas fa-spinner fa-spin")
    
    tryCatch({
      
      if (input$brapi_crops != "none") {
        QBMS::set_crop(input$brapi_crops)
        
        # list all breeding programs in the selected crop
        prg <- QBMS::list_programs() # data frame
        prg <- prg[,1]
        
        # Update widget for BMS programs
        updateSelectInput(inputId = "brapi_prgs", choices = c(prg))
      }
      
    },
    
    warning = function(cond) {
      showModal(modalDialog(title = "Warning",
                            paste("Warnings were generated:", cond$message)))
    }, 
    
    error = function(cond) {
      showModal(modalDialog(title = "Error",
                            paste("The following error was generated:", cond$message)))
    })
    
    # stop the spinning animation
    shinyjs::removeClass(id = "Animate", class = "fas fa-spinner fa-spin")
    
  })
  
  
  # GET trials
  observeEvent(input$GET2,{
    # Show the spinning animation
    shinyjs::addClass(id = "Animate", class = "fas fa-spinner fa-spin")
    
    tryCatch({
      
      if (input$brapi_prgs != "none") {
        QBMS::set_program(input$brapi_prgs) 
        # list all studies/trials in the selected program
        trials <- QBMS::list_trials() # data frame
        trials <- trials[,1] # Convert to a character vector
        # Update widget for BMS programs
        updateSelectInput(inputId = "brapi_trials", choices = c(trials))
      }
    },
    
    warning = function(cond) {
      showModal(modalDialog(title = "Warning",
                            paste("Warnings were generated:", cond$message)))
    }, 
    
    error = function(cond) {
      showModal(modalDialog(title = "Error",
                            paste("The following error was generated:", cond$message)))
    })
    
    # stop the spinning animation
    shinyjs::removeClass(id = "Animate", class = "fas fa-spinner fa-spin")
    
  })
  
  
  # GET studies
  observeEvent(input$GET3,{
    
    # Show the spinning animation
    shinyjs::addClass(id = "Animate", class = "fas fa-spinner fa-spin")
    
    tryCatch({
      
      if (input$brapi_trials != "none") {
        
        # select a specific study/trial by name
        QBMS::set_trial(input$brapi_trials)
        
        # list all environments/locations information in the selected study/trial
        studies <- QBMS::list_studies()
        
        studies <- studies[1:nrow(studies), 1] # Convert studies to a character vector
        
        updateSelectInput(inputId = "brapi_studies", choices = c(studies))
      }
    },
    
    warning = function(cond) {
      showModal(modalDialog(title = "Warning",
                            paste("Warnings were generated:", cond$message)))
    }, 
    
    error = function(cond) {
      showModal(modalDialog(title = "Error",
                            paste("The following error was generated:", cond$message)))  
    })
    
    # stop the spinning animation
    shinyjs::removeClass(id = "Animate", class = "fas fa-spinner fa-spin")
    
  })
  
  # GET data
  observeEvent(input$GET4,{
    
    # Show the spinning animation
    shinyjs::addClass(id = "Animate", class = "fas fa-spinner fa-spin")
    
    shinyjs::enable(id = "submit_dat")
    tryCatch({
      if (input$brapi_studies != "none") {
        QBMS::set_study(input$brapi_studies)
        
        dat <<- QBMS::get_study_data()
        dat <<- dat
        # Update input widgets with column names obtained from the data
        dat_columns <<- colnames(dat)
        init_label_info()
      }
    },
    
    warning = function(cond) {
      showModal(modalDialog(title = "Warning",
                            paste("Warnings were generated:", cond$message)))
    }, 
    
    error = function(cond) {
      showModal(modalDialog(title = "Error",
                            paste("The following error was generated:", cond$message))) 
    })
    
    # stop the spinning animation
    shinyjs::removeClass(id = "Animate", class = "fas fa-spinner fa-spin")
    
  })
  
  
  
  # Update year input widgets with current year; user can input year manually
  yrs <- format(Sys.time(),'%Y')
  updateTextInput(inputId = "yr", value = yrs)
  
  
  ## Triggered on clicking the 'Submit Fieldbook' button
  observeEvent(input$submit_dat,{
    
    # Reactivate GR code and error correction level buttons
    shinyjs::enable(id = "gen_qrcode")
    shinyjs::enable(id = "ec_level")
    
    # Displays the imported fieldbook
    output$imported_fieldbook <- reactable::renderReactable({
      tryCatch({
        reactable::reactable(data.frame(dat), fullWidth = TRUE, defaultPageSize = 10, columns = NULL,
                             bordered = TRUE, highlight = TRUE, resizable = TRUE)
      },
      warning = function(cond) {
        showModal(modalDialog(title = "Warning",
                              "Warnings. Please double-check entered values in order to
                            produce the expected results."))
      },
      error = function(cond) {
        showModal(modalDialog(title = "Error",
                              "An error occurred. Double-check the submitted file to be
                                sure it is of the correct format. The app expects a CSV,
                                XLS, or XLSX file containing rows and columns. Column
                                headers are required and must be present to produce the
                                desired output.
                                "))
      })
    })
  })
  
  # Hide and show BrAPI widgets
  observe({
    
    if (input$brapi == FALSE) {
      
      shinyjs::hide(id = "brapi_inputs")
      shinyjs::enable(id = "from_local")
      
    } else {
      
      shinyjs::show(id = "brapi_inputs")
      shinyjs::disable(id = "from_local")
    }
    
  })
  
  observe({
    
    if (input$from_local == FALSE) {
      
      shinyjs::hide(id = "local_source")
      shinyjs::enable(id = "brapi")
      
    } else {
      
      shinyjs::show(id = "local_source")
      shinyjs::disable(id = "brapi")
    }
  })
  
  
  observe({
    
    if (input$no_auth == TRUE) {
      
      shinyjs::disable(id = "pwd")
      shinyjs::disable(id = "user_name")
      
      
      
    } else {
      
      shinyjs::enable(id = "pwd")
      shinyjs::enable(id = "user_name")
      
    }
  })
  
  ## Triggered on clicking the 'Generate labels' button
  observeEvent(input$gen_labels, {
    
    # Show the spinning animation
    shinyjs::addClass(id = "UpdateAnimate", class = "fas fa-spinner fa-spin")
    
    # Disable the buttons so the user does not click them in the middle of processing
    shinyjs::disable(id = "gen_labels")
    shinyjs::disable(id = "down_fieldbook")
    shinyjs::disable(id = "down_labels")
    
    
    tryCatch({
      if (input$label_type == "field" || input$label_type == "gp") {
        reactive_create_label <- reactive(create_label())
        reactive_create_label()
        
      } else if (input$label_type == "gpp") {
        
        reactive_gp_label_portrait <- reactive(gp_label_portrait())
        reactive_gp_label_portrait()
        
      }
    },
    warning = function(cond) {
      showModal(modalDialog(title = "Warning",
                            "Warnings. Please double-check entered values in order to
                            produce the expected results."))
    },
    error = function(cond) {
      showModal(modalDialog(title = "Error",
                            "An error occurred. Please check to see if all requirements
                            have been met."))
    },
    finally = {
      # In case the label generation fails, reset the button for the user to retry
      shinyjs::enable(id = "gen_labels")
      shinyjs::removeClass(id = "UpdateAnimate", class = "fas fa-spinner fa-spin")
    })
    
    # Reset the button after successful label generation
    shinyjs::enable(id = "gen_labels")
    shinyjs::removeClass(id = "UpdateAnimate", class = "fas fa-spinner fa-spin")
  })
  
  
  
  #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
  #                 Section 3. Observe() Expressions and Downloaders                        #
  #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
  
  ## Input widget controls if type of label = field plot labels
  observe({
    if (input$label_type == "field"){
      
      shinyjs::show(id = "IBlock")
      shinyjs::show(id = "uniqueids")
      shinyjs::show(id = "seed_source")
      shinyjs::show(id = "rname")
      shinyjs::show(id = "plot_id")
      shinyjs::show(id = "rep_id")
      shinyjs::show(id = "row_id")
      shinyjs::show(id = "col_id")
      shinyjs::show(id = "entry_id")
      shinyjs::show(id = "loc_id")
      
      
      ## Hide the input widget for IBlock if the respective checkbox is set to false  
      if (input$IBlock == FALSE ) {
        shinyjs::hide(id = "IBlock_id")
      } else {
        shinyjs::show(id = "IBlock_id")
      }
      
      # Show the input widget for setting the Unique ID 
      if (input$uniqueids == "use_my_ids") {
        shinyjs::show(id = "unique_id")
      } else {
        shinyjs::hide(id = "unique_id")
      }  
      
      # Show the input widget for trial name and year of experiment
      if (input$uniqueids == "uuids" | input$uniqueids == "use_my_ids") {
        shinyjs::hide(id = "tname")
        shinyjs::hide(id = "yr")
      } else if (input$uniqueids == "get_unique_id") {
        shinyjs::show(id = "tname")
        shinyjs::show(id = "yr")
      }
      
      ## Show the input widget for setting seed source if the respective checkbox is true
      if(input$seed_source == FALSE) {
        shinyjs::hide(id = "seed")
        
      } else {
        shinyjs::show(id = "seed")
      }
      # Hide all widgets for general purpose labels -- landscape
      shinyjs::hide(id = "QRcode_id")
      shinyjs::hide(id = "toplt")
      shinyjs::hide(id = "toprt")
      shinyjs::hide(id = "centrt")
      shinyjs::hide(id = "botlt")
      
      shinyjs::hide(id = "QRcode_id2")
      shinyjs::hide(id = "toptxt")
      shinyjs::hide(id = "centtxt")
      shinyjs::hide(id = "bottxt")
      
      
    } else {
      shinyjs::hide(id = "tname")
      shinyjs::hide(id = "yr")
      
    }
  })
  
  
  # Hide all widgets for field plot labels and gp portrait if label type is 
  # gp landscape
  observe({
    if (input$label_type == "gp") {
      
      shinyjs::show(id = "toplt")
      shinyjs::show(id = "toprt")
      shinyjs::show(id = "centrt")
      shinyjs::show(id = "botlt")
      
      # Hide widgets for field plot labels
      shinyjs::hide(id = "IBlock")
      # shinyjs::hide(id = "uniqueids")
      shinyjs::hide(id = "seed_source")
      shinyjs::hide(id = "seed")
      shinyjs::hide(id = "IBlock_id")
      shinyjs::hide(id = "rname")
      shinyjs::hide(id = "plot_id")
      shinyjs::hide(id = "rep_id")
      shinyjs::hide(id = "row_id")
      shinyjs::hide(id = "col_id")
      shinyjs::hide(id = "entry_id")
      shinyjs::hide(id = "loc_id")
      shinyjs::hide(id = "unique_id")
      
      shinyjs::hide(id = "QRcode_id2")
      shinyjs::hide(id = "toptxt")
      shinyjs::hide(id = "centtxt")
      shinyjs::hide(id = "bottxt")
      
      
      
      # Show the input widget for setting the QRcode ID for gp
      if (input$uniqueids == "use_my_ids") {
        shinyjs::show(id = "QRcode_id")
        
      } else {
        shinyjs::hide(id = "QRcode_id")
      }  
      
    } 
    
  })
  
  
  # Hide all widgets for gp portrait if label type is gp landscape 
  observe({
    if (input$label_type == "gpp") {
      
      shinyjs::show(id = "QRcode_id2")
      shinyjs::show(id = "toptxt")
      shinyjs::show(id = "centtxt")
      shinyjs::show(id = "bottxt")
      
      # Hide widgets for field plot labels
      shinyjs::hide(id = "IBlock")
      shinyjs::hide(id = "seed_source")
      shinyjs::hide(id = "seed")
      shinyjs::hide(id = "IBlock_id")
      shinyjs::hide(id = "rname")
      shinyjs::hide(id = "plot_id")
      shinyjs::hide(id = "rep_id")
      shinyjs::hide(id = "row_id")
      shinyjs::hide(id = "col_id")
      shinyjs::hide(id = "entry_id")
      shinyjs::hide(id = "loc_id")
      shinyjs::hide(id = "unique_id")
      
      
      shinyjs::hide(id = "QRcode_id")
      shinyjs::hide(id = "toplt")
      shinyjs::hide(id = "toprt")
      shinyjs::hide(id = "centrt")
      shinyjs::hide(id = "botlt")
      
    } else {
      
    }
    
  })
  
  
  
  
  ## Downloads generated labels
  output$down_labels <- downloadHandler(
    filename = function() {
      paste(pdf_filename)
    },
    content = function(file) {
      file.copy(pdf_filename, file)
    }
  )
  
  ## Downloads updated Fieldbook with unique IDs
  output$down_fieldbook <- downloadHandler(
    filename = function() {
      paste("Updated_Fieldbook.csv")
    },
    content = function(file) {
      file.copy("Updated_Fieldbook.csv", file)
    }
  )
  
  ## Show or hide the imported Fieldbook according to the state of the switch
  # observe({
  #   if (input$preview_dat == TRUE) {
  #     shinyjs::show(id = "fieldbookcard")
  #   } else {
  #     shinyjs::hideElement(id = "fieldbookcard")
  #   }
  # })
  
  # Create reactive object for common labels
  cls <- reactive({
    read.csv("data/common_labels.csv", header = TRUE,
             colClasses = c(rep("character",2), rep("numeric", 9), "logical"))
  })
  
  ## Load and render common labels in a table
  observe({
    output$common_labels <- reactable::renderReactable({
      isolate({reactable::reactable(cls(), fullWidth = TRUE, defaultPageSize = 15,
                                    bordered = TRUE, highlight = TRUE, resizable = TRUE)
      })
    })
  })
  
  # Update page and label setup inputs when label templates are selected
  observeEvent(input$templates,{
    
    clabs <- cls()
    
    updateNumericInput(session, inputId = "wdt",
                       value = clabs$Lab.W.in[clabs$Template == input$templates])
    
    updateNumericInput(session, inputId = "hgt",
                       value = clabs$Lab.H.in[clabs$Template == input$templates])
    
    updateNumericInput(session, inputId = "page_wdt",
                       value = clabs$pg.W.in[clabs$Template == input$templates])
    
    updateNumericInput(session, inputId = "page_hgt",
                       value = clabs$pg.H.in[clabs$Template == input$templates])
    
    
    updateNumericInput(session, inputId = "numrow",
                       value = clabs$nRows.pg[clabs$Template == input$templates])
    
    updateNumericInput(session, inputId = "numcol",
                       value = clabs$nColumns.pg[clabs$Template == input$templates])
    
    updateNumericInput(session, inputId = "top_mar",
                       value = clabs$Height.margin.in[clabs$Template == input$templates])
    
    updateNumericInput(session, inputId = "bot_mar",
                       value = clabs$Height.margin.in[clabs$Template == input$templates])
    
    updateNumericInput(session, inputId = "left_mar",
                       value = clabs$Width.margin.in[clabs$Template == input$templates])
    
    updateNumericInput(session, inputId = "right_mar",
                       value = clabs$Width.margin.in[clabs$Template == input$templates])
    
    shinyWidgets::updatePrettyCheckbox(session, inputId = "rounded",
                                       value = clabs$Rounded[clabs$Template == input$templates])
    
  })
  
  # Auto fill Label information tab with column names if field book was generated
  # using FieldHub or BMS
  observe({
    tryCatch({
      
      # If the user confirms the submitted Fieldbook was generated using FieldHub,
      # set the selectInputs to the right IDs automatically
      # Otherwise, update input widgets with column names obtained from the data
      if(input$from_fieldhub == TRUE ){
        autoset_fieldhub()
        
        # }else if(input$from_BMS == TRUE){
        #   autoset_BMS()
        
      } else {
        init_label_info()
        
      }
      
      
    },
    warning = function(cond) {
      showModal(modalDialog(title = "Warning",
                            "Warnings. Please double-check entered values in order to
                            produce the expected results."))
    },
    error = function(cond) {
      showModal(modalDialog(title = "Error",
                            "An error occurred. Please confirm if the uploaded fieldbook
                            was generated with FieldHub. Either turn off the 'Generated
                            with FieldHub' switch from the Data import page."))
    })
  })
  
  # Update numeric input widget for label preview; observed only when the submitted data
  # action button is clicked
  observe({
    req(input$submit_dat)
    updateNumericInput(session, inputId = "lab_sel", value = 1, step = 1,
                       min = 1, max = nrow(dat))
  })
  
  
  
  
  #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
  #                   Section 4. Regular functions (the "workhorses")                       #
  #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
  
  # Used in assertion to check for positive numbers
  is.valid_number <- function (x) {
    if (x >= 0 && assertthat::is.number(x)) return (TRUE) else return (FALSE)
  }
  
  # Used in assertions to check if number is an integer and positive
  is.valid_count <- function (x) {
    if (x > 0 && assertthat::is.count(x)) return (TRUE) else return (FALSE)
  }
  
  # Initialize label info
  init_label_info <- function() {
    updateSelectInput(inputId = "rep_id", choices = c("none", dat_columns))
    updateSelectInput(inputId = "row_id", choices = c("none", dat_columns))
    updateSelectInput(inputId = "loc_id", choices = c("none", dat_columns))
    updateSelectInput(inputId = "IBlock_id", choices = c("none", dat_columns))
    updateSelectInput(inputId = "plot_id", choices = c("none", dat_columns))
    updateSelectInput(inputId = "col_id", choices = c("none", dat_columns))
    updateSelectInput(inputId = "entry_id", choices = c("none", dat_columns))
    updateSelectInput(inputId = "unique_id", choices = c("none", dat_columns))
    updateSelectInput(inputId = "seed", choices = c("none", dat_columns))
    
    # Update select inputs for general purpose landscape labels
    updateSelectInput(inputId = "toplt_sel_r1", choices = c("none", dat_columns), selected = "none")
    updateSelectInput(inputId = "toplt_sel_r2", choices = c("none", dat_columns), selected = "none")
    updateSelectInput(inputId = "toprt_sel_r1", choices = c("none", dat_columns), selected = "none")
    updateSelectInput(inputId = "toprt_sel_r2", choices = c("none", dat_columns), selected = "none")
    updateSelectInput(inputId = "centrt_sel_r1", choices = c("none", dat_columns), selected = "none")
    updateSelectInput(inputId = "centrt_sel_r2", choices = c("none", dat_columns), selected = "none")
    updateSelectInput(inputId = "centrt_sel_r3", choices = c("none", dat_columns), selected = "none")
    updateSelectInput(inputId = "botlt_sel_r1", choices = c("none", dat_columns), selected = "none")
    updateSelectInput(inputId = "botlt_sel_r2", choices = c("none", dat_columns), selected = "none")
    shinyWidgets::updatePickerInput(session, inputId = "QRcode_id", choices = c("none", dat_columns), selected = "none")
    
    # Update select inputs for general purpose portrait labels
    updateSelectInput(inputId = "top_sel1", choices = c("none", dat_columns), selected = "none")
    updateSelectInput(inputId = "top_sel2", choices = c("none", dat_columns), selected = "none")
    updateSelectInput(inputId = "top_sel3", choices = c("none", dat_columns), selected = "none")
    updateSelectInput(inputId = "cent_sel1", choices = c("none", dat_columns), selected = "none")
    updateSelectInput(inputId = "cent_sel2", choices = c("none", dat_columns), selected = "none")
    updateSelectInput(inputId = "cent_sel3", choices = c("none", dat_columns), selected = "none")
    updateSelectInput(inputId = "cent_sel4", choices = c("none", dat_columns), selected = "none")
    updateSelectInput(inputId = "bot_sel1", choices = c("none", dat_columns), selected = "none")
    updateSelectInput(inputId = "bot_sel2", choices = c("none", dat_columns), selected = "none")
    updateSelectInput(inputId = "bot_sel3", choices = c("none", dat_columns), selected = "none")
    shinyWidgets::updatePickerInput(session, inputId = "QRcode_id2", choices = c("none", dat_columns), selected = "none")
    
  }
  
  
  
  
  # Invoked to automatically set the respective input widgets if a FieldHub-generated
  # fieldbook is uploaded
  autoset_fieldhub <- function() {
    updateSelectInput(inputId = "rep_id", choices = c("none", dat_columns), selected = "REP")
    updateSelectInput(inputId = "row_id", choices = c("none", dat_columns), selected = "ROW")
    updateSelectInput(inputId = "loc_id", choices = c("none", dat_columns), selected = "LOCATION")
    updateSelectInput(inputId = "IBlock_id", choices = c("none", dat_columns), selected = "IBLOCK")
    updateSelectInput(inputId = "plot_id", choices = c("none", dat_columns), selected = "PLOT")
    updateSelectInput(inputId = "col_id", choices = c("none", dat_columns), selected = "COLUMN")
    updateSelectInput(inputId = "entry_id", choices = c("none", dat_columns), selected = "TREATMENT")
  }
  
  autoset_BMS <- function() {
    if(ext == "xls" | ext == "xlsx" ){
      updateSelectInput(inputId = "rep_id", choices = c("none", dat_columns), selected = "REP_NO")
      updateSelectInput(inputId = "row_id", choices = c("none", dat_columns), selected = "FIELDMAP RANGE")
      updateSelectInput(inputId = "loc_id", choices = c("none", dat_columns), selected = "LOCATION_NAME")
      updateSelectInput(inputId = "IBlock_id", choices = c("none", dat_columns), selected = "BLOCK_NO")
      updateSelectInput(inputId = "plot_id", choices = c("none", dat_columns), selected = "PLOT_NO")
      updateSelectInput(inputId = "col_id", choices = c("none", dat_columns), selected = "FIELDMAP COLUMN")
      updateSelectInput(inputId = "entry_id", choices = c("none", dat_columns), selected = "DESIGNATION")
    } else {
      updateSelectInput(inputId = "rep_id", choices = c("none", dat_columns), selected = "REP_NO")
      updateSelectInput(inputId = "row_id", choices = c("none", dat_columns), selected = "FIELDMAP.RANGE")
      updateSelectInput(inputId = "loc_id", choices = c("none", dat_columns), selected = "LOCATION_NAME")
      updateSelectInput(inputId = "IBlock_id", choices = c("none", dat_columns), selected = "BLOCK_NO")
      updateSelectInput(inputId = "plot_id", choices = c("none", dat_columns), selected = "PLOT_NO")
      updateSelectInput(inputId = "col_id", choices = c("none", dat_columns), selected = "FIELDMAP.COLUMN")
      updateSelectInput(inputId = "entry_id", choices = c("none", dat_columns), selected = "DESIGNATION")
      
    }
    
  }
  
  # Update picker input for label unique ID generation method when
  # depending on the method selected for label generation
  observe({
    if (input$label_type == "gp"){
      
      shinyWidgets::updatePickerInput(session, inputId = "uniqueids", 
                                      label = "Select method for unique IDs",
                                      choices = c("Universal Unique IDs" = "uuids", 
                                                  "Custom Unique IDs" = "use_my_ids"))
      
    } else if (input$label_type == "field") {
      shinyWidgets::updatePickerInput(session, inputId = "uniqueids", 
                                      label = "Select method for unique IDs",
                                      choices = c("Reproducible Unique IDs" = "get_unique_id",
                                                  "Universal Unique IDs" = "uuids", 
                                                  "Custom Unique IDs" = "use_my_ids"))
    }
  })
  
  # Update picker input for label unique ID generation method when
  # depending on the method selected for label generation
  observe({
    if (input$label_type == "gpp"){
      
      shinyWidgets::updatePickerInput(session, inputId = "uniqueids", 
                                      label = "Select method for unique IDs",
                                      choices = c("Custom Unique IDs" = "use_my_ids"))
      
    } else if (input$label_type == "field") {
      shinyWidgets::updatePickerInput(session, inputId = "uniqueids", 
                                      label = "Select method for unique IDs",
                                      choices = c("Reproducible Unique IDs" = "get_unique_id",
                                                  "Universal Unique IDs" = "uuids", 
                                                  "Custom Unique IDs" = "use_my_ids"))
    }
  })
  
  
  # Update picker input for label templates depending on the method selected 
  # for label generation
  observe({
    if (input$label_type == "gpp"){
      
      shinyWidgets::updatePickerInput(session, inputId = "templates", label = "Select a desired template",
                                      choices = c("Custom","Avery 94220", "Avery 94200", "Avery 94224",
                                                  "Avery 94237", "Avery 94207", "Avery 94241",
                                                  "Avery 94213", "Avery 94242", "OnlineLabel OL5125",
                                                  "OnlineLabel RL778", "OnlineLabel RL2800",
                                                  "OnlineLabel RL782"),
                                      selected = "Avery 94220",
                                      options = list(style = "btn-primary"))
      
      
    } else {
      shinyWidgets::updatePickerInput(session, inputId = "templates", label = "Select a desired template",
                                      choices = c("Custom","Avery 94220", "Avery 94200", "Avery 94224",
                                                  "Avery 94237", "Avery 94207", "Avery 94241",
                                                  "Avery 94213", "Avery 94242", "OnlineLabel OL5125",
                                                  "OnlineLabel RL778", "OnlineLabel RL2800",
                                                  "OnlineLabel RL782", "Treetag LTS14"),
                                      selected = "Avery 94220",
                                      options = list(style = "btn-primary"))
    }
  })
  
  
  ## Create an augmented fieldbook containing unique IDs
  create_aug_fieldbook <- function() {
    
    if (input$uniqueids == "get_unique_id" | input$uniqueids == "uuids") {
      
      updat <- dplyr::mutate(dat, UNIQUE_ID())
      colnames(updat)[ncol(updat)] <- 'UNIQUE_ID'
    } else {
      updat <- dat
    }
    
    if (colnames(updat)[1] == 'ID') {
      colnames(updat)[1] <- 'SN'
    } else {
      colnames(updat)[1] <- colnames(updat)[1] 
    }
    
    write.csv(updat, file = "Updated_Fieldbook.csv", row.names = FALSE)
  }
  
  ## Function make QR codes as raster object
  ## Input file is the unique id created for each label
  #' New wrapper function for QR code generation -- 10x faster using the qrencode
  #' library
  #' @param my_id unique ID string to be encoded to QR code
  #' @param ec_level error correction level (`0` - `3`, lowest to highest)
  make_qrcode <- function(my_id, ec_level = input$ec_level){
    
    # Create qrcode and store as a rasterGrob image
    
    aa <- raster::raster(qrencoder::qrencode_raw(as.character(my_id), ec_level))
    qr <- grid::rasterGrob(raster::as.raster(aa, col = c('white','black')),
                           interpolate = FALSE)
    
    return(qr)
  }
  
  # Create reactive objects for plot, rep, row, column, loc and entry
  
  
  lab_inf <- reactive({
    
    if (input$label_type == "field") {
      #req(input$label_type == "field")
      
      if (input$plot_id != "none") {
        plott <- paste("Plot ID:", dat[, input$plot_id]) # Plot ids
      } else (plott <- NULL)
      
      if (input$rep_id != "none") {
        repp <- paste("Rep ID:", dat[, input$rep_id]) # Rep ids
      } else (repp <- NULL)
      
      if (input$loc_id != "none") {
        loc <- paste("Loc:", dat[, input$loc_id]) # Location ids
      } else (loc <- NULL)
      
      if (input$row_id != "none") {
        roww <- paste("Row ID:", dat[, input$row_id]) # Row ids
      } else (roww <- NULL)
      
      if (input$col_id != "none") {
        coll <- paste("Col. ID:", dat[, input$col_id]) # Column ids
      } else (coll <- NULL)
      
      if (input$entry_id != "none") {
        entry <-  dat[, input$entry_id]
      } else (entry <- NULL)
      
      rnames <- rep(input$rname, nrow(dat)) # Researcher's name
      
      #' Block ids if it is an incomplete block design
      
      if (input$IBlock == TRUE) {
        
        if (input$IBlock_id != "none") {
          iblock <- paste("B:", dat[, input$IBlock_id])
          
        } else (iblock <- NULL)
        
      } else (iblock <- NULL)
      
      
      if(input$seed_source == TRUE) {
        
        if (input$seed != "none") {
          
          
          sdsource  <- paste(dat[, input$seed])
          
        } else (sdsource  <- NULL)
        
      } else (sdsource  <- NULL)
      
      # Combine all results as a list for field plot labels
      fld_all <- list(plott, roww, repp, coll, iblock, sdsource, rnames, loc, entry)
      
    } else if (input$label_type == "gp") {
      #req(input$label_type == "gp")
      
      if (input$toplt_sel_r1 != "none") {
        tp_lt_r1 <- paste(input$toplt_txt_r1, dat[, input$toplt_sel_r1]) # top left position row 1
      } else {
        tp_lt_r1 <- rep(input$toplt_txt_r1, nrow(dat))
      }
      
      if (input$toplt_sel_r2 != "none") {
        tp_lt_r2 <- paste(input$toplt_txt_r2, dat[, input$toplt_sel_r2]) # top left position row 2
      } else {
        tp_lt_r2 <- rep(input$toplt_txt_r2, nrow(dat))
      }
      
      if (input$toprt_sel_r1 != "none") {
        tp_rt_r1 <- paste(input$toprt_txt_r1, dat[, input$toprt_sel_r1]) # top right position row 1
      } else {
        tp_rt_r1 <- rep(input$toprt_txt_r1, nrow(dat))
      }
      
      if (input$toprt_sel_r2 != "none") {
        tp_rt_r2 <- paste(input$toprt_txt_r2, dat[, input$toprt_sel_r2]) # top right position row 2
      } else {
        tp_rt_r2 <- rep(input$toprt_txt_r2, nrow(dat))
      }
      
      if (input$centrt_sel_r1 != "none") {
        ct_rt_r1 <- paste(input$centrt_txt_r1, dat[, input$centrt_sel_r1]) # center right position row 1
      } else {
        ct_rt_r1 <- rep(input$centrt_txt_r1, nrow(dat))
      }
      
      if (input$centrt_sel_r2 != "none") {
        ct_rt_r2 <- paste(input$centrt_txt_r2, dat[, input$centrt_sel_r2]) # center right position row 2
      } else {
        ct_rt_r2 <- rep(input$centrt_txt_r2, nrow(dat))
      }
      
      if (input$centrt_sel_r3 != "none"){
        ct_rt_r3 <- paste(input$centrt_txt_r3, dat[, input$centrt_sel_r3]) # center right position row 1
      } else {
        ct_rt_r3 <- rep(input$centrt_txt_r3, nrow(dat))
      }
      
      if (input$botlt_sel_r1 != "none"){
        bt_lt_r1 <- paste(input$botlt_txt_r1, dat[, input$botlt_sel_r1]) # bottom left position row 1
      } else {
        bt_lt_r1 <- rep(input$botlt_txt_r1, nrow(dat))
      }
      
      if (input$botlt_sel_r2 != "none"){
        bt_lt_r2 <- paste(input$botlt_txt_r2, dat[, input$botlt_sel_r2]) # bottom left position row 2
        
      } else {
        bt_lt_r2 <- rep(input$botlt_txt_r2, nrow(dat))
      }
      
      # Combine all results as a list for general purpose plot labels
      fld_all <- list(tp_lt_r1, tp_lt_r2, tp_rt_r1, tp_rt_r2, ct_rt_r1, ct_rt_r2,
                      ct_rt_r3, bt_lt_r1, bt_lt_r2)
      
    } else if (input$label_type == "gpp") {
      
      if (input$bot_sel1 != "none") {
        text1 <- paste(input$bot_txt1, dat[, input$bot_sel1]) # bot position row 1
      } else {
        text1 <- rep(input$bot_txt1, nrow(dat))
      }
      
      if (input$bot_sel2 != "none") {
        text2 <- paste(input$bot_txt2, dat[, input$bot_sel2]) # bot position row 2
      } else {
        text2 <- rep(input$bot_txt2, nrow(dat))
      }
      
      if (input$bot_sel3 != "none") {
        text3 <- paste(input$bot_txt3, dat[, input$bot_sel3]) # bot position row 3
      } else {
        text3 <- rep(input$bot_txt3, nrow(dat))
      }
      
      if (input$cent_sel1 != "none") {
        text4 <- paste(input$cent_txt1, dat[, input$cent_sel1]) # center position row 1
      } else {
        text4 <- rep(input$cent_txt1, nrow(dat))
      }
      
      if (input$cent_sel2 != "none") {
        text5 <- paste(input$cent_txt2, dat[, input$cent_sel2]) # center position row 2
      } else {
        text5 <- rep(input$cent_txt2, nrow(dat))
      }
      
      if (input$cent_sel3 != "none") {
        text6 <- paste(input$cent_txt3, dat[, input$cent_sel3]) # center position row 3
      } else {
        text6 <- rep(input$cent_txt3, nrow(dat))
      }
      
      if (input$cent_sel4 != "none") {
        text7 <- paste(input$cent_txt4, dat[, input$cent_sel4]) # center position row 4
      } else {
        text7 <- rep(input$cent_txt4, nrow(dat))
      }
      
      if (input$top_sel1 != "none") {
        text8 <- paste(input$top_txt1, dat[, input$top_sel1]) # top position row 1
      } else {
        text8 <- rep(input$top_txt1, nrow(dat))
      }
      
      if (input$top_sel2 != "none") {
        text9 <- paste(input$top_txt2, dat[, input$top_sel2]) # top position row 2
      } else {
        text9 <- rep(input$top_txt2, nrow(dat))
      }
      
      if (input$top_sel3 != "none") {
        text10 <- paste(input$top_txt3, dat[, input$top_sel3]) # top position row 3
      } else {
        text10 <- rep(input$top_txt3, nrow(dat))
      }
      
      # Combine all results as a list for general purpose plot labels
      fld_all <- list(text1, text2, text3, text4, text5, text6, text7, text8,
                      text9, text10)
      
    }
    
    fld_all
  })
  
  # Generate unique ids for all plots
  
  UNIQUE_ID <- reactive({
    if (input$label_type == "field") {
      if (input$uniqueids == "get_unique_id") {
        
        trial_name <- gsub(" ", "_", input$tname)
        
        if (input$loc_id != "none") {
          loc2 <- dat[, input$loc_id]
        } else (loc2 <- rep("none", nrow(dat)))
        
        if (input$plot_id != "none") {
          plott2 <- dat[, input$plot_id]
        } else (plott2 <- rep(0, nrow(dat)))
        
        
        if (input$row_id != "none") {
          rows <- dat[, input$row_id]
        } else (rows <- rep(0, nrow(dat)))
        
        if (input$col_id != "none") {
          cols <- dat[, input$col_id]
        } else (cols <- rep(0, nrow(dat)))
        
        ids <- paste(paste0(gsub(" ", "", loc2), input$yr), trial_name,
                     plott2, rows, cols, sep = "_" )
        
      } else if (input$uniqueids == "uuids") {
        ids <- uuid::UUIDgenerate(use.time = TRUE, n = nrow(dat), output = "string")
        
      } else if (input$uniqueids == "use_my_ids") {
        
        ids <- dat[, input$unique_id]
      }
      
    } else if (input$label_type == "gp") {
      
      if (input$uniqueids == "uuids") {
        ids <- uuid::UUIDgenerate(use.time = TRUE, n = nrow(dat), output = "string")
        
      } else if (input$uniqueids == "use_my_ids") {
        
        
        ids <- dat[, input$QRcode_id]
      }
      
    } else if (input$label_type == "gpp") {
      
      ids <- dat[, input$QRcode_id2]
      
    }
    ids
  })
  
  # Store qr codes as reactive values
  bb <- reactiveValues(bb = NULL)
  
  observeEvent(input$gen_qrcode,{
    
    # Show the spinning animation
    shinyjs::addClass(id = "Animate", class = "fas fa-spinner fa-spin")
    req(UNIQUE_ID())
    
    # Disable the buttons so the user does not click them in the middle of processing
    shinyjs::disable(id = "gen_qrcode")
    
    shinyjs::disable(id = "ec_level")
    
    withProgress(message = paste("Generating", length(UNIQUE_ID()), "QR codes."),
                 detail = 'This may take a while...',
                 value = 0, {
                   
                   
                   bb$bb <- purrr::map(UNIQUE_ID(), make_qrcode, .progress = TRUE)
                   
                 })
    
    
    shinyjs::enable(id = "gen_qrcode")
    shinyjs::enable(id = "ec_level")
    # stop the spinning animation
    shinyjs::removeClass(id = "Animate", class = "fas fa-spinner fa-spin")
    
    # Show a modal on successful generation of QR codes
    showModal(modalDialog(title = "QR codes have been successfully generated!",
                          "Proceed to the 'Template setup' to select a label template or create a
                          custom label.", "When done, click the 'Generate labels' button to design labels.",
                          footer = modalButton("OK"),
                          easyClose = TRUE))
    
    
  })
  
  # Preview labels
  
  observeEvent(input$submit_dat,{
    
    output$preview <- renderPlot({
      
      tryCatch({
        
        # Define new coordinates for QR code
        wdt1 <- 0.5 * input$wdt
        hgt1 <- 0.5 * input$hgt
        
        qry <- hgt1/1.2
        
        bold_font <- grid::gpar(fontface = "bold", fontsize = input$font_size,
                                fontfamily = input$family)
        bold_font2 <- grid::gpar(fontface = "bold", fontsize = input$font_size-2,
                                 fontfamily = input$family)
        plain_font2 <- grid::gpar(fontface = "plain", fontsize = input$font_size-2,
                                  fontfamily = input$family)
        bold_font3 <- grid::gpar(fontface = "bold", fontsize = input$font_size-4,
                                 fontfamily = input$family)
        plain_font3 <- grid::gpar(fontface = "plain", fontsize = input$font_size-4,
                                  fontfamily = input$family)
        plain_font4 <- grid::gpar(fontface = "plain", fontsize = input$font_size-floor(input$font_size/2.5),
                                  fontfamily = input$family)
        bold_font4 <- grid::gpar(fontface = "bold", fontsize = input$font_size-floor(input$font_size/2.5),
                                 fontfamily = input$family)
        
        if (input$label_type == "gp" || input$label_type == "field") {
          if (input$templates == "Treetag LTS14") {
            
            
            tt <- grid::viewport(x = grid::unit(0, "npc"),
                                 y = grid::unit(1, "npc"),
                                 width = grid::unit(input$wdt, "in"),
                                 height = grid::unit(input$hgt, "in"),
                                 just = c('left','top'))
            
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
                                 width = grid::unit(0.55*input$wdt, "in"),
                                 height = grid::unit(0.8*hgt1, "in"),
                                 just = "left")
            
            # Viewport for second QR code
            qq2 <- grid::viewport(x = grid::unit(0.5, "npc"),
                                  y = grid::unit(0.9, "npc"),
                                  width = grid::unit(wdt1, "inches"),
                                  height = grid::unit(qry, "inches"),
                                  just = c('center'))
            
            px <- 0.11*input$wdt # x coordinate for plot
            
            py <- 0.05*input$hgt # y coordinate for plot
            
            rx <- 0.27*input$wdt # x coordinate for row
            
            ry <- 0.4*input$hgt # y coordinate for Rep
            
            lx <- 0.9*input$wdt # x coordinate for location
            
            ly <- 0.4*input$hgt # y coordinate for location
            
            ex <- 0.9*input$wdt # x coordinate for first entry
            
            ee <- 0.85*input$wdt # x coordinate for second entry
            
            ey <- 0.83*input$hgt # y coordinate for second entry
            
            nx <- 0.6*input$wdt # x coordinate for researcher's name
            
            
            grid::pushViewport(tt)
            
            # if (input$rounded == TRUE) {
            #   grid::grid.roundrect(gp = grid::gpar(lwd = 0.5))
            # } else (grid::grid.rect(gp = grid::gpar(lwd = 0.5)))
            
            # Draw rectangle around labels
            if (input$rect == TRUE) {
              
              if (input$rounded == TRUE) {
                grid::grid.roundrect(gp = grid::gpar(lwd = 0.5))
              } else (grid::grid.rect(gp = grid::gpar(lwd = 0.5)))
              
            } 
            
            # Add Plot ID to label; note coordinates
            grid::grid.text(label = lab_inf()[[1]][input$lab_sel],
                            x = grid::unit(px, "in"),
                            y = grid::unit(py, "in"), rot = 90,
                            gp = bold_font, hjust = 0, vp = tt)
            
            # Add Rep ID to label; note coordinates
            grid::grid.text(label = lab_inf()[[3]][input$lab_sel],
                            x= grid::unit(px, "in"),
                            y = grid::unit(ry, "in"), rot = 90,
                            gp = bold_font, hjust = 0, vp = tt)
            
            # Add Row ID to label; note coordinates
            grid::grid.text(label = lab_inf()[[2]][input$lab_sel],
                            x = grid::unit(rx, "in"),
                            y = grid::unit(py, "in"), rot = 90,
                            gp = bold_font2, hjust = 0, vp = tt)
            
            # Add column ID to label; note coordinates
            grid::grid.text(label = lab_inf()[[4]][input$lab_sel],
                            x = grid::unit(rx, "in"),
                            y = grid::unit(ry, "in"), rot = 90,
                            gp = bold_font2, hjust = 0, vp = tt)
            
            
            # Define viewport for QR code; note coordinates and dimension
            
            grid::pushViewport(qq)
            
            # Add first QR code
            grid::grid.draw(bb$bb[[input$lab_sel]])
            grid::popViewport()
            
            # Define viewport for Block ID if it is an incomplete block design
            
            grid::pushViewport(bl)
            
            # Add Block ID to label; note coordinates
            grid::grid.text(label = lab_inf()[[5]][input$lab_sel],
                            x = grid::unit(0.2, "npc"),
                            y = grid::unit(0.35, "npc"),
                            rot = 360, gp = bold_font2,
                            hjust = 0)
            
            
            # Go back to label viewport
            grid::upViewport()
            
            # Add location of experiment to label
            # grid::grid.text(label = lab_inf()[[8]][input$lab_sel],
            #                 rot = 90,
            #                 x = grid::unit(lx, "in"),
            #                 y = grid::unit(ly, "in"),
            #                 gp = bold_font3, hjust = 0, vp = tt)
            
            grid::grid.text(label = UNIQUE_ID()[input$lab_sel],
                            rot = 90,
                            x = grid::unit(lx, "in"),
                            y = grid::unit(ly, "in"),
                            gp = bold_font3, hjust = 0, vp = tt)
            
            
            # Add seed source to label; note coordinates
            grid::grid.text(label = lab_inf()[[6]][input$lab_sel],
                            x = grid::unit(0.6, "npc"),
                            y = grid::unit(0.35, "npc"),
                            rot = 90, vp = tt,
                            gp = bold_font3, hjust = 0, )
            
            # Add researcher's name to label; note coordinates
            grid::grid.text(label = lab_inf()[[7]][input$lab_sel],
                            x = grid::unit(0.72, "npc"),
                            y = grid::unit(0.35, "npc"),
                            rot = 90, vp = tt,
                            gp = bold_font3, hjust = 0, )
            
            
            # Add entry or treatment name to label
            grid::grid.text(label = lab_inf()[[9]][input$lab_sel], rot = 90,
                            x= grid::unit(ex, "in"),
                            y = grid::unit(py, "in"),
                            gp = bold_font3, hjust = 0, vp = tt)
            
            # Add entry or treatment name to label
            grid::grid.text(label = lab_inf()[[9]][input$lab_sel], rot = 90,
                            x = grid::unit(ee, "in"),
                            y = grid::unit(ey, "in"),
                            gp = bold_font4, hjust = 0, vp = tt)
            
            grid::pushViewport(qq2)
            
            # Add second QR code
            grid::grid.draw(bb$bb[[input$lab_sel]])
            
            grid::popViewport()
            # End for treetag field plot label preview
            
          } else if (input$templates != "Treetag LTS14") {
            
            
            #' Create a viewport for each label
            aa <- grid::viewport(x = grid::unit(0, "npc"),
                                 y = grid::unit(1, "npc"),
                                 width = grid::unit(input$wdt, "in"),
                                 height = grid::unit(input$hgt, "in"),
                                 just = c('left','top'))
            
            # Define viewport for QR code; note coordinates and dimension
            
            qq <- grid::viewport(x = grid::unit(0.5, "npc"),
                                 width = grid::unit(wdt1, "in"),
                                 height = grid::unit(qry, "in"),
                                 just = c('right','center'))
            
            # Define viewport for Block ID if it is an incomplete block design
            
            bl <- grid::viewport(x = grid::unit(0.47, "npc"),
                                 width = grid::unit(0.55*input$wdt, "in"),
                                 height = grid::unit(0.8*hgt1, "in"),
                                 just = "left")
            
            # Coordinates for adding text labels to grids
            px <- 0.1*input$wdt # x coordinate for plot
            
            py <- 0.92*input$hgt # y coordinate for plot
            
            rx <- 0.6*input$wdt # x coordinate for rep
            
            ry <- 0.78*input$hgt # y coordinate for row
            
            ly <- 0.22*input$hgt # y coordinate for location
            
            ex <- 0.05*input$wdt # x coordinate for entry
            
            ey <- 0.1*input$hgt # y coordinate for entry
            
            grid::pushViewport(aa)
            
            # if (input$rounded == TRUE) {
            #   grid::grid.roundrect(gp = grid::gpar(lwd = 0.5))
            # } else (grid::grid.rect(gp = grid::gpar(lwd = 0.5)))
            
            # Draw rectangle around labels
            if (input$rect == TRUE) {
              
              if (input$rounded == TRUE) {
                grid::grid.roundrect(gp = grid::gpar(lwd = 0.5))
              } else (grid::grid.rect(gp = grid::gpar(lwd = 0.5)))
              
            } 
            
            # Add Plot ID to label; note coordinates
            grid::grid.text(label = lab_inf()[[1]][input$lab_sel],
                            x = grid::unit(px, "in"),
                            y = grid::unit(py, "in"),
                            gp = bold_font, hjust = 0, vp = aa)
            
            # Add Rep ID to label; note coordinates
            grid::grid.text(label = lab_inf()[[3]][input$lab_sel],
                            x = grid::unit(rx, "in"),
                            y = grid::unit(py, "in"),
                            gp = bold_font, hjust = 0, vp = aa)
            
            # Add Row ID to label; note coordinates
            grid::grid.text(label = lab_inf()[[2]][input$lab_sel],
                            x = grid::unit(px, "in"),
                            y = grid::unit(ry, "in"),
                            gp = bold_font2, hjust = 0, vp = aa)
            
            # Add column ID to label; note coordinates
            grid::grid.text(label = lab_inf()[[4]][input$lab_sel],
                            x = grid::unit(rx, "in"),
                            y = grid::unit(ry, "in"),
                            gp = bold_font2, hjust = 0, vp = aa)
            
            # Add seed source to label; note coordinates
            grid::grid.text(label = lab_inf()[[6]][input$lab_sel],
                            x = grid::unit(0.42, "npc"),
                            y = grid::unit(0.47, "npc"),
                            gp = bold_font3, hjust = 0, vp = aa)
            
            # Add researcher's name to label; note coordinates
            grid::grid.text(label = lab_inf()[[7]][input$lab_sel],
                            x = grid::unit(0.42, "npc"),
                            y = grid::unit(0.35, "npc"),
                            gp = bold_font3, hjust = 0, vp = aa)
            
            
            # Push viewport for qr code
            
            grid::pushViewport(qq)
            
            # Add QR code
            grid::grid.draw(bb$bb[[input$lab_sel]])
            grid::popViewport()
            
            # Define viewport for Block ID if it is an incomplete block design
            
            grid::pushViewport(bl)
            
            # Add Block ID to label; note coordinates
            
            grid::grid.text(label = lab_inf()[[5]][input$lab_sel],
                            x = grid::unit(0.01, "npc"),
                            y = grid::unit(0.8, "npc"),
                            gp = bold_font2, hjust = 0)
            
            # Go back to label viewport
            grid::upViewport()
            
            # Add location of experiment to label
            # grid::grid.text(label = lab_inf()[[8]][input$lab_sel],
            #                 x= grid::unit(px, "in"),
            #                 y = grid::unit(ly, "in"),
            #                 gp = bold_font3, hjust = 0, vp = aa)
            
            grid::grid.text(label = UNIQUE_ID()[input$lab_sel],
                            x= grid::unit(px, "in"),
                            y = grid::unit(ly, "in"),
                            gp = bold_font3, hjust = 0, vp = aa)
            
            # Add entry or treatment name to label
            grid::grid.text(label = lab_inf()[[9]][input$lab_sel],
                            x= grid::unit(ex, "in"),
                            y = grid::unit(ey, "in"),
                            gp = bold_font3, hjust = 0, vp = aa)
            
            grid::popViewport()
            
          }
          
        } else if (input$label_type == "gpp"){
          if (input$templates != "Treetag LTS14") {
            qq <- grid::viewport(x = grid::unit(1, "npc"),
                                 width = grid::unit(wdt1, "in"),
                                 height = grid::unit(qry, "in"),
                                 just = c('right','center'))
            
            # Create a viewport for each label
            aa <- grid::viewport(x = grid::unit(0, "npc"),
                                 y = grid::unit(1, "npc"),
                                 width = grid::unit(input$wdt, "in"),
                                 height = grid::unit(input$hgt, "in"),
                                 just = c('left','top'))
            
            txt1x <- 0.95*input$wdt # x coordinate for txt1
            
            txt1y <- 0.05*input$hgt # y coordinate for txt1
            
            txt2x <- 0.9*input$wdt # x coordinate for txt2
            
            txt3x <- 0.6*input$wdt # y coordinate for txt3
            
            txt4x <- 0.5*input$wdt # y coordinate for txt4
            
            txt5x <- 0.4*input$wdt # x coordinate for txt5
            
            txt6x <- 0.3*input$wdt # x coordinate for txt6 and 7
            
            txt7y <- 0.55*input$hgt # y coordinate for txt7 and 9
            
            txt8x <- 0.2*input$wdt # x coordinate for txt8 and txt9
            
            txt10x <- 0.05*input$wdt # y coordinate for txt10
            
            grid::pushViewport(aa)
            
            # if (input$rounded == TRUE) {
            #   grid::grid.roundrect(gp = grid::gpar(lwd = 0.5))
            # } else (grid::grid.rect(gp = grid::gpar(lwd = 0.5)))
            
            # Draw rectangle around labels
            if (input$rect == TRUE) {
              
              if (input$rounded == TRUE) {
                grid::grid.roundrect(gp = grid::gpar(lwd = 0.5))
              } else (grid::grid.rect(gp = grid::gpar(lwd = 0.5)))
              
            } 
            
            # Add text1 to label (bottom position 1); note coordinates
            grid::grid.text(label = lab_inf()[[1]][input$lab_sel],
                            x = grid::unit(txt1x, "in"),
                            y = grid::unit(txt1y, "in"), rot = 90,
                            gp = bold_font2, hjust = 0, vp = aa)
            
            # Add text2 to label (bottom position 2); note coordinates
            grid::grid.text(label = lab_inf()[[2]][input$lab_sel],
                            x = grid::unit(txt2x, "in"),
                            y = grid::unit(txt1y, "in"), rot = 90,
                            gp = bold_font4, hjust = 0, vp = aa)
            
            
            # Add text3 to label (bottom position 3); note coordinates
            grid::grid.text(label = lab_inf()[[3]][input$lab_sel],
                            x = grid::unit(txt3x, "in"),
                            y = grid::unit(txt1y, "in"), rot = 90,
                            gp = plain_font3, hjust = 0, vp = aa)
            
            # Add text4 to label (center position 1); note coordinates
            grid::grid.text(label = lab_inf()[[4]][input$lab_sel],
                            x = grid::unit(txt4x, "in"),
                            y = grid::unit(txt1y, "in"), rot = 90,
                            gp = plain_font3, hjust = 0, vp = aa)
            
            # Add text5 to label (center position 2); note coordinates
            grid::grid.text(label = lab_inf()[[5]][input$lab_sel],
                            x = grid::unit(txt5x, "in"),
                            y = grid::unit(txt1y, "in"), rot = 90,
                            gp = bold_font2, just = c(-0.5, 0.5), vp = aa)
            
            
            # Define viewport for QR code; note coordinates and dimension
            
            grid::pushViewport(qq)
            
            # Add first QR code
            grid::grid.draw(bb$bb[[input$lab_sel]])
            # grid::popViewport()
            
            
            # Go back to label viewport
            grid::upViewport()
            
            # Add text6 to label (center position 3); note coordinates
            grid::grid.text(label = lab_inf()[[6]][input$lab_sel],
                            x = grid::unit(txt6x, "in"),
                            y = grid::unit(txt1y, "in"), rot = 90,
                            gp = bold_font3, hjust = 0, vp = aa)
            
            
            # Add text7 to label (center position 4); note coordinates
            grid::grid.text(label = lab_inf()[[7]][input$lab_sel],
                            x = grid::unit(txt6x, "in"),
                            y = grid::unit(txt7y, "in"), rot = 90,
                            gp = bold_font3, hjust = 0, vp = aa)
            
            
            # Add text8 to label (top position 1); note coordinates
            grid::grid.text(label = lab_inf()[[8]][input$lab_sel],
                            x = grid::unit(txt8x, "in"),
                            y = grid::unit(txt1y, "in"), rot = 90,
                            gp = bold_font3, hjust = 0, vp = aa)
            
            
            # Add text9 to label (top position 2); note coordinates
            grid::grid.text(label = lab_inf()[[9]][input$lab_sel],
                            x = grid::unit(txt8x, "in"),
                            y = grid::unit(txt7y, "in"), rot = 90,
                            gp = bold_font3, hjust = 0, vp = aa)
            
            
            # Add text10 to label (top position 3); note coordinates
            grid::grid.text(label = lab_inf()[[10]][input$lab_sel],
                            x = grid::unit(txt10x, "in"),
                            y = grid::unit(txt1y, "in"), rot = 90,
                            gp = bold_font, hjust = 0, vp = aa)
            
            
            grid::popViewport()
            
          }
        }
        
      },
      warning = function(cond) {
        showModal(modalDialog(title = "Warning",
                              "Warnings. Please double-check entered values in order to
                            produce the expected results."))
      },
      error = function(cond) {
        showModal(modalDialog(title = "Error",
                              "A label preview error occurred. Check the page/label setting parameters or
                           the input for label to preview."))
        
      })
      
    }) # end of label preview
    
  })
  
  
  # Generate labels functions
  create_label <- function(){
    
    # Calculate space between label columns if any
    if (input$numcol == 1) {
      col_space <- 0
    } else {col_space <- (input$page_wdt - input$left_mar - input$right_mar -
                            input$numcol*input$wdt)/(input$numcol-1)
    }
    
    # Calculate space between label rows if any
    if (input$numrow == 1) {
      row_space <- 0
    } else {row_space <- (input$page_hgt - input$top_mar - input$bot_mar -
                            input$numrow*input$hgt)/(input$numrow-1)
    }
    
    #' Check if page setup matches label setup per page.
    #' Error message if either column spaces or the row spaces between labels 
    #' are less than zero
    
    if (col_space < 0 | row_space < 0) {
      
      showModal(modalDialog(title = "Error",
                            "Page setup does not match label setup per page!"))
    }
    
    # clean up any open graphical devices if function fails
    on.exit(grDevices::graphics.off())
    
    
    if (input$label_type == "field") {
      plotid <- lab_inf()[[1]] # Plot ids
      repid <- lab_inf()[[2]] # Rep ids
      rowid <- lab_inf()[[3]] # Row ids
      colid <- lab_inf()[[4]]   # Column ids
      Blkid <- lab_inf()[[5]] # iBlocks
      seed_src <- lab_inf()[[6]] # seed source
      rname <- lab_inf()[[7]]
      ids <-  UNIQUE_ID() # unique ids
      Entry <- lab_inf()[[9]]# Entry or treatment ids
      
      qrcds <- bb$bb # QR codes
      
      # if (input$all_labels == TRUE & input$bal_design == FALSE ) {
      #   plotid <- lab_inf()[[1]] # Plot ids
      #   repid <- lab_inf()[[2]] # Rep ids
      #   rowid <- lab_inf()[[3]] # Row ids
      #   colid <- lab_inf()[[4]]   # Column ids
      #   Blkid <- lab_inf()[[5]] # iBlocks
      #   seed_src <- lab_inf()[[6]] # seed source
      #   rname <- lab_inf()[[7]]
      #   ids <-  UNIQUE_ID() # unique ids
      #   Entry <- lab_inf()[[9]]# Entry or treatment ids
      #   
      #   qrcds <- bb$bb # QR codes
      
      # } else if (input$all_labels == FALSE & input$bal_design == TRUE) {
      #   
      #   cc <- which(dat[, input$rep_id] == input$REP & dat[, input$loc_id] == input$LOC)
      #   
      #   plotid <- lab_inf()[[1]][cc] # Plot ids
      #   repid <- lab_inf()[[2]][cc] # Rep ids
      #   rowid <- lab_inf()[[3]][cc] # Row ids
      #   colid <- lab_inf()[[4]][cc]   # Column ids
      #   Blkid <- lab_inf()[[5]][cc] # iBlocks
      #   seed_src <- lab_inf()[[6]][cc] # seed source
      #   rname <- lab_inf()[[7]][cc]
      #   ids <-  UNIQUE_ID()[cc] # unique ids
      #   Entry <- lab_inf()[[9]][cc] # Entry or treatment ids
      #   
      #   qrcds <- bb$bb[cc] # QR codes
      #   
      
      # } else if (input$all_labels == FALSE & input$bal_design == FALSE) {
      #   
      #   cc <- which(dat[,input$loc_id] == input$LOC)
      #   
      #   plotid <- lab_inf()[[1]][cc] # Plot ids
      #   repid <- lab_inf()[[2]][cc] # Rep ids
      #   rowid <- lab_inf()[[3]][cc] # Row ids
      #   colid <- lab_inf()[[4]][cc]   # Column ids
      #   Blkid <- lab_inf()[[5]][cc] # iBlocks
      #   seed_src <- lab_inf()[[6]][cc] # seed source
      #   rname <- lab_inf()[[7]][cc]
      #   ids <-  UNIQUE_ID()[cc] # unique ids
      #   Entry <- lab_inf()[[9]][cc] # Entry or treatment ids
      #   
      #   qrcds <- bb$bb[cc] # QR codes
      #   
      # }
      
    } else if (input$label_type == "gp") {
      plotid <- lab_inf()[[1]] # Top-left row 1
      repid <- lab_inf()[[3]] # Top-left row 2
      rowid <- lab_inf()[[2]] # Top-right row 1
      colid <- lab_inf()[[4]] # Top-right row 2
      Blkid <- lab_inf()[[5]] # Center-right row 1
      seed_src <- lab_inf()[[6]] # Center-right row 2
      rname <- lab_inf()[[7]] # Center-right row 3
      ids <-  lab_inf()[[8]] # Bottom-left row 1
      Entry <- lab_inf()[[9]]# Bottom-left row 2
      
      qrcds <- bb$bb # QR codes
    }
    
    nn <- length(qrcds)
    
    # Call the function to create the augmented fieldbook containing unique IDs
    create_aug_fieldbook()
    
    
    #' Generate label positions -- prints across rows of grid layout
    #pos <- expand.grid(x = 1:input$numcol, y = 1:input$numrow)
    
    # Generate label positions -- prints across rows of grid layout
    if (input$print_across == TRUE) {
      
      pos <- expand.grid(x = 1:input$numcol, y = 1:input$numrow)
      
    } else {
      
      pos <- expand.grid(y = 1:input$numrow, x = 1:input$numcol)
      
    }
    
    
    duplication <- ceiling(nn/nrow(pos))
    
    label_pos <- do.call("rbind", replicate(duplication, pos, simplify = FALSE))
    
    corx <- label_pos$x # label x coordinate
    
    cory <- label_pos$y # label y coordinate
    
    #' Create pdf file to be saved in working directory
    
    pdf_filename <<- paste0(input$filename, paste0(input$wdt,'in'), 'x',
                            paste0(input$hgt,'in'), Sys.time()) # name of pdf file
    
    pdf_filename <<- paste0(gsub(":","_", pdf_filename), ".pdf")
    
    
    #' Font size to print text on labels
    fsize <- input$font_size
    
    # Define new coordinates for QR code
    wdt1 <- 0.5 * input$wdt
    hgt1 <- 0.5 * input$hgt
    
    qry <- hgt1/1.2
    
    #' Create pdf file
    #' The argument input$family specifies the initial/default font input$family to be
    #' used. Device-independent fonts include "sans", "serif", and "mono",
    
    grDevices::pdf(pdf_filename,
                   width = input$page_wdt,
                   height = input$page_hgt,
                   onefile = TRUE,
                   family = input$family) # Letter size paper from Avery
    
    #' Grid layout for labels
    label_layout <- grid::grid.layout(input$numrow, input$numcol,
                                      widths = grid::unit(c(rep(input$wdt + col_space,input$numcol-1),
                                                            input$wdt), "in"),
                                      heights = grid::unit(c(rep(input$hgt + row_space,input$numrow-1),
                                                             input$hgt), "in"))
    
    
    if (input$templates == "Treetag LTS14") {
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
                           width = grid::unit(0.55*input$wdt, "in"),
                           height = grid::unit(0.8*hgt1, "in"),
                           just = "left")
      
      # Viewport for second QR code
      qq2 <- grid::viewport(x = grid::unit(0.5, "npc"),
                            y = grid::unit(0.9, "npc"),
                            width = grid::unit(wdt1, "inches"),
                            height = grid::unit(qry, "inches"),
                            just = c('center'))
      
      px <- 0.11*input$wdt # x coordinate for plot
      
      py <- 0.05*input$hgt # y coordinate for plot
      
      rx <- 0.27*input$wdt # x coordinate for row
      
      ry <- 0.4*input$hgt # y coordinate for Rep
      
      lx <- 0.9*input$wdt # x coordinate for location
      
      ly <- 0.4*input$hgt # y coordinate for location
      
      ex <- 0.9*input$wdt # x coordinate for first entry
      
      ee <- 0.85*input$wdt # x coordinate for second entry
      
      ey <- 0.83*input$hgt # y coordinate for second entry
      
      nx <- 0.6*input$wdt # x coordinate for researcher's name
      
    } else {
      #' Create a viewport for each label
      aa <- grid::viewport(x = grid::unit(0, "npc"),
                           y = grid::unit(1, "npc"),
                           width = grid::unit(input$wdt, "in"),
                           height = grid::unit(input$hgt, "in"),
                           just = c('left','top'))
      
      # Define viewport for QR code; note coordinates and dimension
      
      qq <- grid::viewport(x = grid::unit(0.5, "npc"),
                           width = grid::unit(wdt1, "in"),
                           height = grid::unit(qry, "in"),
                           just = c('right','center'))
      
      # Define viewport for Block ID if it is an incomplete block design
      
      bl <- grid::viewport(x = grid::unit(0.47, "npc"),
                           width = grid::unit(0.55*input$wdt, "in"),
                           height = grid::unit(0.8*hgt1, "in"),
                           just = "left")
      
      # Coordinates for adding text labels to grids
      px <- 0.1*input$wdt # x coordinate for plot
      
      py <- 0.92*input$hgt # y coordinate for plot
      
      rx <- 0.6*input$wdt # x coordinate for rep
      
      ry <- 0.78*input$hgt # y coordinate for row
      
      ly <- 0.22*input$hgt # y coordinate for location
      
      ex <- 0.05*input$wdt # x coordinate for entry
      
      ey <- 0.1*input$hgt # y coordinate for entry
      
    } # end of if statement to create viewports
    
    # Viewport for a new page
    new.page <- grid::viewport(width = grid::unit(input$page_wdt, "in"),
                               height = grid::unit(input$page_hgt, "in"))
    
    #' Create a viewport for each page using grid layout
    lab_vp <- grid::viewport(layout = label_layout)
    grid::pushViewport(lab_vp)
    
    bold_font <- grid::gpar(fontface = "bold", fontsize = fsize)
    bold_font2 <- grid::gpar(fontface = "bold", fontsize = fsize-2)
    plain_font2 <- grid::gpar(fontface = "plain", fontsize = fsize-2)
    plain_font3 <- grid::gpar(fontface = "plain", fontsize = fsize-4)
    bold_font3 <- grid::gpar(fontface = "bold", fontsize = fsize-4)
    bold_font4 <- grid::gpar(fontface = "bold", fontsize = floor(fsize/2.5))
    plain_font4 <- grid::gpar(fontface = "plain", fontsize = floor(fsize/2.5))
    
    withProgress(message = paste("Designing", nn, "labels."), value = 0, {
      
      for (i in seq_len(nn)) {
        
        # Increment the progress bar, and update the detail text.
        incProgress(1/nn, detail = paste("Label", i))
        
        label_posn <- c(x = corx[i], y = cory[i])
        
        # Generate QR code
        #bb <- make_qr(UNIQUE_ID[i])
        
        if (all(i != 1 & label_posn == c(1, 1))) {
          grid::grid.newpage()
          
          grid::pushViewport(new.page)
          grid::pushViewport(lab_vp)
          
        }
        
        if (input$templates == "Treetag LTS14") {
          
          tt <- grid::viewport(layout.pos.row = label_posn['y'],
                               layout.pos.col = label_posn['x'])
          
          
          grid::pushViewport(tt)
          
          # if (input$rounded == TRUE) {
          #   grid::grid.roundrect(gp = grid::gpar(lwd = 0.5))
          # } else (grid::grid.rect(gp = grid::gpar(lwd = 0.5)))
          
          # Draw rectangle around labels
          if (input$rect == TRUE) {
            
            if (input$rounded == TRUE) {
              grid::grid.roundrect(gp = grid::gpar(lwd = 0.5))
            } else (grid::grid.rect(gp = grid::gpar(lwd = 0.5)))
            
          } 
          
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
          grid::grid.draw(qrcds[[i]])
          grid::popViewport()
          
          # Define viewport for Block ID if it is an incomplete block design
          
          grid::pushViewport(bl)
          
          # Add Block ID to label; note coordinates
          grid::grid.text(label = Blkid[i],
                          x = grid::unit(0.2, "npc"),
                          y = grid::unit(0.35, "npc"),
                          rot = 360, gp = plain_font2, hjust = 0)
          
          
          # Go back to label viewport
          grid::upViewport()
          
          # Add Unique ID to label
          grid::grid.text(label = ids[i], rot = 90,
                          x= grid::unit(lx, "in"),
                          y = grid::unit(ly, "in"),
                          gp = plain_font4, hjust = 0, vp = tt)
          
          # Add seed source to label; note coordinates
          grid::grid.text(label = seed_src[i],
                          x = grid::unit(0.6, "npc"),
                          y = grid::unit(0.35, "npc"),
                          rot = 90, vp = tt,
                          gp = plain_font3, hjust = 0, )
          
          # Add researcher's name to label; note coordinates
          grid::grid.text(label = rname[i],
                          x = grid::unit(0.72, "npc"),
                          y = grid::unit(0.35, "npc"),
                          rot = 90, vp = tt,
                          gp = plain_font3, hjust = 0, )
          
          
          # Add entry or treatment name to label
          grid::grid.text(label = Entry[i], rot = 90,
                          x= grid::unit(ex, "in"),
                          y = grid::unit(py, "in"),
                          gp = bold_font3, hjust = 0, vp = tt)
          
          # Add entry or treatment name to label tear-off
          grid::grid.text(label = Entry[i], rot = 90,
                          x = grid::unit(ee, "in"),
                          y = grid::unit(ey, "in"),
                          gp = bold_font3, hjust = 0, vp = tt)
          
          grid::pushViewport(qq2)
          
          # Add second QR code
          grid::grid.draw(qrcds[[i]])
          
          grid::popViewport(2)
          
        } else {
          grid::pushViewport(grid::viewport(layout.pos.row=label_posn['y'],
                                            layout.pos.col=label_posn['x']))
          grid::pushViewport(aa)
          
          # if(input$rounded == TRUE){
          #   grid::grid.roundrect(gp = grid::gpar(lwd = 0.5))
          # }else(grid::grid.rect(gp = grid::gpar(lwd = 0.5)))
          
          # Draw rectangle around labels
          if (input$rect == TRUE) {
            
            if (input$rounded == TRUE) {
              grid::grid.roundrect(gp = grid::gpar(lwd = 0.5))
            } else (grid::grid.rect(gp = grid::gpar(lwd = 0.5)))
            
          } 
          
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
          grid::grid.text(label = seed_src[i],
                          x = grid::unit(0.42, "npc"),
                          y = grid::unit(0.47, "npc"),
                          gp = plain_font3, hjust = 0, vp = aa)
          
          # Add researcher's name to label; note coordinates
          grid::grid.text(label = rname[i],
                          x = grid::unit(0.42, "npc"),
                          y = grid::unit(0.35, "npc"),
                          gp = plain_font3, hjust = 0, vp = aa)
          
          # Push viewport for qr code
          
          grid::pushViewport(qq)
          
          # Add QR code
          grid::grid.draw(qrcds[[i]])
          grid::popViewport()
          
          # Define viewport for Block ID if it is an incomplete block design
          
          grid::pushViewport(bl)
          
          # Add Block ID to label; note coordinates
          grid::grid.text(label = Blkid[i],
                          x = grid::unit(0.01, "npc"),
                          y = grid::unit(0.8, "npc"),
                          gp = plain_font2, hjust = 0)
          
          # Go back to label viewport
          grid::upViewport()
          
          # Add Unique ID to label
          grid::grid.text(label = ids[i],
                          x= grid::unit(px, "in"),
                          y = grid::unit(ly, "in"),
                          gp = plain_font4, hjust = 0, vp = aa)
          
          # Add entry or treatment name to label
          grid::grid.text(label = Entry[i],
                          x= grid::unit(ex, "in"),
                          y = grid::unit(ey, "in"),
                          gp = bold_font3, hjust = 0, vp = aa)
          
          grid::popViewport(2)
        }
        
      }
    })
    #grDevices::dev.off()
    
    # Show a modal on successful generation of labels
    showModal(modalDialog(title = "Success", "Labels have been successfully generated!
                          Click the 'Download labels' button to download a PDF file
                          containing the generated labels to your computer.",
                          footer = modalButton("OK"),
                          easyClose = TRUE))
    
    # Enable the initially disabled 'Download labels' button
    shinyjs::enable(id = "down_labels")
    shinyjs::enable(id = "down_fieldbook")
  } # End of create_label for field plot and gp landscape
  
  
  #---------------------------------------------------------------------------------------#
  
  gp_label_portrait <- function() {
    
    # Calculate space between label columns if any
    if (input$numcol == 1) {
      col_space <- 0
    } else {col_space <- (input$page_wdt - input$left_mar - input$right_mar -
                            input$numcol*input$wdt)/(input$numcol-1)
    }
    
    # Calculate space between label rows if any
    if (input$numrow == 1) {
      row_space <- 0
    } else {row_space <- (input$page_hgt - input$top_mar - input$bot_mar -
                            input$numrow*input$hgt)/(input$numrow-1)
    }
    
    #' Check if page setup matches label setup per page.
    #' Error message if either column spaces or the row spaces between labels 
    #' are less than zero
    
    if (col_space < 0 | row_space < 0) {
      
      showModal(modalDialog(title = "Error",
                            "Page setup does not match label setup per page!"))
    }
    
    # clean up any open graphical devices if function fails
    on.exit(grDevices::graphics.off())
    
    if (input$label_type == "gpp") {
      text1 <- lab_inf()[[1]] # Top-left row 1
      text2 <- lab_inf()[[2]] # Top-left row 2
      text3 <- lab_inf()[[3]] # Top-right row 1
      text4 <- lab_inf()[[4]] # Top-right row 2
      text5 <- lab_inf()[[5]] # Center-right row 1
      text6 <- lab_inf()[[6]] # Center-right row 2
      text7 <- lab_inf()[[7]] # Center-right row 3
      text8 <-  lab_inf()[[8]] # Bottom-left row 1
      text9 <- lab_inf()[[9]]# Bottom-left row 2
      text10 <- lab_inf()[[10]]# Bottom-left row 2
      
      qrcds <- bb$bb # QR codes
    }
    
    nn <- length(qrcds)
    
    #' Generate label positions -- prints across rows of grid layout
    # pos <- expand.grid(x = 1:input$numcol, y = 1:input$numrow)
    # Generate label positions -- prints across rows of grid layout
    if (input$print_across == TRUE) {
      
      pos <- expand.grid(x = 1:input$numcol, y = 1:input$numrow)
      
    } else {
      
      pos <- expand.grid(y = 1:input$numrow, x = 1:input$numcol)
      
    }
    
    duplication <- ceiling(nn/nrow(pos))
    
    label_pos <- do.call("rbind", replicate(duplication, pos, simplify = FALSE))
    
    corx <- label_pos$x # label x coordinate
    
    cory <- label_pos$y # label y coordinate
    
    #' Create pdf file to be saved in working directory
    
    pdf_filename <<- paste0(input$filename, paste0(input$wdt,'in'), 'x',
                            paste0(input$hgt,'in'), Sys.time()) # name of pdf file
    
    pdf_filename <<- paste0(gsub(":","_", pdf_filename), ".pdf")
    
    
    #' Font size to print text on labels
    fsize <- input$font_size
    
    # Define new coordinates for QR code
    wdt1 <- 0.5 * input$wdt
    hgt1 <- 0.5 * input$hgt
    
    qry <- hgt1/1.2
    
    #' Create pdf file
    #' The argument input$family specifies the initial/default font input$family to be
    #' used. Device-independent fonts include "sans", "serif", and "mono",
    
    grDevices::pdf(pdf_filename,
                   width = input$page_wdt,
                   height = input$page_hgt,
                   onefile = TRUE,
                   family = input$family) # Letter size paper from Avery
    
    #' Grid layout for labels
    label_layout <- grid::grid.layout(input$numrow, input$numcol,
                                      widths = grid::unit(c(rep(input$wdt + col_space,input$numcol-1),
                                                            input$wdt), "in"),
                                      heights = grid::unit(c(rep(input$hgt + row_space,input$numrow-1),
                                                             input$hgt), "in"))
    
    qq <- grid::viewport(x = grid::unit(1, "npc"),
                         width = grid::unit(wdt1, "in"),
                         height = grid::unit(qry, "in"),
                         just = c('right','center'))
    
    # Create a viewport for each label
    aa <- grid::viewport(x = grid::unit(0, "npc"),
                         y = grid::unit(1, "npc"),
                         width = grid::unit(input$wdt, "in"),
                         height = grid::unit(input$hgt, "in"),
                         just = c('left','top'))
    
    txt1x <- 0.95*input$wdt # x coordinate for txt1
    
    txt1y <- 0.05*input$hgt # y coordinate for txt1
    
    txt2x <- 0.9*input$wdt # x coordinate for txt2
    
    txt3x <- 0.6*input$wdt # y coordinate for txt3
    
    txt4x <- 0.5*input$wdt # y coordinate for txt4
    
    txt5x <- 0.4*input$wdt # x coordinate for txt5
    
    txt6x <- 0.3*input$wdt # x coordinate for txt6 and 7
    
    txt7y <- 0.55*input$hgt # y coordinate for txt7 and 9
    
    txt8x <- 0.2*input$wdt # x coordinate for txt8 and txt9
    
    txt10x <- 0.05*input$wdt # y coordinate for txt10
    
    
    
    # Viewport for a new page
    new.page <- grid::viewport(width = grid::unit(input$page_wdt, "in"),
                               height = grid::unit(input$page_hgt, "in"))
    
    # Create a viewport for each page using grid layout
    lab_vp <- grid::viewport(layout = label_layout)
    grid::pushViewport(lab_vp)
    
    bold_font <- grid::gpar(fontface = "bold", fontsize = fsize)
    bold_font2 <- grid::gpar(fontface = "bold", fontsize = fsize-2)
    plain_font2 <- grid::gpar(fontface = "plain", fontsize = fsize-2)
    plain_font3 <- grid::gpar(fontface = "plain", fontsize = fsize-4)
    bold_font3 <- grid::gpar(fontface = "bold", fontsize = fsize-4)
    bold_font4 <- grid::gpar(fontface = "plain", fontsize = floor(fsize/2.5))
    
    withProgress(message = paste("Designing", nn, "labels."), value = 0, {
      
      for (i in seq_len(nn)) {
        
        # Increment the progress bar, and update the detail text.
        incProgress(1/nn, detail = paste("Label", i))
        
        label_posn <- c(x = corx[i], y = cory[i])
        
        # Generate QR code
        #bb <- make_qr(UNIQUE_ID[i])
        
        if (all(i != 1 & label_posn == c(1, 1))) {
          grid::grid.newpage()
          
          grid::pushViewport(new.page)
          grid::pushViewport(lab_vp)
          
        }
        
        grid::pushViewport(grid::viewport(layout.pos.row=label_posn['y'],
                                          layout.pos.col=label_posn['x']))
        grid::pushViewport(aa)
        
        # if (input$rounded == TRUE) {
        #   grid::grid.roundrect(gp = grid::gpar(lwd = 0.5))
        # } else (grid::grid.rect(gp = grid::gpar(lwd = 0.5)))
        
        
        # Draw rectangle around labels
        if (input$rect == TRUE) {
          
          if (input$rounded == TRUE) {
            grid::grid.roundrect(gp = grid::gpar(lwd = 0.5))
          } else (grid::grid.rect(gp = grid::gpar(lwd = 0.5)))
          
        } 
        
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
        grid::grid.draw(qrcds[[i]])
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
        
        
      } 
      
    })
    
    # Show a modal on successful generation of labels
    showModal(modalDialog(title = "Success", "Labels have been successfully generated!
                          Click the 'Download labels' button to download a PDF file
                          containing the generated labels to your computer.",
                          footer = modalButton("OK"),
                          easyClose = TRUE))
    
    # Enable the initially disabled 'Download labels' button
    shinyjs::enable(id = "down_labels")
    shinyjs::enable(id = "down_fieldbook")
    
  }# End of gp_label_portrait ()
  #----------------------------------------------------------------------------------------#
  session$onSessionEnded(function(){
    list_of_pdfs <- list.files(pattern = "\\.pdf$|\\.csv$")
    
    if(!is.null(list_of_pdfs)) {
      file.remove(list_of_pdfs)
    }
  })
  
  # Automatically bookmark every time an input changes
  # observe({
  #   reactiveValuesToList(input)
  #   session$doBookmark()
  # })
  
  # Update the query string
  #onBookmarked(updateQueryString)
  
}

shinyApp(ui, server)








