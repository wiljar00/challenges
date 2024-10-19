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