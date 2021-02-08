//
//  TableViewController.swift
//  Planner
//
//  Created by Кирилл Дутов on 05.02.2021.
//

import UIKit

class TableViewController: UITableViewController {
    
    //var places = Place.getPlaces()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return places.count
//    }
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
//        
//        //let place = places[indexPath.row]
//        
//        cell.nameLabel?.text = place.name
//        cell.locationLabel.text = place.location
//        cell.typeLabel.text = place.type
//        
//        if place.image == nil {
//            cell.placeImage?.image = UIImage(named: place.restarauntImage!)
//        } else {
//            cell.placeImage.image = place.image
//        }
//        
//        cell.placeImage?.layer.cornerRadius = cell.placeImage.frame.size.height / 2
//        cell.placeImage?.clipsToBounds = true
//        
//        return cell
//    }
    
    // Configuring the transition to the main screen using the Save button
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        guard let newPlaceVc = segue.source as? NewPlaceTableViewController else {
            print("Error handling save button behavior")
            return
        }
        newPlaceVc.saveNewPlace()
        //places.append(newPlaceVc.newPlace!)
        tableView.reloadData()
    }
}
