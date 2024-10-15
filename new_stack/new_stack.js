// Challenge: 
// Implement the stack using a class.
// optional - Ensure each method operates with constant time complexity (O(1)).


class myStack {
    let data = [];

    function push(input) {
        let new_index = data.length - 1;
        data[new_index] = input
        return data
    }

    function pop(input) {
        let last_index = data.length - 1;
        data[last_index].delete();
        return data;
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