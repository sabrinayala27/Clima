//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
   
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchingTextField: UITextField!
    
    
    var weatherManager = WeatherManager()
    var locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // this should be first to respond, after request
        locationManager.delegate = self
        
        //request the user to alow it when the app is in use
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.requestLocation()
        weatherManager.delegate = self
        searchingTextField.delegate = self
    }
   // este override sirve para bajar el keyboard despues de haber sido usado.
  // override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
  //     self.view.endEditing(true)
  // }
    
    @IBAction func locationPressed(_ sender: UIButton) {
        
        locationManager.requestLocation()
    }
    
}

//MARK: - UITextFieldDelegate

extension WeatherViewController: UITextFieldDelegate {
    
    @IBAction func searchPressed(_ sender: UIButton) {
        //print(searchingTextField.text!)
        searchingTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchingTextField.endEditing(true)
       // print(temperatureLabel.text!)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type a Place"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        //use searchingTextField.text to get the weather of that city
        if let city = searchingTextField.text {
            weatherManager.fetchWeather(cityName: city)
           
        }
        searchingTextField.text = ""
    }
   
    
}

//MARK: - WeatherManagerDelegate

extension WeatherViewController: WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.cityLabel.text = weather.cityName
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
        }
    }
    
    func didFailWhitError(error: Error) {
        print(error)
    }
}

//MARK: - CLLocationManagerDelegate

extension WeatherViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    //  let cordinate = manager.location?.coordinate
      //  let lon = cordinate?.longitude ?? "not found"
      //  let lat = cordinate?.latitude ?? "not found"
       
        
    // el de arriba(you tube) es un codigo mas corto y me da el mismo resultado que el de abajo(angela)
       
    if let location = locations.last {
        locationManager.stopUpdatingLocation()
        let lat = location.coordinate.latitude
        let lon = location.coordinate.longitude
              weatherManager.fetchWeather(lat: lat, lon: lon)
           }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error")
    }
}
