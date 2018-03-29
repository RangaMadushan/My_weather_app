//
//  WeatherCellViewModel.swift
//  MyWeatherApp
//
//  Created by Ranga Madushan on 3/29/18.
//  Copyright © 2018 Ranga Madushan. All rights reserved.
//

import UIKit


struct WeatherCellViewModel {
    let url: URL
    let day: String
    let description: String
    
    func loadImage(completion: @escaping (UIImage?) -> Void){
        guard let imageData = try? Data(contentsOf: url) else {
            return
        }
        
        let image = UIImage(data: imageData)
        
        DispatchQueue.main.async {
            completion(image)
        }
        
          
    }
}





















