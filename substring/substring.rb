# Given a string and substring, return "yes" or "no" if the full_string contains the substring. 

def find_substring(full_string:, substring:)
  result = 'no'

  if full_string.include?(substring)
    result = 'yes'
  end

  result
end

full_string = 'testing'
substring = 'test'

puts find_substring(full_string: full_string, substring: substring)