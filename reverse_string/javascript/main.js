function reverseString(inputStr) {
    return inputStr.split('').reverse().join('');
}
  
const inputStr = "Hello, World!";
const outputStr = reverseString(inputStr);
  
console.log(`Input: ${inputStr}`);
console.log(`Output: ${outputStr}`);