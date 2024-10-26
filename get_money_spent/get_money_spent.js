/**
 * A person wants to determine the most expensive computer keyboard and USB drive that can be purchased with a given budget.
 * Given price lists for keyboards and USB drives and a budget, find the cost to buy them. 
 * If it is not possible to buy both items, return -1.
 */

/**
 * Complete the getMoneySpent function below.
 */
function getMoneySpent(keyboards, drives, budget) {
    let max = -1;

    for (let keyboard of keyboards) {
        for (let drive of drives) {
            let totalCost = keyboard + drive;
            if (totalCost <= budget && totalCost > max) {
                max = totalCost;
            }
        }
    }

    return max;
}

// Test cases
let keyboards = [40, 50, 60];
let drives = [5, 8, 12];
let b = 60;
console.log(getMoneySpent(keyboards, drives, b)); // expects 58

keyboards = [3, 1];
drives = [5, 2, 8];
b = 10;
console.log(getMoneySpent(keyboards, drives, b)); // expects 9

keyboards = [5];
drives = [4];
b = 5;
console.log(getMoneySpent(keyboards, drives, b)); // expects -1