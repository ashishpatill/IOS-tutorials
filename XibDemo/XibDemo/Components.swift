//
//  Components.swift
//  XibDemo
//
//  Created by Ashish Pisey on 27/10/21.
//

import Foundation
import UIKit

enum TextFieldType {
    case email
    case password
    case name
    case username
}

class CustomTextField : UITextField {
    init(tfType:TextFieldType) {
        super.init(frame: .zero)
        
        borderStyle = .roundedRect
        font = .systemFont(ofSize: 16)
        textColor = .black
        tintColor = .black
        keyboardAppearance = .dark
        keyboardType = .default

        var placeholderTxt = ""
        switch tfType {
            case .email:
                placeholderTxt = "Enter a valid email"
                keyboardType = .emailAddress
                autocapitalizationType = .none
            case .name:
                keyboardType = .namePhonePad
                placeholderTxt = "Enter your name"
            case .username:
                keyboardType = .namePhonePad
                placeholderTxt = "Enter an username"
            case .password:
                placeholderTxt = "Enter a password"
                keyboardType = .default
                isSecureTextEntry = true
        }
        
        attributedPlaceholder = NSAttributedString(string: placeholderTxt,
                                                   attributes: [.foregroundColor: UIColor.lightGray])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

class Helper {
    static func createTextFieldWithAnchor(tf:UITextField, view:UIView) {
        tf.frame = CGRect.init(x: 60, y: 200, width: 300, height: 30)
        view.addSubview(tf)
        
        tf.text = ""
        
        NSLayoutConstraint.activate([
            tf.widthAnchor.constraint(equalToConstant: 300),
            tf.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tf.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            tf.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
