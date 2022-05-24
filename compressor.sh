#!/bin/sh

# Compress all file inside app directory
# The process running with minify
# https://github.com/tdewolff/minify/tree/master/cmd/minify

MINIFY="/usr/bin/minify"

if [ ! -x $MINIFY ]; then
  echo "$MINIFY: is not installed. Aborting."
  exit 2
fi

find "$DIRECTORY" -type f -name '*.css' -o -name '*.js' | while read -r file ; do
  $MINIFY --output "$file" "$file"
done

exit 0
