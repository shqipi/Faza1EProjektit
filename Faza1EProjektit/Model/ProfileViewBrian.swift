//
//  ProfileViewBrian.swift
//  Faza1EProjektit
//
//  Created by shqiperimramadani on 15.03.23.
//

import UIKit

struct ProfileViewBrian {
    
    
    
    func changeButtons(_ input: UIButton){
        input.layer.cornerRadius = 15
    }
    
    func addBorder(_ input: UIButton){
        input.layer.borderWidth = 2
        input.layer.borderColor = UIColor.systemBlue.cgColor
    }
}
