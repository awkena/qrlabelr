# Base image https://hub.docker.com/u/rocker/
FROM rocker/shiny:latest

# system libraries of general use
## install debian packages
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
    libxml2-dev \
    libcairo2-dev \
    libsqlite3-dev \
    libmariadbd-dev \
    libpq-dev \
    libssh2-1-dev \
    unixodbc-dev \
    libcurl4-openssl-dev \
    libssl-dev

## update system libraries
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get clean
 
# install R packages required 
# Change the packages list to suit your needs
RUN R -e "install.packages(c('argonDash', 'argonR', 'bslib', 'dplyr', 'grid', 'purrr', 'qrencoder', 'raster', 'reactable', 'shinycssloaders', 'shiny', 'shinyjs', 'shinyBS', 'shinyWidgets', 'uuid', 'QBMS', 'tools', 'dplyr'), repos='https://cran.rstudio.com/')"

# install supervisord
RUN apt-get update && apt-get install -y supervisor

# Copy the supervisor configuration file
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf


RUN mkdir /root/app

WORKDIR /srv/shiny-server

COPY data data

COPY tests tests

COPY www www

COPY app.R app.R

# Make the Shiny app accessible from all network interfaces
EXPOSE 80

# Start supervisord to manage your app
CMD ["supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

# Run the Shiny app using JSON syntax for CMD
# CMD ["R", "-e", "shiny::runApp('/srv/shiny-server', host='0.0.0.0', port=80)"]