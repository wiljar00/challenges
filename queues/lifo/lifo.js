// create an example of a lifo queue (last in first out) in javascript

class LifoQueue {
  constructor() {
    this.queue = [];
  }
}

const lifoQueue = new LifoQueue();
lifoQueue.add(1);
lifoQueue.add(2);
lifoQueue.add(3);
console.log(lifoQueue.queue);
