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
    var path: String {
        switch self {
        case .allVehicles:
            return "/cars.json"
        }
    }
    func asURL() -> URL? {
        return URL(string: Router.BASE_URL + path)
    }
}
