#!/usr/bin/env bash
# File: guessinggame.sh

# Function to count regular files in the current directory.
# This version correctly counts all regular files, including hidden ones,
# but excludes directories, symbolic links, and other special files.
count_regular_files() {
  # find . -maxdepth 1 -type f
  # . : Start search in the current directory.
  # -maxdepth 1 : Limit the search to the current directory only (do not descend into subdirectories).
  # -type f : Only match regular files (this includes hidden files like .bashrc if they are regular files).
  # wc -l : Counts the number of lines, which corresponds to the number of files found.
  find . -maxdepth 1 -type f | wc -l
}

# Main function for the guessing game logic
main_game_logic() {
  local correct_file_count=$(count_regular_files)
  local user_guess

  echo "Welcome to the File Guessing Game!"
  echo "You need to guess how many regular files are in the current directory (including hidden ones)."

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
