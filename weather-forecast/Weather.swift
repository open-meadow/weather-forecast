//
//  TemperatureResponse.swift
//  weather-forecast
//
//  Created by open-meadow on 2025-11-10.
//
import Foundation

class Weather: Decodable {
    var city: String
    var temperature: String
    var minimum: String
    var maximum: String
    var humidity: String
    var wind: String
    var precipitation: String
    
    enum CodingKeys: String, CodingKey {
        case city
        case temperature
        case minimum
        case maximum
        case humidity
        case wind
        case precipitation
    }
    
    required init(from decoder: Decoder) {
        let container = try! decoder.container(keyedBy: CodingKeys.self)
        city = try! container.decode(String.self, forKey: .city)
        temperature = try! container.decode(String.self, forKey: .temperature)
        minimum = try! container.decode(String.self, forKey: .minimum)
        maximum = try! container.decode(String.self, forKey: .maximum)
        humidity = try! container.decode(String.self, forKey: .humidity)
        wind = try! container.decode(String.self, forKey: .wind)
        precipitation = try! container.decode(String.self, forKey: .precipitation)
    }
}
