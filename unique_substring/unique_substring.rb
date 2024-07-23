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

def get_substring(input)
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
puts get_substring(input)