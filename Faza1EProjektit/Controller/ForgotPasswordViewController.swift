//
//  ForgotPasswordViewController.swift
//  Faza1EProjektit
//
//  Created by shqiperimramadani on 09.03.23.
//

import UIKit

class ForgotPasswordViewController: UIViewController, UITextFieldDelegate {
    
    var isClicked = true
    
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var newPassTextField: UITextField!
    @IBOutlet weak var reTypePassTextField: UITextField!
    @IBOutlet weak var changeButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.delegate = self
        newPassTextField.delegate = self
        reTypePassTextField.delegate = self
        
        
        changeCornerRad(mainView)
        changeCornerRad(changeButton)
        addShadow(mainView)
        addShadow(mainTitleLabel)
        addShadow(userNameTextField)
        addShadow(newPassTextField)
        addShadow(reTypePassTextField)
        addColorAndWidthToBorder(changeButton)
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
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let goToProfileViewController = storyBoard.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController {
            goToProfileViewController.firstLabel = "Changed succsessfully"
            self.navigationController?.pushViewController(goToProfileViewController, animated: true)
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
    
    func changeCornerRad(_ input: AnyObject) {
        input.layer?.cornerRadius = 8
    }
    
    func addShadow(_ input: AnyObject){
        input.layer?.shadowRadius = 1
        input.layer?.shadowOpacity = 0.1
        input.layer?.shadowOffset = CGSize(width: 0, height: 3)
        input.layer?.shadowColor = UIColor.darkGray.cgColor
        input.layer?.cornerRadius = 15
        
    }
    
    func addColorAndWidthToBorder(_ input: AnyObject){
        input.layer?.borderWidth = 2
        input.layer?.borderColor = UIColor.black.cgColor
    }

}
