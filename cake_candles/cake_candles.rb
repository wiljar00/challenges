# You are in charge of the cake for a child's birthday. 
# You have decided the cake will have one candle for each year of their total age. 
# They will only be able to blow out the tallest of the candles. 
# Count how many candles are tallest.

# Complete the 'birthdayCakeCandles' function below.
#
# The function is expected to return an INTEGER.
# The function accepts INTEGER_ARRAY candles as parameter.
#

def first_solution(candles)
    max = candles.max
    count = 0

    candles.each do |value|
        if value == max
            count += 1
        end
    end

    count
end

def best_ruby_solution(candles)
    max = candles.max
    candles.count(max)
end

def birthdayCakeCandles(candles)
    # basically find the max value in the array 
    # return how how many times that value appears in the array

    # count = first_solution(candles)
    count = best_ruby_solution(candles)
    count
end

candles = [4, 4, 1, 3]
puts birthdayCakeCandles(candles)