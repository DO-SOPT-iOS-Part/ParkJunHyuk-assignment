//
//  OpenWeatherModel.swift
//  AppleWeatherCloneCoding
//
//  Created by ParkJunHyuk on 2023/11/14.
//

import Foundation

// MARK: - Welcome

struct OpenWeatherData: Codable {
    let timezone: Int
    let weather: [Weather]
    let name: String
    let main: Main
}

struct Main: Codable {
    let temp, tempMax, tempMin: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}

struct Weather: Codable {
    let main: String
}
