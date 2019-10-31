#!/bin/bash

# Name: Mihaela McReynolds
# CITC-1317a > Lab 2
# 9/11/2019

# Task 1: total number of bytes taken up by all of the files in the current directory
# Task 2: Determine how many of the files in the current directory have read/ write/ execute permission

# Create variables to hold counters for bytes,
count=0
# read permission for user
countr=0
# write permission for user
countw=0
# execute eprmission
countx=0

# Loop through all the files, extract their size in bytes and add it up. Look at their permissions settings and add them up for individual permission totals
for file in *
do
	if [ -f $file ] ; then
		count=$((count + $(stat -c "%s" "$file")))
	fi
	if [ -r $file ] ; then
		countr=$((countr + 1))
        fi
        if [ -w $file ] ; then
                countw=$((countw + 1))
	fi
        if [ -x $file ] ; then
                countx=$((countx + 1))
        fi	
done 

# Transform bytes into KB and print number of bytes (KB) for the directory
approx=$(($count / 1000))
echo Total size of all files in this directory: $count bytes \(\~$approx KB\).

# Use the word 'has' or 'have' depending on number of files found for proper English
if [ $countr -gt 1 ] ; then
echo $countr of the files have read permission.
elif [ $countr -eq 1 ] ; then
echo $countr of the files has read permission.
else
echo None of the files have read permission. 
fi
if [ $countw -gt 1 ] ; then
echo $countw of the files have write permission.
elif [ $countw -eq 1 ] ; then
echo $countw of the files has write permission.
else
echo None of the files have write permission. 
fi
if [ $countx -gt 1 ] ; then
echo $countx of the files have execute permission.
elif [ $countx -eq 1 ] ; then
echo $countx of the files has execute permission.
else
echo None of the files have execute permission. 
fi

# Task 3: Write code that will estimate the number of shell scripts in the current directory
# Look at the first line of files, find '#!/bin/bash', count how many files have the shell script label

echo Estimated number of shell script files in this directory:
echo $(grep head -n1 $file | grep -r '^#!/bin/bash' | wc -l)

