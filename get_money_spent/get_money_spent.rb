# A person wants to determine the most expensive computer keyboard and USB drive that can be purchased with a give budget.
# Given price lists for keyboards and USB drives and a budget, find the cost to buy them. 
# If it is not possible to buy both items, return -1.

#
# Complete the getMoneySpent function below.
#
def getMoneySpent(keyboards, drives, b)
    #
    # Write your code here.
    #
    'test'
end

keyboards = [40, 50, 60]
drives = [5, 8, 12]
b = 60
puts getMoneySpent(keyboards, drives, b) # expects 9

keyboards = [3, 1]
drives = [5, 2, 8]
b = 10
puts getMoneySpent(keyboards, drives, b) # expects 9

keyboards = [5]
drives = [4]
b = 5
puts getMoneySpent(keyboards, drives, b) # expects -1