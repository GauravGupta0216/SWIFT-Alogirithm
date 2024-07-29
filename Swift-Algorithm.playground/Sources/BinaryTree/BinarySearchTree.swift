import Foundation

public class BST {

    var root: BinaryTreeNode

    public init(value: Int) {
        self.root = BinaryTreeNode(value: value)
    }

    public func search(_ value: Int) -> Bool {
        return searchHelper(root, value)
    }

    // create a node with the given value and insert it into the binary tree
    public func insert(_ value: Int) {
        insertHelper(root, value: value)
    }

    // helper method - use to implement a recursive search function
    func searchHelper(_ current: BinaryTreeNode?, _ value: Int) -> Bool {
        guard let root = current else { return false }
        
        if root.value == value {
            return true
        } else if root.value > value {
            return searchHelper(root.left, value)
        } else {
            return searchHelper(root.right, value)
        }
    }

    // helper method - use to implement a recursive insert function
    func insertHelper(_ current: BinaryTreeNode, value: Int) {
        if current.value > value {
            guard let left = current.left else {
                current.left = BinaryTreeNode(value: value)
                return
            }
            insertHelper(left, value: value)
        } else {
            guard let right = current.right else {
                current.right = BinaryTreeNode(value: value)
                return
            }
            insertHelper(right, value: value)
        }
    }
}
