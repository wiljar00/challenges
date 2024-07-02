# NISC - Software Engineer II


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

###############################################################################################
###############################################################################################
# feel really dumb... shoulda figured this one out or at least walked through with comments. 

# Answer:
def make_change(amount)
    bills = [20, 10, 5, 2, 1]
    change = {}
  
    bills.each do |bill|
      if amount >= bill
        count = amount / bill
        change[bill] = count
        amount %= bill
      end
    end
  
    change
  end
  
  # Example usage:
  amount = 47
  change = make_change(amount)
  puts "Change for $#{amount}:"
  change.each do |bill, count|
    puts "$#{bill} bill(s): #{count}"
  end

  make_change(1020)






  # another attempt - class based

  class BillCollector
    def initialize(total_amount, bills)
        @total_amount = total_amount
        @bills = bills
    end

    def get_minimum_combo
        change = {}

        @bills.each do |bill|
            if @total_amount >= bill
                count = @total_amount / bill
                change[bill] = count
                @total_amount %= bill
            end
        end

        print_message(change)
    end

    private

    def print_message(change)
        change.each do |bill, count|
            puts "Number of $#{bill} bills: #{count}"
        end
    end
end


total_amount = 1219
bills = [20, 10, 5, 1]

test = BillCollector.new(total_amount, bills)
test.get_minimum_combo