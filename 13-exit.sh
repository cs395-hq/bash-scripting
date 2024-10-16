#!/usr/bin/env bash

# Exiting a script in bash
# Another way to exit a script is to call the exit command with the exit status
# of the command that most recently failed.
# This is a common pattern with the set -e option in bash.
# The set -e option will cause the script to exit if any commands return a non-zero status.
# It's a good idea to include set -e at the beginning of all bash scripts.
# This will make the script exit if any errors occur.
set +e

# Exit a script if a command returns a non-zero status
# This is a good practice
# exit 1 # General error

# The following example demonstrates how to exit a script if a file does not exist.
rm "file-does-not-exist.txt"
echo "If set +e is set, this will print."


# Other exit statuses
# exit 0 # Success
# exit 1 # General error
# exit 2 # Misuse of shell builtins
# exit 126 # Command invoked cannot execute
# exit 127 # "command not found"
# exit 128 # Invalid argument to exit
# exit 128+n # Fatal error signal "n"
# exit 130 # Script terminated by Control-C
# exit 255* # Exit status out of range

# exit 300 # Exit status out of range. What will happen?
