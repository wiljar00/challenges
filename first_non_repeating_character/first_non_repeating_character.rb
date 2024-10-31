


def first_hash_soluti0on(str)
  char_map = Hash.new(0)
  
  # Count occurrences of each character
  str.each_char do |char|
    char_map[char] += 1
  end
  
  # Find first character with count of 1
  str.each_char do |char|
    return char if char_map[char] == 1
  end
  
  'nothing'
end


def first_non_repeating_character(str)
  first_hash_soluti0on(str)
end

# Test cases
puts first_non_repeating_character("aabccd")    # Should output: "b"
puts first_non_repeating_character("aabbcc")    # Should output: "nothing"
puts first_non_repeating_character("abcdef")    # Should output: "a"
puts first_non_repeating_character("aabbccdeeff")  # Should output: "d"