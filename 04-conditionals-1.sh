#!/usr/bin/env bash
# Conditional branching: if, case
if [ 1 -eq 1 ]; then
  echo "true"
else
  echo "false"
fi

name="John"
if [ "$name" == "John" ]; then
  echo "Hello John"
elif [ "$name" == "Jane" ]; then
  echo "Hello Jane"
else
  echo "Hello Stranger"
fi

name="Jane"
case "$name" in
  John)
    echo "Hello John"
    ;;
  Jane)
    echo "Hello Jane"
    ;;
  *)
    echo "Hello Stranger"
    ;;
esac

# create menu
select name in John Jane; do
  case "$name" in
    John)
      echo "Hello John"
      ;;
    Jane)
      echo "Hello Jane"
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
