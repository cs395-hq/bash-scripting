#!/usr/bin/env bash

# Redirections
# ============
# Redirecting standart outpuot and standard error
# 0, 1, and 2 are the file descriptor versions 
# of stdin, stdout, and stderr, respectively.

ls &>ls.log
echo "The content of ls.log"
cat ls.log
rm ls.log
# Same as the following
# ls 1>ls.log 2>&1
# ls  >ls.log 2>&1
#
# But NOT same as with the following
# The following duplicates file descriptor 1 to f.d. 2
# Then, the file descriptor of the ls.log file is duplicated as 1
# So, the stuff that goes to 2 now actually goes to stdout (printed out)
# The stuff that goes to 1 goes to ls.log.
# ls 2>&1 >ls.log 
#

# Copying descriptos
# ------------------
# Let's copy descriptors' original values.
# >& means redirection but it duplicates the file descriptor 1 to 3.
# By doing so, both file descriptors point to the same device.
# In our case it's stdout.
# So that everything that sent to f.d. 3 goes stdout. 
# Same for f.d. 4. It now points to stderr.
exec 3>&1
exec 4>&2
exec 1>output.log # Notice that we don't use & for files.
exec 2>&1
echo "this is going to FD 1 -> output.log" >&1
echo "this is going to FD 2 -> output.log" >&2 
echo "Write to FD 3 -> stdout. This is displayed in the terminal." >&3
echo "Write to FD 4 -> stderr. This is also displayed in the terminal." >&4 
# restore 1 and 3
exec 1>&3
exec 2>&4
echo "The content of output log." 
cat output.log
rm output.log
echo

# close 3 and 4
exec 3>&-
exec 4>&-

# Append to a file.
echo "This creates or overwrites the file." > append.log
echo "This is appended to the file by redirecting FD 1." >> append.log
echo "This also appends but redirecting both FDs 1 and 2." >>append.log 2>&1
# Same as (does NOT work on MacOS)
# echo "" &>>append.log

echo "The content of append.log"
cat append.log
rm append.log
echo

# Redirects the standard output to /dev/null
# /dev/null is a special file that discards all data written to it.
# Copies the standard error to the standard output.
echo "This is not displayed in the terminal." > /dev/null 2>&1

# Here strings
echo -n "Number of characters in the here string: "
wc -c <<< "here string character count!"
echo
# Here documents
# The marker (here, it's EOF but can be another string) 
# must be at the beginning of the line. The marker
# indicates the end of the text.
echo -n "Number of lines in the here document:"
wc -l<<EOF
Here document to the file!
Number of lines.
It's three.
EOF
echo

