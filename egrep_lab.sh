#!/bin/bash

# Name: Mihaela McReynolds
# Class: CITC-1317a
# Lab 3
# 9/13/2019

# 1) You decided to start the file name with your last name, followed by an underscore, and then  lab3.sh for some odd reason).
# 2) Input arguments will be either -e filename or -p filename. -e will cause the script to print out the
# email addresses. -p will print out phone numbers.
# 3) You definitely are not going to need entire lines to be printed, just the email addresses or the
# phone numbers, so you decide to use the -o argument together with egrep to extract needed
# information from the file.
# 4) Ms. Nix told you that she is certain that phone numbers will have one of these two forms:
# ddd-ddd-dddd or (ddd)ddd-dddd.

# If the first argument is -e, then find the email address

if [ $1 = "-e" ] ; then

# Only print the part of the line that matches this regex: 
# one or more alphanumerics + zero or more . or - or _ but not as the first character + one or more alphanumerics + one @ sign + one or more alphanumerics + one dot + com or edu or org or net
# I'm not sure if any double extension is valid, but I included incognito@formetoknow.andnotforyoutofindout.com in my valid regex because it was in the lab print screens


egrep -o '[a-zA-Z0-9]+[._-]*[a-zA-Z0-9]+*@{1}[a-zA-Z0-9.-]+\.{1}(com|edu|org|net)' $2

# Else, if the first argument is -p, then find the phone number

elif [ $1 = "-p" ] ; then

# Only print the part of the line that matches this regex:
# One opening bracket ( + 3 digits 0-9 + one closing bracket ) + 3 digits + a dash + four digits 
# OR 3 digits + one dash + 3 digits + one dash + 4 digits

egrep -o '\({1}[0-9]{3}\){1}[0-9]{3}-{1}[0-9]{4}|[0-9]{3}-{1}[0-9]{3}-{1}[0-9]{4}' $2

# I should be getting results, so if nothing matches, there is an error

else
echo What did you DO?
fi
