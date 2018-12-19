//
//  ViewController.swift
//  DriveBuddyTestProject
//
//  Created by Çağlar Uslu on 30.10.2018.
//  Copyright © 2018 Çağlar Uslu. All rights reserved.
//

import UIKit
// DriveBuddy SDK implementation
import DriveBuddySDK
//

class AuthenticationViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var logoConstraint: NSLayoutConstraint! // Ignore this line
    
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTextFieldDelegates() // Ignore this line
        addGestureRecognizer() // Ignore this line
        
    }
    
    
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        if logoConstraint.constant == -130{ // Ignore this line
            animateConstraint(constraint: logoConstraint, before: -130, after: 70) // Ignore this line
        }
        
        login()
    }
    
    func login(){
        
        if let uniqueID = username.text{ // You should provide a unique id (email, username, driver id etc.) for drivers.
            
            // DriveBuddy SDK implementation
            DriveBuddy.authenticate(withSDKKey: SDK_KEY, username: uniqueID, firstName: firstName.text ?? "", lastName: lastName.text ?? "", email: email.text ?? "", phone: "") { (success) in
                if success{
                    self.performSegue(withIdentifier: "loginPressed", sender: nil)
                }
            }
            
        }else{
            print("Email cannot be left blank")
        }
    }
    
    
    
    
    
    
    // Ignore all the functions below
    
    
    func setTextFieldDelegates(){
        username.delegate = self
        firstName.delegate = self
        lastName.delegate = self
        email.delegate = self
    }
    
    func addGestureRecognizer(){
        let hideTap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardTap(recognizer:)))
        hideTap.numberOfTapsRequired = 1
        self.view.isUserInteractionEnabled = true
        self.view.addGestureRecognizer(hideTap)
    }
    
    @objc func hideKeyboardTap(recognizer: UITapGestureRecognizer){
        if logoConstraint.constant == -130{
            animateConstraint(constraint: logoConstraint, before: -130, after: 70)
        }
        self.view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if logoConstraint.constant == 70{
            animateConstraint(constraint: logoConstraint, before: 70, after: -130)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if logoConstraint.constant == -130{
            animateConstraint(constraint: logoConstraint, before: -130, after: 70)
        }
        self.view.endEditing(true)
        
        return false
    }
    
    func animateConstraint(constraint: NSLayoutConstraint, before: Double, after: Double) {
        
        constraint.constant = CGFloat(before)
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: Double(0.2), animations: {
            constraint.constant = CGFloat(after)
            self.view.layoutIfNeeded()
        })
        
    }
    
    
}

