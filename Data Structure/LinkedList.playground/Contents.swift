import Foundation

var linkedList = LinkedList()

linkedList.append(Node(value: 4))
linkedList.append(Node(value: 9))
linkedList.append(Node(value: 24))
linkedList.append(Node(value: 44))

linkedList.getNode(atPosition: 3)?.value //print 24
linkedList.deleteNode(withValue: 9)
linkedList.getNode(atPosition: 3)?.value //print 44
