//
//  ViewController.swift
//  FBLogin
//
//  Created by Ashish Pisey on 09/11/21.
//

import UIKit
import FirebaseAuth
import FacebookCore
import FacebookLogin

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func loginWithFB(_ sender: UIButton) {
        let readPermissions: [Permission] = [ .publicProfile, .email ]
        LoginManager().logIn(permissions: readPermissions, viewController: self, completion: didReceiveFacebookLoginResult)
    }
    
    
    
}

//MARK: - Facebook Login
extension ViewController {
    private func didReceiveFacebookLoginResult(loginResult: LoginResult) {
        switch loginResult {
        case .success:
            didLoginWithFacebook()
        case .failed(_): break
        default: break
        }
    }
    
    fileprivate func didLoginWithFacebook() {
        // Successful log in with Facebook
        if let accessToken = AccessToken.current {
            // If Firebase enabled, we log the user into Firebase
            
            let fbCredential = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
            
            Auth.auth().signIn(with: fbCredential) { result, error in
               // guard let `self` = self else { return }

                if let error = error {
                    print("errror with fb login")
                    //self.showError(error.localizedDescription)
                    return
                }
                
                // store the email in userdefaults
                DispatchQueue.main.async {
                    // show conversations
                    let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController
                    self.navigationController?.pushViewController(secondVC, animated: true)
                }
            }
        }
    }
    
}

