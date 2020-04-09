#!/bin/bash

#Student_name:Kurt Kimhai
#Student_ID: 10473701

# RNG (Random Number Generator) produces a random integer between 10-80 using the modulo (%) operator. 
RNG=$(($RANDOM%70+10+1))  
number_guesses=1 

#Prompt user to input name prior to commencing the script
    #User is greeted with addition of name input
read -p "Please input your name:" name 
    echo -e "****** Hello $name and Welcome to Guessage.sh ******\n"
for ((;;))
    do
    #prompt for user to enter an integer between 10 - 80
        read -p "Guess the age number between 10-80:" guess_number
        if ! [[ $guess_number =~ ^[0-9]+$ ]]; then  # Exception handling for integer only input.
            echo -e "INVALID INPUT! Try again. Please enter only WHOLE integers\n" # Prompts "Invalid input" message if input is not and integer (eg. string or float)
        else
        #Else- if (elif) statement  will run if guess_number is equivalent to RNG 
        #Displays congratulatory message to user 
        #exit 0 will deem script a success; script ends
            if [ $guess_number -eq $RNG ]; then 
                echo -e "CONGRATULATIONS $name!! YOU GUESSED CORRECT!!\nTotal no. of guesses:$number_guesses"
                exit 0
    # In response to 'if' code block, 'else' statement will execute if guess_number does not equate to RNG
        # If guess_number is greater than RNG then
            #Display message indicating guess_number is Lower.
            #Vice versa, else block will execute if the condition evaluates FALSE
            # Display message indicating number of guesses
             
        else
            echo -n "INCORRECT, try again."
            if [ $guess_number -gt $RNG ]; then  
                echo "(Guess should be LOWER than $guess_number)"
                echo -e "No. of guesses:$number_guesses\n"
            else
                echo "(Guess should be HIGHER than $guess_number)"
                echo -e "No. of guesses:$number_guesses\n"
            
        fi
    fi
fi
number_guesses=$((number_guesses+1)) # Counter will add +1 to number_chances for every incorrect guess
done
