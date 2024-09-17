# An arcade game player wants to climb to the top of the leaderboard and track their ranking.

# The game uses Dense Ranking, so its leaderboard works like this:
# • The player with the highest score is ranked number 1 on the leaderboard.
# • Players who have equal scores receive the same ranking number, and the next players)
# receive the immediately following ranking number.

# Example
# ranked = [100, 90, 90, 80]
# player = [70, 80, 105]

# The ranked players will have ranks 1, 2, 2, and 3, respectively. If the player's scores are 70, 80 and 105, 
# their rankings after each game are 4th, 3rd and 1st. Return [4, 3, 1].

# Function Description

# climbingLeaderboard has the following parameters):
# • int rankedIn: the leaderboard scores
# • int playerm!: the player's scores
# Returns
# • intml: the player's rank after each new score


#
# Complete the 'climbingLeaderboard' function below.
#
# The function is expected to return an INTEGER_ARRAY.
# The function accepts following parameters:
#  1. INTEGER_ARRAY ranked
#  2. INTEGER_ARRAY player
#

def climbingLeaderboard(ranked, player)
    # Write your code here

end


ranked = [100, 90, 90, 80]
player = [70, 80, 105]

climbingLeaderboard(ranked, player) # should return [4, 3, 1]