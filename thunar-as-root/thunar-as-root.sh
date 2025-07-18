#!/bin/bash

TARGET="$(realpath "$1")"

# Run Thunar as root in a clean environment
gksudo thunar "$TARGET"

