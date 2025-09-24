def debug_solution(p)
  n = p.length
  result = "0" * n 
  
  puts "Input array: #{p}"
  puts "Array length: #{n}"
  puts
  
  (1..n).each do |k|
    puts "Checking k = #{k}"
    frequency = Array.new(k + 1, 0)
    unique = 0
    
    # Initialize first window
    puts "  Initializing window [0...#{k}]"
    (0...k).each do |i|
      if p[i] <= k
        frequency[p[i]] += 1
        unique += 1 if frequency[p[i]] == 1
        puts "    p[#{i}] = #{p[i]}, frequency[#{p[i]}] = #{frequency[p[i]]}, unique = #{unique}"
      end
    end
    
    puts "  After initialization: unique = #{unique}, frequency = #{frequency[1..k]}"
    
    if unique == k 
      puts "  ✓ Found balanced k=#{k} in first window"
      result[k-1] = '1'
      next
    end
    
    # Slide window
    puts "  Sliding window..."
    (k...n).each do |i|
      puts "    Window position #{i-k} to #{i}: #{p[i-k..i]}"
      
      if p[i-k] <= k 
        frequency[p[i-k]] -= 1
        unique -= 1 if frequency[p[i-k]] == 0
        puts "    Removed #{p[i-k]}: frequency[#{p[i-k]}] = #{frequency[p[i-k]]}, unique = #{unique}"
      end
      
      if p[i] <= k
        frequency[p[i]] += 1
        unique += 1 if frequency[p[i]] == 1
        puts "    Added #{p[i]}: frequency[#{p[i]}] = #{frequency[p[i]]}, unique = #{unique}"
      end
      
      if unique == k
        puts "  ✓ Found balanced k=#{k} at position #{i-k} to #{i}"
        result[k-1] = '1'
        break
      end
    end
    
    puts "  Result for k=#{k}: #{result[k-1]}"
    puts
  end
  
  result
end

# Test with the failing case
p = [5, 3, 1, 2, 4]
result = debug_solution(p)
puts "Final result: #{result}"
