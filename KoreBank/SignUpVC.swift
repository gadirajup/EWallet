//
//  SignUpVC.swift
//  KoreBank
//
//  Created by Prudhvi Gadiraju on 2/22/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import UIKit
import Firebase

class SignUpVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self, action: #selector(onTap))
        view.addGestureRecognizer(tap)
        
        signUpButton.layer.cornerRadius = 30
    }
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        
        guard let emailText = emailTextField.text else {return}
        guard let phoneNumberText = phoneNumberTextField.text else {return}
        guard let passwordText = passwordTextField.text else {return}

        Auth.auth().createUser(withEmail: emailText, password: passwordText) { (user, error) in
            if let error = error {
                debugPrint(error.localizedDescription)
            }
            
            guard let uid = user?.user.uid else {return}
            Firestore.firestore().collection("user").document(uid).setData([
                "email" : emailText,
                "phoneNumber" : phoneNumberText,
                "dateCreated" : FieldValue.serverTimestamp()
                ], completion: { (error) in
                if let error = error {
                    debugPrint(error.localizedDescription)
                } else {
                    print("created user: \(emailText)")
                    self.dismiss(animated: true, completion: nil)
                }
            })
        }
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func onTap() {
        view.endEditing(true)
    }
}
