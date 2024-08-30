# We define a magic square to be an n x n matrix of distinct positive integers from 1 to n^2 
# where the sum of any row, column, or diagonal of length n is always equal to the same
# number: the magic constant.
# You will be given a 3 x 3 matrix s of integers in the inclusive range [1, 9]. 
# We can convert any digit a to any other digit b in the range [1, 9] at cost of la - b. 
# Given s, convert it into a magic square at minimal cost. Print this cost on a new line.
# Note: The resulting magic square must contain distinct integers in the inclusive range [1, 9].

#
# Complete the 'formingMagicSquare' function below.
#
# The function is expected to return an INTEGER.
# The function accepts 2D_INTEGER_ARRAY s as parameter.
#

def formingMagicSquare(s)
    # Write your code here
    result = 0

    return result
end

s = [[5, 3, 4], [1, 5, 8], [6, 4, 2]]
puts formingMagicSquare(s) # Expected result: 7