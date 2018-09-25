//
//  ViewController.swift
//  VenuesExplorer
//
//  Created by Duy Pham on 4/27/18.
//  Copyright © 2018 Duy Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let baseURL = "https://api.foursquare.com/v2/"
        let path = "venues/search?ll=40.7484,-73.9857&client_id=BYRM2DBQ3HOUCSZUWQI2XTGOWZHDWQRQ2NRGT5D4LOITAEA4&client_secret=PCFOWPVOLHOOVSI44QPHKORU11L0XNIV3JUUOOS2VJMTHFK2&v=20180427"
        let urlString = "\(baseURL)\(path)"
        let url = URL(string: urlString)!
        let urlRequest = URLRequest(url: url)
        
        let networkProcessing = NetworkProcessing(request: urlRequest)
        
        networkProcessing.downloadJSON { (json, httpResponse, error) in
            if let dictionary = json {
                if let metaDict = dictionary["meta"] as? [String : Any] {
                    let requestId = metaDict["requestId"] as! String
                    print(requestId)
                }
            }
        }
    }
}

