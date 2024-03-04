PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
ELEMENT=$1

ELEMENT_INFO() {
  if [[ -z $ELEMENT ]]
  then
    echo Please provide an element as an argument.
    exit
  fi
  if [[ $ELEMENT =~ ^[0-9]+$ ]]
  then
    GET_ATOMIC_NUM=$($PSQL "SELECT * FROM elements JOIN properties USING (atomic_number) JOIN types USING (type_id) WHERE atomic_number = $ELEMENT;")
    if [[ -z $GET_ATOMIC_NUM ]]
    then
      echo 'I could not find that element in the database.'
    else
      echo $GET_ATOMIC_NUM | sed 's/|/ /g' | while read TYPE_ID ATOMIC_NUM SYMBOL NAME ATOMIC_MASS MELT_C BOIL_C TYPE
      do
      echo "The element with atomic number $ATOMIC_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELT_C celsius and a boiling point of $BOIL_C celsius."
      done
    fi
  else
    GET_SYMBOL=$($PSQL "SELECT * FROM elements JOIN properties USING (atomic_number) JOIN types USING (type_id) WHERE symbol = '$ELEMENT';")
    if [[ -z $GET_SYMBOL ]]
    then
      GET_NAME=$($PSQL "SELECT * FROM elements JOIN properties USING (atomic_number) JOIN types USING (type_id) WHERE name = '$ELEMENT';")
      if [[ -z $GET_NAME ]]
      then
        echo 'I could not find that element in the database.'
      else
        echo $GET_NAME | sed 's/|/ /g' | while read TYPE_ID ATOMIC_NUM SYMBOL NAME ATOMIC_MASS MELT_C BOIL_C TYPE
        do
          echo "The element with atomic number $ATOMIC_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELT_C celsius and a boiling point of $BOIL_C celsius."
        done
      fi
    else
      echo $GET_SYMBOL | sed 's/|/ /g' | while read TYPE_ID ATOMIC_NUM SYMBOL NAME ATOMIC_MASS MELT_C BOIL_C TYPE
        do
          echo "The element with atomic number $ATOMIC_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELT_C celsius and a boiling point of $BOIL_C celsius."
        done
    fi
  fi
}

ELEMENT_INFO