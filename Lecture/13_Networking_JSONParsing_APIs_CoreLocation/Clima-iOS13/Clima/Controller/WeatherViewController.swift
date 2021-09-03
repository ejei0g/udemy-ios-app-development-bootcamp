//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController{

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
       

    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        searchTextField.delegate = self
        weatherManager.delegate = self

    }
    
}

//MARK: - UITextFieldDelegate
extension WeatherViewController: UITextFieldDelegate {
    @IBAction func searchPressed(_ sender: UIButton) {
        if let inputString: String = searchTextField.text {
            print(inputString)
        }
        searchTextField.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("1. call the textFieldShouldReturn")
        
        //endEditing호출 = 키보드 닫기
        searchTextField.endEditing(true)
        
        return true
    }
    
    //endEditing이 호출되었을 때 동작
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("3. call the textFieldDidEndEditing")
        weatherManager.fetchWeather(cityName: textField.text ?? nil)
        searchTextField.text = ""
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("2. call the textFieldShouldEndEditing")
        if searchTextField.text != "" {
            return true
        } else {
            searchTextField.placeholder = "please input"
            return false
        }
    }
}

//MARK: - WeatherManagerDelegate
extension WeatherViewController: WeatherManagerDelegate {

    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        print(weather.conditionId)
       // temperatureLabel.text = weather.temperatureString //Crash : use DispatchQueue
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.cityLabel.text = weather.nameOfCity
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
        }
    }

    func didFailWithError(error: Error) {
        print(error)
    }

}

//MARK: - CLLocationManagerDelegate

extension WeatherViewController: CLLocationManagerDelegate {
    
    @IBAction func pressedLocationButton(_ sender: UIButton) {
        print("pressed the my location button")
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("call the locationManager")
        print(locations)
        if let location = locations.last {
            //locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            
            weatherManager.fetchWeather(latitude: String(lat), longitude: String(lon))
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
