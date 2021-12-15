#!/bin/bash

free -h | awk '/^Mem/ {print "🧠 " $3 "/" $2}'
