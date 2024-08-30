# Given an array of integers, find the longest subarray where the absolute difference between any two elements is less than or equal to 1.

#
# Complete the 'pickingNumbers' function below.
#
# The function is expected to return an INTEGER.
# The function accepts INTEGER_ARRAY a as parameter.
#

def pickingNumbers(a)
    # Write your code here
    subarray = a[0]
    

    subarray
end

a = [1, 1, 2, 2, 4, 4, 5, 5, 5]
puts pickingNumbers(a) # expects to return 5

a = [4, 6, 5, 3, 3, 1]
puts pickingNumbers(a) # expects to return 5

a = [1, 2, 2, 3, 1, 2]
puts pickingNumbers(a) # expects to return 5