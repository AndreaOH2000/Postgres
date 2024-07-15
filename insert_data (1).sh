#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE games,teams")
cat games.csv | while IFS="," read YEAR ROUND WINNER OPP WGOALS OPPGOALS 
do
  if [[ $YEAR != "year" ]]
  then
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    # if not found
    if [[ -z $WINNER_ID ]]
    then
      #Insert team_id:
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $WINNER
      fi
      # Get new winner_id
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    fi

    #get opponent_id
    OPP_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPP'")
    # if not found
    if [[ -z $OPP_ID ]]
    then
      #Insert team_id:
      INSERT_OPP_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPP')")
      if [[ $INSERT_OPP_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $OPP
      fi
      # Get new opponent_id
      OPP_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPP'")
    fi

    #insert into games:
     # insert into majors_courses
    INSERT_GAMES_RESULT=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR,'$ROUND',$WINNER_ID,$OPP_ID,$WGOALS,$OPPGOALS)")
    if [[ $INSERT_GAMES_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into games, $YEAR : $WINNER vs $OPP
      fi

  fi
done
