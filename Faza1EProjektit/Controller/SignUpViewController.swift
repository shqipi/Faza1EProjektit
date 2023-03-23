//
//  SignUpViewController.swift
//  Faza1EProjektit
//
//  Created by shqiperimramadani on 09.03.23.
//

import UIKit

class SignUpViewController: UIViewController {
    
    var user: User?
    var isClicked = true
    
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var reTypePassTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var mainViewField: UIView!
    
    @IBOutlet weak var nameWarningLabel: UILabel!
    @IBOutlet weak var userWarningLabel: UILabel!
    @IBOutlet weak var passWarningLabel: UILabel!
    @IBOutlet weak var rePassWarningLabel: UILabel!
    @IBOutlet weak var cityWarningLabel: UILabel!
    @IBOutlet weak var countryWarningLabel: UILabel!
    @IBOutlet weak var ageWarningLabel: UILabel!
    
    
    var signUpViewBrain = SignUpViewBrain()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullNameTextField.delegate = self
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        reTypePassTextField.delegate = self
        cityTextField.delegate = self
        countryTextField.delegate = self
        ageTextField.delegate = self
        signUpViewBrain.changeBorder(mainViewField)
        signUpViewBrain.buttonChange(signInButton)
        changeArrayViews()
    }
    
    @IBAction func eyeButtonPressed(_ sender: UIButton) {
        if isClicked {
            passwordTextField.isSecureTextEntry = false
        }else{
            passwordTextField.isSecureTextEntry = true
        }
        isClicked = !isClicked
    }
    
    @IBAction func secondEyeButtonPressed(_ sender: UIButton) {
        if isClicked {
            reTypePassTextField.isSecureTextEntry = false
        }else{
            reTypePassTextField.isSecureTextEntry = true
        }
        isClicked = !isClicked
    }
    
    @IBAction func signupButtonPressed(_ sender: UIButton) {
        
        guard let user = userNameTextField.text, let name = userNameTextField.text, let password = passwordTextField.text, let reTypePass = reTypePassTextField.text ,let city = cityTextField.text, let country = countryTextField.text, let age = ageTextField.text else {
            return
        }
        if user != "", name != "", password != "", reTypePass != "", city != "", country != "", age != ""{
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            if let profileViewController = storyBoard.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController {
                let userObj = User(userName: (userNameTextField.text ?? "hello"), fullName: (userNameTextField.text ?? "hello"), city: (cityTextField.text ?? "hello"), country: (countryTextField.text ?? "hello"), age: Int (ageTextField.text ?? "0"), id: 1)
                profileViewController.name = userObj.fullName ?? "Hello"
                profileViewController.userName = userObj.userName ?? "Shqiperim"
                profileViewController.city = userObj.city ?? "Ferizaj"
                profileViewController.country = userObj.country ?? "Kosova"
                profileViewController.age = String(Int(userObj.age ?? 0))
                
                self.navigationController?.pushViewController(profileViewController, animated: true)
                
                nameWarningLabel.isHidden = true
                userWarningLabel.isHidden = true
                passwordTextField.isHidden = true
                rePassWarningLabel.isHidden = true
                cityWarningLabel.isHidden = true
                countryWarningLabel.isHidden = true
                ageWarningLabel.isHidden = true
            }
        }else{
            
            nameWarningLabel.isHidden = false
            nameWarningLabel.text = "Name is empty"
            
            userWarningLabel.isHidden = false
            userWarningLabel.text = "User name is empty"
            
            passWarningLabel.isHidden = false
            passWarningLabel.text = "Password is empty"
            
            rePassWarningLabel.isHidden = false
            rePassWarningLabel.text = "Re-Type Pass is empty"
            
            cityWarningLabel.isHidden = false
            cityWarningLabel.text = "City is empty"
            
            countryWarningLabel.isHidden = false
            countryWarningLabel.text = "Country is empty"
            
            ageWarningLabel.isHidden = false
            ageWarningLabel.text = "Age is empty"
            
        }
        
    }
    
    func changeArrayViews(){
        let arr: [AnyObject] = [fullNameTextField, userNameTextField, passwordTextField, reTypePassTextField, cityTextField, countryTextField, ageTextField, signInButton]
        for i in 0...arr.count - 1{
            signUpViewBrain.addShadow(arr[i])
        }
    }
    
}

//MARK: - UITextFieldDelegate

extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        }else {
            textField.placeholder = "Please type something"
            return false
        }
    }
}
