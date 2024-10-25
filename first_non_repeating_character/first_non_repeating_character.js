/**
 * Write a function that takes a string as input and returns the first non-repeating character in the string. If there is no non-repeating character, return null.
 * For example:
 * For the input "aabccd", the function should return 'b'.
 * For the input "aabbcc", the function should return null.
 *
 * This question is good because:
 * It requires the use of a hash table (object) for efficient counting.
 * It involves string manipulation and iteration.
 *
 * @param {string} str - The input string
 * @return {string|null} The first non-repeating character, or null if none exists
 */

function firstNonRepeatingCharacter(str) {
  // Implement your solution here
}

// Test cases
console.log(firstNonRepeatingCharacter("aabccd")); // Should output: "b"
console.log(firstNonRepeatingCharacter("aabbcc")); // Should output: null
console.log(firstNonRepeatingCharacter("abcdef")); // Should output: "a"
console.log(firstNonRepeatingCharacter("aabbccdeeff")); // Should output: "d"
