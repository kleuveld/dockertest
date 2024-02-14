FROM rocker/verse

#required latex packages
RUN tlmgr update --self
RUN tlmgr install multirow colortbl float wrapfig

# Set a user and the working directory
WORKDIR /report

RUN install2.r flextable \
    && rm -rf /tmp/downloaded_packages \
    && strip /usr/local/lib/R/site-library/*/libs/*.so

ENTRYPOINT ["Rscript", "-e"]