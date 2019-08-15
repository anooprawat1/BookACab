//
//  MapVM.swift
//  BookACab
//
//  Created by Anoop on 15/8/19.
//  Copyright © 2019 Anoop. All rights reserved.
//

import Foundation

class MapVM {

    let apiManager: ApiManager!
    var allVehicles = [Vehicle]()
    
    init(_ apiManager: ApiManager) {
        self.apiManager = apiManager
        fetchAllVehicles()
    }
    
    func fetchAllVehicles() {
        
        apiManager.fetch(with: Router.allVehicles) { [weak self] (data, errorString) in
            guard let data = data else { return }
            let vehicles: [Vehicle] = Decoding.decodeArray(_from: data)
            self?.allVehicles.removeAll()
            self?.allVehicles = vehicles
        }
    }
}
