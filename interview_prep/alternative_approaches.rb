# Alternative Approach 1: Position-Based Analysis
# Instead of sliding window, analyze positions of each number
def position_based_solution(p)
  n = p.length
  result = "0" * n
  max_val = p.max
  
  # Build position maps for each value
  positions = Hash.new { |h, k| h[k] = [] }
  p.each_with_index { |val, idx| positions[val] << idx }
  
  (1..n).each do |k|
    break if k > max_val
    
    # Skip if any required number is missing
    missing = (1..k).any? { |num| positions[num].empty? }
    next if missing
    
    # For each possible starting position, check if we can form a valid window
    found = false
    (0..n-k).each do |start|
      end_pos = start + k - 1
      
      # Count how many of each required number appear in this range
      valid = true
      (1..k).each do |num|
        count = positions[num].count { |pos| pos >= start && pos <= end_pos }
        if count != 1
          valid = false
          break
        end
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

# Alternative Approach 2: Interval Intersection
# Find the minimum interval that contains all required numbers
def interval_intersection_solution(p)
  n = p.length
  result = "0" * n
  max_val = p.max
  
  # Build position maps
  positions = Hash.new { |h, k| h[k] = [] }
  p.each_with_index { |val, idx| positions[val] << idx }
  
  (1..n).each do |k|
    break if k > max_val
    
    # Skip if any required number is missing
    required_nums = (1..k).to_a
    missing = required_nums.any? { |num| positions[num].empty? }
    next if missing
    
    # Find minimum window that contains at least one of each required number
    min_window_size = find_minimum_window_size(positions, required_nums)
    
    if min_window_size && min_window_size <= k
      # Check if there's actually a window of size k with the right properties
      if check_exact_window_exists(p, k, n, positions, required_nums)
        result[k-1] = '1'
      end
    end
  end
  
  result
end

def find_minimum_window_size(positions, required_nums)
  # Find the smallest window that contains at least one occurrence of each required number
  all_positions = []
  required_nums.each do |num|
    positions[num].each { |pos| all_positions << [pos, num] }
  end
  all_positions.sort!
  
  # Sliding window to find minimum window with all required numbers
  left = 0
  count = Hash.new(0)
  min_size = Float::INFINITY
  
  all_positions.each_with_index do |(pos, num), right|
    count[num] += 1
    
    while count.size == required_nums.size && count.values.all? { |c| c > 0 }
      window_size = pos - all_positions[left][0] + 1
      min_size = [min_size, window_size].min
      
      left_num = all_positions[left][1]
      count[left_num] -= 1
      count.delete(left_num) if count[left_num] == 0
      left += 1
    end
  end
  
  min_size == Float::INFINITY ? nil : min_size
end

def check_exact_window_exists(p, k, n, positions, required_nums)
  # Use two pointers to find if there's a window of exactly size k
  (0..n-k).each do |start|
    window = p[start, k]
    freq = Hash.new(0)
    window.each { |val| freq[val] += 1 }
    
    # Check if this window has exactly the required numbers
    valid = required_nums.all? { |num| freq[num] == 1 } &&
            freq.keys.all? { |key| required_nums.include?(key) }
    
    return true if valid
  end
  false
end

# Alternative Approach 3: Divide and Conquer
# Split the problem into smaller subproblems
def divide_conquer_solution(p)
  n = p.length
  result = "0" * n
  max_val = p.max
  
  (1..n).each do |k|
    break if k > max_val
    
    if has_balanced_subsequence(p, k, 0, n-1)
      result[k-1] = '1'
    end
  end
  
  result
end

