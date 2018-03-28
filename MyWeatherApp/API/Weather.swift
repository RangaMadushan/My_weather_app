//
//  Weather.swift
//  MyWeatherApp
//
//  Created by Ranga Madushan on 3/28/18.
//  Copyright © 2018 Ranga Madushan. All rights reserved.
//

import Foundation

class Weather: Codable {
    let forecast: Forecast
}

struct Forecast: Codable {
    let forecastText: ForecastText
    
    private enum CodingKeys: String, CodingKey {
        case forecastText = "txt_forecast"
    }
}

struct ForecastText: Codable {
    let date: String
    let forecastDays: [ForecastDay]
    
    private enum CodingKeys: String, CodingKey {
        case date
        case forecastDays = "forecastday"
    }
}

struct ForecastDay: Codable {
    let iconUrl: String
    let day: String
    let description: String
    
    private enum CodingKeys: String, CodingKey {
        case iconUrl = "icon_url"
        case day = "title"
        case description = "fcttext"
    }
}
















