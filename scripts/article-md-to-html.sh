#!/bin/sh

# Ensure a file is given as an argument
if [ "$#" -ne 1 ] || ! [ -f "$1" ]; then
  echo "Usage: $0 MARKDOWN_FILE" >&2
  exit 1
fi

# Capture the base filename by removing markdown extension
name=$(echo $1 | cut -f 1 -d '.')
echo "Converting $1 to $name.html..."

# Build with Pandoc because Kramdown doesn't support image captions and citation
# ALSO: we want the flexibility to keep private or render to MS Word

# need to hardcode CSS styling sheets (try to approximate Cayman markdown)
stylesheet="/mnt/d/stephen-krewson/Documents/StephenKrewson.github.io/assets/css/pandoc.css"

# For extensions, see: http://pandoc.org/MANUAL.html#pandocs-markdown
pandoc --toc --css="$stylesheet" --filter pandoc-citeproc -o "$name.html" -f markdown+citations+implicit_figures+inline_notes+yaml_metadata_block -s $1

echo "Done!"
