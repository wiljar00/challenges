# Maria plays college basketball and wants to go pro. 
# Each season she maintains a record of her play. 
# She tabulates the number of times she breaks her season record 
# for most points and least points in a game. 
# Points scored in the first game establish her record for the season, 
# and she begins counting from there.

# Given the scores for a season, determine the number of times Maria 
# breaks her records for most and least points scored during the season.

#
# Complete the 'breakingRecords' function below.
#
# The function is expected to return an INTEGER_ARRAY.
# The function accepts INTEGER_ARRAY scores as parameter.
#

def breakingRecords(scores)
    # Write your code here

end


scores1 = [10, 5, 20, 20, 4, 5, 2, 25, 1]
puts breakingRecords(scores1) # output should b [2, 4]

scores2 = [3, 4, 21, 36, 10, 28, 35, 5, 24, 42]
puts breakingRecords(scores2) # output should be [4, 0]