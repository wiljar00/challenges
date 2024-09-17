# An arcade game player wants to climb to the top of the leaderboard and track their ranking.

# The game uses Dense Ranking, so its leaderboard works like this:
# • The player with the highest score is ranked number 1 on the leaderboard.
# • Players who have equal scores receive the same ranking number, and the next player(s)
# receive the immediately following ranking number.

# Example
# ranked = [100, 90, 90, 80]
# player = [70, 80, 105]

# The ranked players will have ranks 1, 2, 2, and 3, respectively. If the player's scores are 70, 80 and 105, 
# their rankings after each game are 4th, 3rd and 1st. Return [4, 3, 1].

# Function Description

# climbingLeaderboard has the following parameters):
# • int ranked[n]: the leaderboard scores
# • int player[m]: the player's scores
# Returns
# • int[m]: the player's rank after each new score


#
# Complete the 'climbingLeaderboard' function below.
#
# The function is expected to return an INTEGER_ARRAY.
# The function accepts following parameters:
#  1. INTEGER_ARRAY ranked
#  2. INTEGER_ARRAY player
#

def climbingLeaderboard(ranked, player)
    # Create a unique list of rankings
    unique_ranks = ranked.uniq
    result = []
    rank_index = unique_ranks.length - 1
    
    # For each score of the player
    player.each do |score|
      # Traverse the unique ranked list from the back
      while rank_index >= 0 && score >= unique_ranks[rank_index]
        rank_index -= 1
      end
      # The current player's rank is rank_index + 2
      # Because rank_index + 1 would be where the player's score fits
      # and rank is 1-based, so add 1 more
      result << rank_index + 2
    end
    
    result
end


ranked = [100, 90, 90, 80]
player = [70, 80, 105]

puts climbingLeaderboard(ranked, player) # should return [4, 3, 1]