//
//  ApiManager.swift
//  BookACab
//
//  Created by Anoop on 15/8/19.
//  Copyright © 2019 Anoop. All rights reserved.
//

import UIKit

class ApiManager: NSObject {
    
    static let shared = ApiManager()
    
    private let session = URLSession.shared
    
    func fetch(with router: Router, isRequiredHeader: Bool = false, completionHandler: @escaping (Data?, String?) -> ()) {
        
        guard let url = router.asURL() else {
            completionHandler(nil, "Invalid Url")
            return
        }

        var urlRequest = URLRequest(url: url)
        if isRequiredHeader {
            urlRequest.setValue("", forHTTPHeaderField: "")
        }
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                completionHandler(nil, error.localizedDescription)
            }
            
            if let data = data {
                completionHandler(data, nil)
            }
        }
        task.resume()
    }
}
