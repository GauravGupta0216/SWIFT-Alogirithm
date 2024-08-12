import UIKit

let tree = BST(value: 4)

// Insert elements
tree.insert(2)
tree.insert(1)
tree.insert(3)
tree.insert(5)

// Check search
print(tree.search(4)) // Should be true
print(tree.search(6)) // Should be false


// Test cases - Binary Tree
let binaryTree = BinaryTree(rootValue: 1)
binaryTree.root.left = BinaryTreeNode(value: 2)
binaryTree.root.right = BinaryTreeNode(value: 3)
binaryTree.root.left?.left = BinaryTreeNode(value: 4)
binaryTree.root.left?.right = BinaryTreeNode(value: 5)

// Test search
print(binaryTree.search(4)) // Should be true
print(binaryTree.search(6)) // Should be false

// Test printTree
print(binaryTree.printTree()) // Should be 1-2-4-5-3
