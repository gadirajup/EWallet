//
//  FirestoreAuthentication.swift
//  KoreBank
//
//  Created by Prudhvi Gadiraju on 2/22/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import Foundation
import Firebase

struct smsStatus: Decodable {
    var message: String
}

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
    
    func queryPhoneNumber(number: String, amount: Double) {
        guard let currentUser = Auth.auth().currentUser else {return}
        
        Firestore.firestore().collection("users").document(currentUser.uid).getDocument { (snapshot, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                guard let snapshot = snapshot else {return}
                guard let data = snapshot.data() else {return}
                let money = data["balance"] as! String
                let newMoney = Double(money)! - amount
                
                self.setBalance(uid: currentUser.uid, newBalance: newMoney)
            }
        }
        
//        Firestore.firestore().collection("users").document(currentUser.uid).setData(["balance" : Any], merge: true)
        
        let query = Firestore.firestore().collection("users").whereField("phoneNumber", isEqualTo: number)
        query.getDocuments { (querySnapshot, error) in
            if let error = error {
                debugPrint("Query Error: \(error.localizedDescription)")
            } else {
                for document in querySnapshot!.documents {
                    let balance = document["balance"] as! String
                    let newBalance = amount + Double(balance)!
                    
                    self.setBalance(uid: document.documentID, newBalance: newBalance)
                    guard let url = URL(string: "http://192.168.1.7:8080/pay/\(number)/\(Int(newBalance))") else {return}
                    self.makeURLRequest(withUrl: url)
                }
            }
        }
    }
    
    func setBalance(uid: String, newBalance: Double){
        Firestore.firestore().collection("users").document(uid).setData(["balance" : String(newBalance)], merge: true)
    }
    
    func makeURLRequest(withUrl url: URL) {
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }

            guard let data = data else { return }
            print(String(bytes:data, encoding: .utf8) ?? "oh oh" )

            do {
                let status = try JSONDecoder().decode(smsStatus.self, from: data)
                print(status)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
