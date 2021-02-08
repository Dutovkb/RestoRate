//
//  TableViewController.swift
//  Planner
//
//  Created by Кирилл Дутов on 05.02.2021.
//

import UIKit
import RealmSwift

class TableViewController: UITableViewController {
    
    var places: Results<Place>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        places = realm.objects(Place.self)
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.isEmpty ? 0 : places.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let place = places[indexPath.row]
        
        cell.nameLabel?.text = place.name
        cell.locationLabel.text = place.location
        cell.typeLabel.text = place.type
        cell.placeImage.image = UIImage(data: place.imageData!)
        
        cell.placeImage?.layer.cornerRadius = cell.placeImage.frame.size.height / 2
        cell.placeImage?.clipsToBounds = true
        
        return cell
    }
    
    // Configuring the transition to the main screen using the Save button
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        guard let newPlaceVc = segue.source as? NewPlaceTableViewController else {
            print("Error handling save button behavior")
            return
        }
        newPlaceVc.saveNewPlace()
        tableView.reloadData()
    }
}
