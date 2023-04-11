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
    @IBOutlet weak var changeButton: UIButton!
    
    var forgotPassViewBrain = ForgotPassViewBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpDisplay()
        setUpDelegate()
        adjustDisplayView()
    }
    
    func setUpDelegate() {
        userNameTextField.delegate = self
        newPassTextField.delegate = self
        reTypePassTextField.delegate = self
        
    }
    
    func adjustDisplayView() {
        mainView.layer.cornerRadius = 10
        mainView.layer.borderColor = UIColor.black.cgColor
        mainView.layer.borderWidth = 2
        mainView.layer.shadowRadius = 10
        mainView.layer.shadowOpacity = 0.2
    }
    
    func setUpDisplay() {
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
        let storyBoard = UIStoryboard(name: K.main, bundle: nil)
        if let goToProfileViewController = storyBoard.instantiateViewController(withIdentifier: K.identifierOfProfileVC) as? ProfileViewController {
            goToProfileViewController.firstLabel = "Changed succsessfully"
            self.navigationController?.pushViewController(goToProfileViewController, animated: true)
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
