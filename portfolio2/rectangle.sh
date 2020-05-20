#!/bin/bash

#Student_name: Kurt Kimhai
#StudentID:10473701

# The following function below (crdf) creates a rectangle.txt file using the 'cat' command.
crdf(){
    cat>rectangle.txt
}

# Using the -f expression, the if-statement below checks if the rectangle.txt file does not exist; then
# script will prompt the following message as output:

        #File created. Insert rectangle dimension inside rectangle.txt
        # Press ctrl + d to continue and run rectangle.sh again
# The rectangle.txt filec is created in the portfolio2 directory. Insert the rectangle dimensions inside the file ans save.
# After completing the above, return to rectangle.sh and press ctrl + d to prompt command line.  
#The crdf function is called to create the rectangle.txt file
if ! [ -f rectangle.txt ]; then
    echo -e "\nFile created. Insert rectangle dimensions inside rectangle.txt\nPress ctrl + d  to continue and run rectangle.sh again"
    crdf
fi

# The if-statement below checks if the rectangle_f.txt does exist then it runs sed body
# The enhanced expression (-e) is used to enable the use of special characters
# Substitution/ text replacement takes place for every line that begins with '^Rec'
# The tab command (\t) replaces spaces characters in rectangle_f.txt with tab characters
# The formatted rectangle dimensions will be output onto the rectangle_f.txt file
# The following sed body is as follows:
    #'1d' Deleted the first line of rectangle.txt
    # Substittues the first apostrophe to height
    # Substittues the first apostrophe to height
    # Substitues the second apostrophe to width
    #Substitues the third apostrophe to colour
    #Substitues the fourth apostrophe to colour
    #Subtitutes 'R' to 'Name:R'. Stores the formatted output from rectangle.txt to rectangle_f.txt
if [ -f rectangle.txt ]; then
    sed -e '1d'\
        -e '/^Rec/ s/,/ \tHeight:/'\
        -e '/^Rec/ s/,/ \tWidth:/'\
        -e '/^Rec/ s/,/ \tArea:/'\
        -e '/^Rec/ s/,/  \tColour:/'\
        -e '/^Rec/ s/R/   Name:R/'  rectangle.txt > rectangle_f.txt    
        echo -e "\nRectangle dimensions formatted to rectangle_f.txt file\n"   
        exit 0

# The else statement below checks if rectangle.txt is empty then it prints a message prompting the user to insert the rectangle dimensions in rectangle.txt       
else
    if ! [ -s rectangle.txt ]; then
        echo "\nNothing to process.\nPlease insert rectangle dimensions in rectangle.txt."
    fi
fi 
