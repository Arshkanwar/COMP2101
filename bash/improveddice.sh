#!/bin/bash
#
# this script rolls a pair of six-sided dice and displays both the rolls and the sum
#

# Improve this script by re-organizing it to:
#  put the number of sides in a variable which is used as the range for the random number
#  put the bias, or offset, for the RANDOM number in a variable (it is 1 for our purposes)
#     - you can think of this as the minimum value for the generated number
#  roll the dice using the variables for the range and bias i.e. RANDOM % range + bias
#  generate the sum of the dice
#  generate the average of the dice
#  display a summary of what was rolled, and what the result was

range=6
bias=1
# Tell the user we have started processing
echo "Rolling..."
# roll the dice and save the results
die1=$(( RANDOM % $range + $bias))
die2=$(( RANDOM % $range + $bias))
# sum up the rolls
sum=$(( die1 + die2 ))
# generate the average
avg=$(( (die1 + die2) / 2))
# display the results
echo "Rolled $die1, $die2 for a $sum (average of the dice was $avg)"
