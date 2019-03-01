//
//  PayNowVC.swift
//  KoreBank
//
//  Created by Prudhvi Gadiraju on 2/24/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import UIKit

class PayNowVC: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    let FA = FirestoreAuthentication()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addGradient(color1: #colorLiteral(red: 1, green: 0.462745098, blue: 0.462745098, alpha: 1), color2: #colorLiteral(red: 0.9607843137, green: 0.3058823529, blue: 0.6352941176, alpha: 1))
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTap))
        view.addGestureRecognizer(tap)
    }
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func nextButtonPressed(_ sender: Any) {
        print("Phone Number: \(String(describing: phoneNumberTextField.text))")
        print("Amount: \(String(describing: amountTextField.text))")
        
        FA.queryPhoneNumber(number: phoneNumberTextField.text!, amount: Double(amountTextField.text!)!)
        
        dismiss(animated: true, completion: nil)
    }
    
    @objc func onTap() {
        view.endEditing(true)
    }
}
