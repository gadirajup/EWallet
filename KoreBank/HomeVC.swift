//
//  HomeVC.swift
//  KoreBank
//
//  Created by Prudhvi Gadiraju on 2/21/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import UIKit
import Firebase

class HomeVC: UIViewController {
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var payNowButton: UIButton!
    @IBOutlet weak var requestButton: UIButton!
    @IBOutlet weak var addToWalletButton: UIButton!
    
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    var selectedButton = UIButton()
    let transition = PopAnimator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkUser()
        addNav(text: "Hello")
        setupView()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkUser()
    }
    
    @IBAction func payNowButtonPressed(_ sender: Any) {
        selectedButton = payNowButton
        let payNowVC = storyBoard.instantiateViewController(withIdentifier: "payNowVC")
        payNowVC.transitioningDelegate = self
        present(payNowVC, animated: true, completion: nil)
    }
    @IBAction func requestButtonPressed(_ sender: Any) {
        selectedButton = requestButton
        let requestVC = storyBoard.instantiateViewController(withIdentifier: "requestVC")
        requestVC.transitioningDelegate = self
        present(requestVC, animated: true, completion: nil)
    }
    @IBAction func addToWalletButtonPressed(_ sender: Any) {
        selectedButton = addToWalletButton
        let addToWalletVC = storyBoard.instantiateViewController(withIdentifier: "addToWalletVC")
        addToWalletVC.transitioningDelegate = self
        present(addToWalletVC, animated: true, completion: nil)
    }
    
    func setupView() {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        Firestore.firestore().collection("users").document(uid).getDocument { (snapshot, error) in
            if let error = error {
                debugPrint(error.localizedDescription)
            } else {
                guard let snap = snapshot else {return}
                guard let data = snap.data() else {return}
                self.addNav(text: "Hello, \(data["name"] as! String)")
                self.addBalance(balance: data["balance"] as! Double)
            }
        }
    }
    
    func addNav(text: String) {
        let customLargeTitleView = CustomLargeTitleView()
        customLargeTitleView.addCustomLargeTitle(view: view, text: "\(text) ")
    }
    
    func addBalance(balance: Double) {
        balanceLabel.text = "$\(balance)"
    }
    
    func checkUser() {
        let firestoreAuthentication = FirestoreAuthentication()
        firestoreAuthentication.checkUser(self)
    }
}

extension HomeVC: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        transition.originalSize = selectedButton.frame
        transition.presenting = true
        
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.originalSize = selectedButton.frame
        transition.presenting = false
        
        return transition
    }
}
