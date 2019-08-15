//
//  ViewController.swift
//  BookACab
//
//  Created by Anoop on 14/8/19.
//  Copyright © 2019 Anoop. All rights reserved.
//

import UIKit
import MapKit

class MapVC: UIViewController {

    @IBOutlet var mapView: MKMapView!
    fileprivate let locationManager = CLLocationManager()

    fileprivate var viewmodel: MapVM!

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        viewmodel = MapVM(ApiManager.shared)
        viewmodel.uidelegate = self
    }

    func setRegion() {
        if let coordinates = locationManager.location?.coordinate {
            let region = MKCoordinateRegion(center: coordinates, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            self.mapView.setRegion(region, animated: true)
        }
    }
}
extension MapVC: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation {
            let userPin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: nil)
            userPin.animatesDrop = true
            return userPin
        }
        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
        }
        
        if let vehicleAnnotation = annotation as? Vehicle {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 40))
            let btn = UIButton(type: .detailDisclosure)
            label.text = vehicleAnnotation.titleCar
            annotationView?.detailCalloutAccessoryView = label
            annotationView?.rightCalloutAccessoryView = btn
            annotationView?.image = UIImage(named: "car")
        }
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        for annotation in mapView.annotations {
            mapView.view(for: annotation)?.isHidden = true
        }
        view.isHidden = false
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        // TO DO - SHOW DETAIL VIEW
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        for annotation in mapView.annotations {
            mapView.view(for: annotation)?.isHidden = false
        }
    }
}

extension MapVC: UIDelegate {
    func updateUI() {
        DispatchQueue.main.async {
            self.mapView.addAnnotations(self.viewmodel.allVehicles)
            self.setRegion()
        }
    }
}
