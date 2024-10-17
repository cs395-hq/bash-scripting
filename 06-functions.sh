#!/usr/bin/env bash
# This script demonstrates the scope of variables.
# The variable var is defined in three different scopes:
# 1. Global scope (outside of any function)
# 2. Local scope (inside func1)
# Run the script passing at least one argument. 
# ./06-functions.sh my-script-arg

func1()
{
    local var='func1 local variable'
    func2
}

func2()
{
    echo "In func2, var = $var <- func1 scope is effective"
}

func3()
{
	echo '$0 in func3 is' $0 # This does not change
	echo "In func3, positional parameter 1: $1"
}

var="global variable"
func1
echo "After func1, var = $var"
func3 "Argument passed to func3"
echo "Positional parameter 1 outside func3: $1"
