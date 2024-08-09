//  Given an array of bird sightings where every element represents a bird type id, 
//  determine the id of the most frequently sighted type. If more than 1 type has been spotted that maximum amount, 
//  return the smallest of their ids.



//  Complete the 'migratoryBirds' function below.

//  The function is expected to return an INTEGER.
//  The function accepts INTEGER_ARRAY arr as parameter.


function migratoryBirds(arr) {
    const birdCount = {};

    arr.forEach(birdId => {
        if (birdCount[birdId]) {
            birdCount[birdId]++;
        } else {
            birdCount[birdId] = 1;
        }
    });

    const maxFrequency = Math.max(...Object.values(birdCount));
    const maxBirds = Object.keys(birdCount).filter(birdId => birdCount[birdId] === maxFrequency);

    return Math.min(...maxBirds.map(Number));
}

// Example usage
const arr = [1, 4, 4, 4, 5, 3];
console.log(migratoryBirds(arr)); // expected result: 4