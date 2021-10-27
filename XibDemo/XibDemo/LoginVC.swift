//
//  LoginVC.swift
//  XibDemo
//
//  Created by Ashish Pisey on 27/10/21.
//

import UIKit

class LoginVC: UIViewController {
    
    var label : UILabel?
    
    lazy var emailTf = CustomTextField(tfType: .email)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        createLabelWithAnchor()
        Helper.createTextFieldWithAnchor(tf: emailTf, view: self.view)
    }

    @IBAction func GoToHome(_ sender: UIButton) {
        let homeVC = HomeVC.init(nibName: "HomeVC", bundle: nil)
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    
    func createLabelWithAnchor() {
        //let labelFrame = CGRect.init(x: 0, y: 0, width: 60, height: 60)
        label = UILabel()
        guard let label = label else { return }
        label.text = "Anchor label"
        self.view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = .yellow
        
        NSLayoutConstraint.activate([
            label.widthAnchor.constraint(equalToConstant: 300),
            label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            label.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            label.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    func createLabel() {
        let labelFrame = CGRect.init(x: 0, y: 40, width: 60, height: 60)
        let label = UILabel.init(frame: labelFrame)
        label.center = CGPoint.init(x: self.view.center.x, y: labelFrame.origin.y)
        label.text = "Hello"
        self.view.addSubview(label)
    }

}
