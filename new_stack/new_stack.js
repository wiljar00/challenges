// Challenge: 
// Implement the stack using a class.
// optional - Ensure each method operates with constant time complexity (O(1)).


class myStack {
    constructor() {
        this.data = []; 
    }

    push(input) {
        this.data.push(input);
        return this.data;
    }

    peek() {
        let index = this.data.length - 1;
        return this.data[index];
    }

    pop(input) {
        if (this.data.length === 0) {
            return null;
        }
        return this.data.pop();
    }

    isEmpty() {
        return this.data.length === 0;
    }

    size() {
        return this.data.length
    }

    clear() {
        this.data = [];
    }

    contains(item) {
        return this.data.includes(item);
    }

    toString() {
        return this.data.join(' ');
    }

    reverse() {
        this.data.reverse();
        return this.data;
    }

    clone() {
        const newStack = new myStack();
        newStack.data = [...this.data];
        return newStack;
    }

    min() {
        if (this.isEmpty()) {
            return null;
        }
        return Math.min(...this.data);
    }

    max() {
        if (this.isEmpty()) {
            return null;
        }
        return Math.max(...this.data);
    }
    
    duplicate() {
        if (!this.isEmpty()) {
            this.push(this.peek());
        }
    }    

}


// Test Cases:

let stack = new myStack();

// Test pushing multiple items
console.log("Push 5, 10, 15 to stack");
stack.push(5);
stack.push(10);
stack.push(15);
console.log(stack.data); // [5, 10, 15]

// Test peek
console.log("Peek at the top item");
console.log(stack.peek()); // 15

// Test size
console.log("Size of stack:");
console.log(stack.size()); // 3

// Test popping an item
console.log("Pop the top item");
console.log(stack.pop()); // 15
console.log(stack.data); // [5, 10]

// Test isEmpty on a non-empty stack
console.log("Check if stack is empty");
console.log(stack.isEmpty()); // false

// Test popping all items
console.log("Pop all items");
console.log(stack.pop()); // 10
console.log(stack.pop()); // 5
console.log(stack.pop()); // null, as stack is now empty

// Test isEmpty on an empty stack
console.log("Check if stack is empty after popping all items");
console.log(stack.isEmpty()); // true

// Final check: size should be zero
console.log("Final stack size:");
console.log(stack.size()); // 0


// additional test scenarios:
stack = new myStack();
stack.push(5);
stack.push(10);
stack.push(15);
console.log(stack.toString()); // "5 10 15"
console.log(stack.contains(10)); // true
console.log(stack.reverse()); // [15, 10, 5]
const clonedStack = stack.clone();
console.log(clonedStack.toString()); // "15 10 5"
stack.clear();
console.log(stack.isEmpty()); // true