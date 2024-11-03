// create an example of a lifo queue (last in first out) in javascript

class LifoQueue {
  constructor() {
    this.queue = [];
  }

  add(item) {
    this.queue.push(item);
  }

  remove() {
    return this.queue.pop();
  }

  printQueue() {
    console.log(this.queue);
  }
}

const lifoQueue = new LifoQueue();
lifoQueue.add(1);
console.log("queue should be [1]");
lifoQueue.printQueue();
lifoQueue.add(2);
console.log("queue should be [1, 2]");
lifoQueue.printQueue();
lifoQueue.add(3);
console.log("queue should be [1, 2, 3]");
lifoQueue.printQueue();
console.log("remove should be 3");
console.log(lifoQueue.remove());
console.log("queue should be [1, 2]");
console.log(lifoQueue.queue);
