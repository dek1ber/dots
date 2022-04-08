#!/bin/bash

# Script to find memory usage (used mem / total mem)
free -h | awk '/^Mem/ {print "🧠 " $3 "/" $2}'
