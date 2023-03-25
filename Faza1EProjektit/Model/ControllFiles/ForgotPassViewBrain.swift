//
//  ForgotPassViewBrain.swift
//  Faza1EProjektit
//
//  Created by shqiperimramadani on 15.03.23.
//

import UIKit

struct ForgotPassViewBrain {
    
    func changeCornerRad(_ input: AnyObject) {
        input.layer?.cornerRadius = 8
    }
    
    func addShadow(_ input: AnyObject){
        input.layer?.shadowRadius = 1
        input.layer?.shadowOpacity = 0.1
        input.layer?.shadowOffset = CGSize(width: 0, height: 3)
        input.layer?.shadowColor = UIColor.darkGray.cgColor
        input.layer?.cornerRadius = 10
    }
    
    func addColorAndWidthToBorder(_ input: AnyObject){
        input.layer?.borderWidth = 2
        input.layer?.borderColor = UIColor.black.cgColor
    }
}
