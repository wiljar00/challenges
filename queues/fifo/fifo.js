// create a fifo queue in javascript

class FifoQueue {
    constructor() {
      this.queue = [];
    }
  
    add(item) {
      this.queue.push(item);
    }
  
    remove() {
      return this.queue.shift();
    }
  
    printQueue() {
      console.log(this.queue);
    }
}
  
const fifoQueue = new FifoQueue();
fifoQueue.add(1);
console.log("queue should be [1]");
fifoQueue.printQueue();
fifoQueue.add(2);
console.log("queue should be [1, 2]");
fifoQueue.printQueue();
fifoQueue.add(3);
console.log("queue should be [1, 2, 3]");
fifoQueue.printQueue();
console.log("remove should be 1");
console.log(fifoQueue.remove());
console.log("queue should be [2, 3]");
console.log(fifoQueue.queue);
  