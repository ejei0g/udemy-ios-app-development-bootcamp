//
//  WeatherManager.swift
//  Clima
//
//  Created by Jaeyoung Lee on 2021/09/02.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct WeatherManager {
    var delegate: WeatherManagerDelegate?
    
    let weatherURL: String = "https://api.openweathermap.org/data/2.5/weather?appid=c078270eff51ef947f069f2d70dfd3b9&units=metric"
    func fetchWeather(cityName: String?) {
        
        var fetchedURL: String
        if let city = cityName {
            fetchedURL = weatherURL + "&q=\(city)"
        } else {
            fetchedURL = weatherURL
        }
        //print(fetchedURL)
        performRequest(with: fetchedURL)
    }
    
    func performRequest(with urlString: String) {
        //1. create a url
        if let url = URL(string: urlString) {
            //2. creata a url session
            let session = URLSession(configuration: .default)
            //3. give the session a task
            let task =  session.dataTask(with: url) { data, response, error in
                if error != nil {
                    //print(error!)
                    delegate?.didFailWithError(error: error!)
                    return
                }
                print("비동기처리 핸들러 데이터가 오기전까지 실행안됨")
                if let safeData = data {
                    //let dataString = String(data: safeData, encoding: .utf8)
                    //print(dataString)
                    if let weather = self.parseJSON(safeData) {
                        
                        delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            //handler는 비동기처리를 위한 함수.
            //4. start the task
            print("start the task")
            task.resume()
           // print(task)
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
//        decoder.decode(Decodable.Protocol, from: weatherData)
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
           // print(getConditionName(weatherId: decodedData.weather[0].id))
            
            let city = decodedData.name
            let tempurature = decodedData.main.temp
            let id = decodedData.weather[0].id
            let weather: WeatherModel = WeatherModel(conditionId: id, nameOfCity: city, temperature: tempurature)
            //print(weather.conditionName)
            //print(weather.temperatureString)
            
            return weather
        }
        catch {
            //print(error)
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    func testParameterName(extern intern: String) {
        print(intern)
    }
     
    func testExtern(_ intern: String) {
        print(intern)
    }
 
}

