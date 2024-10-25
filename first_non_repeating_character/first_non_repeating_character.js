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

function firstSolution(str) {
  const charCount = {};
  for (let i = 0; i < str.length; i++) {
    const char = str[i];
    if (charCount[char]) {
      charCount[char]++;
    } else {
      charCount[char] = 1;
    }
  }

  for (let i = 0; i < str.length; i++) {
    if (charCount[str[i]] === 1) {
      return str[i];
    }
  }
  return null;
}

function second_solution(str) {
  // uses modern JS syntax object property access
  const charMap = new Map();

  for (const char of str) {
    charMap.set(char, (charMap.get(char) || 0) + 1);
  }

  for (const [char, count] of charMap) {
    if (count === 1) {
      return char;
    }
  }

  return null;
}

function firstNonRepeatingCharacter(str) {
  //   return firstSolution(str);
  return second_solution(str);
}

// Test cases
console.log(firstNonRepeatingCharacter("aabccd")); // Should output: "b"
console.log(firstNonRepeatingCharacter("aabbcc")); // Should output: null
console.log(firstNonRepeatingCharacter("abcdef")); // Should output: "a"
console.log(firstNonRepeatingCharacter("aabbccdeeff")); // Should output: "d"
