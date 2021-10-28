//
//  HomeVC.swift
//  XibDemo
//
//  Created by Ashish Pisey on 27/10/21.
//

import UIKit

class HomeVC: UIViewController {
    
    private let userNameTF = CustomTextField(tfType: .username)
    lazy var button = CustomButton(bgColor: .blue, title: "Register", cornerRadius: 8)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        Helper.createTextFieldWithAnchor(tf: userNameTF, view: self.view)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
