# Kangaroo

# You are choreographing a circus show with various animals. 
# For one act, you are given two kangaroos on a number line ready to jump in the positive direction (i.e, toward positive infinity).
# • The first kangaroo starts at location x1 and moves at a rate of ul meters per jump.
# • The second kangaroo starts at location x2 and moves at a rate of u2 meters per jump.
# You have to figure out a way to get both kangaroos at the same location at the same time as part of the show. 
# If it is possible, return YES, otherwise return NO.

# Complete the 'kangaroo' function below.
#
# The function is expected to return a STRING.
# The function accepts following parameters:
#  1. INTEGER x1
#  2. INTEGER v1
#  3. INTEGER x2
#  4. INTEGER v2
#

def kangaroo(x1, v1, x2, v2)
    # Write your code here

    if v1 != v2
        if (x2 - x1) % (v1 - v2) == 0 && (x2 - x1) / (v1 - v2) > 0
            return "YES"
        end
    elsif x1 == x2
        return "YES"
    end
    "NO"
end

x1 = 0
v1 = 3
x2 = 4
v2 = 2

puts kangaroo(x1, v1, x2, v2) # should be "YES"
puts kangaroo(2, 1, 1, 2) # should be "YES"