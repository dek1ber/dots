#!/bin/sh

# Script to find % CPU usage
grep cpu /proc/stat | awk '{usage=($2)*100/($2+$5)} END {print usage}' | numfmt --format=%0.2f --suffix=%
