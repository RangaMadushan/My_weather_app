//
//  WeatherTableViewController.swift
//  MyWeatherApp
//
//  Created by Ranga Madushan on 3/28/18.
//  Copyright © 2018 Ranga Madushan. All rights reserved.
//

import UIKit

class WeatherTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let weatherApi = WeatherAPIClient()
        let weatherEndpoint = WeatherEndpoint.tenDayForecast(city: "San_Francisco", state: "CA")
        weatherApi.weather(with: weatherEndpoint) { (either) in
            switch either {
                
            case .value(let forecastText):
                print(forecastText)
            case .error(let error):
                print(error)
            }
        }
        
       
    }

   

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath)

        // Configure the cell...

        return cell
    }
    


}//class
