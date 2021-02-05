//
//  TableViewController.swift
//  Planner
//
//  Created by Кирилл Дутов on 05.02.2021.
//

import UIKit

class TableViewController: UITableViewController {
    
    let restarauntNames = ["Art-Caviar", "Литтл Сицили", "Ресторан Балкан", "Home Cafe Петергоф", "Meal", "Mr. Bo", "Public Cafe"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restarauntNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = restarauntNames[indexPath.row]
        return cell
    }
}
