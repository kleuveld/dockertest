FROM rocker/verse:4.3.2

#required latex packages
RUN tlmgr update --self
RUN tlmgr install multirow colortbl float wrapfig euenc fontspec tipa unicode-math xunicode booktabs preprint

# Set a user and the working directory
WORKDIR /doc

RUN install2.r \
  here \
  flextable officer bookdown \
  tidyverse haven \
  list sandwich lmtest DeclareDesign fixest

COPY ./rendermarkdown.sh /
RUN chmod 755 /rendermarkdown.sh

ENTRYPOINT [ "/rendermarkdown.sh" ]