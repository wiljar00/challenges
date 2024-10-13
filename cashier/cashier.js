// Given a total number amount, return the smallest number of bills adding up to the total. 
// Bills are given in 20, 10, 5, 1


function cashier(bills, amount) {
    let result = {};
    
    for (let bill of bills) {
        if (amount >= bill) {
            // Number of this bill needed
            result[bill] = Math.floor(amount / bill);  
            
            // Reduce the amount accordingly
            amount -= result[bill] * bill;  
        }
    }
    
    console.log(result);
    return result;
}


let bills = [20, 10, 5, 1];
let amount = 125;


cashier(bills, amount);