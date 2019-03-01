//
//  RequestVC.swift
//  KoreBank
//
//  Created by Prudhvi Gadiraju on 2/25/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import UIKit

class RequestVC: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addGradient(color1: #colorLiteral(red: 0.2588235294, green: 0.9019607843, blue: 0.5843137255, alpha: 1), color2: #colorLiteral(red: 0.231372549, green: 0.6980392157, blue: 0.7215686275, alpha: 1))
    }
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
