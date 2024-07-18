#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo "Welcome to My Salon, how can I help you?" 

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  echo -e "\n1) cut\n2) color\n3) perm"
  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
    1) CUT_MENU ;;
    2) COLOR_MENU ;;
    3) PERM_MENU ;;
    *) MAIN_MENU "I could not find that service. What would you like today?" ;;
  esac
}

CUSTOMER_INFO(){
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_ID=$($PSQL "SELECT customer_id from customers WHERE phone='$CUSTOMER_PHONE'")

  if [[ -z $CUSTOMER_ID ]]
  then
    # ask for name
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    # insert into customers database 
    CUSTOMER_INSERT=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
  else
    CUSTOMER_NAME=$($PSQL "SELECT name from customers WHERE phone='$CUSTOMER_PHONE'")
    CUSTOMER_NAME=$(echo $CUSTOMER_NAME | sed 's/^ *//g' | sed 's/ *$//g')
  fi
  CUSTOMER_ID=$($PSQL "SELECT customer_id from customers WHERE phone='$CUSTOMER_PHONE'")
}
INSERT_APPOINTMENT() {
   
  INSERT_RESULT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  SERVICE_NAME=$(echo $SERVICE_NAME | sed 's/^ *//g' | sed 's/ *$//g')
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
}
CUT_MENU() {
  CUSTOMER_INFO
  echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
  read SERVICE_TIME
  INSERT_APPOINTMENT

}

COLOR_MENU() {
  CUSTOMER_INFO
  echo -e "\nWhat time would you like your color, $CUSTOMER_NAME?"
  read SERVICE_TIME
  INSERT_APPOINTMENT
}

PERM_MENU() {
  CUSTOMER_INFO
  echo -e "\nWhat time would you like your perm, $CUSTOMER_NAME?"
  read SERVICE_TIME
  INSERT_APPOINTMENT
}


MAIN_MENU