//
//  WeatherAPIClient.swift
//  MyWeatherApp
//
//  Created by Ranga Madushan on 3/29/18.
//  Copyright © 2018 Ranga Madushan. All rights reserved.
//

import Foundation

class WeatherAPIClient: APIClient {
    var session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
   
    func weather(with endpoint: WeatherEndpoint, completion: @escaping (Either<ForecastText, APIError>) -> Void) {
        
        let request = endpoint.request;
        self.fetch(with: request) { (either: Either<Weather, APIError>) in
            switch either {
            case .value(let weather):
                let weather = weather.forecast.forecastText
                completion(.value(weather))
                
            case .error(let error):
                completion(.error(error))
            }
        }
    }
    
    
}//class

























