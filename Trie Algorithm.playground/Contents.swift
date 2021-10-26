import UIKit

class Node {
    var children: [Character : Node]
    var isWord: Bool
    init() {
        children = [Character : Node]()
        isWord = false
    }
}

class Trie {
    var root: Node
    init() {
        root = Node()
    }
}

let lastNode = Node()
lastNode.isWord = true
// card
let d = Node()
d.children = ["d": lastNode]
d.isWord = true

// cart
let t = Node()
t.children = ["t":lastNode]
t.isWord = true

let r = Node()
r.children = ["r": d, "R": t]
r.isWord = false

let a = Node()
a.children = ["a": r]
a.isWord = false

let cNode = Node()
cNode.children = ["c": a]
cNode.isWord = false


func searchTrie(node:Node?) -> Node? {
    // define nodes
    guard let node = node else { return nil }
    print(node.children.keys.first)
    
    // check the base condition
    if node.children.count > 0 {
        if node.isWord == false {
            let key = node.children.keys.first
            //previousArr.append(node)
            guard let nextNode = node.children[key!] as? Node else {return node}// O(1)
            searchTrie(node: nextNode)
        }
        return node
    }
    
    return nil
}

searchTrie(node: cNode)



