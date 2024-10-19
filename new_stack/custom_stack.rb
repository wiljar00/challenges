class CustomStack
  def initialize
    @stack = []
  end

  def print_stack
    puts @stack.to_s
  end

  def push(value)
    # add validations to value type
    @stack.push(value)
  end

  def pop()
    return @stack.pop()
  end

  def size()
    return @stack.length
  end

  def get_value_at_index(index)
    # index starts at 0
    return @stack[index]
  end
end


# testing class
# initialize
custom_stack = CustomStack.new

# print stack
custom_stack.print_stack # expect [1, 3, 5]

# add values to stack
custom_stack.push(1)
custom_stack.push(3)
custom_stack.push(5)
custom_stack.print_stack # expect [1, 3, 5]

# pop one value from stack 
puts custom_stack.pop() # expect 5
custom_stack.print_stack() # expect [1, 3]

# return number of values in the stack
custom_stack.push(5)
custom_stack.print_stack()
puts custom_stack.size() # expect 3

# return value at specefic index
custom_stack.print_stack()
puts custom_stack.get_value_at_index(2) # expect 5