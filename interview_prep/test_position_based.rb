def final_solution(p)
    n = p.length
    result = "0" * n 
    max_val = p.max
    
    # trying a position mapping algorighm
    positions = Hash.new{ |h, k| h[k] = [] }    
    p.each_with_index { |val, idx| positions[val] << idx }
    
    (1..n).each do |k|
        break if k > max_val 

        next if (1..k).any? { |num| positions[num].empty? }
        
        found = false 
        (0..n-k).each do |start|
            end_pos = start + k - 1 
            
            valid = (1..k).all? do |num|
                count = positions[num].count { |pos| pos >= start && pos <= end_pos }  
                count == 1          
            end
            
            if valid 
                result[k-1] = '1' 
                found = true 
                break 
            end
        end
    end
    
    result
end

# Original sliding window for comparison
def sliding_window_solution(p)
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

# Test both implementations
if __FILE__ == $0
  test_cases = [
    [4, 1, 3, 2],
    [5, 3, 1, 2, 4],
    [1, 2, 3, 4, 5, 6],
    [3, 1, 4, 2, 5]
  ]
  expected = ["1011", "11111", "111111", "11100"]
  
  puts "Testing your position-based implementation:"
  
  test_cases.each_with_index do |test, i|
    result1 = final_solution(test)
    result2 = sliding_window_solution(test)
    
    puts "\nTest #{i + 1}: #{test}"
    puts "Expected:      #{expected[i]}"
    puts "Position-based: #{result1} #{result1 == expected[i] ? '✓' : '✗'}"
    puts "Sliding window: #{result2} #{result2 == expected[i] ? '✓' : '✗'}"
    puts "Match: #{result1 == result2 ? '✓' : '✗'}"
  end
  
  puts "\nPerformance comparison:"
  [500, 1000, 2000].each do |size|
    test_array = (1..size).to_a.shuffle
    
    start = Time.now
    result1 = final_solution(test_array)
    time1 = Time.now - start
    
    start = Time.now
    result2 = sliding_window_solution(test_array)
    time2 = Time.now - start
    
    puts "\nSize #{size}:"
    puts "Position-based: #{time1.round(4)}s"
    puts "Sliding window: #{time2.round(4)}s"
    puts "Results match:  #{result1 == result2 ? '✓' : '✗'}"
    puts "Speedup:        #{(time2/time1).round(2)}x" if time1 > 0
  end
end
