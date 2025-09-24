def final_solution_optimized(p)
    n = p.length
    result = "0" * n 
    max_val = p.max
    
    # Build position mapping
    positions = Hash.new{ |h, k| h[k] = [] }    
    p.each_with_index { |val, idx| positions[val] << idx }
    
    (1..n).each do |k|
        break if k > max_val 

        next if (1..k).any? { |num| positions[num].empty? }
        
        # Optimization: For each window, use binary search or direct indexing
        (0..n-k).each do |start|
            end_pos = start + k - 1 
            
            # Instead of counting, check if exactly one occurrence exists in range
            valid = true
            (1..k).each do |num|
                # Use binary search or direct range check
                count_in_range = 0
                positions[num].each do |pos|
                    break if pos > end_pos  # positions are in order
                    count_in_range += 1 if pos >= start
                end
                
                if count_in_range != 1
                    valid = false
                    break
                end
            end
            
            if valid 
                result[k-1] = '1' 
                break 
            end
        end
    end
    
    result
end

# Even more optimized: Use binary search
def final_solution_binary_search(p)
    n = p.length
    result = "0" * n 
    max_val = p.max
    
    # Build sorted position mapping
    positions = Hash.new{ |h, k| h[k] = [] }    
    p.each_with_index { |val, idx| positions[val] << idx }
    
    (1..n).each do |k|
        break if k > max_val 

        next if (1..k).any? { |num| positions[num].empty? }
        
        (0..n-k).each do |start|
            end_pos = start + k - 1 
            
            valid = (1..k).all? do |num|
                pos_array = positions[num]
                
                # Binary search for start position
                left_idx = binary_search_left(pos_array, start)
                right_idx = binary_search_right(pos_array, end_pos)
                
                # Count elements in range [start, end_pos]
                count = right_idx - left_idx
                count == 1
            end
            
            if valid 
                result[k-1] = '1' 
                break 
            end
        end
    end
    
    result
end

def binary_search_left(arr, target)
    left, right = 0, arr.length
    while left < right
        mid = (left + right) / 2
        if arr[mid] < target
            left = mid + 1
        else
            right = mid
        end
    end
    left
end

def binary_search_right(arr, target)
    left, right = 0, arr.length
    while left < right
        mid = (left + right) / 2
        if arr[mid] <= target
            left = mid + 1
        else
            right = mid
        end
    end
    left
end

# Hybrid approach: Use sliding window for large k, position-based for small k
def final_solution_hybrid(p)
    n = p.length
    result = "0" * n 
    max_val = p.max
    
    # Build position mapping for small k values
    positions = Hash.new{ |h, k| h[k] = [] }    
    p.each_with_index { |val, idx| positions[val] << idx }
    
    (1..n).each do |k|
        break if k > max_val 
        next if (1..k).any? { |num| positions[num].empty? }
        
        if k <= 50  # Use position-based for small k
            (0..n-k).each do |start|
                end_pos = start + k - 1 
                
                valid = (1..k).all? do |num|
                    # Optimized counting using early termination
                    count = 0
                    positions[num].each do |pos|
                        break if pos > end_pos
                        count += 1 if pos >= start
                        break if count > 1  # Early termination
                    end
                    count == 1
                end
                
                if valid 
                    result[k-1] = '1' 
                    break 
                end
            end
        else  # Use sliding window for large k
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
                out_val = p[i - k]
                if out_val <= k && out_val >= 1
                    unique -= 1 if (freq[out_val] -= 1) == 0
                end
                
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
    end
    
    result
end

# Test all optimized versions
if __FILE__ == $0
    test_cases = [
        [4, 1, 3, 2],
        [5, 3, 1, 2, 4]
    ]
    expected = ["1011", "11111"]
    
    puts "Testing optimized position-based approaches:"
    
    test_cases.each_with_index do |test, i|
        puts "\nTest #{i + 1}: #{test}"
        puts "Expected: #{expected[i]}"
        
        result1 = final_solution_optimized(test)
        result2 = final_solution_binary_search(test)
        result3 = final_solution_hybrid(test)
        
        puts "Optimized:     #{result1} #{result1 == expected[i] ? '✓' : '✗'}"
        puts "Binary search: #{result2} #{result2 == expected[i] ? '✓' : '✗'}"
        puts "Hybrid:        #{result3} #{result3 == expected[i] ? '✓' : '✗'}"
    end
    
    puts "\nPerformance test (size 1000):"
    test_array = (1..1000).to_a.shuffle
    
    methods = [
        [:optimized, method(:final_solution_optimized)],
        [:binary_search, method(:final_solution_binary_search)],
        [:hybrid, method(:final_solution_hybrid)]
    ]
    
    methods.each do |name, method|
        start = Time.now
        result = method.call(test_array)
        time = Time.now - start
        puts "#{name.to_s.ljust(15)}: #{time.round(4)}s"
    end
end
