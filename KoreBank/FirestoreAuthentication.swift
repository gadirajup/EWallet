//
//  FirestoreAuthentication.swift
//  KoreBank
//
//  Created by Prudhvi Gadiraju on 2/22/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import Foundation
import Firebase

class FirestoreAuthentication {
    var authHandle: AuthStateDidChangeListenerHandle?
    
    func checkUser(_ sender: UIViewController) {
        authHandle = Auth.auth().addStateDidChangeListener({ (auth, user) in
            if user == nil {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let signVC = storyboard.instantiateViewController(withIdentifier: "signVC")
                sender.present(signVC, animated: true, completion: nil)
            }
        })
    }
}
