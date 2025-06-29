#!/usr/bin/env bash
# File: guessinggame.sh

# Function to count regular files in the current directory.
# It excludes directories, symbolic links, and other special files.
count_regular_files() {
  # ls -l lists files in long format
  # grep "^-" filters for lines starting with '-', which indicates a regular file
  # wc -l counts the number of lines, giving us the file count
  ls -l | grep "^-" | wc -l
}

# Main function for the guessing game logic
main_game_logic() {
  local correct_file_count=$(count_regular_files)
  local user_guess

  echo "Welcome to the File Guessing Game!"
  echo "You need to guess how many regular files are in the current directory."

  # Start a loop that continues until the user guesses correctly
  while true; do
    read -p "Please enter your guess: " user_guess

    # Check if the input is a valid non-negative integer
    if ! [[ "$user_guess" =~ ^[0-9]+$ ]]; then
      echo "Invalid input. Please enter a non-negative whole number."
    # Check if the guess is too low
    elif (( user_guess < correct_file_count )); then
      echo "Your guess is too low. Try again."
    # Check if the guess is too high
    elif (( user_guess > correct_file_count )); then
      echo "Your guess is too high. Try again."
    # If none of the above, the guess must be correct
    else
      echo "Congratulations! Your guess is correct!"
      break # Exit the loop as the game is won
    fi
  done
}

# Call the main game logic function to start the program
main_game_logic
