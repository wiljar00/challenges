
# Complete the 'diagonalDifference' function below.
#
# Given a square matrix, calculate the absolute difference between the sums of its diagonals.
#
# The function is expected to return an INTEGER.
# The function accepts 2D_INTEGER_ARRAY arr as parameter.

def diagonalDifference(array)
    # 1. find the sum of the first diagonal starting at 1 x 1
    first_sum = 0
    second_sum = 0

    array.each_with_index do |value, index|
        number = value[index]
        first_sum += number
    end
    
    # 2. find the sum of the second diagonal, starting at 1 x array[length - 1]
    array.reverse.each_with_index do |value, index|
        number = value[index]
        second_sum += number
    end

    # 3. find out which one is greater and subtract
    if first_sum >= second_sum
        result = first_sum - second_sum
    else
        result = second_sum - first_sum
    end

    # 4. return the difference. 
    result
end

array1 = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]

puts "Diagonal difference: #{diagonalDifference(array1)}"