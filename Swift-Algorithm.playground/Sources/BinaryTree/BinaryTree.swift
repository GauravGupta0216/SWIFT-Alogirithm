import Foundation

public class BinaryTree {

    public var root: BinaryTreeNode
    
    public init(rootValue: Int) {
        self.root = BinaryTreeNode(value: rootValue)
    }

    // Return true if the value is in the tree, otherwise return false
    public func search(_ value: Int) -> Bool {
        
        return preorderSearch(root, value)
    }

    // Return a string containing all tree nodes as they are visited in a pre-order traversal.
    public func printTree() -> String {
        let str = preorderPrint(root, "") ?? ""
        return String(str[..<str.index(before: str.endIndex)])
    }

    // Helper method - use to create a recursive search solution.
    func preorderSearch(_ start: BinaryTreeNode?, _ value: Int) -> Bool {
        guard let root = start else {
            return false
        }
        if root.value == value {
            return true
        }
        return preorderSearch(root.left, value) || preorderSearch(root.right, value)
    }

    // Helper method - use to construct a string representing the preordered nodes
    func preorderPrint(_ start: BinaryTreeNode?, _ traverse: String) -> String? {
        var str = traverse
        guard let root = start else {
            return ""
        }
        str += String(root.value) + "-"
        str += preorderPrint(root.left, "") ?? ""
        str += preorderPrint(root.right,  "") ?? ""
        return str
    }
}
