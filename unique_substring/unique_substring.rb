# -----------------------
# Unique Substring 
# -----------------------

# Problem Statement:
# Given a string s, find the length of the longest substring without repeating characters.

# -----------------------
# Examples

# Input: s = "abcabcbb"
# Output: 3
# Explanation: The answer is "abc", with the length of 3.

# Input: s = "bbbbb"
# Output: 1
# Explanation: The answer is "b", with the length of 1.

# Input: s = "pwwkew"
# Output: 3
# Explanation: The answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.

# -----------------------
# -----------------------

# Solution

def get_substring_length(input)
    char_index = {}
    left = 0
    max_length = 0
  
    input.each_char.with_index do |char, right|
      if char_index.key?(char) && char_index[char] >= left
        left = char_index[char] + 1
      end
      char_index[char] = right
      max_length = [max_length, right - left + 1].max
    end
  
    max_length
end

input = "abcabcbb"
puts "Longest unique substring length: #{get_substring_length(input)}"

# -----------------------

def get_substring(input)
    char_index = {}
    left = 0
    max_length = 0
    start = 0
  
    input.each_char.with_index do |char, right|
      if char_index.key?(char) && char_index[char] >= left
        left = char_index[char] + 1
      end

      char_index[char] = right

      if right - left + 1 > max_length
        max_length = right - left + 1
        start = left
      end
    end
  
    longest_substring = input[start, max_length]
    return max_length, longest_substring
end

input = "abcabcbb"
length, substring = get_substring(input)
puts "Length: #{length}"
puts "Substring: #{substring}"

# -----------------------

def substring_using_loops(input)
    char_index = {}
    left = 0
    max_length = 0
    start = 0
  
    for right in 0...input.length
      char = input[right]
      if char_index.key?(char) && char_index[char] >= left
        left = char_index[char] + 1
      end

      char_index[char] = right

      if right - left + 1 > max_length
        max_length = right - left + 1
        start = left
      end
    end
  
    longest_substring = input[start, max_length]
    return max_length, longest_substring
  end

input = "abcabcbb"
length, substring = substring_using_loops(input)
puts "Length: #{length}"
puts "Substring: #{substring}"