// Binary Tree Path Sum Challenge
//
// Given a binary tree, determine if there exists a root-to-leaf path
// where the sum of all node values along the path equals a given target sum.

class TreeNode {
  constructor(val = 0, left = null, right = null) {
    this.val = val;
    this.left = left;
    this.right = right;
  }
}

function hasPathSum(root, targetSum) {
  // TODO: Implement this function
  // Return true if there exists a root-to-leaf path with sum equal to targetSum
  // Return false otherwise
}

// Helper function to build a tree from array representation
function buildTree(arr) {
  if (!arr || arr.length === 0 || arr[0] === null) {
    return null;
  }

  const root = new TreeNode(arr[0]);
  const queue = [root];
  let i = 1;

  while (queue.length > 0 && i < arr.length) {
    const node = queue.shift();

    // Add left child
    if (i < arr.length && arr[i] !== null) {
      node.left = new TreeNode(arr[i]);
      queue.push(node.left);
    }
    i++;

    // Add right child
    if (i < arr.length && arr[i] !== null) {
      node.right = new TreeNode(arr[i]);
      queue.push(node.right);
    }
    i++;
  }

  return root;
}

// Test cases
function runTests() {
  console.log("Running Binary Tree Path Sum Tests...");

  // Test 1: Example from problem description
  // Tree: [5,4,8,11,null,13,4,7,2,null,null,null,1]
  //       5
  //      / \
  //     4   8
  //    /   / \
  //   11  13  4
  //  /  \      \
  // 7    2      1
  const tree1 = buildTree([
    5,
    4,
    8,
    11,
    null,
    13,
    4,
    7,
    2,
    null,
    null,
    null,
    1,
  ]);
  const result1 = hasPathSum(tree1, 22);
  console.log(`Test 1 - Expected: true, Got: ${result1}`);
  if (result1 !== true) throw new Error("Test 1 failed");

  // Test 2: Simple tree
  // Tree: [1,2,3]
  //       1
  //      / \
  //     2   3
  const tree2 = buildTree([1, 2, 3]);
  const result2 = hasPathSum(tree2, 5);
  console.log(`Test 2 - Expected: false, Got: ${result2}`);
  if (result2 !== false) throw new Error("Test 2 failed");

  // Test 3: Single node
  // Tree: [1]
  const tree3 = buildTree([1]);
  const result3 = hasPathSum(tree3, 1);
  console.log(`Test 3 - Expected: true, Got: ${result3}`);
  if (result3 !== true) throw new Error("Test 3 failed");

  // Test 4: Empty tree
  const tree4 = buildTree([]);
  const result4 = hasPathSum(tree4, 0);
  console.log(`Test 4 - Expected: false, Got: ${result4}`);
  if (result4 !== false) throw new Error("Test 4 failed");

  // Test 5: Negative values
  // Tree: [-2,null,-3]
  //       -2
  //         \
  //         -3
  const tree5 = buildTree([-2, null, -3]);
  const result5 = hasPathSum(tree5, -5);
  console.log(`Test 5 - Expected: true, Got: ${result5}`);
  if (result5 !== true) throw new Error("Test 5 failed");

  // Test 6: Zero sum
  const tree6 = buildTree([1, -2, -3, 1, 3, -2, null, -1]);
  const result6 = hasPathSum(tree6, 0);
  console.log(`Test 6 - Expected: true, Got: ${result6}`);
  if (result6 !== true) throw new Error("Test 6 failed");

  console.log("All tests passed! ✅");
}

// Uncomment to run tests
// runTests();

// Export for use in other files
if (typeof module !== "undefined" && module.exports) {
  module.exports = { TreeNode, hasPathSum, buildTree, runTests };
}
