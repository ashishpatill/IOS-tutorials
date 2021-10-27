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

var wordArr:[[Node]] = []
var nodeArr:[Node] = []

// single search
func singleWordSearch(node:Node?) -> Node? {
    // define nodes
    guard let node = node else { return nil }
    print(node.children.keys.first!)
    
    // check the base condition
    if node.children.count > 0 {
        if node.isWord == false {
            let key = node.children.keys.first
            //previousArr.append(node)
            guard let nextNode = node.children[key!] else {return node}// O(1)
            searchTrie(node: nextNode)
        }
        return node
    }
    
    return nil
}

//MARK: - solution 1 - Multiple word search
func searchTrie(node:Node?) -> Node? {
    // define nodes
    guard let node = node else { return nil }
    nodeArr.append(node)
    
    // check the base condition
    if node.children.count > 0  {
        
        if node.isWord == false {
            guard let nextNodeArr = getNextNode(node: node) else { return nil }
            for nextNode in nextNodeArr {
                searchTrie(node: nextNode)
            }
        } else {
            //print("last letter: \(nodeArr.last?.children.keys.first)")
            if wordArr.count > 0 {
                //reuse word arr
                var commonArr = wordArr[0]
                commonArr.removeLast()
                commonArr.append(nodeArr.last!)
                wordArr.append(commonArr)
            } else {
                wordArr.append(nodeArr)
            }
            nodeArr = []
        }
        
        return node
    }
    
    return nil
}

func printCombinationOfWords(wordArr:[[Node]]) {
    for word in wordArr {
        for node in word {
            print(node.children.keys.first!)
        }
        print("word")
    }
}

func getNextNode(node:Node) -> [Node]? {
    let keys = node.children.keys

    var nextNodeArr:[Node] = []
    for key in keys {
        guard let nextNode = node.children[key] else { return nil }// O(1)
        nextNodeArr.append(nextNode)
    }
    return nextNodeArr
}

//MARK: - solution 2
func getNextLetters(node:Node) -> [Character]? {
    let keys = node.children.keys

    var nextNodeArr:[Node] = []
    for key in keys {
        guard let nextNode = node.children[key] else { return nil }// O(1)
        nextNodeArr.append(nextNode)
    }
    
    var nextLetters:[Character] = []
    for nextNode in nextNodeArr {
        guard let nextLetter = nextNode.children.keys.first else { return nil }
        nextLetters.append(nextLetter)
    }
    return nextLetters
}

wordArr = []
searchTrie(node: cNode)
//print(wordArr)
printCombinationOfWords(wordArr: wordArr)

// C : Node
// A
// R
// D // T
