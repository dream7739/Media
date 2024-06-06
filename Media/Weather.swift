//
//  Weather.swift
//  Media
//
//  Created by 홍정민 on 6/6/24.
//

import UIKit

//현재 온도, 습도, 바람 풍속, 이미지

struct WeatherResult : Decodable {
    let weather: [Weather]
    let main: MainWeather
    let wind: Wind
}

struct Weather : Decodable {
    var iconDescription : String {
        return "\(icon)@2x.png"
    }
    
    let id: Int
    let main: String
    let description: String
    let icon : String
}

struct MainWeather : Decodable {
    var tempDescription: String {
        return "지금은 \(temp)°C 에요"
    }
    
    var humidityDescription: String {
        return "\(humidity)% 만큼 습해요"
    }
    
    let temp : Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let humidity: Int
}

struct Wind : Decodable {
    var windDescription: String {
        return "\(speed)m/s의 바람이 불어요"
    }
    
    let speed: Double
}
