# create an example of a fifo queue (first in first out)

class FifoQueue
  def initialize
    @queue = []
  end
end

fifo_queue = FifoQueue.new
fifo_queue.add(1)
fifo_queue.add(2)
fifo_queue.add(3)

fifo_queue.print_queue