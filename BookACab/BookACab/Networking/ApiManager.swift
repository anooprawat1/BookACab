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
            urlRequest.setValue("Bearer df7c313b47b7ef87c64c0f5f5cebd6086bbb0fa", forHTTPHeaderField: "Authorization")
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
    
    func post(with router: Router, isRequiredHeader: Bool = true, postData: [String: Any], completionHandler: @escaping (Data?, String?) -> ()) {
        
        guard let url = router.asURL() else {
            completionHandler(nil, "Invalid Url")
            return
        }
        guard let httpBody = try? JSONSerialization.data(withJSONObject: postData, options: []) else {
            completionHandler(nil, "Invalid Post Data")
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = httpBody
        
        if isRequiredHeader {
            urlRequest.setValue("Bearer df7c313b47b7ef87c64c0f5f5cebd6086bbb0fa", forHTTPHeaderField: "Authorization")
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
