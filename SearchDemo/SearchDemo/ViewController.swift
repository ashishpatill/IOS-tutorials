//
//  ViewController.swift
//  SearchDemo
//
//  Created by Ashish Pisey on 26/10/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    var wordArr = ["card", "cart", "cat", "rat", "rack", "cannon", "car", "cave"]
    @IBOutlet weak var searchTextField: UITextField!
    var searchResults:[String] = []
    
    var wordNodes:[[Node]] = []
    var trie = Trie()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //convertWordsToNodes()
        createTrie()
        
        myTableView.dataSource = self
        searchTextField.delegate = self
    }

    @IBAction func findWord(_ sender: Any) {
       // optional
    }
    
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchResults.count > 0 {
            return searchResults.count
        } else {
            return wordArr.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell") as! SearchCell
        
        var tempArr = wordArr
        if searchResults.count > 0 {
            tempArr = searchResults
        }
        cell.wordLabel.text = tempArr[indexPath.row]
        
        return cell
    }
}

//MARK: - Filter operation
extension ViewController : UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let searchText  = textField.text! + string
        // solution 1 : Using swift higher order functions
        //let shouldChange = defaultFilter(searchText: searchText)
        
        // solution 3
        searchResults = trie.findWordsforSearchText(searchText: searchText)
        print(searchResults)   // I got filtered data here but how to show this data into the tableview
        myTableView.reloadData()
        return true
    }
    
    func defaultFilter(searchText:String) -> Bool {
        searchResults = wordArr.filter({ (result) -> Bool in
            return result.range(of: searchText, options: .caseInsensitive) != nil
        })
        return true
    }
}

class Node {
    var value: String
    var children: [String : Node]
    var isWord: Bool
    init() {
        children = [String : Node]()
        isWord = false
        value = ""
    }
}


extension ViewController {
    /*
    func convertWordsToNodes() {
        if let wordArr = getNodeArr(wordList: wordArr) {
            wordNodes = wordArr
        }
    }
    
    func getNodeArr(wordList: [String]) -> [[Node]]? {
        var wordNodeArr:[[Node]] = []
        for word in wordArr {
            // every word will be an array of nodes
            var nodeArr:[Node] = []
            for letter in word {
                // create a node for every letter
                let subStr = String(letter)
                let node = Node()
                node.children[subStr] = node
                nodeArr.append(node)
            }
            wordNodeArr.append(nodeArr)
        }
        return nil
    }
    
    //MARK: - solution 2
    func getNextLetters(node:Node) -> [String]? {
        let keys = node.children.keys

        var nextNodeArr:[Node] = []
        for key in keys {
            guard let nextNode = node.children[key] else { return nil }// O(1)
            nextNodeArr.append(nextNode)
        }
        
        var nextLetters:[String] = []
        for nextNode in nextNodeArr {
            nextLetters.append(nextNode.value)
        }
        return nextLetters
    }
    */
    
    //MARK: - Solution 3, Best Solution
    func createTrie() {
        for word in wordArr {
            trie.insert(word: word)
        }
    }
}
