import Foundation

import Foundation

public class Node {
    public var value: Int
    public var next: Node?

    public init(value: Int, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

public class LinkedList {
    public var head: Node?

    public init(head: Node? = nil) {
        self.head = head
    }

    public func append(_ node: Node) {
        guard head != nil else {
            head = node
            return
        }
        
        var current = head
        while current?.next != nil {
            current = current?.next
        }
        current?.next = node
    }
    
    // Get a node from a particular position.
    // Assume the first position is "1".
    // Return "nil" if position is not in the list.
    // Assume count is less than number of node
    public func getNode(atPosition position: Int) -> Node? {
        guard head != nil && position > 0 else {
            return nil
        }
        
        var count = 1
        var current = head
        while current != nil && count < position {
            current = current?.next
            count += 1
        }
        return current
    }
    
    // Insert a new node at the given position.
    // Assume the first position is "1".
    // Inserting at position 3 means between the 2nd and 3rd nodes.
    public func insertNode(_ node: Node, at position: Int) {
        var count = 1
        var current = head
        var currnext = head?.next
        while current != nil && count < position-1 {
            current = current?.next
            currnext = currnext?.next
            count += 1
        }
        current?.next = node
        node.next = currnext
    }
    
    // Delete the first node with a given value.
    public func deleteNode(withValue value: Int) {
        var current = head
        var currNext = head?.next
        if head?.value == value {
            head = head?.next
            return
        }
        
        while currNext?.value != value && currNext?.next != nil {
            current = currNext
            currNext = currNext?.next
        }
        current?.next = currNext?.next
    }
}
