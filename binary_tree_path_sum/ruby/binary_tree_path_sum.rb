# Binary Tree Path Sum Challenge
# 
# Given a binary tree, determine if there exists a root-to-leaf path 
# where the sum of all node values along the path equals a given target sum.

class TreeNode
  attr_accessor :val, :left, :right
  
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

def has_path_sum(root, target_sum)
  # TODO: Implement this method
  # Return true if there exists a root-to-leaf path with sum equal to target_sum
  # Return false otherwise
end

# Helper method to build a tree from array representation
def build_tree(arr)
  return nil if arr.empty? || arr[0].nil?
  
  root = TreeNode.new(arr[0])
  queue = [root]
  i = 1
  
  while !queue.empty? && i < arr.length
    node = queue.shift
    
    # Add left child
    if i < arr.length && !arr[i].nil?
      node.left = TreeNode.new(arr[i])
      queue << node.left
    end
    i += 1
    
    # Add right child
    if i < arr.length && !arr[i].nil?
      node.right = TreeNode.new(arr[i])
      queue << node.right
    end
    i += 1
  end
  
  root
end

# Test cases
def run_tests
  puts "Running Binary Tree Path Sum Tests..."
  
  # Test 1: Example from problem description
  # Tree: [5,4,8,11,nil,13,4,7,2,nil,nil,nil,1]
  #       5
  #      / \
  #     4   8
  #    /   / \
  #   11  13  4
  #  /  \      \
  # 7    2      1
  tree1 = build_tree([5,4,8,11,nil,13,4,7,2,nil,nil,nil,1])
  result1 = has_path_sum(tree1, 22)
  puts "Test 1 - Expected: true, Got: #{result1}"
  raise "Test 1 failed" unless result1 == true
  
  # Test 2: Simple tree
  # Tree: [1,2,3]
  #       1
  #      / \
  #     2   3
  tree2 = build_tree([1,2,3])
  result2 = has_path_sum(tree2, 5)
  puts "Test 2 - Expected: false, Got: #{result2}"
  raise "Test 2 failed" unless result2 == false
  
  # Test 3: Single node
  # Tree: [1]
  tree3 = build_tree([1])
  result3 = has_path_sum(tree3, 1)
  puts "Test 3 - Expected: true, Got: #{result3}"
  raise "Test 3 failed" unless result3 == true
  
  # Test 4: Empty tree
  tree4 = build_tree([])
  result4 = has_path_sum(tree4, 0)
  puts "Test 4 - Expected: false, Got: #{result4}"
  raise "Test 4 failed" unless result4 == false
  
  # Test 5: Negative values
  # Tree: [-2,nil,-3]
  #       -2
  #         \
  #         -3
  tree5 = build_tree([-2,nil,-3])
  result5 = has_path_sum(tree5, -5)
  puts "Test 5 - Expected: true, Got: #{result5}"
  raise "Test 5 failed" unless result5 == true
  
  # Test 6: Zero sum
  tree6 = build_tree([1,-2,-3,1,3,-2,nil,-1])
  result6 = has_path_sum(tree6, 0)
  puts "Test 6 - Expected: true, Got: #{result6}"
  raise "Test 6 failed" unless result6 == true
  
  puts "All tests passed! ✅"
end

# Uncomment to run tests
# run_tests
