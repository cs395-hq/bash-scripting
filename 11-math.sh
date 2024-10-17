#!/usr/bin/env bin

# Math
# The `expr` command can be used to do a variety of different operations.
# It is important to note that the `*` character must be escaped.
# The `bc` command can be used to perform more advanced calculations.
echo "a=2 b=3"
a=2; b=3
echo "We can use expr for basic operations"
echo "a + b = "`expr $a + $b` # 5

echo "We can use square brackets as well"
echo '[ $a + $b ] -> ' [ $a + $b ] # 2 3 + (not what we want)
echo '$[ $a + $b ] -> ' $[ $a + $b ] # 5 <--- This is what we want

echo "We can use double parentheses for more advanced operations"
echo "a + b = "$((a + b)) # 5
echo "a * b = $((a * b))" # 6
echo "a ^ b = "$((a ^ b)) # 1
echo "a % b = "$((a % b)) # 2
echo "a / b = "$((a / b)) # 0
echo "a - b = "$((a - b)) # -1
echo "a++ = "$((a++)) # 2
echo "a=" $a # 3

echo "Let's use bc to perform operations on floating point numbers"
echo "4.5 * 2.2" | bc # 9.9

# bc accepts files as input, let's use a here string
# scale=2 sets the number of decimal places
bc <<< "scale=2; 5.5 / 2" # 2.75
