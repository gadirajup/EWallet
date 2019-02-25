//
//  SignInVC.swift
//  KoreBank
//
//  Created by Prudhvi Gadiraju on 2/21/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import UIKit
import Firebase

class SignInVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTap))
        self.view.addGestureRecognizer(tap)
        
        signInButton.layer.cornerRadius = 30
    }
    @IBAction func signInButtonPressed(_ sender: Any) {
        guard let emailText = emailTextField.text else {return}
        guard let passwordText = passwordTextField.text else {return}
        
        Auth.auth().signIn(withEmail: emailText, password: passwordText) { (user, error) in
            if let error = error {
                debugPrint(error.localizedDescription)
            } else {
                print("Signed in as \(String(describing: user!.user.email))")
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let tabVC = storyboard.instantiateViewController(withIdentifier: "tabViewController")
                
                let transition = CATransition()
                transition.duration = 0.5
                transition.type = CATransitionType.push
                transition.subtype = CATransitionSubtype.fromRight
                transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
                self.view.window!.layer.add(transition, forKey: kCATransition)
                
                self.present(tabVC, animated: false, completion: nil)
            }
        }
    }
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func onTap() {
        view.endEditing(true)
    }
}
