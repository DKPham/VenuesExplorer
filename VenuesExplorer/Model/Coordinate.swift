//
//  Coordinate.swift
//  VenuesExplorer
//
//  Created by Duy Pham on 4/27/18.
//  Copyright © 2018 Duy Pham. All rights reserved.
//

import Foundation

struct Coordinate : CustomStringConvertible {
    let latitude: Double
    let longitude: Double

    var description: String {
        return "\(latitude),\(longitude)"
    }
}














