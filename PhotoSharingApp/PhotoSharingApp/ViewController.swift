//
//  ViewController.swift
//  PhotoSharingApp
//
//  Created by Aydın Kutlu on 3.06.2024.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {

    
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInClicked(_ sender: Any) {
        if emailTextfield.text != "" && passwordTextfield.text != "" {
            Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { AuthDataResult, error in
                if error != nil {
                    self.errorMessage(title: "Error", message: error?.localizedDescription ?? "Error")
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        } else {
            errorMessage(title: "Error", message: "Wrong Email or Password")
        }
    }

    
    @IBAction func signUpClicked(_ sender: Any) {
        if emailTextfield.text != "" && passwordTextfield.text != "" {
            Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { AuthDataResult, error in
                if error != nil {
                    self.errorMessage(title: "Error", message: error?.localizedDescription ?? "Error, Try Again")
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        } else {
            errorMessage(title: "Error!", message: "Please Enter Username and Password.")
        }
    }
    
    func errorMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}

