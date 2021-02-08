//
//  NewPlaceTableViewController.swift
//  Restorate
//
//  Created by Кирилл Дутов on 08.02.2021.
//

import UIKit

class NewPlaceTableViewController: UITableViewController, UINavigationControllerDelegate {
    
    var newPlace = Place()
    var imageIsChanged = false
    
    @IBOutlet weak var imageOfPlace: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var placeName: UITextField!
    @IBOutlet weak var placeLocation: UITextField!
    @IBOutlet weak var placeType: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            self.newPlace.savePlaces()
        }
        
        saveButton.isEnabled = false
        placeName.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        
        // Removing unnecessary separators in the table
        tableView.tableFooterView = UIView()
    }
    
    //MARK: - TableView delegate
    
    // Сonfigure the hiding of the keyboard by tap to other cells and make a menu for the first cell in the table
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
            // Adding icons to UIAlertAction
            
            let cameraIcon = #imageLiteral(resourceName: "camera")
            let photoIcon = #imageLiteral(resourceName: "photo")
            
            // Add and configure UIAlertController
            
            let actionSheet = UIAlertController(title: nil,
                                                message: nil,
                                                preferredStyle: .actionSheet)
            
            let camera = UIAlertAction(title: "Камера", style: .default) { _ in
                self.chooseImagePicker(source: .camera)
            }
            camera.setValue(cameraIcon, forKey: "image")
            camera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            
            let photo = UIAlertAction(title: "Фото", style: .default) { _ in
                self.chooseImagePicker(source: .photoLibrary)
            }
            photo.setValue(photoIcon, forKey: "image")
            photo.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            
            let cancel = UIAlertAction(title: "Отмена", style: .cancel)
            
            actionSheet.addAction(camera)
            actionSheet.addAction(photo)
            actionSheet.addAction(cancel)
            
            present(actionSheet, animated: true)
            
        } else {
            view.endEditing(true)
        }
    }
    
    // Implement the possibility of saving a new establishment
    
    func saveNewPlace() {
        
        var image: UIImage?
        
        if imageIsChanged {
            image = imageOfPlace.image
        } else {
            image = #imageLiteral(resourceName: "imagePlaceholder")
        }
        
//        newPlace = Place(name: placeName.text!,
//                         location: placeLocation.text,
//                         type: placeType.text,
//                         image: image,
//                         restarauntImage: nil)
    }
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true)
    }
}
//MARK: - TextField delegate

extension NewPlaceTableViewController: UITextFieldDelegate {
    
    // Hiding the keyboard by clicking on done
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Configuring the logic for hiding the save button
    
    @objc private func textFieldChanged() {
        if placeName.text?.isEmpty != true {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
    }
    
    
}

//MARK: - Work with image

extension NewPlaceTableViewController: UIImagePickerControllerDelegate {
    
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageOfPlace.image = info[.editedImage] as? UIImage
        imageOfPlace.contentMode = .scaleAspectFill
        imageOfPlace.clipsToBounds = true
        
        imageIsChanged = true
        
        dismiss(animated: true, completion: nil)
    }
}
