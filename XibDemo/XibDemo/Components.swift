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

class CustomButton: UIButton {
    init(bgColor:UIColor,  title:String, cornerRadius: Double) {
        super.init(frame: .zero)
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = bgColor
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = self.frame.size.height/2
        self.layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
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
