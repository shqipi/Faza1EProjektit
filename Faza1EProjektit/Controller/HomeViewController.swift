//
//  HomeViewController.swift
//  Faza1EProjektit
//
//  Created by shqiperimramadani on 09.03.23.
//

import UIKit


class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var topLabel: UILabel!
    
    @IBOutlet weak var firstPic: UIImageView!
    @IBOutlet weak var largFirstPic: UIImageView!
    @IBOutlet weak var miniFirstPic: UIImageView!
    
    @IBOutlet weak var secondPic: UIImageView!
    @IBOutlet weak var largSecondPic: UIImageView!
    @IBOutlet weak var miniSecondPic: UIImageView!
    
    var showUsername: String = "Hello"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeCornerRad(input: largFirstPic)
        changeCornerRad(input: largSecondPic)
        roundPictures(input: firstPic)
        roundPictures(input: miniFirstPic)
        roundPictures(input: secondPic)
        roundPictures(input: miniSecondPic)
        topLabel.text = "Welcome \(showUsername)"
    }
  
    
    
    func changeCornerRad(input: AnyObject){
        input.layer?.cornerRadius = 5
        input.layer?.shadowRadius = 1
        input.layer?.shadowOpacity = 0.2
    }
    
    func roundPictures(input: AnyObject) {
        input.layer?.cornerRadius = input.frame.height / 2
        input.layer?.shadowRadius = 1
        input.layer?.shadowOpacity = 0.2
    }


}
