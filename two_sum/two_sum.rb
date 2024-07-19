def get_indices(nums, target)
    nums_copy = nums.dup

    begin
        for i in nums
            ind1 = nums[i]
            ind2 = nums[i+1]
            total = ind1 + ind2
            return [ind1, ind2] if total == target
        end
    rescue => e
        return e
    end
end

nums = [1, 2, 3]
target = 3

puts "Indices: #{get_indices(nums, target)}"