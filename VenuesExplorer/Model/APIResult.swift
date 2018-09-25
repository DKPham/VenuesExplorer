//
//  APIResult.swift
//  VenuesExplorer
//
//  Created by Duy Pham on 4/27/18.
//  Copyright © 2018 Duy Pham. All rights reserved.
//

import Foundation

enum APIResult<T> {
    case success(T)  //it has data! but of different types
    case failure(Error)
}

//var venueResult = APIResult.success(Venue(...))









