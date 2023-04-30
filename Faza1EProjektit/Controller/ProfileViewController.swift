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
    
    @IBOutlet weak var picBackgroundView: UIView!
    @IBOutlet weak var mainPic: UIImageView!
    
    
    var profileViewBrain = ProfileViewBrian()
    let scrollView = UIScrollView()
    
    let uiView = UIView()
    
    let imageArray: [String] = ["01", "02", "03", "Trees"]
    
    var firstLabel: String = ""
    var name: String = ""
    var userName: String = ""
    var age: String = "0"
    var city: String = ""
    var country: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpProfileView()
        showScrollView()
    }
    
    
    func showScrollView() {
        picBackgroundView.addSubview(scrollView)
        scrollView.frame = CGRect(x: 5, y: 5, width: picBackgroundView.frame.width + 16, height: 180)
        scrollView.isPagingEnabled = true
        
        for i in 0...imageArray.count - 1 {
            let imageView = UIImageView()
            scrollView.addSubview(imageView)
            imageView.frame = CGRect(x: CGFloat(i) * self.scrollView.frame.width, y: 0, width: self.scrollView.frame.width, height: 180)
            imageView.image = UIImage(named: imageArray[i])
            imageView.contentMode = .scaleToFill
        }
        scrollView.contentSize = CGSize(width: imageArray.count * Int(self.scrollView.frame.width), height: 180)
    }
    
    func setUpProfileView() {
        fullNameLabel.text = name
        userNameLabel.text = userName
        ageLabel.text = age
        cityLabel.text = city
        countyrLabel.text = country
        topLabel.text = firstLabel
        profileViewBrain.changeButtons(startRecButton)
        profileViewBrain.changeButtons(connToOtherButton)
        profileViewBrain.changeButtons(mainPic)
        profileViewBrain.changeButtons(picBackgroundView)
        profileViewBrain.addBorder(connToOtherButton)
    }
}


extension UIColor {
    static func random() -> UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }
}
