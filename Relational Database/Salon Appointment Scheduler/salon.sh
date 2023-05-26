#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~ Salon ~~~"

MAIN_MENU() {
  if [[ $1 ]] 
  then
    echo -e $1
  fi
  echo -e "\nWelcome to the salon, how can I help you?"
  SALON_SERVICES_RESULT=$($PSQL "SELECT * FROM services ORDER BY service_id;")
  echo "$SALON_SERVICES_RESULT" | while read SERVICE_ID BAR NAME
  do
    echo -e "$SERVICE_ID) $NAME"
  done
  read SERVICE_ID_SELECTED
  case $SERVICE_ID_SELECTED in
    1 | 2 | 3) USE_SERVICE ;;
    *) MAIN_MENU "\nI could not find that service"
  esac
}

USE_SERVICE() {
  echo -e "\nWhat is your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE';")
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nWhat is your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER_NAME_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE');")
  fi
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
  echo -e "\nWhat time would you like?"
  read SERVICE_TIME
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED;")
  echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
}

MAIN_MENU