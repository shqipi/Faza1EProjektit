//
//  LoginViewController.swift
//  Faza1EProjektit
//
//  Created by shqiperimramadani on 09.03.23.
//

import UIKit
class LoginViewController: UIViewController {
    
    
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
        
        setUpTextFieldDelegate()
        setUpDisplay()
    }
    
    func setUpTextFieldDelegate() {
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func setUpDisplay() {
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
//        let storyBoard = UIStoryboard(name: K.main, bundle: nil)
//        let mainTabBardController = storyBoard.instantiateViewController(withIdentifier: K.identifierOfMainTbC)
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBardController)
        self.performSegue(withIdentifier: K.segueIdentifier.segueGo2Home, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.segueIdentifier.segueGo2Home {
            if let homeViewController = segue.destination as? HomeViewController{
                let user = User(userName: usernameTextField.text ?? "Feed", id: 1)
                homeViewController.showUsername = user.userName ?? "Shqiperim"
            }
        }
    }
}

//MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        }else{
            textField.placeholder = "Please type something"
            return false
        }
    }
}

