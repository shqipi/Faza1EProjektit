//
//  WeatherData.swift
//  Faza1EProjektit
//
//  Created by shqiperimramadani on 11.04.23.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
    let coord: Coord
    
}

struct Weather: Codable {
    let id: Int
    let icon: String
}

struct Main: Codable {
    
    let temp: Double
}

struct Coord: Codable {
    let lat: Double
    let lon: Double
}
