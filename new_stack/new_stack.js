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
        if (this.data.length === 0) {
            return true;
        } else {
            return false;
        }
    }

    size() {
        return this.data.length
    }

}


// Usage: 
const stack = new myStack();
stack.push(10);
stack.push(20);
console.log(stack.peek()); // 20
console.log(stack.pop());  // 20
console.log(stack.isEmpty()); // false
console.log(stack.size()); // 1