//
//  WeatherTableViewController.swift
//  MyWeatherApp
//
//  Created by Ranga Madushan on 3/28/18.
//  Copyright © 2018 Ranga Madushan. All rights reserved.
//

import UIKit

class WeatherTableViewController: UITableViewController {
    
    var cellViewModels = [WeatherCellViewModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let weatherApi = WeatherAPIClient()
        let weatherEndpoint = WeatherEndpoint.tenDayForecast(city: "Galle", state: "LK")
        weatherApi.weather(with: weatherEndpoint) { (either) in
            switch either {
                
            case .value(let forecastText):
                print(forecastText)
                self.cellViewModels = forecastText.forecastDays.map {
                    WeatherCellViewModel(url: $0.iconUrl, day: $0.day, description: $0.description)
                    
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
 
            case .error(let error):
                print(error)
            }
        }
        
       
    }

   

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cellViewModels.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath)

        // Configure the cell...
        let cellViewModel = cellViewModels[indexPath.row]
        cell.textLabel?.text = cellViewModel.day
        cell.detailTextLabel?.text = cellViewModel.description
        cellViewModel.loadImage { (image) in
            cell.imageView?.image = image
        }

        return cell
    }
    


}//class
