//
//  LoginViewController.swift
//  Faza1EProjektit
//
//  Created by shqiperimramadani on 09.03.23.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    var user: User?
    var isClicked = true
    
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgetPassButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        
        makeChanges(input: backgroundView)
        makeChanges(input: loginButton)
        txtFieldShadow(input: usernameTextField)
        txtFieldShadow(input: passwordTextField)
    }
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue){
        
    }
    
    
    @IBAction func eyeButtonPressed(_ sender: UIButton) {
        if isClicked {
            passwordTextField.isSecureTextEntry = false
        }else{
            passwordTextField.isSecureTextEntry = true
        }
        isClicked = !isClicked
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
       performSegue(withIdentifier: "go2Home", sender: self)
    }
    
    
    func makeChanges(input: AnyObject) {
        input.layer?.cornerRadius = 10
        input.layer?.borderColor = UIColor.black.cgColor
        input.layer?.borderWidth = 2
        input.layer?.shadowRadius = 10
        input.layer?.shadowOpacity = 0.2
    }
    
    func txtFieldShadow(input: UITextField) {
        input.layer.shadowRadius = 10
        input.layer.shadowOpacity = 0.2
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        }else{
            textField.placeholder = "Please type something"
            return false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "go2Home" {
            if let homeViewController = segue.destination as? HomeViewController{
                let user = User(userName: usernameTextField.text ?? "Feed")
                homeViewController.showUsername = user.userName
            }
        }
    }

}

