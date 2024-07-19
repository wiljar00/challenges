# First Attempt

# def get_indices(nums, target)
#     nums_copy = nums.dup

#     begin
#         for i in nums
#             ind1 = nums[i]
#             ind2 = nums[i+1]
#             total = ind1 + ind2
#             return [ind1, ind2] if total == target
#         end
#     rescue => e
#         return e
#     end
# end

# nums = [1, 2, 3]
# target = 3

# puts "Indices: #{get_indices(nums, target)}"


# AI Solution
def two_sum(nums, target)
    hash = {}
    
    nums.each_with_index do |num, index|
      complement = target - num
      if hash.key?(complement)
        return [hash[complement], index]
      end
      hash[num] = index
    end
    
    # If no solution is found, return an empty array
    []
  end
  
  # Example usage
  nums = [2, 7, 11, 15]
  target = 9
  puts "nums: #{nums}"
  puts "target: #{target}"
  puts two_sum(nums, target).inspect  # Output: [0, 1]
  
#        Explanation:
#       --------------
# 1. Hash Initialization: We initialize an empty hash to store the numbers and their indices as we iterate through the array.
# 2. Iteration with Index: We use each_with_index to iterate through the array while keeping track of the index.
# 3. Complement Calculation: For each number, we calculate its complement (i.e., the number needed to reach the target sum).
# 4. Check Complement in Hash: If the complement exists in the hash, we have found our two numbers. We return their indices.
# 5. Update Hash: If the complement is not in the hash, we add the current number and its index to the hash.
# 6. Return: If no solution is found by the end of the loop, we return an empty array (although the problem guarantees exactly one solution, so this line is more of a safeguard).