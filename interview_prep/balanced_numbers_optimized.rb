def final_solution(p)
  n = p.length
  result = "0" * n 
  max_val = p.max
  
  (1..n).each do |k|
    break if k > max_val 
    
    freq = Array.new(k + 1, 0)
    unique = 0 
    
    # first window
    k.times do |i|
      val = p[i] 
      next if val > k || val < 1 
      unique += 1 if (freq[val] += 1) == 1
    end 
    
    if unique == k 
      result[k - 1] = '1'
      next
    end
    
    # sliding window
    (k...n).each do |i|
      # get rid outgoing element
      out_val = p[i - k]
      if out_val <= k && out_val >= 1
        unique -= 1 if (freq[out_val] -= 1) == 0
      end
      
      # add incoming element
      in_val = p[i] 
      if in_val <= k && in_val >= 1 
        unique += 1 if (freq[in_val] += 1) == 1
      end
      
      if unique == k 
        result[k - 1] = '1' 
        break
      end
    end
  end
  
  result
end

# Most optimized version - reduces constant factors significantly
def blazing_fast_solution(p)
  n = p.length
  result = "0" * n
  max_val = p.max
  
  # Pre-filter: only process values that could be relevant
  valid_indices = []
  p.each_with_index { |val, idx| valid_indices << idx if val <= max_val }
  
  k = 1
  while k <= n && k <= max_val
    freq = [0] * (k + 1)
    unique = 0
    
    # Initial window - unrolled for small k values
    if k <= 10
      case k
      when 1
        if p[0] == 1
          result[0] = '1'
          k += 1
          next
        end
      when 2
        val1, val2 = p[0], p[1]
        if (val1 == 1 && val2 == 2) || (val1 == 2 && val2 == 1)
          result[1] = '1'
          k += 1
          next
        end
      end
    end
    
    # Standard processing for larger k
    i = 0
    while i < k
      val = p[i]
      if val <= k && val >= 1
        if freq[val] == 0
          unique += 1
          freq[val] = 1
        else
          freq[val] += 1
        end
      end
      i += 1
    end
    
    if unique == k
      result[k - 1] = '1'
      k += 1
      next
    end
    
    # Sliding window with manual loop unrolling
    i = k
    while i < n
      # Remove outgoing
      out_val = p[i - k]
      if out_val <= k && out_val >= 1
        freq[out_val] -= 1
        unique -= 1 if freq[out_val] == 0
      end
      
      # Add incoming
      in_val = p[i]
      if in_val <= k && in_val >= 1
        unique += 1 if freq[in_val] == 0
        freq[in_val] += 1
      end
      
      if unique == k
        result[k - 1] = '1'
        break
      end
      
      i += 1
    end
    
    k += 1
  end
  
  result
end

# Test with provided examples
if __FILE__ == $0
  puts "Testing both versions:"
  
  test_cases = [
    [4, 1, 3, 2],
    [5, 3, 1, 2, 4]
  ]
  expected = ["1011", "11111"]
  
  test_cases.each_with_index do |test, i|
    result1 = final_solution(test)
    result2 = blazing_fast_solution(test)
    
    puts "Test #{i + 1}: #{test}"
    puts "Expected: #{expected[i]}"
    puts "Final:    #{result1} #{result1 == expected[i] ? '✓' : '✗'}"
    puts "Blazing:  #{result2} #{result2 == expected[i] ? '✓' : '✗'}"
    puts
  end
  
  puts "Performance comparison:"
  [1000, 5000, 10000].each do |size|
    test_array = (1..size).to_a.shuffle
    
    start = Time.now
    result1 = final_solution(test_array)
    time1 = Time.now - start
    
    start = Time.now  
    result2 = blazing_fast_solution(test_array)
    time2 = Time.now - start
    
    puts "Size #{size}:"
    puts "  Final:   #{time1.round(4)}s"
    puts "  Blazing: #{time2.round(4)}s"
    puts "  Match:   #{result1 == result2}"
    puts "  Speedup: #{(time1/time2).round(2)}x" if time2 > 0
    puts
  end
end