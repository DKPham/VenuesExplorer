//
//  Venue.swift
//  VenuesExplorer
//
//  Created by Duy Pham on 4/27/18.
//  Copyright © 2018 Duy Pham. All rights reserved.
//

import Foundation
import AddressBook
import MapKit

struct Venue {
    let id: String
    let name: String
    let location: Location?
    let categoryName: String
    let checkins: Int
    var categoryIconURL: URL?
    var categoryIconSize = 88
    let url: URL?
    
    init?(json: [String : Any]) {
        guard let id = json["id"] as? String,
            let name = json["name"] as? String,
            let categories = json["categories"] as? [[String : Any]],
            let category = categories.first,
            let categoryName = category["name"] as? String,
            let stats = json["stats"] as? [String : Any],
            let checkinsCount = stats["checkinsCount"] as? Int else {
            return nil
        }
        
        self.id = id
        self.name = name
        self.categoryName = categoryName
        self.checkins = checkinsCount
        
        if let urlString = json["url"] as? String {
            self.url = URL(string: urlString)
        } else {
            self.url = nil
        }
        
        if let locationDict = json["location"] as? [String : Any] {
            self.location = Location(json: locationDict)
        } else {
            self.location = nil
        }
        
        if let categoryIconDict = category["icon"] as? [String : Any],
            let prefix = categoryIconDict["prefix"] as? String,
            let suffix = categoryIconDict["suffix"] as? String {
            let iconURLString = "\(prefix)\(categoryIconSize)\(suffix)"
            self.categoryIconURL = URL(string: iconURLString)
        } else {
            self.categoryIconURL = nil
        }
    }
    
    func mapItem() -> MKMapItem
    {
        let addressDictionary = [String(kABPersonAddressStreetKey) : categoryName]
        let point = MKPointAnnotation()
        point.coordinate = CLLocationCoordinate2D(latitude: (location?.coordinate?.latitude)!, longitude: (location?.coordinate?.longitude)!)
        let placemark = MKPlacemark(coordinate: point.coordinate, addressDictionary: addressDictionary)
        let mapItem = MKMapItem(placemark: placemark)
        
        mapItem.name = "\(name) \(categoryName)"
        
        return mapItem
    }
}

























