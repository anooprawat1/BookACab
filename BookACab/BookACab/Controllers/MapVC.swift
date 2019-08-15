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
    
    let viewmodel = MapVM(ApiManager.shared)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}

