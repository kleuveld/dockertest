FROM rocker/r-ver:4.4.0

# ensure versions for r packages are always the same
RUN /rocker_scripts/setup_R.sh https://packagemanager.posit.co/cran/__linux__/jammy/2024-07-11

#run pandoc install script
RUN /rocker_scripts/install_pandoc.sh

#install R packages
RUN install2.r  \
  here \
  flextable officer bookdown modelsummary GGally \
  tidyverse haven \
  list sandwich lmtest DeclareDesign fixest \
  randomForest

#install tinytex (https://yihui.org/tinytex/)
RUN apt update && \
    apt install -y \
    perl 

RUN wget -qO- "https://yihui.org/tinytex/install-bin-unix.sh" | sh
RUN ln -s /root/bin/* /usr/local/bin
RUN /root/.TinyTeX/bin/*/tlmgr path add

#required latex packages
RUN tlmgr update --self
RUN tlmgr install multirow colortbl float wrapfig euenc fontspec tipa unicode-math xunicode booktabs preprint bookmark

WORKDIR /doc
COPY ./rendermarkdown.sh /
RUN chmod 755 /rendermarkdown.sh

ENTRYPOINT [ "/rendermarkdown.sh" ]