//
//  WeatherData.swift
//  AppleWeatherCloneCoding
//
//  Created by ParkJunHyuk on 2023/10/17.
//

import Foundation

struct WeatherData {
    let myLocation: String
    let location: String
    let weather: String
    let temperature: Int
    let maxTemperature: Int
    let minTemperature: Int
}

var weatherData = [WeatherData(myLocation: "나의 위치", location: "인천광역시", weather: "맑음", temperature: 19, maxTemperature: 19, minTemperature: 7), WeatherData(myLocation: "나의 위치", location: "서구", weather: "맑음", temperature: 17, maxTemperature: 20, minTemperature: 5), WeatherData(myLocation: "나의 위치", location: "중구", weather: "맑음", temperature: 20, maxTemperature: 13, minTemperature: 5), WeatherData(myLocation: "나의 위치", location: "미추홀구", weather: "맑음", temperature: 17, maxTemperature: 20, minTemperature: 9), WeatherData(myLocation: "나의 위치", location: "부평구", weather: "맑음", temperature: 18, maxTemperature: 19, minTemperature: 3), WeatherData(myLocation: "나의 위치", location: "계양구", weather: "맑음", temperature: 7, maxTemperature: 18, minTemperature: 5), WeatherData(myLocation: "나의 위치", location: "연수구", weather: "맑음", temperature: 9, maxTemperature: 20, minTemperature: 6), WeatherData(myLocation: "나의 위치", location: "남동구", weather: "맑음", temperature: 13, maxTemperature: 15, minTemperature: 5)]
