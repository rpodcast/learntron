FROM rocker/r-ver:4.1.0
ENV RENV_VERSION 0.14.0

# install system dependencies
RUN apt-get update && apt-get install -y  git-core libcurl4-openssl-dev libgit2-dev libicu-dev libsasl2-dev libssl-dev libxml2-dev make pandoc pandoc-citeproc && rm -rf /var/lib/apt/lists/*

# install renv
RUN echo "options(repos = c(CRAN = 'https://cran.rstudio.com/'), download.file.method = 'libcurl', Ncpus = 4)" >> /usr/local/lib/R/etc/Rprofile.site
RUN R -e 'install.packages("remotes")'
RUN R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"

# restore packages from renv lock file
COPY . /project
WORKDIR /project
RUN Rscript -e 'renv::restore()'

# run tutorial
EXPOSE 80
CMD R -e "source('run_tutorial.R')"
