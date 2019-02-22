//
//  SignVC.swift
//  KoreBank
//
//  Created by Prudhvi Gadiraju on 2/21/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import UIKit

class SignVC: UIViewController {
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signInButton.layer.cornerRadius = 30

    }
    @IBAction func signInButtonPressed(_ sender: Any) {
    }
}
