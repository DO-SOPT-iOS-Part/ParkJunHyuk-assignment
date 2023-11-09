//
//  WeatherData.swift
//  AppleWeatherCloneCoding
//
//  Created by ParkJunHyuk on 2023/10/17.
//

import Foundation

struct WeatherData {
    let identifier: Int
    let myLocation: String
    let location: String
    let weather: String
    let temperature: Int
    let maxTemperature: Int
    let minTemperature: Int
    let timeWeatherData: [TimeWeatherData]
}

struct TimeWeatherData {
    let time: String
    let weather: String
    let temperature: Int
}

var weatherData = [WeatherData(identifier: 0, myLocation: "나의 위치", location: "인천광역시", weather: "맑음", temperature: 19, maxTemperature: 19, minTemperature: 7, timeWeatherData: [TimeWeatherData(time: "Now", weather: "cloud.moon", temperature: 21), TimeWeatherData(time: "10시", weather: "cloud.drizzle", temperature: 21), TimeWeatherData(time: "11시", weather: "cloud.heavyrain", temperature: 19), TimeWeatherData(time: "12시", weather: "cloud.bolt", temperature: 19), TimeWeatherData(time: "1시", weather: "cloud.sun.rain", temperature: 19), TimeWeatherData(time: "2시", weather: "cloud.moon", temperature: 21), TimeWeatherData(time: "3시", weather: "cloud.drizzle", temperature: 21), TimeWeatherData(time: "4시", weather: "cloud.heavyrain", temperature: 19), TimeWeatherData(time: "5시", weather: "cloud.bolt", temperature: 19), TimeWeatherData(time: "6시", weather: "cloud.sun.rain", temperature: 19)]),

                   WeatherData(identifier: 1, myLocation: "나의 위치", location: "서구", weather: "맑음", temperature: 20, maxTemperature: 21, minTemperature: 5, timeWeatherData: [TimeWeatherData(time: "Now", weather: "cloud.moon", temperature: 21), TimeWeatherData(time: "10시", weather: "cloud.drizzle", temperature: 21), TimeWeatherData(time: "11시", weather: "cloud.heavyrain", temperature: 19), TimeWeatherData(time: "12시", weather: "cloud.bolt", temperature: 19), TimeWeatherData(time: "1시", weather: "cloud.sun.rain", temperature: 19), TimeWeatherData(time: "2시", weather: "cloud.moon", temperature: 21), TimeWeatherData(time: "3시", weather: "cloud.drizzle", temperature: 21), TimeWeatherData(time: "4시", weather: "cloud.heavyrain", temperature: 19), TimeWeatherData(time: "5시", weather: "cloud.bolt", temperature: 19), TimeWeatherData(time: "6시", weather: "cloud.sun.rain", temperature: 19)]),
                   
                   WeatherData(identifier: 2, myLocation: "나의 위치", location: "중구", weather: "맑음", temperature: 17, maxTemperature: 19, minTemperature: 8, timeWeatherData: [TimeWeatherData(time: "Now", weather: "cloud.moon", temperature: 21), TimeWeatherData(time: "10시", weather: "cloud.drizzle", temperature: 21), TimeWeatherData(time: "11시", weather: "cloud.heavyrain", temperature: 19), TimeWeatherData(time: "12시", weather: "cloud.bolt", temperature: 19), TimeWeatherData(time: "1시", weather: "cloud.sun.rain", temperature: 19), TimeWeatherData(time: "2시", weather: "cloud.moon", temperature: 21), TimeWeatherData(time: "3시", weather: "cloud.drizzle", temperature: 21), TimeWeatherData(time: "4시", weather: "cloud.heavyrain", temperature: 19), TimeWeatherData(time: "5시", weather: "cloud.bolt", temperature: 19), TimeWeatherData(time: "6시", weather: "cloud.sun.rain", temperature: 19)]),
                              
                   WeatherData(identifier: 3, myLocation: "나의 위치", location: "중구", weather: "맑음", temperature: 17, maxTemperature: 19, minTemperature: 8, timeWeatherData: [TimeWeatherData(time: "Now", weather: "cloud.moon", temperature: 21), TimeWeatherData(time: "10시", weather: "cloud.drizzle", temperature: 21), TimeWeatherData(time: "11시", weather: "cloud.heavyrain", temperature: 19), TimeWeatherData(time: "12시", weather: "cloud.bolt", temperature: 19), TimeWeatherData(time: "1시", weather: "cloud.sun.rain", temperature: 19), TimeWeatherData(time: "2시", weather: "cloud.moon", temperature: 21), TimeWeatherData(time: "3시", weather: "cloud.drizzle", temperature: 21), TimeWeatherData(time: "4시", weather: "cloud.heavyrain", temperature: 19), TimeWeatherData(time: "5시", weather: "cloud.bolt", temperature: 19), TimeWeatherData(time: "6시", weather: "cloud.sun.rain", temperature: 19)]),
                   
//                   WeatherData(identifier: 4, myLocation: "나의 위치", location: "중구", weather: "맑음", temperature: 17, maxTemperature: 19, minTemperature: 8, timeWeatherData: [TimeWeatherData(time: "Now", weather: "cloud.moon", temperature: 21), TimeWeatherData(time: "10시", weather: "cloud.drizzle", temperature: 21), TimeWeatherData(time: "11시", weather: "cloud.heavyrain", temperature: 19), TimeWeatherData(time: "12시", weather: "cloud.bolt", temperature: 19), TimeWeatherData(time: "1시", weather: "cloud.sun.rain", temperature: 19), TimeWeatherData(time: "2시", weather: "cloud.moon", temperature: 21), TimeWeatherData(time: "3시", weather: "cloud.drizzle", temperature: 21), TimeWeatherData(time: "4시", weather: "cloud.heavyrain", temperature: 19), TimeWeatherData(time: "5시", weather: "cloud.bolt", temperature: 19), TimeWeatherData(time: "6시", weather: "cloud.sun.rain", temperature: 19)]),
                   
//                   WeatherData(identifier: 5, myLocation: "나의 위치", location: "중구", weather: "맑음", temperature: 17, maxTemperature: 19, minTemperature: 8, timeWeatherData: [TimeWeatherData(time: "Now", weather: "cloud.moon", temperature: 21), TimeWeatherData(time: "10시", weather: "cloud.drizzle", temperature: 21), TimeWeatherData(time: "11시", weather: "cloud.heavyrain", temperature: 19), TimeWeatherData(time: "12시", weather: "cloud.bolt", temperature: 19), TimeWeatherData(time: "1시", weather: "cloud.sun.rain", temperature: 19), TimeWeatherData(time: "2시", weather: "cloud.moon", temperature: 21), TimeWeatherData(time: "3시", weather: "cloud.drizzle", temperature: 21), TimeWeatherData(time: "4시", weather: "cloud.heavyrain", temperature: 19), TimeWeatherData(time: "5시", weather: "cloud.bolt", temperature: 19), TimeWeatherData(time: "6시", weather: "cloud.sun.rain", temperature: 19)])
]
