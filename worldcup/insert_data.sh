#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
# Truncate the tables
echo "$($PSQL "truncate table teams, games")"

 
# Read from file 
cat games.csv | while IFS=',' read -r YEAR ROUND WIN OPP WING OPPG
do
  #Ommit first line
  if [[ $YEAR = 'year' ]]; then continue
  else
    # if team not exist
    WINT=$($PSQL "select name from teams where name='$WIN'")
    OPPT=$($PSQL "select name from teams where name='$OPP'")
    # Add win teams to teams table
    if [[ -z $WINT ]]
    then
      echo "$($PSQL "insert into teams(name) values('$WIN')")"
    fi
    # Add lose team to team table
    if [[ -z $OPPT ]]
    then
      echo "$($PSQL "insert into teams(name) values('$OPP')")"
    fi
    # Cheack team ID
    WINID=$($PSQL "select team_id from teams where name='$WIN'")
    OPPID=$($PSQL "select team_id from teams where name='$OPP'")
    # Add values to the games table
    echo "$($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals)\
    values($YEAR, '$ROUND', $WINID, $OPPID, $WING, $OPPG)")"     
  fi
done

