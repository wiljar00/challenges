// to run, cd to directory and run `node script.js`

console.log("Amicable Pairs Problem\n\n");


// Function to calculate sum of proper divisors of a number
function sumOfProperDivisors(number) {
    let sum = 0;
    // Iterate through potential divisors up to the square root of the number
    for (let i = 1; i <= Math.sqrt(number); i++) {
        // If 'i' is a divisor of 'number'
        if (number % i === 0) {
            // Add 'i' to the sum of divisors
            if (i === 1 || i === number / i) {
                sum += i;
            } else {
                // Add both 'i' and 'number / i' to the sum (if they are distinct)
                sum += i + (number / i);
            }
        }
    }
    return sum;
}

// Function to find and display amicable pairs up to a specified limit
function findAmicablePairs(limit) {
    let pairs = [];

    // Iterate through each number up to the limit
    for (let a = 1; a <= limit; a++) {
        // Calculate sum of proper divisors for 'a'
        let b = sumOfProperDivisors(a);
        // Check if 'a' and 'b' form an amicable pair
        if (a !== b && b > a && sumOfProperDivisors(b) === a) {
            // Add the pair [a, b] to the list of amicable pairs
            pairs.push([a, b]);
        }
    }

    // Return the list of found amicable pairs
    return pairs;
}

// run code
const limit = 10000;
const amicablePairs = findAmicablePairs(limit);

// Output the found amicable pairs
console.log(`Amicable pairs up to ${limit}:`);
amicablePairs.forEach(pair => {
    console.log(`${pair[0]} and ${pair[1]}`);
});
