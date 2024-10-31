# find the first non repeating character in a string

def first_hash_soluti0on(str)
  # most efficient. O(n)
  # best overall solution
  char_map = Hash.new(0)
  
  str.each_char do |char|
    char_map[char] += 1
  end
  
  str.each_char do |char|
    return char if char_map[char] == 1
  end
  
  'nothing'
end

def second_solution_using_array(str)
  # most concise but less efficient. O(n^2)
  str.chars.find { |char| str.count(char) == 1 } || 'nothing'
end

def third_solution_using_ruby_tally(str)
  # clean and readable. O(n)
  # use if flexing ruby knowledge. Idiomatic ruby example
  chars = str.chars
  char_counts = chars.tally
  chars.find { |char| char_counts[char] == 1 } || 'nothing'
end

def fourth_solution_using_ruby_each_with_index(str)
  # more verbose but less effeciant. O(n^2)
  chars = str.chars
  chars.each_with_index do |char, index|
    return char if chars.count(char) == 1
  end
  'nothing'
end

def first_non_repeating_character(str)
  # first_hash_soluti0on(str)
  # second_solution_using_array(str)
  # third_solution_using_ruby_tally(str)
  fourth_solution_using_ruby_each_with_index(str)
end

# Test cases
puts first_non_repeating_character("aabccd")    # Should output: "b"
puts first_non_repeating_character("aabbcc")    # Should output: "nothing"
puts first_non_repeating_character("abcdef")    # Should output: "a"
puts first_non_repeating_character("aabbccdeeff")  # Should output: "d"