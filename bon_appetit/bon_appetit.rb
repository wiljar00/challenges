# Two friends Anna and Brian, are deciding how to split the bill at a dinner. 
# Each will only pay for the items they consume. Brian gets the check and calculates Anna's portion. 
# You must determine if his calculation is correct.

# For example, assume the bill has the following prices: bill = 2, 4, 6. Anna declines to eat
# item k = bill|2] which costs 6. If Brian calculates the bill correctly, Anna will pay
# (2 + 4)/2 = 3. If he includes the cost of bill[2], he will calculate (2 + 4 + 6) /2 = 6. In the
# second case, he should refund 3 to Anna.


#
# Complete the 'bonAppetit' function below.
#
# The function accepts following parameters:
#  1. INTEGER_ARRAY bill
#  2. INTEGER k - 0 based index of not eaten item
#  3. INTEGER b - amount of money charged
#

def my_solution(bill, k, b)
    bill_copy = bill.dup
    bill_copy.delete_at(k)
    anna_owes = bill_copy.sum/2

    if anna_owes == b
        "Bon Appetit"
    else
        b - anna_owes
    end
end

def cleaner_solution(bill, k, b)
  anna_share = (bill.sum - bill[k]) / 2
  
  if anna_share == b
    "Bon Appetit"
  else
    b - anna_share
  end
end

def bonAppetit(bill, k, b)
    # my_solution(bill, k, b)
    cleaner_solution(bill, k, b)
end

bill = [3, 10, 2, 9]
k = 1
b = 12
puts bonAppetit(bill, k, b) # expect 5

bill = [3, 10, 2, 9]
k = 1
b = 7
puts bonAppetit(bill, k, b) # expect "Bon Appetit"