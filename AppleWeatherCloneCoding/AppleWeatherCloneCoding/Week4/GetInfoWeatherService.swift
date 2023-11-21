//
//  GetInfoWeatherService.swift
//  AppleWeatherCloneCoding
//
//  Created by ParkJunHyuk on 2023/11/14.
//

import Foundation

class GetInfoWeatherService {
    
    static let shared = GetInfoWeatherService()
    private init() {}
    
    let baseURL = "https://api.openweathermap.org/data/2.5/weather"
    
    func makeRequest(cityName: String) -> URLRequest? {
        
        let apiKey = Bundle.main.object(forInfoDictionaryKey: Config.Keys.Plist.APIKey) as? String ?? ""
        print(apiKey)
        let urlString = "\(baseURL)?q=\(cityName)&appid=\(apiKey)&units=metric"
        
        guard let url = URL(string: urlString) else {
            print("유효하지않은 URL 입니다.")
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let header = ["Content-Type": "application/json"]
        
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        
        return request
    }
    
    func GetRegisterData(cityName: String) async throws -> OpenWeatherData? {
        do {
            guard let request = self.makeRequest(cityName: cityName) else {
                return nil
            }
            
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.responseError
            }
            
            return parseOpenWeatherData(data: data)
        } catch {
            throw error
        }
    }


    private func parseOpenWeatherData(data: Data) -> OpenWeatherData? {
        do {
            let jsonDecoder = JSONDecoder()
            let result = try jsonDecoder.decode(OpenWeatherData.self, from: data)
            print(result)
            return result
        } catch {
            print(error)
            return nil
        }
    }

    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode)
        ?? NetworkError.unknownError
    }
}
