# interview session


# Given an infinite $20, $10, $5, $2 and $1 bills. Write a program that will return the change for n dollars that would require the least amount of bills to be returned

def get_bills(input)
    change = 0
    twenties = 0

    while (input > 0) do
        if change = input % 20 == 0
            change += 1
            
        end
        change = input % 20
        
        # change = count_bills(input, 20)
        # input -= 
        # change += count_bills(input, 10)
        # change += count_bills(input, 5)
        # change += count_bills(input, 2)
        # change += count_bills(input, 1)
    end


    # puts "Input amount: #{input}"
    puts "Bills: #{change}"
end

def count_bills(amount, bill)
    bills = 0

    if amount > bill
        amount -= bill
        bills +=1
    end

    bills
end

# input = 1000
# get_bills(input)



