//
//  ViewController.swift
//  FireMessenger
//
//  Created by Ashish Pisey on 20/10/21.
//

import UIKit
import Firebase
import FirebaseAuth

class SignupVC: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if Auth.auth().currentUser != nil {
            navigateToHomeVC()
        }
    }
    
    func validateEmailAndPassword() -> (String, String)? {
        guard let email = emailTextField.text,
              email.count > 0,
              let password = passwordTextField.text,
              password.count > 0 else {
                  return nil
              }
        
        return (email, password)
    }
    
    @IBAction func SignupAction(_ sender: UIButton) {
        guard let (email, password) = validateEmailAndPassword() else {
            print("email or password is invalid")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            print("Signup successfull")
            if let error = error {
                print(error)
            } else {
                DispatchQueue.main.async {
                    self.navigateToHomeVC()
                }
            }
            
        }
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        guard let (email, password) = validateEmailAndPassword() else {
            print("email or password is invalid")
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print(error)
            } else {
                DispatchQueue.main.async {
                    self.navigateToHomeVC()
                }
            }
        }
    }
    
    func navigateToHomeVC() {
        let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "Home") as! HomeVC
        
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    


}

