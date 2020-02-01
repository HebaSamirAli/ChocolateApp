//
//  LoginViewController.swift
//  chocolateApp
//
//  Created by HebaMac on 1/29/20.
//  Copyright © 2020 HSA. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseFirestore



class LoginViewController: UIViewController {
    
    @IBOutlet weak var userID: UITextField!
    @IBOutlet weak var pass: UITextField!
    let db = Firestore.firestore()
    var ps = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
       
    }
    
// action func for signup btn
    
    @IBAction func btnsignup(_ sender: Any)
    {

// write to database in firebase
        
        if (userID != nil){
            let ref = db.collection("Login")
            ref.document("user"+userID.text!).setData(["password": pass.text])
            //db.collection("Login").addDocument(data: ["id":userID.text as Any, "password":pass.text as Any])

// Remove textBoxs values
            
            userID.text = ""
            pass.text = ""
        }
    }
    
    @IBAction func btnsignin(_ sender: Any)
    {
        
// parse data from firebase
        
        let ref = db.collection("Login").document("user"+userID.text!)
        ref.getDocument{(document,error) in
            if let document = document,document.exists{
                let dataDiscription = document.data().map(String.init(describing:)) ?? "nil"
                
// check for correct pass
                
                let str = String(dataDiscription.dropFirst(13).dropLast(1))
                if (str == self.pass.text) {
                    let main = UIStoryboard(name: "Main",bundle: nil)
                    let cv = main.instantiateViewController(withIdentifier: "VC")
                    self.present(cv, animated: true, completion: nil)
                    
                    
                }
                
            }else {print("Document data does not exist")}
            
        }
        
    }
    
// cancel button
    @IBAction func btnCancel(_ sender: Any)
    {
        let main = UIStoryboard(name: "Main",bundle: nil)
        let cv = main.instantiateViewController(withIdentifier: "Master")
        self.present(cv, animated: true, completion: nil)
        
    }

    
}
