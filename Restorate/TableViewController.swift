//
//  TableViewController.swift
//  Planner
//
//  Created by Кирилл Дутов on 05.02.2021.
//

import UIKit

class TableViewController: UITableViewController {
    
    let places = Place.getPlaces()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.nameLabel?.text = places[indexPath.row].name
        cell.locationLabel.text = places[indexPath.row].location
        cell.typeLabel.text = places[indexPath.row].type
        cell.placeImage?.image = UIImage(named: places[indexPath.row].image)
        cell.placeImage?.layer.cornerRadius = cell.placeImage.frame.size.height / 2
        cell.placeImage?.clipsToBounds = true
        return cell
    }
    
}
