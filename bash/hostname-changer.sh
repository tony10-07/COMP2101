#!/bin/bash
#
# This script is for the bash lab on variables, dynamic data, and user input
# Download the script, do the tasks described in the comments
# Test your script, run it on the production server, screenshot that
# Send your script to your github repo, and submit the URL with screenshot on Blackboard

# Get the current hostname using the hostname command and save it in a variable
My_hostname= echo "Given hostname is : $(hostname)"
# Tell the user what the current hostname is in a human friendly way
echo $My_hostname
# Ask for the user's student number using the read command
read -p "Please enter the Student number : ";
Std_ID="pc${REPLY}"
echo $Std_ID

# Use that to save the desired hostname of pcNNNNNNNNNN in a variable, where NNNNNNNNN is the student number entered by the user

# If that hostname is not already in the /etc/hosts file, change the old hostname in that file to the new name using sed or something similar and
#     tell the user you did that
#e.g. sed -i "s/$oldname/$newname/" /etc/hosts
grep "$Std_ID" /etc/hosts || (sudo sed -i "s/My_hostname/$Std_ID/" /etc/hosts && echo "Current hostname is now changed from $My_hostname to $Std_ID" )

# If that hostname is not the current hostname, change it using the hostnamectl command and
#     tell the user you changed the current hostname and they should reboot to make sure the new name takes full effect
#e.g. hostnamectl set-hostname $newname
grep "$Std_ID" /etc/hosts && echo "Hostname $Std_ID already in use" || (sudo hostnamectl set-hostname $Std_ID && echo "You have to restart the PC for full effect")
