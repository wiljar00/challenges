// Two children, Lily and Ron, want to share a chocolate bar. 
// Each of the squares has an integer on it.
// Lily decides to share a contiguous segment of the bar selected such that:
// • The length of the segment matches Ron's birth month, and,
// • The sum of the integers on the squares is equal to his birth day.
// Determine how many ways she can divide the chocolate.

// Example
// s = [2,2,1,3, 2]
// d = 4
// m = 2
// Lily wants to find segments summing to Ron's birth day, d = 4 with a length equalling his
// birth month, m = 2. In this case, there are two segments meeting her criteria: 2, 2 and [1,3].


//
// Complete the 'birthday' function below.
//
// The function is expected to return an INTEGER.
// The function accepts following parameters:
//  1. INTEGER_ARRAY s
//  2. INTEGER d
//  3. INTEGER m
//

function birthday(s, d, m) {
    // Initialize a counter to keep track of the number of valid subarrays
    let count = 0;

    // Iterate over the possible starting positions of the subarrays
    for (let i = 0; i <= s.length - m; i++) {
        // Extract the subarray of length m starting at index i
        let segment = s.slice(i, i + m);
        
        // Calculate the sum of the subarray
        let segmentSum = segment.reduce((sum, num) => sum + num, 0);
        
        // Check if the sum matches the required value d
        if (segmentSum === d) {
            // Increment the count if it matches
            count++;
        }
    }

    // Return the total count of matching subarrays
    return count;
}

// Example 1:
const s1 = [2, 2, 1, 3, 2];
const d1 = 4;
const m1 = 2;
console.log(birthday(s1, d1, m1)); // Expected output: 2

// Example 2:
const s2 = [1, 2, 1, 3, 2];
const d2 = 3;
const m2 = 2;
console.log(birthday(s2, d2, m2)); // Expected output: 2
