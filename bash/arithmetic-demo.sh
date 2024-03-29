#!/bin/bash
#
# this script demonstrates doing arithmetic

# Improve this script by asking the user to supply the two numbers
# Improve this script by demonstrating using subtraction and multiplication
# Improve this script by demonstrating the modulus operation
#   - the output should look something like:
#   - first divided by second gives X with a remainder of Y
# Improve this script by calculating and displaying the first number raised to the power of the second number


firstnum=5
secondnum=2
sum=$((firstnum + secondnum))
dividend=$((firstnum / secondnum))
fpdividend=$(awk "BEGIN{printf \"%.2f\", $firstnum/$secondnum}")

cat <<EOF
$firstnum plus $secondnum is $sum
$firstnum divided by $secondnum is $dividend
  - More precisely, it is $fpdividend
EOF

echo "-------IMPROVE---------"
# Improve this script by asking the user to supply the two numbers
read -p "Enter a number: " n1
read -p "Enter a second number: " n2

# Improve this script by demonstrating using subtraction and multiplication
echo "Subtraction of $n1 - $n2 is      = " $((n1-n2))
echo "Multiplication of $n1 * $n2 is   = " $((n1*n2))

# Improve this script by demonstrating the modulus operation
echo "Modulus of $n1 % $n2 is          = " $((n1%n2))
n3=$((n1/n2))
remainder=$((n1%n2))
echo "The first number divided the second gives $n3 with a remainder of $remainder"

# Improve this script by calculating and displaying the first number raised to the power of the second number
echo "The first number $n1 raised to the power of the second number $n2 is = " $((n1**n2))
