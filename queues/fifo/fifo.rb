# create an example of a fifo queue (first in first out)

class FifoQueue
  def initialize
    @queue = []
  end

  def add(item)
    @queue.push(item)
  end

  def remove
    @queue.shift
  end

  def print_queue
    puts "queue: #{@queue}"
  end
end

fifo_queue = FifoQueue.new
puts "adding 1"
fifo_queue.add(1)
fifo_queue.print_queue
puts "adding 2"
fifo_queue.add(2)
puts "adding 3"
fifo_queue.add(3)

puts "removing a value, expects 1, got: #{fifo_queue.remove}"
fifo_queue.print_queue 
puts "removing a value, expects 2, got: #{fifo_queue.remove}"
fifo_queue.print_queue
puts "removing a value, expects 3, got: #{fifo_queue.remove}"
fifo_queue.print_queue