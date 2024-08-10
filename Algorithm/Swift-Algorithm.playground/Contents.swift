import Foundation

// Test cases
// Set up tree
let tree = BinaryTree(rootValue: 1)
tree.root.left = BinaryTreeNode(value: 2)
tree.root.right = BinaryTreeNode(value: 3)
tree.root.left?.left = BinaryTreeNode(value: 4)
tree.root.left?.right = BinaryTreeNode(value: 5)

// Test search
print(tree.search(4)) // Should be true
print(tree.search(6)) // Should be false

// Test printTree
print(tree.printTree()) // Should be 1-2-4-5-3
