//
//  ForgotPasswordViewController.swift
//  Faza1EProjektit
//
//  Created by shqiperimramadani on 09.03.23.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    var isClicked = true
    
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var newPassTextField: UITextField!
    @IBOutlet weak var reTypePassTextField: UITextField!
    @IBOutlet weak var userNameWarningLabel: UILabel!
    @IBOutlet weak var passwordWarningLabel: UILabel!
    @IBOutlet weak var reTypePassWarningLabel: UILabel!
    @IBOutlet weak var changeButton: UIButton!
    
    var forgotPassViewBrain = ForgotPassViewBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.delegate = self
        newPassTextField.delegate = self
        reTypePassTextField.delegate = self
        forgotPassViewBrain.changeCornerRad(mainView)
        forgotPassViewBrain.changeCornerRad(changeButton)
        forgotPassViewBrain.addShadow(mainView)
        forgotPassViewBrain.addShadow(mainTitleLabel)
        forgotPassViewBrain.addShadow(userNameTextField)
        forgotPassViewBrain.addShadow(newPassTextField)
        forgotPassViewBrain.addShadow(reTypePassTextField)
        forgotPassViewBrain.addColorAndWidthToBorder(changeButton)
    }
    
    
    @IBAction func firstEyeButtonPressed(_ sender: UIButton) {
        if isClicked{
            newPassTextField.isSecureTextEntry = false
        }else{
            newPassTextField.isSecureTextEntry = true
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
    
    
    
    @IBAction func changeButtonPressed(_ sender: UIButton) {
        
        guard let name = userNameTextField.text, let password = newPassTextField.text, let retPassword = reTypePassTextField.text else {
            return
        }
        
        if name != "", password != "", retPassword != "" {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            if let goToProfileViewController = storyBoard.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController {
                goToProfileViewController.firstLabel = "Changed succsessfully"
                self.navigationController?.pushViewController(goToProfileViewController, animated: true)
            }
            userNameWarningLabel.isHidden = true
            passwordWarningLabel.isHidden = true
            reTypePassWarningLabel.isHidden = true
        }else {
            userNameWarningLabel.isHidden = false
            userNameWarningLabel.text = "User name is empty"
            passwordWarningLabel.isHidden = false
            passwordWarningLabel.text = "Password is empty"
            reTypePassWarningLabel.isHidden = false
            reTypePassWarningLabel.text = "Re-Type password is empty"
        }
    }
}

//MARK: -  UITextFieldDelegate

extension ForgotPasswordViewController: UITextFieldDelegate {
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        }else{
            textField.placeholder = "Please type something"
            return false
        }
    }
}
