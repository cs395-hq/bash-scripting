#!/usr/bin/env bash

# Shell Special Parameters
echo  '$0: ' $0 # The filename of the current script.
echo  '$1, $2, $3: ' $1, $2, $3 # The first, second, third, ... parameters passed to the script.
echo  ': '$$# # The number of parameters passed to the script.
echo  '$@: ' $@ # All parameters passed to the script.
echo  '$?: ' $? # The exit status of the last command executed.
echo  '$$: ' $$ # The process ID of the current script.
echo  '$USER: ' $USER # The username of the user running the script.
echo  '$HOSTNAME: ' $HOSTNAME # The hostname of the machine running the script.
echo  '$RANDOM: ' $RANDOM # Returns a different random number each time is it referred to.
echo  '$LINENO: ' $LINENO # Returns the current line number in the script.
echo  '$SECONDS: ' $SECONDS # Returns the number of seconds since the script was started.
echo  '$PWD: ' $PWD # The current working directory.
echo  '$OLDPWD: ' $OLDPWD # The previous working directory.
echo  '$IFS: ' $IFS # The Internal Field Separator that is used for word splitting after expansion and to split lines into words with the read builtin command.
echo  '$HOME: ' $HOME # The home directory of the user running the script.
echo  '$PATH: ' $PATH # The search path for commands.
echo  '$PS1: ' $PS1 # The primary prompt string.
echo  '$PS2: ' $PS2 # The secondary prompt string.
echo  '$PS3: ' $PS3 # The tertiary prompt string.
echo  '$PS4: ' $PS4 # The quaternary prompt string.
echo  '$SHELLOPTS: ' $SHELLOPTS # A colon-separated list of enabled shell options.
echo  '$BASH_VERSION: ' $BASH_VERSION # The version number of the current instance of Bash.
echo  '$BASH_VERSINFO: ' $BASH_VERSINFO # A readonly array variable whose members hold version information for this instance of Bash.
echo  '$BASH: ' $BASH # The full pathname used to execute the current instance of Bash.
echo  '$BASH_SOURCE: ' $BASH_SOURCE # The source filename of the current Bash script.
echo  '$FUNCNAME: ' $FUNCNAME # The name of the current function.
echo  '$BASH_SUBSHELL: ' $BASH_SUBSHELL # The level of subshell within the current shell.
echo  '$BASH_ALIASES: ' $BASH_ALIASES # An associative array variable whose members correspond to the internal list of aliases as maintained by the alias builtin.
echo  '$BASH_ARGC: ' $BASH_ARGC # An array variable whose values are the number of parameters in each frame of the current Bash execution call stack.
echo  '$BASH_ARGV: ' $BASH_ARGV # An array variable containing all of the parameters in the current Bash execution call stack.
echo  '$BASH_CMDS: ' $BASH_CMDS # An associative array variable whose members correspond to the internal hash table of commands as maintained by the command builtin.
echo  $BASH_EXECUTION_STRING # The command argument to the #c invocation option.
