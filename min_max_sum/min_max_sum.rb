# Given five positive integers, find the minimum and maximum values that can be calculated by summing exactly 
#   four of the five integers. Then print the respective minimum and maximum values as a single line of two 
#   space-separated long integers.

# Complete the 'miniMaxSum' function below.
#
# The function accepts INTEGER_ARRAY arr as parameter.
#

def first_answer_using_sort(arr)
    sorted_array = arr.sort
    array_length = sorted_array.length

    min = sorted_array[0] + sorted_array[1] + sorted_array[2] + sorted_array[3]
    max = sorted_array[array_length-1] + sorted_array[array_length - 2] + sorted_array[array_length - 3] + sorted_array[array_length - 4]

    puts "#{min} #{max}"
end

def second_answer_without_sort(arr)
    total_sum = arr.sum
    min_value = arr.min
    max_value = arr.max
  
    min_sum = total_sum - max_value
    max_sum = total_sum - min_value
  
    puts "#{min_sum} #{max_sum}"
end
def miniMaxSum(arr)
    # Write your code here
    min = 0
    max = 0

    # first idea - using sort:
    # 1. sort the array from small to large
    # 2. min is the first two array values added together
    # 3. max is the last two array values added together
    #
    # first_answer_using_sort(arr)

    # Second idea - difficult without using sort, but here's the Ruby way:
    #
    # 1. find the sum of the array
    # 2. find the minimum value if the array
    # 3. find the maximum value in the array
    # 4. min_sum is the total - max value in array
    # 5. max_sum is the total - min value in array
    #
    # still uses built in Ruby methods but is simple. 
    second_answer_without_sort(arr)
end

# array = [1, 3, 5, 7, 9]
array = [1, 3, 7, 9, 5]
# expected result: 
# 16, 24
miniMaxSum(array)
