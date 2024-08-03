# There will be two arrays of integers. Determine all integers that satisfy the following two
# conditions:
# 1. The elements of the first array are all factors of the integer being considered
# 2. The integer being considered is a factor of all elements of the second array
# These numbers are referred to as being between the two arrays. Determine how many such numbers exist.

# Complete the 'getTotalX' function below.
#
# The function is expected to return an INTEGER.
# The function accepts following parameters:
#  1. INTEGER_ARRAY a
#  2. INTEGER_ARRAY b
#

def getTotalX(a, b)
  # Find the range to check for potential candidates
  max_a = a.max
  min_b = b.min

  factors = []

  (max_a..min_b).each do |possible_num|
    is_multiple_of_a = a.all? do |a_num|
      possible_num % a_num == 0
    end

    is_factor_of_b = b.all? do |b_num|
      b_num % possible_num == 0
    end

    if is_multiple_of_a && is_factor_of_b
      factors << possible_num
    end
  end

  puts "Factors: #{factors}"
  factors.size
end


a = [2, 6]
b = [24, 36]

puts getTotalX(a, b) # returns [6, 2].size which is 2

a = [2, 4]
b = [16, 32, 96]

puts getTotalX(a, b) # returns [4, 8, 16].size which is 3