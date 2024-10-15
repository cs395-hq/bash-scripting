#!/usr/bin/env bash

# Redirections
# ============
# Redirecting standart output and standard error
ls &>ls.log
# Same as
ls >ls.log 2>&1

# Append to a file
ls >>ls.log 2>&1
# Same as (does not work on MacOS)
# ls -l &>>ls.log

# Redirects the standard output to /dev/null
# /dev/null is a special file that discards all data written to it.
# Copies the standard error to the standard output.
ffmpeg > /dev/null 2>&1

# copies the standard error to the standard output and
# redirects the standard output to /dev/null.
#ffmpeg 2>&1 > /dev/null

# Redirecting to a file
# Order matters
#ffmpeg 2>&1 > ffmpeg.log
#ffmpeg > ffmpeg.log 2>&1

# Here strings
echo -n "Number of characters in the here string: "
wc -c <<< "here string character count!"

# Here documents
# The delimiter must be at the beginning of the line.
echo -n "Number of lines in the here document:"
wc -l<<EOF
Here document to the file!
Number of lines.
It's three.
EOF
