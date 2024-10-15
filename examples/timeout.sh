#!/usr/bin/env bash
# our watchdog timeout in seconds
maxseconds="$1"
shift

case $# in
  0) echo "Usage: `basename $0` <seconds> <command> [arg ...]" 1>&2 ;;
esac

"$@" &
waitforpid=$!

{
    sleep $maxseconds
    echo "TIMED OUT: $@" 1>&2 
    2>/dev/null kill -0 $waitforpid && kill -15 $waitforpid
} &
killerpid=$!

>>/dev/null 2>&1 wait $waitforpid
# this is the exit value we care about, so save it and use it when we
rc=$?

# zap our watchdog if it's still there, since we no longer need it
2>>/dev/null kill -0 $killerpid && kill -15 $killerpid

exit $rc
