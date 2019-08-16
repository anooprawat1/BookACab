//
//  ReservationDetail.swift
//  BookACab
//
//  Created by Anoop on 16/8/19.
//  Copyright © 2019 Anoop. All rights reserved.
//

import UIKit

class ReservationDetail: Decodable {
    
    var reservationId: Int?
    var carId: Int?
    var cost: Int?
    var drivenDistance: Int?
    var licencePlate: String?
    var startAddress: String?
    var userId: Int?
    var isParkModeEnabled = false
    var damageDescription: String?
    var fuelCardPin: String?
    var endTime: Int?
    var startTime: Int?
    
    required init?(data: [String : Any]) {
        
        reservationId = data["reservationId"] as? Int
        carId = data["carId"] as? Int
        cost = data["cost"] as? Int
        drivenDistance = data["drivenDistance"] as? Int
        licencePlate = data["licencePlate"] as? String
        startAddress = data["startAddress"] as? String
        userId = data["userId"] as? Int
        if let isParkModeEnabled = data["isParkModeEnabled"] as? Bool {
            self.isParkModeEnabled = isParkModeEnabled
        }
        damageDescription = data["damageDescription"] as? String
        fuelCardPin = data["fuelCardPin"] as? String
        endTime = data["endTime"] as? Int
        startTime = data["startTime"] as? Int
    }
}
