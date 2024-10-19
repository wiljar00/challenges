class CustomStack
  def initialize
    @stack = []
  end

  def print_stack
    puts @stack.to_s
  end
end


# testing class
# initialize
customStack = CustomStack.new

# print stack
customStack.print_stack
