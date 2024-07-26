# Description:
# Given an array of integers, calculate the ratios of its elements that are positive, negative, and zero. 
# Print the decimal value of each fraction on a new line with 6 places after the decimal.

# Note: This challenge introduces precision problems. 
#       The test cases are scaled to six decimal places, though answers with absolute error of up to  are acceptable.


# Complete the 'plusMinus' function below.
#
# The function accepts INTEGER_ARRAY arr as parameter.
#

def plusMinus(arr)
    # Write your code here

    # 1. Get the total number of array values (array.length)
    # 2. Find ratio of positive numbers in array:
    #       Loop through array counting how many items are greater than 0
    #       Divide that count by the total numbers in array (step 1)
    # 3. Find ratio of negative numbers in array:
    #       Loop through array counting how many items are less than 0
    #       Divide that count by the total numbers in array (step 1)
    # 4. Find ratio of zero value numbers in array:
    #       Loop through array counting how many items are equal to 0
    #       Divide that count by the total numbers in array (step 1)
    # 5. Print out each ratio on a new line to six decimal places
    
    positive_count = 0
    negative_count = 0
    zero_count = 0

    arr.each do |value|
        if value > 0
            positive_count += 1
        elsif value < 0
            negative_count += 1
        elsif value == 0
            zero_count += 1
        end
    end

    total_values = arr.length.to_f

    positive_ratio = positive_count / total_values
    negative_ratio = negative_count / total_values
    zero_ratio = zero_count / total_values

    # round to 6 decimal places
    printf("%.6f\n", positive_ratio)
    printf("%.6f\n", negative_ratio)
    printf("%.6f\n", zero_ratio)
end

array = [-1, -1, 0, 1, 1]

puts plusMinus(array)
