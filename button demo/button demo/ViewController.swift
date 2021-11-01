//
//  ViewController.swift
//  button demo
//
//  Created by Ashish Pisey on 31/10/21.
//

import UIKit

class ViewController: UIViewController {
    // this button uses big image, check text and image insets (need to change insets if image is bigger than button height or width)
    @IBOutlet weak var fullsizeImageButton: UIButton!
    
    //this button uses smaller image (ideal way, just used image size which button needs, you will not be doing this, designer will be providing you button images as per your need)
    @IBOutlet weak var mybutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func btnClicked(_ sender: UIButton) {
    }
    
}

