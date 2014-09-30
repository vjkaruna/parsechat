//
//  ViewController.swift
//  challenge
//
//  Created by Tianyu Shi on 9/29/14.
//  Copyright (c) 2014 codepathThing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!

    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signInAction(sender: AnyObject) {
        var username = emailTextField.text
        var password = passwordTextField.text
        PFUser.logInWithUsernameInBackground(username, password:password) {
            (user: PFUser!, error: NSError!) -> Void in
            if user != nil {
                println("user \(user.username)")
                self.performSegueWithIdentifier("signInSegue", sender: self)
            } else {
               println("Error 1")
            }
        }
    }

    @IBAction func signUpAction(sender: AnyObject) {
        var pfuser = PFUser()
        
        pfuser.username = emailTextField.text
        pfuser.password = passwordTextField.text
        pfuser.email = emailTextField.text
        
        pfuser.signUpInBackgroundWithBlock {
            (succeeded: Bool!, error: NSError!) -> Void in
            if error == nil {
                println("user \(pfuser.username)")
                self.performSegueWithIdentifier("signUpSegue", sender: self)
            } else {
                let errorString = (error.userInfo! as NSDictionary)["error"] as NSString
                // Show the errorString somewhere and let the user try again.
                println("Error 2 \(errorString)")
            }
        }
    }
}

