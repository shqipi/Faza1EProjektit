//
//  ViewBrain.swift
//  Faza1EProjektit
//
//  Created by shqiperimramadani on 15.03.23.
//

import UIKit

struct LoginViewBrain {
    
    
    
    func makeChanges(_ input: AnyObject) {
        input.layer?.cornerRadius = 10
        input.layer?.borderColor = UIColor.black.cgColor
        input.layer?.borderWidth = 2
        input.layer?.shadowRadius = 10
        input.layer?.shadowOpacity = 0.2
    }
    
    func txtFieldShadow(_ input: UITextField) {
        input.layer.shadowRadius = 10
        input.layer.shadowOpacity = 0.2
    }
}
