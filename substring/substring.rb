# Given a string and substring, return "yes" or "no" if the full_string contains the substring. 

def ruby_cheat(full_string, substring)
  full_string.include?(substring) ? 'yes' : 'no'
end

def find_substring(full_string:, substring:)
  result = 'no'

  result = ruby_cheat(full_string, substring)

  result
end

full_string = 'testing'
substring = 'test'

puts find_substring(full_string: full_string, substring: substring)