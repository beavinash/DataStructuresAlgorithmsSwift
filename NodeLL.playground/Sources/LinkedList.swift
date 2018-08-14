import Foundation

public struct LinkedList<T> {
    public var head: Node<T>?
    public var tail: Node<T>?
    
    public init() {
        
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
        tail?.next = Node(value: value, next: nil)
        
        // 3
        tail = tail?.next
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
