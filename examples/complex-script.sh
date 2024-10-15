#!/bin/bash

# Bash script showcasing advanced Bash features

# Global variables
LOGFILE="script.log"
declare -A USERS
USERS=(["admin"]="Admin User" ["guest"]="Guest User")

# Function to log messages to a file and stdout
log_message() {
    local message="$1"
    echo "$(date +'%Y-%m-%d %H:%M:%S') - $message" | tee -a "$LOGFILE"
}

# Function to check if a file exists and is readable
check_file() {
    local file="$1"
    if [[ -r "$file" ]]; then
        log_message "File '$file' exists and is readable."
    else
        log_message "File '$file' does not exist or is not readable."
        return 1
    fi
}

# Function to demonstrate basic user input and validation
get_user_input() {
    local input
    read -p "Enter your username (admin/guest): " input
    if [[ -n "${USERS[$input]}" ]]; then
        log_message "Hello, ${USERS[$input]}!"
    else
        log_message "Invalid username. Please enter 'admin' or 'guest'."
        return 1
    fi
}

# Function to demonstrate array and loop usage
list_system_info() {
    local info_types=("hostname" "uptime" "whoami" "df -h" "uname -a")
    echo "Gathering system information..."
    for cmd in "${info_types[@]}"; do
        echo "Command: $cmd"
        eval "$cmd"
        echo ""
    done
}

# Function to demonstrate conditional checks and process substitution
compare_files() {
    local file1="$1"
    local file2="$2"

    if check_file "$file1" && check_file "$file2"; then
        if diff <(sort "$file1") <(sort "$file2") > /dev/null; then
            log_message "Files '$file1' and '$file2' are identical."
        else
            log_message "Files '$file1' and '$file2' differ."
        fi
    fi
}

# Function to demonstrate I/O redirection
create_temp_file() {
    local temp_file
    temp_file=$(mktemp /tmp/tempfile.XXXXXX)
    echo "This is a temporary file." > "$temp_file"
    log_message "Temporary file created: $temp_file"
    cat "$temp_file"
}

# Trap signals and clean up
cleanup() {
    log_message "Cleaning up before exit."
    rm -f /tmp/tempfile.*
    exit 0
}

trap cleanup SIGINT SIGTERM

# Main function to demonstrate the entire script's capabilities
main() {
    log_message "Script started."

    # Get user input
    while ! get_user_input; do
        echo "Try again."
    done

    # System information
    list_system_info

    # File comparison
    compare_files "file1.txt" "file2.txt"

    # Temporary file creation
    create_temp_file

    log_message "Script completed."
}

# Call the main function
main
