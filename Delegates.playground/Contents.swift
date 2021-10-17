import UIKit

class MyViewController: cellDelegate {
    var name = "Ashish"
    var cell: Cell?

    func setDelegate() {
        // cell for row
        cell?.delegate = self
    }
    
    func passData(name: String) {
        // callback from cell class
        print("Received from cell: \(name)")
    }
}

class Cell {
    weak var delegate: cellDelegate?
    
    func sendData() {
        delegate?.passData(name: "Hi from B class")
    }
}

protocol cellDelegate:AnyObject {
    func passData(name:String)
}

let myView = MyViewController()
let cell = Cell()
myView.cell = cell
myView.setDelegate()

myView.cell?.sendData()
