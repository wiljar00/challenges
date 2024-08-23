# Two cats and a mouse are at various positions on a line. 
# You will be given their starting positions. 
# Your task is to determine which cat will reach the mouse first, 
# assuming the mouse does not move and the cats travel at equal speed. 
# If the cats arrive at the same time, the mouse will be allowed to move and it will escape while they fight.

# You are given q queries in the form of x, y, and z representing the respective positions for cats A and B,
# and for mouse C. Complete the function catAndMouse to return the appropriate answer to each query, 
# which will be printed on a new line.


# Input:
# x = Cat A's position
# y = Cat B's position
# z = Mouse C's position
# return value = String ('Cat A', 'Cat B', or 'Mouse C')

def catAndMouse(x, y, z)
    # find the difference between each cat and the mouse
    # whichever difference is less, return that cat
    # if the difference is the same, return Mouse

    cat_a_distance = (z - x).abs
    cat_b_distance = (z - y).abs 
    
    if cat_a_distance == cat_b_distance
        result = 'Mouse C'
    elsif cat_a_distance > cat_b_distance
        result = 'Cat B'
    else
        result = 'Cat A'
    end

    result
end

x = 2
y = 5
z = 4
puts catAndMouse(x, y, z) # expects 'Cat B'

x = 1
y = 2
z = 3
puts catAndMouse(x, y, z) # expects 'Cat B'

x = 1
y = 3
z = 2
puts catAndMouse(x, y, z) # expects 'Mouse C'