//
//  Vehicle.swift
//  BookACab
//
//  Created by Anoop on 15/8/19.
//  Copyright © 2019 Anoop. All rights reserved.
//

import UIKit
import MapKit

class Vehicle: MKPointAnnotation, Decodable {
    
    var carId: Int?
    var titleCar: String?
    var lat: Double?
    var lon: Double?
    var licencePlate: String?
    var fuelLevel: Int?
    var vehicleStateId: Int?
    var vehicleTypeId: Int?
    var pricingTime: String?
    var pricingParking: String?
    var reservationState: Int?
    var isClean = false
    var isDamaged = false
    var distance: String?
    var address: String?
    var zipCode: String?
    var city: String?
    var locationId: Int?
    var hardwareId: String?
    var isActivatedByHardware = false
    var damageDescription: String?
    var vehicleTypeImageUrl: String?

    required init?(data: [String : Any]) {
        super.init()
        carId = data["carId"] as? Int
        titleCar = data["title"] as? String
        lat = data["lat"] as? Double
        lon = data["lon"] as? Double
        licencePlate = data["licencePlate"] as? String
        fuelLevel = data["fuelLevel"] as? Int
        vehicleStateId = data["vehicleStateId"] as? Int
        vehicleTypeId = data["vehicleTypeId"] as? Int
        pricingTime = data["pricingTime"] as? String
        pricingParking = data["pricingParking"] as? String
        reservationState = data["reservationState"] as? Int
        if let isClean = data["isClean"] as? Bool {
            self.isClean = isClean
        }
        if let isDamaged = data["isDamaged"] as? Bool {
            self.isDamaged = isDamaged
        }
        distance = data["distance"] as? String
        address = data["address"] as? String
        zipCode = data["zipCode"] as? String
        city = data["city"] as? String
        locationId = data["locationId"] as? Int
        hardwareId = data["hardwareId"] as? String
        if let isActivatedByHardware = data["isActivatedByHardware"] as? Bool {
            self.isActivatedByHardware = isActivatedByHardware
        }
        damageDescription = data["damageDescription"] as? String
        vehicleTypeImageUrl = data["vehicleTypeImageUrl"] as? String
        coordinate = CLLocationCoordinate2DMake(lat ?? 0, lon ?? 0)
    }
}
