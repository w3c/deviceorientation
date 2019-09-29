#!/bin/bash
set -e # Exit with nonzero exit code if anything fails

bikeshed spec

if [ -d out ]; then
  echo Copy the generated spec into out/
  cp spec-source-orientation.html out/spec-source-orientation.html
  cp index.html out/index.html
  cp *.png out/
  cp *.xhtml out/
fi