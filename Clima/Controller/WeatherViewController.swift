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
    @IBOutlet weak var searchTextField: UITextField!
    
        
        var weatherManager = WeatherManager()
        let locationManager = CLLocationManager()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // TextField ayarları
            searchTextField.delegate = self
            searchTextField.isSecureTextEntry = false // Şifre gibi görünmesin
            
            // WeatherManager delegate
            weatherManager.delegate = self
            
            // Lokasyon ayarları
            locationManager.delegate = self
            locationManager.requestWhenInUseAuthorization()
            locationManager.requestLocation()
        }
}

    // MARK: - UITextFieldDelegate
    extension WeatherViewController: UITextFieldDelegate {
        @IBAction func searchPressed(_ sender: UIButton) {
            searchTextField.endEditing(true)
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            searchTextField.endEditing(true)
            return true
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            if let city = searchTextField.text, !city.isEmpty {
                cityLabel.text = city // Şehri hemen göster
                weatherManager.fetchWeather(cityName: city)
            }
            searchTextField.text = ""
        }
    }

    // MARK: - WeatherManagerDelegate
    extension WeatherViewController: WeatherManagerDelegate {
        func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
            DispatchQueue.main.async {
                self.temperatureLabel.text = "\(weather.temperatureString)C"
                self.conditionImageView.image = UIImage(systemName: weather.conditionName)
                self.cityLabel.text = weather.cityName
            }
        }
        
        func didFailWithError(error: Error) {
            print(error)
        }
    }

    // MARK: - CLLocationManagerDelegate
    extension WeatherViewController: CLLocationManagerDelegate {
        @IBAction func locationPressed(_ sender: UIButton) {
            locationManager.requestLocation()
        }
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            if let location = locations.last {
                locationManager.stopUpdatingLocation()
                let lat = location.coordinate.latitude
                let lon = location.coordinate.longitude
                weatherManager.fetchWeather(latitude: lat, longitude: lon)
            }
        }
        
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print(error)
        }
    }
