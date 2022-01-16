#!/bin/bash

find examples -maxdepth 1 \
    -type d \( ! -name examples \) \
    -exec sh -c 'fname="$1"; cd "$fname" && terraform init' shell {} \;
