#!/bin/bash

# cd to the root of the project
cd $(dirname $0)/..

# find svg and export them to png
find assets/svg -type f -name "*.svg" -exec sh -c 'inkscape -z -e $(echo "{}" | sed "s/svg/png/g") "{}"' \;
