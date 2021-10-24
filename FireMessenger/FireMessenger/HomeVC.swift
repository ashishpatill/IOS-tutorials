//
//  LoginVC.swift
//  FireMessenger
//
//  Created by Ashish Pisey on 20/10/21.
//

import UIKit
import FirebaseAuth

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutAction(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
            self.navigationController?.popViewController(animated: true)
        } catch {
            print(error)
        }
    }
    
    

}
