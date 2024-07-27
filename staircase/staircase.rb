# This is a staircase of size :
   #
  ##
 ###
####
# Its base and height are both equal to n. It is drawn using # symbols and spaces. The last line is not preceded by any spaces.

# Write a program that prints a staircase of size .

# Complete the 'staircase' function below.
#
# The function accepts INTEGER n as parameter.
#

def line_printer(n)
    string = ""

    for i in 1..n
        string = string << "#"
    end

    puts string
end

def staircase(n)
    # Write your code here
    for i in 1..n
        line_printer(i)
    end
end

staircase(4)