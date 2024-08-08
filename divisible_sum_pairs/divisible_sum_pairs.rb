# Given an array of integers and a positive integer k, 
# determine the number of (i, j) pairs where i < j and arli] + ar[i] is divisible by k.

#
# Complete the 'divisibleSumPairs' function below.
#
# The function is expected to return an INTEGER.
# The function accepts following parameters:
#  1. INTEGER n
#  2. INTEGER k
#  3. INTEGER_ARRAY ar
#

def divisibleSumPairs(n, k, ar)
    # Write your code here
    count = 0

    (0...n).each do |i|
        (i+1...n).each do |j|
          sum = ar[i] + ar[j]
          
          if sum % k == 0
            count += 1
          end
        end
      end
    count
end

ar = [1, 3, 2, 6, 1, 2]
k = 3
n = 6

puts divisibleSumPairs(n, k, ar) # should be 5