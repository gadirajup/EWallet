//
//  AddToWalletVC.swift
//  KoreBank
//
//  Created by Prudhvi Gadiraju on 2/25/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import UIKit

class AddToWalletVC: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addGradient(color1: #colorLiteral(red: 0.09019607843, green: 0.9176470588, blue: 0.8509803922, alpha: 1), color2: #colorLiteral(red: 0.3764705882, green: 0.4705882353, blue: 0.9176470588, alpha: 1))
    }
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
