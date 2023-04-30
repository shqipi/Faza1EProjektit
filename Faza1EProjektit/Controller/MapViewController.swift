//
//  MapViewController.swift
//  Faza1EProjektit
//
//  Created by shqiperimramadani on 09.04.23.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate{

    
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var toggleButtonView: UIButton!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    
    
    
    
    var tracksArrey: [MKPointAnnotation] = []
    
    let loacationManager = CLLocationManager()
    let myLocation = MKPointAnnotation()
    var weatherManager = WeatherManager()
    var pagesArray: [Page] = []
    
    var webTableView = UITableView()
    
    var isShowing: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapView.removeAnnotations(self.tracksArrey)
        self.mapView.addAnnotations(self.tracksArrey)
        self.mapView.showAnnotations(self.tracksArrey, animated: true)
        self.mapView.delegate = self
        showFooterView()
        
        weatherManager.delegate = self
        setupLocationManager()
    }
    
    @IBAction func startButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Start Trail", message: "You are about to start this trail", preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okButton)
        present(alert, animated: true)
    }
    
    @IBAction func fbButtonPressed(_ sender: Any) {
        let fbPage = Page(name: "Facebook", url: "https://www.facebook.com/")
        nextStoryBoard(url: fbPage)
    }
    @IBAction func inButtonPressed(_ sender: Any) {
        let inPage = Page(name: "Instagram", url: "https://www.instagram.com/")
        nextStoryBoard(url: inPage)
    }
    @IBAction func twButtonPressed(_ sender: Any) {
        let twPage = Page(name: "Twitter", url: "https://www.twitter.com/")
        nextStoryBoard(url: twPage)
    }
    @IBAction func liButtonPressed(_ sender: Any) {
        let ltPage = Page(name: "LinkedIn", url: "https://www.linkedin.com/")
        nextStoryBoard(url: ltPage)
    }
    @IBAction func gtButtonPressed(_ sender: Any) {
        let gtPage = Page(name: "GitHub", url: "https://github.com/")
        nextStoryBoard(url: gtPage)
    }
    
    func nextStoryBoard(url: Page) {
        let storyBoard = UIStoryboard(name: K.main, bundle: nil)
        if let goToWebViewController = storyBoard.instantiateViewController(identifier: K.identifierOfWebVC) as? WebViewController {
            goToWebViewController.urlString = url
            self.navigationController?.pushViewController(goToWebViewController, animated: true)
        }
    }
    
    func setupLocationManager() {
        loacationManager.requestWhenInUseAuthorization()
        if loacationManager.authorizationStatus == .authorizedWhenInUse {
            loacationManager.delegate = self
            loacationManager.startUpdatingLocation()
        }
    }
 
    
    
    @IBAction func locationButtonPressed(_ sender: UIButton) {
        loacationManager.requestLocation()
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
        let footerHeight = 160
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
            
            self.drawPath(source: lybeteniStart, destination: lybeteniEnd)
        case 1:
            let oshlakStart = MKPointAnnotation()
            oshlakStart.title = K.mapTitlesForAnnotationsPoints.startOfTrack
            oshlakStart.coordinate = CLLocationCoordinate2D(latitude: 42.181447, longitude: 20.947707)
            tracksArrey.append(oshlakStart)
            
            let oshlakEnd = MKPointAnnotation()
            oshlakEnd.title = K.mapTitlesForAnnotationsPoints.endOfTrack
            oshlakEnd.coordinate = CLLocationCoordinate2D(latitude: 42.196572, longitude: 20.880558)
            tracksArrey.append(oshlakEnd)
            self.drawPath(source: oshlakStart, destination: oshlakEnd)
        case 2:
            let majaEzezeStart = MKPointAnnotation()
            majaEzezeStart.title = K.mapTitlesForAnnotationsPoints.startOfTrack
            majaEzezeStart.coordinate = CLLocationCoordinate2D(latitude: 42.173739, longitude: 20.962032)
            tracksArrey.append(majaEzezeStart)
            
            let majaEzezeEnd = MKPointAnnotation()
            majaEzezeEnd.title = K.mapTitlesForAnnotationsPoints.endOfTrack
            majaEzezeEnd.coordinate = CLLocationCoordinate2D(latitude: 42.142395, longitude: 20.916490)
            tracksArrey.append(majaEzezeEnd)
            self.drawPath(source: majaEzezeStart, destination: majaEzezeEnd)
        case 3:
            let livadhetEJezercitStart = MKPointAnnotation()
            livadhetEJezercitStart.title = K.mapTitlesForAnnotationsPoints.startOfTrack
            livadhetEJezercitStart.coordinate = CLLocationCoordinate2D(latitude: 42.353814, longitude: 21.018506)
            tracksArrey.append(livadhetEJezercitStart)
            
            let livadhetEJezercitEnd = MKPointAnnotation()
            livadhetEJezercitEnd.title = K.mapTitlesForAnnotationsPoints.endOfTrack
            livadhetEJezercitEnd.coordinate = CLLocationCoordinate2D(latitude: 42.358408, longitude: 21.005375)
            tracksArrey.append(livadhetEJezercitEnd)
            self.drawPath(source: livadhetEJezercitStart, destination: livadhetEJezercitEnd)
        default:
            break
        }
    }
    
    func drawPath(source: MKPointAnnotation, destination: MKPointAnnotation){
        let sourcePlacemark = MKPlacemark(coordinate: source.coordinate)
        let destinationPlacemark = MKPlacemark(coordinate: destination.coordinate)
        
        // 2.Kthe Placemark ne MapItem
        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
        
        // 3.Deklaro deriction request
        let directionRequest = MKDirections.Request()
        directionRequest.source = sourceMapItem
        directionRequest.destination = destinationMapItem
        directionRequest.transportType = .walking
        
        // 4.Deklaro direction
        let direction = MKDirections(request: directionRequest)
        
        // 5.Kalkulo rruge
        direction.calculate { response, error in
            if let calculationResponse = response {
                let routes = calculationResponse.routes
                
                print("calculated routed = \(routes)")
                for route in routes {
                    print("route = \(route.name), distance = \(route.distance)")
                    self.mapView.addOverlay(route.polyline, level: .aboveRoads)
                }
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = .blue
        renderer.lineWidth = 3
        return renderer
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
   
}




extension MapViewController: CLLocationManagerDelegate, WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.locationLabel.text = weather.cityName
            self.iconImage.image = UIImage(systemName: weather.conditionName)
            self.tempLabel.text = "\(weather.temperature) °C"
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            loacationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
        }
        
        if let userLocation = manager.location?.coordinate {
            myLocation.coordinate = userLocation
            mapView.addAnnotation(myLocation)
            mapView.showAnnotations(self.mapView.annotations, animated: true)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    
}


