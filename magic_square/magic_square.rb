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

def first_solution(s)
    # All possible 3x3 magic squares
    magic_squares = [
        [[8, 1, 6], [3, 5, 7], [4, 9, 2]],
        [[6, 1, 8], [7, 5, 3], [2, 9, 4]],
        [[4, 9, 2], [3, 5, 7], [8, 1, 6]],
        [[2, 9, 4], [7, 5, 3], [6, 1, 8]],
        [[8, 3, 4], [1, 5, 9], [6, 7, 2]],
        [[4, 3, 8], [9, 5, 1], [2, 7, 6]],
        [[6, 7, 2], [1, 5, 9], [8, 3, 4]],
        [[2, 7, 6], [9, 5, 1], [4, 3, 8]]
    ]

    # Initialize minimum cost to a large number
    min_cost = Float::INFINITY

    # Calculate the cost to convert the given square to each magic square
    magic_squares.each do |magic|
        cost = 0
        for i in 0..2
        for j in 0..2
            cost += (s[i][j] - magic[i][j]).abs
        end
        end
        # Update the minimum cost
        min_cost = [min_cost, cost].min
    end

    return min_cost
end

def second_solution(s)
    # All possible 3x3 magic squares
    magic_squares = [
        [[8, 1, 6], [3, 5, 7], [4, 9, 2]],
        [[6, 1, 8], [7, 5, 3], [2, 9, 4]],
        [[4, 9, 2], [3, 5, 7], [8, 1, 6]],
        [[2, 9, 4], [7, 5, 3], [6, 1, 8]],
        [[8, 3, 4], [1, 5, 9], [6, 7, 2]],
        [[4, 3, 8], [9, 5, 1], [2, 7, 6]],
        [[6, 7, 2], [1, 5, 9], [8, 3, 4]],
        [[2, 7, 6], [9, 5, 1], [4, 3, 8]]
    ]

    # Calculate the minimal cost
    magic_squares.map do |magic|
        magic.zip(s).sum { |m_row, s_row| m_row.zip(s_row).sum { |m, s| (m - s).abs } }
    end.min
end

def formingMagicSquare(s)
    # first_solution(s)
    second_solution(s)
end

s = [[5, 3, 4], [1, 5, 8], [6, 4, 2]]
puts formingMagicSquare(s) # Expected result: 7

s = [[4, 9, 2],[3, 5, 7], [8, 1, 5]]
puts formingMagicSquare(s) # Expected result: 1