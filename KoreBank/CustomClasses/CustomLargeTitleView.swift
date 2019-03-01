//
//  CustomLargeTitleView.swift
//  KoreBank
//
//  Created by Prudhvi Gadiraju on 2/22/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import UIKit

class CustomLargeTitleView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addCustomLargeTitle(view: UIView, text: String){
        let navView = UIView()
        view.addSubview(navView)
        
        navView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        navView.translatesAutoresizingMaskIntoConstraints = false
        navView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        navView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        navView.heightAnchor.constraint(equalToConstant: 139).isActive = true
        
        let navViewShadow = UIView()
        view.addSubview(navViewShadow)
        
        navViewShadow.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navViewShadow.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        navViewShadow.layer.shadowOffset = CGSize(width: 0, height: 1)
        navViewShadow.layer.shadowOpacity = 0.1
        navViewShadow.layer.shadowRadius = 3
        
        navViewShadow.translatesAutoresizingMaskIntoConstraints = false
        navViewShadow.widthAnchor.constraint(equalTo: navView.widthAnchor).isActive = true
        navViewShadow.centerXAnchor.constraint(equalTo: navView.centerXAnchor).isActive = true
        navViewShadow.heightAnchor.constraint(equalToConstant: 1).isActive = true
        navViewShadow.centerYAnchor.constraint(equalTo: navView.bottomAnchor, constant: -1).isActive = true
        
        let helloLabel = UILabel()
        navView.addSubview(helloLabel)
        
        helloLabel.text = "\(text)"
        helloLabel.font = UIFont(name: "Avenir-Heavy", size: 36)
        helloLabel.textColor = #colorLiteral(red: 0.2117647059, green: 0.2117647059, blue: 0.2117647059, alpha: 1)
        
        helloLabel.translatesAutoresizingMaskIntoConstraints = false
        helloLabel.leftAnchor.constraint(equalTo: navView.leftAnchor, constant: 16).isActive = true
        helloLabel.rightAnchor.constraint(equalTo: navView.rightAnchor, constant: -16).isActive = true
        helloLabel.centerYAnchor.constraint(equalTo: navView.bottomAnchor, constant: -25).isActive = true
    }
}
