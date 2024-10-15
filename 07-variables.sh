r No spaces around the equal sign
# The value should not be quoted if it is a number or a string without spaces

my_var="123"
my_var2=456
my_var3=my_var
my_var4=$my_var
no_quotes=abcde
no_quotes2=1 2 3 # The value should be quoted if it contains spaces

echo "my_var: $my_var"
echo "my_var2: $my_var2"
echo "my_var3: $my_var3"
echo "my_var4: $my_var4"
echo "no_quotes: $no_quotes"
echo "no_quotes2: $no_quotes2 <--- This will not work as expected"

# Positional parameters
# $0 is the script name
# $1, $2, ... are the positional parameters
# run bash parameters.sh "param 1" "param 2" "param 3"
echo "Script name: $0"
echo "All positional parameters: $@" # In quotes, all the positional parameters are treated as separate string
for i in "$@"; do
    echo $i
done

echo "All positional parameters: $*" # In quotes, all the positional parameters are treated as a single string
for i in "$*"; do
    echo $i
done

echo "Number of positional parameters: $#"
echo "PID of the script: $$"
echo "PID of the last background command: $!" 

echo "First parameter: $1"
echo "Second parameter: $2"
shift # Shifts the positional parameters to the left
echo "First parameter after shift: $1"


