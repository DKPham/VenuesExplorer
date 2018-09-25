//
//  Location.swift
//  VenuesExplorer
//
//  Created by Duy Pham on 4/27/18.
//  Copyright © 2018 Duy Pham. All rights reserved.
//

import Foundation

struct Location {
    let coordinate: Coordinate?
    let distance: Double?
    let countryCode: String?
    let country: String?
    let state: String?
    let city: String?
    let streetAddress: String?
    let crossStreet: String?
    let postalCode: String?
    

    init?(json: [String : Any]) {
        if let latitude = json["lat"] as? Double,
            let longitude = json["lng"] as? Double {
            coordinate = Coordinate(latitude: latitude, longitude: longitude)
        } else {
            coordinate = nil
        }
        
        distance = json["distance"] as? Double
        countryCode = json["cc"] as? String
        country = json["country"] as? String
        state = json["state"] as? String
        city = json["city"] as? String
        streetAddress = json["address"] as? String
        crossStreet = json["crossStreet"] as? String
        postalCode = json["postalCode"] as? String
    }
    
}











