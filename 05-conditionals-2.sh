#!/usr/bin/env bash

square_brackets() {
	echo "Square Brackets"
	# [[ ]] is an improved version of [ ].
	# Return a status of 0 or 1 depending on the evaluation of the conditional expression expression.
	# regex matching
	# [[ "string" =~ regex ]]
	# For more information: man 3 regex
	name="John"
	if [[ "$name" =~ ^J.*n$ ]]; then
	    echo "Name starts with J and ends with n."
	fi

	filename="2024-12-31.txt"
	if [[ "$filename" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}\.txt$ ]]; then
	    echo "File name is in the correct format."
	fi

	spaced_string="  hello  "
	if [[ "$spaced_string" =~ ^[[:space:]]*hello[[:space:]]*$ ]]; then
	    echo "String is 'hello' with optional spaces."
	fi
}


parentheses() {
	echo "Parentheses"
	# (( )) is used for arithmetic evaluation.
	# Return a status of 0 or 1 depending on the evaluation of the arithmetic expression.
	# For the list of operators, see https://www.gnu.org/software/bash/manual/html_node/Shell-Arithmetic.html

	if (( 1 + 1 == 2 )); then
	    echo "1 + 1 equals 2."
	fi
	my_var=1
	if (( ++my_var == 2 )); then
	    echo "my_var is 2."
	fi

	if (( my_var << 1 == 4 )); then
	    echo "my_var shifted left by 1 is 4."
	fi

	permission_bits=755
	if (( permission_bits & 400 )); then
	    echo "User has read permission."
	fi
}

priority() {
	echo "Priority"
	# priority
	# 1. (expression)
	# 2. ! expression
	# 3. expression1 && expression2
	# 4. expression1 || expression2

	# priority example
	if [[ !("a" == "b") || "b" == "b" && "c" == "d" ]]; then
		echo "This will be printed (1)."
	fi

	# The first comparison is false, so the second comparison is evaluated.
	if [[ "x" == "y" || $(echo 1) ]]; then
		echo "This will be printed (2)."
	fi

	# The first command block will succeed,
	# The second command block will be executed thanks to the && operator.
	if { echo 1; } && echo 2; then
		echo "This will be printed (3)."
	fi

	# The first command will exit with an error (a subshell)
	# The second command will be executed, thanks to the || operator.
	if ( echo "Exit with error!"; exit 1; ) || echo "OoOoOo"; then
		echo "This will be printed (4)."
	fi
}

square_brackets
parentheses
priority
