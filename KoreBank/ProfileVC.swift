//
//  ProfileVC.swift
//  KoreBank
//
//  Created by Prudhvi Gadiraju on 2/22/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import UIKit
import Firebase

class ProfileVC: UIViewController {

    @IBOutlet weak var signOutButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func signOutButtonPressed(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch let error as NSError {
            debugPrint("Sign Out Error: \(error.localizedDescription)")
        }
    }
}
