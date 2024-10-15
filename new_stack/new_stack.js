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

    pop(input) {
        if (this.data.length === 0) {
            return null;
        }
        return this.data.pop();
    }

}



// Usage: 
const stack = new myStack();
stack.push(10);
stack.push(20);
// console.log(stack.peek()); // 20
console.log(stack.pop());  // 20
// console.log(stack.isEmpty()); // false
// console.log(stack.size()); // 1