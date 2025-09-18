# Binary Tree Path Sum Challenge
# 
# Given a binary tree, determine if there exists a root-to-leaf path 
# where the sum of all node values along the path equals a given target sum.

class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

def has_path_sum(root, target_sum):
    # TODO: Implement this function
    # Return True if there exists a root-to-leaf path with sum equal to target_sum
    # Return False otherwise
    pass

def build_tree(arr):
    """Helper function to build a tree from array representation"""
    if not arr or arr[0] is None:
        return None
    
    root = TreeNode(arr[0])
    queue = [root]
    i = 1
    
    while queue and i < len(arr):
        node = queue.pop(0)
        
        # Add left child
        if i < len(arr) and arr[i] is not None:
            node.left = TreeNode(arr[i])
            queue.append(node.left)
        i += 1
        
        # Add right child
        if i < len(arr) and arr[i] is not None:
            node.right = TreeNode(arr[i])
            queue.append(node.right)
        i += 1
    
    return root

def run_tests():
    """Run all test cases"""
    print("Running Binary Tree Path Sum Tests...")
    
    # Test 1: Example from problem description
    # Tree: [5,4,8,11,None,13,4,7,2,None,None,None,1]
    #       5
    #      / \
    #     4   8
    #    /   / \
    #   11  13  4
    #  /  \      \
    # 7    2      1
    tree1 = build_tree([5,4,8,11,None,13,4,7,2,None,None,None,1])
    result1 = has_path_sum(tree1, 22)
    print(f"Test 1 - Expected: True, Got: {result1}")
    assert result1 == True, "Test 1 failed"
    
    # Test 2: Simple tree
    # Tree: [1,2,3]
    #       1
    #      / \
    #     2   3
    tree2 = build_tree([1,2,3])
    result2 = has_path_sum(tree2, 5)
    print(f"Test 2 - Expected: False, Got: {result2}")
    assert result2 == False, "Test 2 failed"
    
    # Test 3: Single node
    # Tree: [1]
    tree3 = build_tree([1])
    result3 = has_path_sum(tree3, 1)
    print(f"Test 3 - Expected: True, Got: {result3}")
    assert result3 == True, "Test 3 failed"
    
    # Test 4: Empty tree
    tree4 = build_tree([])
    result4 = has_path_sum(tree4, 0)
    print(f"Test 4 - Expected: False, Got: {result4}")
    assert result4 == False, "Test 4 failed"
    
    # Test 5: Negative values
    # Tree: [-2,None,-3]
    #       -2
    #         \
    #         -3
    tree5 = build_tree([-2,None,-3])
    result5 = has_path_sum(tree5, -5)
    print(f"Test 5 - Expected: True, Got: {result5}")
    assert result5 == True, "Test 5 failed"
    
    # Test 6: Zero sum
    tree6 = build_tree([1,-2,-3,1,3,-2,None,-1])
    result6 = has_path_sum(tree6, 0)
    print(f"Test 6 - Expected: True, Got: {result6}")
    assert result6 == True, "Test 6 failed"
    
    print("All tests passed! ✅")

if __name__ == "__main__":
    # Uncomment to run tests
    # run_tests()
    pass
