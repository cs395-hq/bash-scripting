#!/usr/bin/env bash
# Conditional branching: if, case
if [ 1 -eq 1 ]; then
  echo "1 equals 1"
  if [ 2 -lt 3 ]; then
    echo "2 is less than 3"
    if [ 3 -gt 2 ]; then
      echo "3 is greater than 2"
      if [ -z "" ]; then
	echo "empty string"
	if [ -n "not empty" ]; then
	  echo "not empty string"
	  if [ -e /etc/passwd ]; then
	    echo "file exists"
	    if [ -f /etc/passwd ]; then
	      echo "regular file"
	      if [ -d /etc ]; then
		echo "directory /etc/ exists"
		if [ -r /etc/passwd ]; then
		  echo "file /etc/passwd is readable"
		  if [ -w /etc/passwd ]; then
		    echo "file /etc/passwd is writable"
		    if [ -x /etc/passwd ]; then
		      echo "file /etc/passwd is executable"
		      if [ -s /etc/passwd ]; then
			echo "file /etc/passwd is not empty"
		      fi
		    fi
		  fi
		fi
	      fi
	    fi
	  fi
	fi
      fi
    fi
  fi
else
  echo "false"
fi

# -eq: equal
# -ne: not equal
# -lt: less than
# -le: less than or equal
# -gt: greater than
# -ge: greater than or equal
# -z: zero length string
# -n: non-zero length string
# -e: file exists
# -f: file exists and is a regular file
# -d: file exists and is a directory
# -r: file exists and is readable
# -w: file exists and is writable
# -x: file exists and is executable
# -s: file exists and is not empty
# -a: and
# -o: or
# !: not
# -p: named pipe
# -L: symbolic link
# -S: socket
# -b: block device
# -c: character device

name="Can"
if [ "$name" == "Can" ]; then
  echo "Hello Can"
elif [ "$name" == "Ayse" ]; then
  echo "Hello Ayse"
else
  echo "Hello Stranger"
fi

name="Ayse"
case "$name" in
  Can)
    echo "Hello Can"
    ;;
  Ayse)
    echo "Hello Ayse"
    ;;
  *)
    echo "Hello Stranger"
    ;;
esac

# create menu
select name in Can Ayse; do
  case "$name" in
    Can)
      echo "Hello Can"
      ;;
    Ayse)
      echo "Hello Ayse"
      ;;
    *)
      echo "Hello Stranger"
      ;;
  esac
  break
done

# regex matching
# [[ "string" =~ regex ]]
# For more information: man 3 regex
