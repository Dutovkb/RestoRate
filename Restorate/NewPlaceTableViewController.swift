//
//  NewPlaceTableViewController.swift
//  Restorate
//
//  Created by Кирилл Дутов on 08.02.2021.
//

import UIKit

class NewPlaceTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - TableView delegate
    
    // Сonfigure the hiding of the keyboard by tap to other cells and make a menu for the first cell in the table
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
        } else {
            view.endEditing(true)
        }
    }
}
    //MARK: - TextField delegate
    
    extension NewPlaceTableViewController: UITextFieldDelegate {
        
        // Hiding the keyboard by clicking on done
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
    }

