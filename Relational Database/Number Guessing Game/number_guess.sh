#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=game --tuples-only --no-align -c"
GENERATED_NUMBER=$(($RANDOM % 1000 + 1))
NUMBER_OF_GUESSES=0

echo $GENERATED_NUMBER

MAIN_PROGRAM() {
  if [[ $1 ]] 
  then
    echo -e $1
  fi
  echo -e "\nEnter your username:"
  read USERNAME
  CHECK_USERNAME_RESULT=$($PSQL "SELECT * FROM users WHERE username='$USERNAME';")
  if [[ -z $CHECK_USERNAME_RESULT ]]
  then
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  else
    echo "$CHECK_USERNAME_RESULT" | while IFS='|' read USERNAME GAMES_PLAYED BEST_GAME
    do
      echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    done
  fi
  GUESS
}

GUESS () {
  if [[ $1 ]]
  then
    echo -e "$1"
  else
    echo -e "\nGuess the secret number between 1 and 1000:"
  fi
  read GUESS
  NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES + 1))
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    GUESS "That is not an integer, guess again:"
  fi
  if [[ $GUESS -gt $GENERATED_NUMBER ]]
  then
    GUESS "It's lower than that, guess again:"
  fi
  if [[ $GUESS -lt $GENERATED_NUMBER ]]
  then 
    GUESS "It's higher than that, guess again:"
  fi
  if [[ $GUESS -eq $GENERATED_NUMBER ]]
  then
    echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $GENERATED_NUMBER. Nice job!"
    if [[ -z $CHECK_USERNAME_RESULT ]]
    then
      ADD_USER_TO_DB=$($PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$USERNAME', 1, $NUMBER_OF_GUESSES);")
    else
      UPDATE_NUMBER_OF_GAMES=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE username = '$USERNAME';")
      if [[ $NUMBER_OF_GUESSES -lt $BEST_GAME ]]
      then
        UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game = $NUMBER_OF_GUESSES WHERE username = '$USERNAME';")
      fi
    fi
    exit
  fi
}

MAIN_PROGRAM
