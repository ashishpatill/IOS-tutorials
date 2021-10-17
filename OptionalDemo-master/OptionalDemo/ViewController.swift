//
//  ViewController.swift
//  OptionalDemo
//
//  Created by Shaadi_mac1 on 25/02/15.
//  Copyright (c) 2015 Ashish. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtField: UITextField!
    
    
    @IBAction func doneAction(sender: UIButton) {
        var anOptional = txtField.text.toInt()?
        print("anOptional :- \(anOptional)")
        
        var txtfieldTxt = txtField.text
        var forcedUnwrappedString = forcedUnWrapping(txtfieldTxt)
        NSLog("AGE:- \(txtfieldTxt)")
        
        // implicitly unwrapped optional, this assumes value exists i.e. forced unwrapping
        
        var implicitString:String! = "My Age is \(txtfieldTxt.toInt())"
        var convertedString = implicitString // No Need for '!'
        print("\(convertedString)")
        // optional binding 
        
        var optionalTxt = optionalBinding(txtfieldTxt)
        
        print("\(optionalTxt)")
        
    }
    
    /**
    This function will always return a value even if txt is nil. so it is our responsiblity to check for that
    
    :param: txt An optional text
    
    :returns: Unwrapped optional string
    */

    func forcedUnWrapping(txt:String?)->String
    {
        var ageString:String = "MY age is \(txt!)"

        return ageString;
    }
    
    /**
    This Function will check if the value is not nil and then only it will return the value, So its more safe
    But this can become redundant in case of a nested inheritence structure
    
    :param: txt A String Var ideally a number
    
    :returns: String Unwrapped from the optional
    */
    func optionalBinding(txt:String)->String
    {
        if let actualAge = txt.toInt()
        {
            return "AGE has a value \(actualAge)"
        }
        else
        {
            return "AGE: \(txt) cant be converted to a valid Integer"
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

