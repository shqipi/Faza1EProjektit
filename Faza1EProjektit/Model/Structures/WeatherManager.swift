//
//  WeatherMenager.swift
//  Faza1EProjektit
//
//  Created by shqiperimramadani on 11.04.23.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?&appid=9f28f3114c39abec68d57ade032cdf2a&units=metric"
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees){
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String){
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        do{
            let decodecData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodecData.weather[0].id
            let temp = decodecData.main.temp
            let icon = decodecData.weather[0].icon
            let name = decodecData.name
            let lat = decodecData.coord.lat
            let lon = decodecData.coord.lon
            
            let weather = WeatherModel(conditionId: id, cityName: name, weatherIcon: icon, temperature: temp, latitude: lat, longitude: lon)
            return weather
        }catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
