//
//  Decoding.swift
//  BookACab
//
//  Created by Anoop on 15/8/19.
//  Copyright © 2019 Anoop. All rights reserved.
//

import Foundation

protocol Decodable {
    init?(data: [String: Any])
}

class Decoding {
    
    static func decode<T>(_from data: Data) -> T where T : Decodable {
        let parsedJSON: Any?
        do {
            parsedJSON = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
        } catch let error {
            print(error)
            parsedJSON = nil
        }
        let didid: T = getMappingObject(parsedJSON as! [String: Any])
        return didid
    }
    
    static func decodeArray<T>(_from data: Data) -> [T] where T : Decodable {
        let parsedJSON: Any?
        do {
            parsedJSON = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
        } catch let error {
            print(error)
            parsedJSON = nil
        }
        var allData = [T]()
        for jsonObject in (parsedJSON as! [Any]) {
            let data: T = getMappingObject(jsonObject as! [String: Any])
            allData.append(data)
        }
        return allData
    }
    
    static func getMappingObject<T>(_ json: [String: Any]) -> T where T: Decodable {
        let object = T(data: json)
        return object!
    }
}
