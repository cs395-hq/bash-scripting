#!/usr/bin/env bash

# Shell Expansions
shell_expansions() {
	echo "Shell Expansions"
	echo "==============="
	echo "Command Substitution"
	echo "===================="
	echo "The output of a command can be used as an argument to another command."
	echo "Example: echo \"Today is \$(date)\""
	echo "Today is $(date)"
	echo "Today with ticks: `date`"
	echo
}

arithmetic_expansion() {
	echo "Arithmetic Expansion"
	echo "===================="
	echo "The result of an arithmetic expression can be used as an argument to another command."
	echo "Example: echo \"2 + 2 = \$((2 + 2))\""
	echo "2 + 2 = $((2 + 2))"
	echo
}

brace_expansion() {
	echo "Brace Expansion"
	echo "=============="
	echo "Brace expansion is used to generate arbitrary strings."
	echo "Example: echo \"{a,b,c}\""
	echo "{a,b,c}"
	echo
}

parameter_expansion() {
	echo "Parameter Expansion"
	echo "==================="
	echo "Parameter expansion is used to manipulate variables."
	string=01234567890abcdefgh
	echo "Example: echo \"\${string:7:3}\""
	echo "${string:7:3}"
	echo "Example: echo \"\${string:7:-2}\""
	echo "${string:7:-2}"
	echo "Example with regex: echo \"\${string//[0-9]/X}\""
	echo "${string//[0-9]/X}"
	echo
}

tilde_expansion() {
	echo "Tilde Expansion"
	echo "==============="
	echo "Tilde expansion is used to refer to the home directory."
	echo "Example: echo \"The home directory is \$HOME\""
	echo "The home directory is $HOME"
	echo
}

word_expansion() {
	echo "Word Expansion"
	echo "=============="
	echo "Word expansion is used to split a string into words."
	echo "Example: echo \"\${PATH}\""
	echo "${PATH}"
	echo
}

process_substitution() {
	echo "Process Substitution"
	echo "===================="
	echo "Process substitution is used to pass the output of a command to another command."
	echo "Example: diff <(echo \"Hello\") <(echo \"World\")"
	diff <(echo "Hello") <(echo "World")
	echo
}

file_expansion() {
	echo "File Expansion"
	echo "=============="
	echo "File expansion is used to generate a list of files."
	echo "Example: echo \"*.sh\""
	echo *.sh
	echo
}

# shell_expansions
# arithmetic_expansion
# brace_expansion
# parameter_expansion
# tilde_expansion
# word_expansion
process_substitution
file_expansion

