//
//  TrackViewController.swift
//  Faza1EProjektit
//
//  Created by shqiperimramadani on 25.03.23.
//

import UIKit

class TrackViewController: UIViewController  {
    
    @IBOutlet weak var trackTableView: UITableView!
    
    var trackArray: [Track] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startSetUp()
        creatTrack()
    }
    
    func startSetUp() {
        trackTableView.dataSource = self
        trackTableView.delegate = self
        trackTableView.register(UINib(nibName: "TrackCell", bundle: nil), forCellReuseIdentifier: "TrackCell")
    }
    
    func creatTrack() {
        let track1 = Track(id: 1, name: "Shtegu te Malet e Rosit", city: "Valbone", startPoint: "Te Ura e madhe", finishPoint: "Maja e Rosit", distance: 12, image: "WaterFall")
        let track2 = Track(id: 2, name: "Shtegu tek Livadhet", city: "Ferizaj", startPoint: "Te Mrizi i Zanave", finishPoint: "Lumit Morava", distance: 10, image: "Forest")
        let track3 = Track(id: 3, name: "Shtegu tek Liqeni i Batllaves", city: "Prishtin", startPoint: "Pran Diges", finishPoint: "Fshatin Magure", distance: 7, image: "Lake")
        let track4 = Track(id: 4, name: "Shtegu tek Liqeni i Batllaves", city: "Prishtin", startPoint: "Pran Diges", finishPoint: "Fshatin Magure", distance: 7, image: "Mountens")
        let track5 = Track(id: 5, name: "Shtegu tek Liqeni i Batllaves", city: "Prishtin", startPoint: "Pran Diges", finishPoint: "Fshatin Magure", distance: 7, image: "Trees")
        let track6 = Track(id: 6, name: "Shtegu tek Liqeni i Batllaves", city: "Prishtin", startPoint: "Pran Diges", finishPoint: "Fshatin Magure", distance: 7, image: "Sky")
        
        trackArray = [track1, track2, track3, track4, track5, track6]
        trackTableView.reloadData()
    }
    

}

//MARK: - UITableViewDataSource

extension TrackViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trackArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrackCell") as! TrackCell
        cell.setDetails(track: trackArray[indexPath.row])
        return cell
    }
    
    
}

//MARK: - Extention 2
extension TrackViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
