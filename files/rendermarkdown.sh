#!/bin/bash

cd /doc

if [ $# -eq 0 ]; then
  R
else
  if [ "$1" = "index.Rmd" ]; then
    R -e "bookdown::render_book('$1')"
  else
    R -e "rmarkdown::render('$1',output_format = 'all')"
  fi
fi