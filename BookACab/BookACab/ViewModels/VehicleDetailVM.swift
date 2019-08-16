//
//  VehicleDetailVM.swift
//  BookACab
//
//  Created by Anoop on 16/8/19.
//  Copyright © 2019 Anoop. All rights reserved.
//

import UIKit

class VehicleDetailVM {
    let apiManager: ApiManager!
    private (set) var vehicle: Vehicle?
    weak var uidelegate: UIDelegate?

    init(_ apiManager: ApiManager, vehicleId: Int) {
        self.apiManager = apiManager
        fetchVehicleForId(vehicleId)
    }
    
    func fetchVehicleForId(_ id: Int) {
        apiManager.fetch(with: Router.vehicleDetail(id)) { [weak self] (data, errorString) in
            guard let data = data else { return }
            let selectedVehicle: Vehicle = Decoding.decode(_from: data)
            self?.vehicle = selectedVehicle
            self?.uidelegate?.updateUI()
        }
    }
    
    func getData() -> [(key: String, value: Any)]? {
        let sortedValue = vehicle?.toDict().sorted(by: { $0.0 < $1.0 })
        return sortedValue
    }
    
    func numberOfRows() -> Int {
        return getData()?.count ?? 0
    }
    
    func descriptionAtIndex(_ index: Int) ->  String {
        var description = ""
        let selectedData = getData()![index]
        var value = ""
        if let intValue = selectedData.value as? Int {
            value = "\(intValue)"
        } else if let boolValue = selectedData.value as? Bool {
            value = boolValue.description
        } else if let stringValue = selectedData.value as? String {
            value = stringValue
        }
        description = "\(selectedData.key) - \(value)"
        return description
    }
    
    func quickRentVehicle(completionHandler: @escaping (_ isSuccess: Bool) -> Void) {
        let postData = ["carId": vehicle?.carId ?? 0]
        apiManager.post(with: Router.quickRent, postData: postData) { (data, error) in
            guard let data = data else { return }
            let reservationDetail: ReservationDetail = Decoding.decode(_from: data)
            if reservationDetail.carId != nil {
                completionHandler(true)
            } else {
                completionHandler(false)
            }
            
        }
    }
}
