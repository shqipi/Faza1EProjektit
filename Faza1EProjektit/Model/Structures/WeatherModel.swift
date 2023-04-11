//
//  WeatherModel.swift
//  Faza1EProjektit
//
//  Created by shqiperimramadani on 11.04.23.
//

import Foundation
import CoreLocation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let weatherIcon: String
    let temperature : Double
    let latitude: CLLocationDegrees
    let longitude: CLLocationDegrees
    
    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "could.rain"
        case 600...622:
            return "cloud.snow"
        case 700...781:
            return "cloud.fog"
        case 800:
            if weatherIcon != "01d" {
                return "moon.fill"
            }else {
                return "sun.max"
            }
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
}
