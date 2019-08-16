//
//  URLConstants.swift
//  BookACab
//
//  Created by Anoop on 15/8/19.
//  Copyright © 2019 Anoop. All rights reserved.
//

import UIKit

enum Router {
    
    private static let BASE_URL = "https://s3.eu-central-1.amazonaws.com/wunderfleet-recruiting-dev"

    case allVehicles
    case vehicleDetail(Int)
    case quickRent
    var path: String {
        switch self {
        case .allVehicles:
            return "/cars.json"
        case .vehicleDetail(let vehicleId):
            return "/cars/\(vehicleId)"
        case .quickRent:
            return "https://4i96gtjfia.execute-api.eu-central-1.amazonaws.com/default/wunderfleet-recruiting-mobile-dev-quick-rental"
        }
    }
    func asURL() -> URL? {
        switch self {
        case .quickRent:
            return URL(string: path)
        default:
            return URL(string: Router.BASE_URL + path)
        }
    }
}
