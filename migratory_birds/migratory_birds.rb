# Given an array of bird sightings where every element represents a bird type id, 
# determine the id of the most frequently sighted type. If more than 1 type has been spotted that maximum amount, 
# return the smallest of their ids.


#
# Complete the 'migratoryBirds' function below.
#
# The function is expected to return an INTEGER.
# The function accepts INTEGER_ARRAY arr as parameter.
#

def migratoryBirds(arr)
    bird_count = Hash.new(0)

    arr.each do |bird_id|
        bird_count[bird_id] += 1
    end

    max_frequency = bird_count.values.max
    max_birds = bird_count.select { |bird_id, count| count == max_frequency }

    max_birds.keys.min
end

arr = [1, 4, 4, 4, 5, 3]

puts migratoryBirds(arr) # expected result: 4