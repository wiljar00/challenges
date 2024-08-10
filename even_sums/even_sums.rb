# Challenge: Sum of Even Numbers
# Problem:
# Write a function in Ruby that takes an array of integers as input and 
# returns the sum of all even numbers in the array.

def sum_of_evens(arr)
    even_nums = []
    arr.each do |num|
        if num % 2 == 0
            even_nums << num
        end
    end
    even_nums.sum
end

puts sum_of_evens([1, 2, 3, 4, 5, 6])
# => 12

puts sum_of_evens([7, 8, 9, 10])
# => 18

puts sum_of_evens([11, 13, 15])
# => 0
