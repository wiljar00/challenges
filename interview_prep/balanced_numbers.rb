def countBalancedNumbers(p)
  n = p.length
  result = "0" * n
  
  # For each possible subarray, check what k values it satisfies
  (0...n).each do |start|
    (start...n).each do |end_idx|
      length = end_idx - start + 1
      
      # Early termination: if we already found this k, skip
      next if result[length - 1] == '1'
      
      subarray = p[start..end_idx]
      
      # Check if this subarray forms a permutation of 1..length
      if is_permutation_of_1_to_k(subarray, length)
        result[length - 1] = '1'
      end
    end
  end
  
  result
end

def is_permutation_of_1_to_k(arr, k)
  return false if arr.length != k
  
  # Use a boolean array to track which numbers 1..k we've seen
  seen = Array.new(k + 1, false)
  
  arr.each do |num|
    return false if num < 1 || num > k || seen[num]
    seen[num] = true
  end
  
  true
end

# Test with the example
p = [4, 1, 3, 2]
result = countBalancedNumbers(p)
puts "Result: #{result}"  # Should output: "1011"

# Test with sample case
p2 = [5, 3, 1, 2, 4]
result2 = countBalancedNumbers(p2)
puts "Sample result: #{result2}"

# Additional test
p3 = [1, 2, 3, 4]
result3 = countBalancedNumbers(p3)
puts "All balanced: #{result3}"  # Should be "1111"
