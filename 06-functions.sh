#!/usr/bin/env bash
# This script demonstrates the scope of variables.
# The variable var is defined in three different scopes:
# 1. Global scope (outside of any function)
# 2. Local scope (inside func1)

func1()
{
    local var='func1 local'
    func2
}

func2()
{
    echo "In func2, var = $var"
}

func3()
{
	echo $0
	echo "In func3, positional parameter 1: $1"
}

var="global"
func1
echo "After func1, var = $var"
func3 "hello"
echo "Positional parameter 1 outside func3: $1"
