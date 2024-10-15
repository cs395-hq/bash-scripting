function check_other_players {
    # echo "Checking for other users ($name)"
    for player in bus/*; do
	if [ $player != bus/$name ] ; then
	    player_name=${player##*/}
	    if [[ ! "$subscribed_players" =~ "$player_name," ]]; then
		    echo "A new user found ${player##*/}"
		    # read data from the player
		    subscribed_players="$subscribed_players$player_name,"
		    tail -f $player | while read line; do
			echo
			echo "$player_name: $line"
		    done &
	    fi
	fi
    done
    echo $subscribed_players
}

subscribed_players=""

read -p "Enter your name: " name

echo "Hello $name, let's chat!"

# create a pipe for communication between the other players
# the pipe name will be the name of the player
# and also we will look for other user pipes to read data from them

# create a pipe for the player in bus directory
if [ ! -d bus ]; then
    mkdir bus
fi

if [ -f bus/$name ]; then
    rm bus/$name
fi

# create a pipe for the player
# if the pipe does not exist
if [ ! -p bus/$name ]; then
	echo "Creating a pipe for $name"
	mkfifo bus/$name
fi

echo "$name in!" > bus/$name & 

# look for other users
while true; do
    check_other_players
    sleep 1
    read -p "Enter your message: " message
    if [[ -n "$message" ]]; then
	    echo $message > bus/$name &
	    # echo "Message sent! bus/$name"
    fi
done

trap "rm -f bus/$name" EXIT


