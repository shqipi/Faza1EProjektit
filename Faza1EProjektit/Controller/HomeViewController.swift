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
    var homeViewBrain = HomeViewBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeViewBrain.changeCornerRad(largFirstPic)
        homeViewBrain.changeCornerRad(largSecondPic)
        homeViewBrain.roundPictures(firstPic)
        homeViewBrain.roundPictures(miniFirstPic)
        homeViewBrain.roundPictures(secondPic)
        homeViewBrain.roundPictures(miniSecondPic)
        topLabel.text = "Welcome \(showUsername)"
    }
}
