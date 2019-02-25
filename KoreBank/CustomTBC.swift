//
//  CustomTBC.swift
//  KoreBank
//
//  Created by Prudhvi Gadiraju on 2/22/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import UIKit

// Makes unselected icons a darker gray
class CustomTBC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.unselectedItemTintColor = #colorLiteral(red: 0.2117647059, green: 0.2117647059, blue: 0.2117647059, alpha: 1)
    }
}
