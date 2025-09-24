def count_highly_profitable_intervals(stock_prices, k)
  return 0 if stock_prices.length < k
  
  count = 0
  
  # Check each possible interval of length k
  (0..stock_prices.length - k).each do |i|
    interval = stock_prices[i, k]
    
    # Check if the interval is strictly increasing
    is_strictly_increasing = true
    (0...interval.length - 1).each do |j|
      if interval[j] >= interval[j + 1]
        is_strictly_increasing = false
        break
      end
    end
    
    count += 1 if is_strictly_increasing
  end
  
  count
end

# Test with the example from the problem
stock_prices = [5, 3, 5, 7, 8]
k = 3
result = count_highly_profitable_intervals(stock_prices, k)
puts "Result: #{result}"  # Should output: 2

# Additional test cases
puts "\nAdditional test cases:"

# Test case 1: All increasing
test1 = [1, 2, 3, 4, 5]
puts "Test 1 - [1,2,3,4,5], k=3: #{count_highly_profitable_intervals(test1, 3)}"  # Should be 3

# Test case 2: No increasing intervals
test2 = [5, 4, 3, 2, 1]
puts "Test 2 - [5,4,3,2,1], k=3: #{count_highly_profitable_intervals(test2, 3)}"  # Should be 0

# Test case 3: k=1 (all intervals of length 1 are profitable)
test3 = [5, 3, 5, 7, 8]
puts "Test 3 - [5,3,5,7,8], k=1: #{count_highly_profitable_intervals(test3, 1)}"  # Should be 5

# Test case 4: Mixed case
test4 = [1, 2, 1, 3, 4, 2, 5]
puts "Test 4 - [1,2,1,3,4,2,5], k=3: #{count_highly_profitable_intervals(test4, 3)}"  # Should be 2
