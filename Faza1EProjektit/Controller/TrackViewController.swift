//
//  TrackViewController.swift
//  Faza1EProjektit
//
//  Created by shqiperimramadani on 25.03.23.
//

import UIKit

class TrackViewController: UIViewController {
    
    @IBOutlet weak var trackTableView: UITableView!
    
    var trackArray: [Track] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startSetUp()
        creatTrack()
    }
    
    @IBAction func addNewTracButtonPressed(_ sender: Any) {
        performSegue(withIdentifier:K.segueIdentifier.segueAddNewMap, sender: self)
    }
    
    func startSetUp() {
        trackTableView.dataSource = self
        trackTableView.delegate = self
        trackTableView.register(UINib(nibName: K.uiNibeNames.trackCellNibName, bundle: nil), forCellReuseIdentifier: K.cellResudeIdentifierName.trackCellIdentifierName)
    }
    
    func creatTrack() {
        let track1 = Track(id: 1, name: "Shtegu te Malet e Rosit", city: "Valbone", startPoint: "Te Ura e madhe", finishPoint: "Maja e Rosit", distance: 12, image: "11")
        let track2 = Track(id: 2, name: "Shtegu tek Livadhet", city: "Ferizaj", startPoint: "Te Mrizi i Zanave", finishPoint: "Lumit Morava", distance: 10, image: "22")
        let track3 = Track(id: 3, name: "Shtegu tek Liqeni i Batllaves", city: "Prishtin", startPoint: "Pran Diges", finishPoint: "Fshatin Magure", distance: 7, image: "Lake")
        let track4 = Track(id: 4, name: "Shtegu tek Liqeni i Batllaves", city: "Prishtin", startPoint: "Pran Diges", finishPoint: "Fshatin Magure", distance: 7, image: "Mountens")
        let track5 = Track(id: 5, name: "Shtegu tek Liqeni i Batllaves", city: "Prishtin", startPoint: "Pran Diges", finishPoint: "Fshatin Magure", distance: 7, image: "Trees")
        let track6 = Track(id: 6, name: "Shtegu tek Liqeni i Batllaves", city: "Prishtin", startPoint: "Pran Diges", finishPoint: "Fshatin Magure", distance: 7, image: "Sky")
        
        trackArray = [track1, track2, track3, track4, track5, track6]
        trackTableView.reloadData()
    }
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue){
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellResudeIdentifierName.trackCellIdentifierName) as! TrackCell
        cell.setDetails(track: trackArray[indexPath.row])
        cell.startTrailButton.addTarget(self, action: #selector(handleButtonClick(_:)), for: .touchUpInside)
        cell.startTrailButton.tag = indexPath.row
        return cell
    }
    
    
    @objc func handleButtonClick(_ sender: UIButton) {
        let currentNumber = sender.tag
        let storyBoard = UIStoryboard(name: K.main, bundle: nil)
        if let trackViewController = storyBoard.instantiateViewController(withIdentifier: K.identifierOfMapVC) as? MapViewController {
            if currentNumber == 0 {
                trackViewController.createTracks(currentNumber)
            } else if currentNumber == 1 {
                trackViewController.createTracks(currentNumber)
            }else if currentNumber == 2 {
                trackViewController.createTracks(currentNumber)
            }else if currentNumber == 3 {
                trackViewController.createTracks(currentNumber)
            }else if currentNumber == 4 {
                trackViewController.createTracks(currentNumber)
            }else if currentNumber == 5{
                trackViewController.createTracks(currentNumber)
            }
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(trackViewController)
        }
    }
}

//MARK: - Extention 2
extension TrackViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
