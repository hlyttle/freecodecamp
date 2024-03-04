#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

NUMBER_GUESS() {
  RANDOM_NUM=$((1 + $RANDOM % 1000))
  echo "Enter your username:"
  read USER
  GET_USER=$($PSQL "SELECT * FROM number_guess WHERE username ='$USER';")
  if [[ -z $GET_USER ]]
  then
    echo -e "\nWelcome, $USER! It looks like this is your first time here."
  else
    echo $GET_USER | sed 's/|/ /g' | while read USERNAME GAMES_PLAYED BEST_GAME
    do
      echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    done
  fi
  ATTEMPTS=0
  GUESS_NUMBER() {
    if [[ $ATTEMPTS = 0 ]]
    then
      echo -e "\nGuess the secret number between 1 and 1000:"
    fi
    read GUESS
    if ! [[ $GUESS =~ ^[0-9]+$ ]]
    then
      echo "That is not an integer, guess again:"
      GUESS_NUMBER
    elif [ $GUESS -lt $RANDOM_NUM ]
    then
      ATTEMPTS=$(($ATTEMPTS+1))
      echo "It's higher than that, guess again:"
      GUESS_NUMBER
    elif [ $GUESS -gt $RANDOM_NUM ]
    then
      ATTEMPTS=$(($ATTEMPTS+1))
      echo "It's lower than that, guess again:"
      GUESS_NUMBER
    elif [ $GUESS -eq $RANDOM_NUM ]
    then
      ATTEMPTS=$(($ATTEMPTS+1))
      echo "You guessed it in $ATTEMPTS tries. The secret number was $RANDOM_NUM. Nice job!"
      if [[ -z $GET_USER ]]
      then
        USER_INSERT=$($PSQL "INSERT INTO number_guess (username, games_played, best_game) VALUES('$USER', 1, $ATTEMPTS);")
      else
        echo $GET_USER | sed 's/|/ /g' | while read USERNAME PLAYED BEST
        do
          PLAYED=$(($PLAYED+1))
          if [ $ATTEMPTS -lt $BEST ]
          then
            BEST=$ATTEMPTS
          fi
          USER_UPDATE=$($PSQL "UPDATE number_guess SET games_played = $PLAYED, best_game = $BEST WHERE username = '$USERNAME';")
        done
      fi
    fi
  }
  GUESS_NUMBER
}

NUMBER_GUESS