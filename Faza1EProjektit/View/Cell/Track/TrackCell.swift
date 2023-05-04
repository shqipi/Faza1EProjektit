//
//  TrackViewCell.swift
//  Faza1EProjektit
//
//  Created by shqiperimramadani on 25.03.23.
//

import UIKit
protocol TapGestureRecognizerToImag{
    func tapImage(track: Track)
}
class TrackCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var startPointLabel: UILabel!
    @IBOutlet weak var finishPointLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var startTrailButton: UIButton!
    @IBOutlet weak var trackImageLabel: UIImageView!
    
    var delegate: TapGestureRecognizerToImag?
    var track: Track?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setButton()
        setImage()
    }
    
    func handleTap() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        trackImageLabel.isUserInteractionEnabled = true
        trackImageLabel.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        if let track = track {
            delegate?.tapImage(track: track)
        }
    }
   
    
    func setButton() {
        startTrailButton.layer.cornerRadius = 5
        startTrailButton.layer.borderWidth = 1
        startTrailButton.layer.borderColor = UIColor.black.cgColor
    }
    
    func setImage() {
        trackImageLabel.layer.cornerRadius = 5
    }
    
    
    func setDetails(track: Track) {
        nameLabel.text = track.name
        cityLabel.text = track.city
        startPointLabel.text = track.startPoint
        finishPointLabel.text = track.finishPoint
        distanceLabel.text = "\(track.distance ?? 0) Km"
        trackImageLabel.image = UIImage(named: track.image ?? "1")
    }
    
    
    @IBAction func startTrailButtonPressed(_ sender: Any) {
    }
}
