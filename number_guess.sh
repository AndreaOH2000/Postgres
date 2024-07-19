#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_NUMBER=$(( (RANDOM % 1000) + 1 ))
echo -e "\nEnter your username:"
read USERNAME

INFO_USER=$($PSQL "SELECT games_played,best_game FROM users WHERE username='$USERNAME'")

# if user not found
if [[ -z $INFO_USER ]]
then
  echo -e "Welcome, $USERNAME! It looks like this is your first time here."
  # Add username to table
  INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
else
  #if user found
  IFS='|' read -r GAMES_PLAYED BEST_GAME<<< "$INFO_USER"
  INFO_FORMATTED=$(echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."|sed 's/ |/"/')
  echo $INFO_FORMATTED
fi
((GAMES_PLAYED++))
NUMBER_OF_GUESSES=0
echo -e "\nGuess the secret number between 1 and 1000:"
read GUESS

while true
do
   ((NUMBER_OF_GUESSES++))
  if [[ ! $GUESS =~ ^-?[0-9]+$ ]]
  then
    # input not an integer
    echo -e "\nThat is not an integer, guess again:"
    read GUESS
  elif [[ $GUESS > $RANDOM_NUMBER ]]
  then
    echo -e "\nIt's lower than that, guess again:"
    read GUESS
  elif [[ $GUESS < $RANDOM_NUMBER ]]
  then
    echo -e "\nIt's higher than that, guess again:"
    read GUESS
  else
    echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
    INSERT_NUMBER_PLAYED=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED WHERE username='$USERNAME'")
    if [[ $NUMBER_OF_GUESSES < BEST_GAME ]]
    then
      INSERT_BEST_GAME=$($PSQL "UPDATE users SET best_game=$BEST_GAME WHERE username='$USERNAME'")
    fi
    break
  fi
done