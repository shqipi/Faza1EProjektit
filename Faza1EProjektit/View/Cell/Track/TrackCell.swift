//
//  TrackViewCell.swift
//  Faza1EProjektit
//
//  Created by shqiperimramadani on 25.03.23.
//

import UIKit

class TrackCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var startPointLabel: UILabel!
    @IBOutlet weak var finishPointLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var trackImageLabel: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setDetails(track: Track) {
        nameLabel.text = track.name
        cityLabel.text = track.city
        startPointLabel.text = track.startPoint
        finishPointLabel.text = track.finishPoint
        distanceLabel.text = "\(track.distance ?? 0) Km"
        trackImageLabel.image = UIImage(named: track.image ?? "1")
    }
}
