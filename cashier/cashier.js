// Given a total number amount, return the smallest number of bills adding up to the total. 
// Bills are given in 20, 10, 5, 1


function cashier(bills, amount) {
    console.log(`Amount to withdraw: $${amount}`);
    console.log("Number of bills:");
    
    for (let bill of bills) {
        let count = Math.floor(amount / bill);
        if (count > 0) {
            console.log(`  $${bill} bill(s): ${count}`);
            amount -= count * bill;
        }
    }
    
    console.log("Withdrawal complete.\n");
}

let bills = [20, 10, 5, 1];
let testAmounts = [125, 87, 42, 19, 3];

for (let amount of testAmounts) {
    // loop through amounts to test scenarios
    cashier(bills, amount);
}