import Foundation

class Node {
    var name: String
    var linkedNode: Node?
    
    init(name: String) {
        self.name = name
        self.linkedNode = nil
        print("Node \(name) initialized")
    }
    
    func printNodeName() {
        print("Node \(self.name)")
    }
    
    deinit {
        print("Node \(self.name) released")
    }
}

// This will call the initializer
var myNode: Node? = Node(name: "MyNode")

myNode?.printNodeName()

// This will call the de-initializer
myNode = nil

// MARK: Let's create a retain cycle

// Let's create two nodes
var nodeA: Node? = Node(name: "A")
var nodeB: Node? = Node(name: "B")

// Now interconnect both nodes
nodeA?.linkedNode = nodeB
nodeB?.linkedNode = nodeA

// Now let's assign both variables to nil

nodeA = nil
nodeB = nil

// This is RETAIN CYCLE because nodeA and nodeB references to each other.
// The reference count of both node is still 1 even after destroying our references to it!
// You CANNOT access & release them!

// MARK: Let's see how to eliminate retain cycles with weak references

class WeakLinkedNode {
    var name: String
    weak var linkedNode: WeakLinkedNode?
    
    init(name: String) {
        self.name = name
        self.linkedNode = nil
        print("WeakLinkedNode \(name) initialized")
    }
    
    func printNodeName() {
        print("WeakLinkedNode \(self.name)")
    }
    
    deinit {
        print("WeakLinkedNode \(self.name) released")
    }
}

// Let's create two nodes
var nodeC: WeakLinkedNode? = WeakLinkedNode(name: "C")
var nodeD: WeakLinkedNode? = WeakLinkedNode(name: "D")

// Let's interconnect them
nodeC?.linkedNode = nodeD
nodeD?.linkedNode = nodeC

nodeC = nil
nodeD = nil

// See that? No retain cycles anymore!
// The fact is instances tied to weak references will be removed when strong reference count hits 0.
// Since weak references are optionals, we can check the existence with "if let" or "guard" statements.

// MARK: Another example of preventing retain cycles with unowned keyword

class UnownedLinkedNode {
    var name: String
    unowned var linkedNode: Node
    
    init(name: String, linkedNode: Node) {
        self.name = name
        self.linkedNode = linkedNode
        print("WeakLinkedNode \(name) initialized")
    }
    
    func printNodeName() {
        print("WeakLinkedNode \(self.name) - \(self.linkedNode.name)")
    }
    
    deinit {
        print("WeakLinkedNode \(self.name) released")
    }
}

// Let's initialize a node named "child" and keep a reference in child var.
var child: Node? = Node(name: "Child")
child!.printNodeName()

// Let's create an instance of UnownedLinkedNode linked to child node
var node = UnownedLinkedNode(name: "Parent", linkedNode: child!)
node.printNodeName()

// Let's destroy our reference to the child node
child = nil
// the deinit will be called and "Child" node will be released from the memory.

// WARNING: The below line will cause crash because we are accessing an unowned var which is not in memory anymore.

// node.printNodeName()

// unowned references cannot be checked for the referred instance is available. If it is not available,
// it just crashes. When you use unowned references, you have to make sure the referant is alive.
