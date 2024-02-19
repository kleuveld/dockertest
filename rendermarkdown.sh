#!/bin/bash
if [ $# -eq 0 ]; then
  R
else
  Rscript -e "rmarkdown::render('$1',output_format = 'all')"
fi