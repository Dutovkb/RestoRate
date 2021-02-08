//
//  PlaceModel.swift
//  Restorate
//
//  Created by Кирилл Дутов on 05.02.2021.
//

import RealmSwift


class Place: Object {
    @objc dynamic var name = ""
    @objc dynamic var location: String?
    @objc dynamic var type: String?
    @objc dynamic var imageData: Data?
    @objc dynamic var restarauntImage: String?
    
    let restaurantNames = [
        "Burger Heroes", "Kitchen", "Bonsai", "Дастархан",
        "Индокитай", "X.O", "Балкан Гриль", "Sherlock Holmes",
        "Speak Easy", "Morris Pub", "Вкусные истории",
        "Классик", "Love&Life", "Шок", "Бочка"
    ]
     
    // Save the list of restaurants to the database
    
    func savePlaces() {
        
        for place in restaurantNames {
            
            let image = UIImage(named: place)
            guard let imageData = image?.pngData() else { return }
            
            let newPlace = Place()
            
            newPlace.name = place
            newPlace.location = "Санкт-Петербург"
            newPlace.type = "Ресторан"
            newPlace.imageData = imageData
            
            StorageManager.saveObject(newPlace)
            
        }
    }
}
