!#/usr/bin/env bash
# don't exit on error
set +e

# That's a comment.

# QUOTING
# Single quoting
a='1"'
b='3"'
# Double quotes
c="2\"'"
d="Another variable in double quotes -> a: $a"

echo "a: $a b: $b c: $c"
echo $d 

# Single quotes are used to prevent the shell from interpreting the characters within them.
e='Single quoting does not expand variable -> a: $a'
echo $e

files=*.sh # This will expand to all the .sh files in the current directory. 
echo "$files" # In double quotes, the expansion is not performed.
echo $files # In this case, the expansion is performed.

#z='4\'' # This is an error. Escape character is not working in single quotes.
#echo $z

# Ansi C Quoting
# https://www.gnu.org/software/bash/manual/html_node/ANSI_002dC-Quoting.html
# \? -> Question mark; \a -> Alert (bell), etc...
echo $'\' \\ \" \? \a' 



