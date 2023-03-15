//
//  LoginViewController.swift
//  Faza1EProjektit
//
//  Created by shqiperimramadani on 09.03.23.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
    
    @IBOutlet weak var userNameWarningLabel: UILabel!
    @IBOutlet weak var passwordWarningLabel: UILabel!
    
    var user: User?
    var isClicked = true
    var loginViewBrain = LoginViewBrain()
    
    
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
        
        loginViewBrain.makeChanges(backgroundView)
        loginViewBrain.makeChanges(loginButton)
        loginViewBrain.txtFieldShadow(usernameTextField)
        loginViewBrain.txtFieldShadow(passwordTextField)
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
        
        guard let username = usernameTextField.text, let password = passwordTextField.text else {
            return
        }
        if username != "" && password != ""{
            performSegue(withIdentifier: "go2Home", sender: self)
            userNameWarningLabel.isHidden = true
            passwordWarningLabel.isHidden = true
        }else {
            userNameWarningLabel.isHidden = false
            userNameWarningLabel.text = "UserName is empty"
            passwordWarningLabel.isHidden = false
            passwordWarningLabel.text = "Password is empty"

            return
        }
        
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

