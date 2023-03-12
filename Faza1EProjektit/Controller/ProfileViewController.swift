//
//  ProfileViewController.swift
//  Faza1EProjektit
//
//  Created by shqiperimramadani on 12.03.23.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var countyrLabel: UILabel!
    
    @IBOutlet weak var startRecButton: UIButton!
    @IBOutlet weak var connToOtherButton: UIButton!
    
    @IBOutlet weak var mainPic: UIImageView!
    
    var firstLabel: String = ""
    var name: String = ""
    var userName: String = ""
    var age: String = "0"
    var city: String = ""
    var country: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullNameLabel.text = name
        userNameLabel.text = userName
        ageLabel.text = age
        cityLabel.text = city
        countyrLabel.text = country
        topLabel.text = firstLabel
        changeButtons(startRecButton)
        changeButtons(connToOtherButton)
        addBorder(connToOtherButton)
    }
    
    func changeButtons(_ input: UIButton){
        input.layer.cornerRadius = 15
    }
    
    func addBorder(_ input: UIButton){
        input.layer.borderWidth = 2
        input.layer.borderColor = UIColor.systemBlue.cgColor
    }

}
