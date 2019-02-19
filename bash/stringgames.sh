#!/bin/bash
#
# this script demonstrates some common text manipulation commands
#

# The somesillytext variable will contain some sample inline data for us to play with
somesillytext="
He said hello to me.
So I said hello back to him.
Then he told me his name was Othello.
I thanked him and ate his lunch.

He got sad, and asked why I did that.
I,   uh,   was not sure and said so.
So I said sorry, and he laughed and said it's ok because he likes Canadians.
"

# This echo command sequence displays what is in the somesillytext variable
# TASK 1: Modify these 3 commands to use printf instead of echo
echo "========silly text========"
echo "$somesillytext"
echo "=========================="

# this 'grep' command finds lines with the string 'hello' in them in the text from the somesillytext variable
# TASK 2: Modify the grep command to only find the word hello as a word of its own in the text from the somesillytext variable
# TASK 3: Modify the grep command to only find the lines that start with 'I' in the text from the somesillytext variable
# TASK 4: Modify the grep command to only find the lines that end with something other than a period in the text from the somesillytext variable
# TASK 5: Modify the grep command to only find the lines that are blank or only contain spaces or tabs in the text from the somesillytext variable
echo "========silly text lines with the string 'hello'========"
grep hello <<< "$somesillytext"
echo "=========================="

# this 'tr' command will remove extra spaces from the text in the somesillytext variable
# TASK 6: Modify the tr command to turn lower case characters into upper case characters in the text from the somesillytext variable
echo "========Extra spaces removed========"
tr -s ' ' <<< "$somesillytext"
echo "=========================="

# this pipeline runs ip to show configured ip addresses in brief mode
#   then uses cut to only extract the first word of each output line
#   to produce a list of configured interface names on this system
# TASK 7: Modify this pipeline to use awk to print the interface names instead of cut
# TASK 8: Modify this pipeline to use grep to print the interface names instead of cut
echo "========Interface Names using cut with a space as delimiter========"
ip -br a s| cut -d ' ' -f 1
echo "=========================="

# this pipeline uses the find command to find regular files
#   then uses 'file' on each file to determine the type of data the file contains
#   then uses 'egrep' to only keep the lines that have png in them
#   then uses 'awk' to print out the filename and type only, to keep the output clean
# TASK 9: Modify the grep to find both JPEG and PNG files
echo "=========PNG files========"
find ~ -type f -exec file {} \; 2> /dev/null |
    grep  ": PNG" |
    awk '{print $1, $2}' |
    head
echo "=========================="

# this script block finds the setuid files on the system
#   and displays a list of them sorted by the 5th field on the line which is the user that owns each file
# TASK 10: Modify this to display a second report showing the files with setgid set, sorted by and displaying the group that owns them
echo "Setuid files:"
echo "=========================="
find /bin /usr/bin -type f -executable -perm -4000 -ls 2>/dev/null | sort -k 5 | head
echo "=========================="

