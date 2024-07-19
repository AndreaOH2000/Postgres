#!/bin/bash

# Define the PSQL command
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

# Check if an argument is provided
if [ -z $1 ]; then
  echo "Please provide an element as an argument."
  exit 0
fi

ELEMENT=$1
if [[ $ELEMENT =~ ^[0-9]+$ ]] #if argument is a number
then
  ELEMENT_DETAILS=$($PSQL "SELECT atomic_number,symbol,name,atomic_mass,melting_point_celsius,boiling_point_celsius,type FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$ELEMENT" )
elif [[ ${#ELEMENT} -le 2 ]] # if argument is a symbol
  then
  ELEMENT_DETAILS=$($PSQL "SELECT atomic_number,symbol,name,atomic_mass,melting_point_celsius,boiling_point_celsius,type FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol='$ELEMENT'" )
else # if argument is a name
  ELEMENT_DETAILS=$($PSQL "SELECT atomic_number,symbol,name,atomic_mass,melting_point_celsius,boiling_point_celsius,type FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE name='$ELEMENT'" )
fi
 
if [[ -z $ELEMENT_DETAILS ]] #if the element was not found
then
  echo -e "I could not find that element in the database."
else
  IFS='|' read -r ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE <<< "$ELEMENT_DETAILS" 
  OUTPUT=$(echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius.")
  FORMATTED_OUTPUT=$(echo "$OUTPUT" | sed -e 's/  */ /g' -e 's/ (\s*/ (/g' -e 's/\s*)/)/g')
  echo "$FORMATTED_OUTPUT"
fi
