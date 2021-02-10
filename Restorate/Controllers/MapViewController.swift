//
//  MapViewController.swift
//  Restorate
//
//  Created by Кирилл Дутов on 09.02.2021.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    var place = Place()
    let annotationIdentifier = "annotationIdentifier"
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPlacemark()
        locationManagerDidChangeAuthorization(locationManager)
    }
    
    @IBAction func closeVC() {
        dismiss(animated: true)
    }
    
    private func setupPlacemark() {
        guard let location = place.location else { return }
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(location) { (placemarks, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let placemarks = placemarks else { return }
            
            let placemark = placemarks.first
            
            let annotation = MKPointAnnotation()
            annotation.title = self.place.name
            annotation.subtitle = self.place.type
            
            guard let placemarkLocation = placemark?.location else { return }
            
            annotation.coordinate = placemarkLocation.coordinate
            
            self.mapView.showAnnotations([annotation], animated: true)
            self.mapView.selectAnnotation(annotation, animated: true)
            
        }
    }
    
    private func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            locationManagerDidChangeAuthorization(locationManager)
        } else {
            
        }
    }
    
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
    }
    
    internal func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        switch manager.authorizationStatus {
        case .authorizedAlways , .authorizedWhenInUse:
            mapView.showsUserLocation = true
            break
        case .denied , .restricted:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        @unknown default:
            print("New case is available")
        }
    }
}

// MARK: - Setting up annotation

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else { return nil }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView?.canShowCallout = true
        }
        
        if let imageData = place.imageData {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            imageView.layer.cornerRadius = 10
            imageView.clipsToBounds = true
            imageView.image = UIImage(data: imageData)
            annotationView?.rightCalloutAccessoryView = imageView
        }
        return annotationView
    }
}

extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        locationManagerDidChangeAuthorization(locationManager)
    }
}
