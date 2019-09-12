//
//  WeatherTableViewController.swift
//  Weather
//
//  Created by Ryan Kuck on 9/5/19.
//  Copyright © 2019 Ryan Kuck. All rights reserved.
//

import UIKit

class WeatherTableViewController: UITableViewController {

    var cellViewModels = [WeatherCellViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let weatherApi = WeatherAPIClient()
//        let weatherEndpoint = WeatherEndpoint.fiveDayForecast(city: "Atlanta")

        let weatherEndpoint = WeatherEndpoint.fiveDayForecast(city: "Atlanta", country: "us")
        weatherApi.weather(with: weatherEndpoint) { (either) in
            switch either {
            case .value(let ListA):
                print("Made it")
                print(ListA)
                var ListB: [List] = ListA
                self.cellViewModels = ListA.weather.map {
                    WeatherCellViewModel(description: $0.description)
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

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return cellViewModels.count
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cellViewModels.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath)

        // Configure the cell...
        let cellViewModel = cellViewModels[indexPath.row]
//        cell.textLabel?.text = cellViewModel.day
        cell.detailTextLabel?.text = cellViewModel.description
        return cell
    }

}
