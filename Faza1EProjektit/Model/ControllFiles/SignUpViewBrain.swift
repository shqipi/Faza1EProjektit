//
//  SignUpViewBrain.swift
//  Faza1EProjektit
//
//  Created by shqiperimramadani on 15.03.23.
//

import UIKit

struct SignUpViewBrain {
    
    func changeBorder(_ input: AnyObject){
        input.layer?.cornerRadius = 10
        input.layer?.shadowRadius = 5
        input.layer?.shadowOpacity = 0.2
        input.layer?.shadowOffset = CGSize(width: 0, height: 3)
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
