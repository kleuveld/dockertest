#!/bin/bash

if [ $# -eq 0 ]; then
  R
else
  if [ "$1" = "index.Rmd" ]; then
    Rscript -e "bookdown::render_book('$1')"
  else
    Rscript -e "rmarkdown::render('$1',output_format = 'all')"
  fi
fi