def has_balanced_subsequence(arr, k, left, right)
  return false if right - left + 1 < k
  
  # Base case: check if current segment can form a valid subsequence
  if right - left + 1 == k
    freq = Hash.new(0)
    (left..right).each { |i| freq[arr[i]] += 1 }
    return (1..k).all? { |num| freq[num] == 1 }
  end
  
  # Check all possible windows of size k in current segment
  (left..right-k+1).each do |start|
    window_valid = true
    freq = Hash.new(0)
    
    (start...start+k).each do |i|
      freq[arr[i]] += 1
    end
    
    if (1..k).all? { |num| freq[num] == 1 } && freq.size == k
      return true
    end
  end
  
  false
end

# Alternative Approach 4: Mathematical/Combinatorial
# Use mathematical properties to eliminate impossible cases faster
def mathematical_solution(p)
  n = p.length
  result = "0" * n
  max_val = p.max
  
  # Precompute frequency of each number
  freq_global = Hash.new(0)
  p.each { |val| freq_global[val] += 1 }
  
  (1..n).each do |k|
    break if k > max_val
    
    # Mathematical check: if any required number appears more than n-k+1 times,
    # it's impossible to have a window where it appears exactly once
    impossible = (1..k).any? { |num| freq_global[num] == 0 || freq_global[num] > n - k + 1 }
    next if impossible
    
    # If all required numbers appear exactly once, check if they're in a valid window
    if (1..k).all? { |num| freq_global[num] == 1 }
      positions = {}
      p.each_with_index { |val, idx| positions[val] = idx if val >= 1 && val <= k }
      
      if positions.size == k
        min_pos = positions.values.min
        max_pos = positions.values.max
        if max_pos - min_pos + 1 <= k
          result[k-1] = '1'
          next
        end
      end
    end
    
    # Fall back to optimized sliding window for complex cases
    if optimized_sliding_window_check(p, k, n)
      result[k-1] = '1'
    end
  end
  
  result
end

def optimized_sliding_window_check(p, k, n)
  freq = [0] * (k + 1)
  unique = 0
  
  # Initial window
  k.times do |i|
    val = p[i]
    next if val > k || val < 1
    if freq[val] == 0
      unique += 1
      freq[val] = 1
    else
      freq[val] += 1
    end
  end
  
  return true if unique == k
  
  # Sliding window
  (k...n).each do |i|
    out_val = p[i-k]
    if out_val <= k && out_val >= 1
      freq[out_val] -= 1
      unique -= 1 if freq[out_val] == 0
    end
    
    in_val = p[i]
    if in_val <= k && in_val >= 1
      unique += 1 if freq[in_val] == 0
      freq[in_val] += 1
    end
    
    return true if unique == k
  end
  
  false
end

# Test all approaches
if __FILE__ == $0
  test_cases = [
    [4, 1, 3, 2],
    [5, 3, 1, 2, 4],
    [1, 2, 3, 4, 5, 6]
  ]
  expected = ["1011", "11111", "111111"]
  
  methods = [
    [:position_based, method(:position_based_solution)],
    [:interval_intersection, method(:interval_intersection_solution)],
    [:divide_conquer, method(:divide_conquer_solution)],
    [:mathematical, method(:mathematical_solution)]
  ]
  
  puts "Testing alternative approaches:"
  
  test_cases.each_with_index do |test, i|
    puts "\nTest #{i + 1}: #{test}"
    puts "Expected: #{expected[i]}"
    
    methods.each do |name, method|
      begin
        result = method.call(test)
        status = result == expected[i] ? '✓' : '✗'
        puts "#{name.to_s.ljust(20)}: #{result} #{status}"
      rescue => e
        puts "#{name.to_s.ljust(20)}: ERROR - #{e.message}"
      end
    end
  end
  
  # Performance comparison on medium-sized input
  puts "\nPerformance test (size 500):"
  test_array = (1..500).to_a.shuffle
  
  methods.each do |name, method|
    begin
      start = Time.now
      result = method.call(test_array)
      time = Time.now - start
      puts "#{name.to_s.ljust(20)}: #{time.round(4)}s"
    rescue => e
      puts "#{name.to_s.ljust(20)}: ERROR - #{e.message}"
    end
  end
end
