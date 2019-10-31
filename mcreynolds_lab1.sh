#!/bin/bash
echo -e "  Hello World! This is $USER's first script. \r  
Quick summary of the current state: \r
1) current directory: \r
$PATH
2) contents of current directory (including permissions):
$(ls -la)
3) processes currently running here:
$(ps)
4) users currently logged on and their activity:
$(w)"

