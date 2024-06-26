// to run, cd to directory and run `node script.js`

console.log("Amicable Pairs Problem");

// Function to calculate sum of proper divisors of a number
function sumOfProperDivisors(number) {
    let sum = 0;
    for (let i = 1; i <= Math.sqrt(number); i++) {
        if (number % i === 0) {
            if (i === 1 || i === number / i) {
                sum += i;
            } else {
                sum += i + (number / i);
            }
        }
    }
    return sum;
}

// Function to find and display amicable pairs up to a specified limit
function findAmicablePairs(limit) {
    let pairs = [];

    for (let a = 1; a <= limit; a++) {
        let b = sumOfProperDivisors(a);
        if (a !== b && b > a && sumOfProperDivisors(b) === a) {
            pairs.push([a, b]);
        }
    }

    return pairs;
}

// run code
const limit = 10000;
const amicablePairs = findAmicablePairs(limit);

console.log(`Amicable pairs up to ${limit}:`);
amicablePairs.forEach(pair => {
    console.log(`${pair[0]} and ${pair[1]}`);
});
