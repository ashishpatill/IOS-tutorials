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
    lazy var loginButton:CustomButton = {
        let button = CustomButton(bgColor: .blue, title: "Login", cornerRadius: 8)
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel.init(frame: .zero)
        label.text = "Login"
        label.font = UIFont.init(name: "SF-Pro", size: 18)
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupFireBase()
        setupUI()
    }
    
    func setupFireBase() {
        // call firebase api
    }
    
    func setupUI() {
        
        let stackview = UIStackView(arrangedSubviews: [titleLabel,
                                                       emailTf,
                                                       loginButton])
        stackview.axis = .vertical
        stackview.distribution = .equalSpacing
        stackview.spacing = 16
        view.addSubview(stackview)
        
        NSLayoutConstraint.activate([
            stackview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            stackview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10),
            stackview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackview.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackview.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
    
    @IBAction func GoToHome(_ sender: UIButton) {
        let homeVC = HomeVC.init(nibName: "HomeVC", bundle: nil)
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    
    @objc func login() {
        
    }

}
