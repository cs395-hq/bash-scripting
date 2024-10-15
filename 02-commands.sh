#!/usr/bin/env bash

# Description: Shell comm02

# Simple command
echo "I'm a simple command"

# Multiple commands, separated by semicolon
printf "Hello"; printf " "; printf "World"

# Piping commands
echo 1 | cat - # 1
echo "1+3" | bc -l # 4

# Conditional execution
echo "Hello" && echo "World" # Hello World
echo "Hello" || echo "World" # Hello

