//
//  WeatherInfo.swift
//  AppleWeatherCloneCoding
//
//  Created by ParkJunHyuk on 2023/11/03.
//

import Foundation

struct ForecastData: Codable {
    let forecastInfo: [ForecastInfo]
}

struct ForecastInfo: Codable {
    let headerInfo: HeaderInfo
    let sections: [Section]
}

struct HeaderInfo: Codable {
    let myLocation: String
    let location: String
    let weather: String
    let temperature: String
    let maxTemperature: String
    let minTemperature: String
}

struct Section: Codable {
    let timeWeatherInfo: [TimeWeatherInfo]?
    let dailyWeatherInfo: [DailyWeatherInfo]?
}

struct TimeWeatherInfo: Codable {
    let time: String
    let weather: String
    let temperature: String
}

struct DailyWeatherInfo: Codable {
    let week: String
    let weather: String
    let precipitation: String
    let maxTemperature: String
    let minTemperature: String
}
