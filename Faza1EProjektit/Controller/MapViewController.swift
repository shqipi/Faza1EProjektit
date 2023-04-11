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
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var toggleButtonView: UIButton!
    
    let loacationManager = CLLocationManager()
    var tracksArrey: [MKPointAnnotation] = []
    
    var isShowing: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapView.removeAnnotations(self.tracksArrey)
        self.mapView.addAnnotations(self.tracksArrey)
        self.mapView.showAnnotations(self.tracksArrey, animated: true)
        self.mapView.delegate = self
        showFooterView()
//        hideFooterView()
        
//        loacationManager.delegate = self
//        loacationManager.requestWhenInUseAuthorization()
//        loacationManager.requestLocation()
    }
    
    
    @IBAction func locationButtonPressed(_ sender: UIButton) {
//        loacationManager.requestLocation()
    }
    
    @IBAction func toggleButtonPressed(_ sender: Any) {
        UIView.animate(withDuration: 0.6) {
            if self.isShowing {
                self.hideFooterView()
                self.toggleButtonView.setImage(UIImage(systemName: "chevron.up"), for: .normal)
                self.isShowing = false
            }else {
                self.showFooterView()
                self.toggleButtonView.setImage(UIImage(systemName: "chevron.down"), for: .normal)
                self.isShowing = true
            }
        }
    }
    
    func showFooterView() {
        let footerHeight = 130
        footerView.frame = CGRect(x: 0, y: Int(view.frame.height) - footerHeight, width: Int(self.view.frame.width), height: footerHeight)
        view.addSubview(footerView)
    }
    
    func hideFooterView() {
        let footerHeight = 40
        footerView.frame = CGRect(x: 0, y: Int(view.frame.height) - footerHeight, width: Int(self.view.frame.width), height: footerHeight)
//        view.addSubview(footerView)
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
        dismiss(animated: true)
    }
}


//extension MapViewController: CLLocationManagerDelegate {
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let location = locations.last {
//            loacationManager.stopUpdatingLocation()
////            let lat = location.coordinate.latitude
////            let lon = location.coordinate.longitude
//        }
//    }
    
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        print(error)
//    }
//}
