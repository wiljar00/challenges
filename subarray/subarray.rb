# Given an array of integers, find the longest subarray where the absolute difference between any two elements is less than or equal to 1.

#
# Complete the 'pickingNumbers' function below.
#
# The function is expected to return an INTEGER.
# The function accepts INTEGER_ARRAY a as parameter.
#

def pickingNumbers(a)
    frequency = Hash.new(0)
    a.each { |num| frequency[num] += 1 }

    max_length = 0
    frequency.keys.each do |num|
        current_length = frequency[num] + frequency[num + 1]
        max_length = [max_length, current_length].max
    end

    max_length
end

a = [1, 1, 2, 2, 4, 4, 5, 5, 5]
puts pickingNumbers(a) # expects to return 5

a = [4, 6, 5, 3, 3, 1]
puts pickingNumbers(a) # expects to return 3

a = [1, 2, 2, 3, 1, 2]
puts pickingNumbers(a) # expects to return 5