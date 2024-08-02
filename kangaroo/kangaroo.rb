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
    first_jump_1 = x1 + v1
    first_jump_2 = x2 + v2
    position_difference = x1 - x2
    velocity_difference = v2 - v1

    if first_jump_1 == first_jump_2
        return "YES"
    end

    will_meet = (position_difference % velocity_difference == 0) && (position_difference / velocity_difference < 0)
  
    return will_meet ? "YES" : "NO"
end

x1 = 0
v1 = 3
x2 = 4
v2 = 2

puts kangaroo(x1, v1, x2, v2) # should be "NO"
puts kangaroo(2, 1, 1, 2) # should be "YES"