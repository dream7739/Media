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
    let id: Int
    let main: String
    let description: String
    let icon : String
}

struct MainWeather : Decodable {
    let temp : Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let humidity: Int
}

struct Wind : Decodable {
    let speed: Double
}
