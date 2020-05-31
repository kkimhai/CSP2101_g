#!/bin/bash

#Name: Kurt Kimhai
#Student ID:10473701

#1.)Connect to source
    # The following uses wget to retrieve the gallery.php folder from the ECU website. 
        #Prints message prompting successful download of gallery.php
if ! [ -f gallery.php?folder=152 ]; then
    wget "https://www.ecu.edu.au/service-centres/MACSC/gallery/gallery.php?folder=152/DSC0$i1.jpg"
    echo -e "\nSUCCESSFULLY DOWNLOADED WEBPAGEn"
fi

#2.) Construct user menu  && #3.) Prompt for user input && #5.) Execute tasks
# Using the for loop to reiterate the if-else body functions
for ((;;));
    do
        #Using echo, the following prints the options from which the user will select 
        #read -p prompts the user to insert an input
        echo "Please select one of the following options [1-4]:"
        echo "[1] Download a specific thumbnail"
        echo "[2] Download all thumbnails"
        echo "[3] Download Images in a range (by the last 4 digits of the file name)"
        echo "[4] Download a specified number of images"
        echo "[5] Exit"
        read -p "Input your option: " input
        #Function 1
        #The following if statement will run if $input is equivalent to 1 then;
        #prompts user a message for input using read -p
            #else statement runs wget to extract the image from the URL with the addition of what the user inp
        if [[ $input -eq 1 ]]; then
            read -p "Input the last four digits of the image within the provided range DSC0 (1533-2042):" it
        # if the user input is greater than 2041 or less than 1533 then it prompts the user with an error message; acts as an exception handler
            if [[ $it -gt 2042 ]]  || [[ $it -lt 1533 ]]; then
                echo -e "\nINVALID INPUT.PLEASE INSERT THE FOUR DIGITS WITHIN THE PROVIDED RANGE.\n"
                continue
            fi
        # else statement runs if the user input is within the provided range
            #Uses wget to download the address of the file to a specified path, opt1, which is in the same directory; 
            #The user input is inserted and replaces the last segment of the URL and retrieves that specific thumbnail
            # The tnsize(thumb nail size) syntax retrieves information about the file; 
            # Retrieves the file size of specified thumbnail from opt1 folder
            # It then prints the downloaded file, file name and file size (using the tnsize syntax)
            if [ -f DSC0$it.jpg ]; then
                echo "\nFile already exist\nTry another one\n"
            else  
                wget -P ./opt1 https://secure.ecu.edu.au/service-centres/MACSC/gallery/152/DSC0$it.jpg 
                tnsize=$( stat -c%s ./opt1/DSC0$it.jpg )
                echo -e "\nDownloading: DSC0$it\nFilename: DSC0$it.jpg\nFile size: $tnsize bytes.\n"
                continue
            fi 
        #Function 2
        # Pass contents of gallery .php to strip all non-url elements from the gallery.php to the atn.txt file
        # wget retrives the output of gallery.php file to atn and outputs atn contents to opt2 directory
        # -i option: not case sensitive; read the contents of text file
        elif [[ $input -eq 2 ]]; then
        # The first if statement checks if the opt2 directory exist; then 
        # Remove and recreate the directory. This overwrites the contents of the opt2 folder every time its run
        # Prints message prompting the contents of opt2 have been overwritten
                if [ -d opt2 ]; then
                    rm -r ~/opt2; mkdir ~/opt2
                    echo -e "\nFILE ALREADY EXISTS .Opt2 FOLDER OVERWRITTEN\n"
                    continue
        # The following else statement runs if the opt2 folder and its contents does not exist
        # Sed function substitutes the contents of the gallery.php text file and stripping certain URL elements. 
        # Use of semicolon to seperate each regex
        # From the gallery.php text file, grep finds any similar patterns or strings matching the specified URL link and stores it to atn.txt (all thumb nails)
        # wget reads the contents of atn.txt and outputs it to the opt2folder using -P
                else
                    sed -i -e 's/<img src="//g';'s/" alt="DSC0.*$//g' gallery.php?folder=152 &&  grep "https://secure.ecu.edu.au/service-centres" gallery.php?folder=152 > atn.txt
                    wget -i atn.txt -P opt2/
                    echo -e "\nDOWNLOADED ALL THUMBNAI\n"
                    continue  
                fi  
        #FUNCTION 3
        # The following elif statement asks user to download images from within a specified range
        # Prints message prompting user to input starting range (sr) and ending range (er)
        # If statement is an exception handler which checks if sr/er is greater/less than the provided range; then
        # Prints INVALID message prompting user to input a range again
        
        elif [[ $input -eq 3 ]]; then
            echo -e "\nPleases specify a STARTING and ENDING range  to download images from (Min.1533-Max.2042)"
            read -p "Starting range:DSC0" sr
            read -p "Ending range:DSC0" er
            if [[ $sr -gt 2042 || $sr -lt 1533 ]] || [[ $er -lt 1533 || $er -gt 2042 ]]; then
                echo -e "\nINVALID INPUT.\nPLEASE INSERT A RANGE NO LESS THAN 1533 OR GREATER THAN 2042\n"
                continue
        # The else statement below contains a nested for loop which reiterates over a range of number defined by variables
            else
        # The for loop repeatedly executes looking for a sequence of numbers within the sr and er
        # For (i)tems in between sr and er;
        # grep any matching/similar patterns in the atn.txt file and outputs it to ri.txt file
        # wget the contents of the ri.txt file and output it to an opt3 folder.
                for i in $(seq $sr $er)
                    do 
                        grep "https://secure.ecu.edu.au/service-centres/MACSC/gallery/152/DSC0$i.jpg" atn.txt > ri.txt
                        wget -i ./ri.txt -P opt3/
                        continue
                done
            fi
        #FUNCTION 4
        # The following function downloads a random number of images  out of the 75 images in the atn.txt file
        elif [[ $input -eq 4 ]]; then
        #Prompts the user to input a specified number of images to download
        #The rng function makes use of shuf to pick a random line from 1533-2042 and by using the -n option to limit the output to the specified user number input.
        #if statement checks if user input is greater than 75; then
        #prompt message to try again
            read -p "Input number of images to download:" r
            rng=$(shuf -n $r -i 1533-2042 )
            if [[ $r -gt 75 ]]; then
                echo -e "\nThere are only 75 images to download in total. Please try again.\n"
        # The else staement uses grep to find any matching /similar patterns in the atn.txt file and output it sn.txt
        # From sn.txt, use wget to retrieve the contents of sn.txt and output to an opt4 folder
            else
                grep "https://secure.ecu.edu.au/service-centres/MACSC/gallery/152/DSC0$rng.jpg" atn.txt > sn.txt
                wget -i sn.txt -P opt4/
                continue
            fi
        #Function 5
        # The last function gives te user the option to exit out of the script
        # Prints "Goodbye" message
        elif [[ $input -eq 5 ]]; then
            echo -e "\nGOODBYE\n"
            break
    #4.) Validate user input
        #The following exception handler checks if user inputs any other option other than 1-5
        else
            echo -e "\n**INVALID INPUT**. Please choose either options 1,2,3,4 or 5.\n"
            continue  
    fi
done

#6.) Report/Display result
    #Function 1
        # Duplicates thumbnails as opposed to overwriting/deleting the previous thumbnail
        #Does not check for special characters
    #Function 3
        # Does not overwrite/delete any duplicates
        #Does not check for special characters
        # Issues concerning 'No Urls' being found in ri.txt
    #Function 4
        # Does not overwrite/delete any duplicates
        # Does not check for any special characters
        # Issues regarding downloading the number specified from user input

#7.) Exit