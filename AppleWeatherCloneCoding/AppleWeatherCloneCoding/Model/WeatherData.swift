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

var weatherData = [WeatherData(myLocation: "나의 위치", location: "인천광역시", weather: "맑음", temperature: 19, maxTemperature: 19, minTemperature: 7), WeatherData(myLocation: "서울특별시", location: "오후 5:36", weather: "맑음", temperature: 17, maxTemperature: 20, minTemperature: 5)]
