//
//  WeatherManager.swift
//  Clima
//
//  Created by Sabrina Ayala on 19/01/2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWhitError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?&appid=aacb46d13e851f702b91999c3a1a349e&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather (cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        perfomRequest(whit: urlString)
    }
    
    func fetchWeather (lat: CLLocationDegrees, lon: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(lat)&lon=\(lon)"
        perfomRequest(whit: urlString)
    }
    
    func perfomRequest(whit urlString: String) {
        //1.create a URL
        if let url = URL(string: urlString) {
            //2.create a URLSession
            let session = URLSession(configuration: .default)
            //3.Give the Session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    delegate?.didFailWhitError(error: error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(safeData){
                        delegate?.didUpdateWeather(self, weather: weather)
                    }
                        
                    }
            }
            //4.Start the task
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let weather = WeatherModel(conditionId: id, cityName: name , temperature: temp)
            return weather
        } catch {
            delegate?.didFailWhitError(error: error)
            return nil
        }
    }
   
    }

