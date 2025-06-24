#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon -t -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "Welcome to My Salon, how can I help you?\n"

# Display services menu
display_services() {
  echo -e "\nHere are our services:"
  echo -e "\n1) haircut\n2) blowout\n3) highlight"
}

select_services(){
  display_services
  read SERVICE_ID_SELECTED

  SERVICE_EXIST=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED")

  if [[ -z $SERVICE_EXIST ]]
  then
  echo "That's not a valid service option"
  select_services
  else
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  PHONE_EXIST=$($PSQL "SELECT phone FROM customers WHERE phone='$CUSTOMER_PHONE'")
    
    if [[ -z $PHONE_EXIST ]]
    then
    echo -e "\nWhat's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    
    echo -e "\nWhat time would you like to come?"
    read SERVICE_TIME
    
    
    else
    
    
    echo -e "\nWhat time would you like to come?"
    read SERVICE_TIME
    
    fi
  CUSTOMER_NAME_RESULT=$($PSQL "SELECT name FROM customers where phone='$CUSTOMER_PHONE'")
    
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_EXIST")
  CUSTOMER_NAME_CLEAN=$(echo "$CUSTOMER_NAME" | sed -e 's/^ *//' -e 's/ *$//')
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_EXIST, '$SERVICE_TIME')")
  echo -e "\n I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME_CLEAN."
  fi
}

select_services

