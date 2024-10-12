# Given a string and substring, return "yes" or "no" if the full_string contains the substring. 

def ruby_cheat(full_string, substring)
  full_string.include?(substring) ? 'yes' : 'no'
end

def find_substring(full_string:, substring:)
  result = 'no'

  # first solution - ruby cheat code solution
  # result = ruby_cheat(full_string, substring)

  # second solution - figure it out myself
  for i in 0..(full_string.length - substring.length)
    current_slice = full_string[i, substring.length]

    if current_slice == substring
      result = 'yes'
      break
    end
  end

  result
end

full_string = 'testing'
substring = 'test'

puts find_substring(full_string: full_string, substring: substring)