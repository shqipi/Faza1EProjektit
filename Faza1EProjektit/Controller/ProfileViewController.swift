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
    
    
    var profileViewBrain = ProfileViewBrian()
    
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
        profileViewBrain.changeButtons(startRecButton)
        profileViewBrain.changeButtons(connToOtherButton)
        profileViewBrain.addBorder(connToOtherButton)
    }
    
    
}
