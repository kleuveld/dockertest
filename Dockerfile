FROM rocker/verse

#required latex packages
RUN tlmgr update --self
RUN tlmgr install multirow colortbl float wrapfig euenc fontspec tipa unicode-math xunicode booktabs preprint

# Set a user and the working directory
WORKDIR /report

RUN install2.r flextable here

ENTRYPOINT ["Rscript", "-e"]