#!/usr/bin/env bash

file_count=$(find . -maxdepth 1 -type f | wc -l)

check_guess() {
  local guess=$1
  if [[ $guess -eq $file_count ]]; then
    echo "Congratulations! You guessed the correct number of files."
    return 0
  elif [[ $guess -lt $file_count ]]; then
    echo "Your guess was too low. Try again."
  else
    echo "Your guess was too high. Try again."
  fi
  return 1
}

echo "How many files are in the current directory?"
while true; do
  read -p "Enter your guess: " guess
  if ! [[ $guess =~ ^[0-9]+$ ]]; then
    echo "Please enter a non-negative integer."
    continue
  fi
  if check_guess "$guess"; then
    break
  fi
done