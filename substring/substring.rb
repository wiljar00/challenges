# Given a string and substring, return "yes" or "no" if the full_string contains the substring. 

def ruby_cheat(full_string, substring)
  full_string.include?(substring) ? 'yes' : 'no'
end

def my_solution(full_string, substring)
  for i in 0..(full_string.length - substring.length)
    current_slice = full_string[i, substring.length]

    if current_slice == substring
      result = 'yes'
      break
    end
  end
end

def find_substring(full_string:, substring:)
  result = 'no'

  # first solution - ruby cheat code solution
  # result = ruby_cheat(full_string, substring)

  # second solution - figure it out myself
  my_solution(full_string, substring)

  result
end

# Test cases
puts "Full string: 'testing', Substring: 'test' => #{find_substring(full_string: 'testing', substring: 'test')}     # Expected: yes (substring at start)"
puts "Full string: 'testing', Substring: 'ing' => #{find_substring(full_string: 'testing', substring: 'ing')}      # Expected: yes (substring at end)"
puts "Full string: 'testing', Substring: 'sti' => #{find_substring(full_string: 'testing', substring: 'sti')}      # Expected: yes (substring in the middle)"
puts "Full string: 'testing', Substring: 'hello' => #{find_substring(full_string: 'testing', substring: 'hello')}     # Expected: no (substring not present)"
puts "Full string: 'testing', Substring: 'testing' => #{find_substring(full_string: 'testing', substring: 'testing')}  # Expected: yes (full string and substring are identical)"
puts "Full string: 'testing', Substring: '' => #{find_substring(full_string: 'testing', substring: '')}         # Expected: yes (empty substring is technically 'found' at every position)"
puts "Full string: '', Substring: 'test' => #{find_substring(full_string: '', substring: 'test')}             # Expected: no (empty full string)"