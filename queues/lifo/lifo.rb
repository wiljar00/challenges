# create an example of a lifo queue (last in first out)

class LifoQueue
  def initialize
    @queue = []
  end

  def add(item)
    @queue.push(item)
  end

  def remove
    @queue.pop
  end

  def print_queue
    puts "queue: #{@queue}"
  end
end


lifo_queue = LifoQueue.new
puts "adding 1"
lifo_queue.add(1)
lifo_queue.print_queue
puts "adding 2"
lifo_queue.add(2)
lifo_queue.print_queue
puts "adding 3"
lifo_queue.add(3)
lifo_queue.print_queue

puts "removing a value, expects 3, got: #{lifo_queue.remove}"
lifo_queue.print_queue
puts "removing a value, expects 2, got: #{lifo_queue.remove}"
lifo_queue.print_queue
puts "removing a value, expects 1, got: #{lifo_queue.remove}"
lifo_queue.print_queue
