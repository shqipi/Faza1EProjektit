//
//  UserCell.swift
//  Faza1EProjektit
//
//  Created by shqiperimramadani on 22.03.23.
//

import UIKit

class UserCell: UITableViewCell {
    
    @IBOutlet weak var profilePhoto: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var mianPhoto: UIImageView!
    @IBOutlet weak var withInPhotoLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var miniPhoto: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setDetaisl(user: User){
        profilePhoto.image = UIImage(named: user.profilPhoto ?? "1")
        nameLabel.text = user.name
        dateLabel.text = user.date
        mianPhoto.image = UIImage(named: user.mainPhoto ?? "2")
        withInPhotoLabel.text = user.photoLabel
        likeLabel.text = user.likeLabel
        miniPhoto.image = UIImage(named: user.minPhoto ?? "2")
        roundPictures(profilePhoto)
        roundPictures(miniPhoto)
        changeCornerRad(mianPhoto)
    }
    
    func changeCornerRad(_ input: AnyObject){
        input.layer?.shadowRadius = 1
        input.layer?.shadowOpacity = 0.2
        input.layer?.shadowOffset = CGSize(width: 0, height: 3)
    }
    
    func roundPictures(_ input: AnyObject) {
        input.layer?.cornerRadius = input.frame.height / 2
        input.layer?.shadowRadius = 1
        input.layer?.shadowOpacity = 0.2
    }
    
}
