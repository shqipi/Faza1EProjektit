//
//  HomeViewBrain.swift
//  Faza1EProjektit
//
//  Created by shqiperimramadani on 15.03.23.
//

import UIKit

struct HomeViewBrain {
    
    
    
    func changeCornerRad(_ input: AnyObject){
        input.layer?.cornerRadius = 5
        input.layer?.shadowRadius = 1
        input.layer?.shadowOpacity = 0.2
    }
    
    func roundPictures(_ input: AnyObject) {
        input.layer?.cornerRadius = input.frame.height / 2
        input.layer?.shadowRadius = 1
        input.layer?.shadowOpacity = 0.2
    }

}
