//
//  MapViewController.swift
//  Faza1EProjektit
//
//  Created by shqiperimramadani on 09.04.23.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate{
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var startButton: UIButton!
    
    var tracksArrey: [MKPointAnnotation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapView.removeAnnotations(self.tracksArrey)
        self.mapView.addAnnotations(self.tracksArrey)
        self.mapView.showAnnotations(self.tracksArrey, animated: true)
        self.mapView.delegate = self
    }
    
    
    @IBAction func locationButtonPressed(_ sender: UIButton) {
    }
    
    func createTracks(_ n: Int) {
        switch n {
        case 0:
            let lybeteniStart = MKPointAnnotation()
            lybeteniStart.title = K.mapTitlesForAnnotationsPoints.startOfTrack
            lybeteniStart.coordinate = CLLocationCoordinate2D(latitude: 42.218717, longitude: 21.187697)
            tracksArrey.append(lybeteniStart)
            
            let lybeteniEnd = MKPointAnnotation()
            lybeteniEnd.title = K.mapTitlesForAnnotationsPoints.endOfTrack
            lybeteniEnd.coordinate = CLLocationCoordinate2D(latitude: 42.206932, longitude: 21.119323)
            tracksArrey.append(lybeteniEnd)
        case 1:
            let oshlakStart = MKPointAnnotation()
            oshlakStart.title = K.mapTitlesForAnnotationsPoints.startOfTrack
            oshlakStart.coordinate = CLLocationCoordinate2D(latitude: 42.181447, longitude: 20.947707)
            tracksArrey.append(oshlakStart)
            
            let oshlakEnd = MKPointAnnotation()
            oshlakEnd.title = K.mapTitlesForAnnotationsPoints.endOfTrack
            oshlakEnd.coordinate = CLLocationCoordinate2D(latitude: 42.196572, longitude: 20.880558)
            tracksArrey.append(oshlakEnd)
        case 2:
            let majaEzezeStart = MKPointAnnotation()
            majaEzezeStart.title = K.mapTitlesForAnnotationsPoints.startOfTrack
            majaEzezeStart.coordinate = CLLocationCoordinate2D(latitude: 42.173739, longitude: 20.962032)
            tracksArrey.append(majaEzezeStart)
            
            let majaEzezeEnd = MKPointAnnotation()
            majaEzezeEnd.title = K.mapTitlesForAnnotationsPoints.endOfTrack
            majaEzezeEnd.coordinate = CLLocationCoordinate2D(latitude: 42.142395, longitude: 20.916490)
            tracksArrey.append(majaEzezeEnd)
        case 3:
            let livadhetEJezercitStart = MKPointAnnotation()
            livadhetEJezercitStart.title = K.mapTitlesForAnnotationsPoints.startOfTrack
            livadhetEJezercitStart.coordinate = CLLocationCoordinate2D(latitude: 42.353814, longitude: 21.018506)
            tracksArrey.append(livadhetEJezercitStart)
            
            let livadhetEJezercitEnd = MKPointAnnotation()
            livadhetEJezercitEnd.title = K.mapTitlesForAnnotationsPoints.endOfTrack
            livadhetEJezercitEnd.coordinate = CLLocationCoordinate2D(latitude: 42.358408, longitude: 21.005375)
            tracksArrey.append(livadhetEJezercitEnd)
        default:
            break
        }
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        let storyBoard = UIStoryboard(name: K.main, bundle: nil)
        if let trackViewController = storyBoard.instantiateViewController(identifier: K.identifierOfTrackVC) as? TrackViewController {
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(trackViewController)
        }
    }
}
