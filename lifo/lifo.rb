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
end


lifo_queue = LifoQueue.new
lifo_queue.add(1)
puts "queue: #{lifo_queue.instance_variable_get(:@queue)}"
lifo_queue.add(2)
puts "queue: #{lifo_queue.instance_variable_get(:@queue)}"
lifo_queue.add(3)
puts "queue: #{lifo_queue.instance_variable_get(:@queue)}"

puts "expects 3, got: #{lifo_queue.remove}"
puts "expects 2, got: #{lifo_queue.remove}"
puts "expects 1, got: #{lifo_queue.remove}"
