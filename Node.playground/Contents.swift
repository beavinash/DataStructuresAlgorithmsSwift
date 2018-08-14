import UIKit

public class Node<T> {
    public var value: T
    public var next: Node?
    
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        
        return "\(value) -> " + String(describing: next) + " "
    }
}

public struct LinkedList<T> {
    public var head: Node<T>?
    public var tail: Node<T>?
    
    init() {
        
    }
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public mutating func push(_ value: T) {
        
        head = Node(value: value, next: head)
        
        if tail == nil {
            tail = head
        }
    }
    
    public mutating func append(_ value: T) {
        // 1
        guard !isEmpty else {
            push(value)
            return
        }
        
        // 2
        tail!.next = Node(value: value)
        
        // 3
        tail = tail!.next
    }
    
    public func node(at index: Int) -> Node<T>? {
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    @discardableResult
    public mutating func insert(_ value: T, after node: Node<T>) -> Node<T> {
        guard tail !== node else {
            append(value)
            return tail!
        }
        
        node.next = Node(value: value, next: node.next)
        return node.next!
    }
    
    @discardableResult
    public mutating func pop() -> T? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Empty List"
        }
        return String(describing: head)
    }
}




let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3, next: nil)

node1.next = node2
node2.next = node3

var list = LinkedList<Int>()
list.push(1)
list.push(2)
list.push(3)
list.append(4)

var middleNode = list.node(at: 1)!
for _ in 1...4 {
    middleNode = list.insert(2, after: middleNode)
}

print(list)

let poppedValue = list.pop()
print("\(poppedValue!)")

print(list)
