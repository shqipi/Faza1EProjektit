//
//  SignUpViewController.swift
//  Faza1EProjektit
//
//  Created by shqiperimramadani on 09.03.23.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullNameTextField.delegate = self
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        reTypePassTextField.delegate = self
        cityTextField.delegate = self
        countryTextField.delegate = self
        ageTextField.delegate = self
        
        changeBorder(input: mainViewField)
        changeArrayViews()
        buttonChange(signInButton)
    }
  
    func changeBorder(input: AnyObject){
        input.layer?.cornerRadius = 10
        input.layer?.shadowRadius = 5
        input.layer?.shadowOpacity = 0.2
        input.layer?.shadowOffset = CGSize(width: 0, height: 3)
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
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let profileViewController = storyBoard.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController {
            let userObj = User(userName: (userNameTextField.text ?? "hello"), fullName: (userNameTextField.text ?? "hello"), city: (cityTextField.text ?? "hello"), country: (countryTextField.text ?? "hello"), age: Int (ageTextField.text ?? "0"))
            profileViewController.name = userObj.fullName ?? "Hello"
            profileViewController.userName = userObj.userName 
            profileViewController.city = userObj.city ?? "Ferizaj"
            profileViewController.country = userObj.country ?? "Kosova"
            profileViewController.age = String(Int(userObj.age ?? 0))
            
            self.navigationController?.pushViewController(profileViewController, animated: true)
            
        }
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        }else {
            textField.placeholder = "Please type something"
            return false
        }
    }
    
    func changeArrayViews(){
        let arr: [AnyObject] = [fullNameTextField, userNameTextField, passwordTextField, reTypePassTextField, cityTextField, countryTextField, ageTextField,signInButton]
        for i in 0...arr.count - 1{
            addShadow(arr[i])
        }
    }
    
    func addShadow(_ input: AnyObject){
        input.layer?.shadowRadius = 1
        input.layer?.shadowOpacity = 0.1
        input.layer?.shadowOffset = CGSize(width: 0, height: 3)
        input.layer?.shadowColor = UIColor.darkGray.cgColor
        input.layer?.cornerRadius = 10
    }
    
    func buttonChange(_ input: AnyObject){
        input.layer?.borderColor = UIColor.black.cgColor
        input.layer?.cornerRadius = 5
        input.layer?.borderWidth = 2
    }
    
}
