#!/usr/bin/env bash

# File paths for communication
GAME_FILE="game_number.txt"
WINNER_FILE="winner.txt"

# Function to start a new game
start_new_game() {
    if [ -f "$WINNER_FILE" ]; then
        rm -f "$WINNER_FILE" # Remove winner file if exists to reset
    fi

    echo "Starting a new game!"
    # Player 1 generates a random number and writes it to the game file
    if [ ! -f "$GAME_FILE" ]; then
        echo "You are Player 1. Generating a random number between 0 and 1000..."
        RANDOM_NUMBER=$(( RANDOM % 1001 )) # Generate a number between 0 and 1000
        echo $RANDOM_NUMBER > "$GAME_FILE" # Save the number in the file
        echo "Random number generated! Player 2 can now join and start guessing."
    else
        echo "Game already started. You are Player 2."
    fi
    guess_number "$username"
}

# Function for players to guess
guess_number() {
    local username=$1

    # Check if the winner file exists (game is over)
    if [ -f "$WINNER_FILE" ]; then
        winner=$(cat "$WINNER_FILE")
        echo "Game over! The winner is $winner."
        if [ "$winner" == "$username" ]; then
            echo "You won! Do you want to start a new game? (y/n)"
            read restart_choice
            if [ "$restart_choice" == "y" ]; then
                rm -f "$GAME_FILE" # Remove game file to reset the game
                start_new_game
            fi
        fi
        exit 0
    fi

    if [ ! -f "$GAME_FILE" ]; then
        echo "No game in progress. Please wait for Player 1 to start a new game."
        exit 1
    fi

    # Load the number from the game file
    TARGET_NUMBER=$(cat "$GAME_FILE")

    while true; do
        echo -n "Enter your guess: "
        read guess

        if [[ ! "$guess" =~ ^[0-9]+$ ]]; then
            echo "Please enter a valid number."
            continue
        fi

        # Check if someone else won the game in between guesses
        if [ -f "$WINNER_FILE" ]; then
            winner=$(cat "$WINNER_FILE")
            echo "Game over! The winner is $winner."
            exit 0
        fi

        if [ "$guess" -lt "$TARGET_NUMBER" ]; then
            echo "Guess higher!"
        elif [ "$guess" -gt "$TARGET_NUMBER" ]; then
            echo "Guess lower!"
        else
            echo "Congratulations, $username! You've guessed the correct number!"
            echo "$username" > "$WINNER_FILE" # Write the winner to the file
            exit 0
        fi
    done
}

# Main logic
echo "Enter your username:"
read username

if [ -f "$WINNER_FILE" ]; then
    winner=$(cat "$WINNER_FILE")
    echo "Game is already over. The winner is $winner."
    if [ "$winner" == "$username" ]; then
        echo "You are the winner! Do you want to start a new game? (y/n)"
        read restart_choice
        if [ "$restart_choice" == "y" ]; then
            rm -f "$GAME_FILE" # Remove game file to reset the game
            start_new_game
        fi
    else
        echo "Waiting for $winner to restart the game."
    fi
    exit 0
fi

# Start the game or join an existing game
if [ -f "$GAME_FILE" ]; then
    guess_number "$username"
else
    start_new_game
fi
