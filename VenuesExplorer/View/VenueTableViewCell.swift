//
// VenueTableViewCell.swift
//  VenuesExplorer
//
//  Created by Duy Pham on 4/30/18.
//  Copyright © 2018 Duy Pham. All rights reserved.
//

import UIKit

class VenueTableViewCell: UITableViewCell {

    @IBOutlet weak var restaurantCategoryImageView: UIImageView!
    @IBOutlet weak var restaurantTitleLabel: UILabel!
    @IBOutlet weak var restaurantCategoryLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var checkinsLabel: UILabel!
    
    var foursquareClient: FoursquareClient!
    
    var venue: Venue! {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        restaurantTitleLabel.text = venue.name
        checkinsLabel.text = "\(venue.checkins)"
        restaurantCategoryLabel.text = venue.categoryName
        
        if let distance = venue.location?.distance {
            distanceLabel.text = "\(distance)"
        } else {
            distanceLabel.isHidden = true
        }
        
        if let foursquareClient = foursquareClient, let categoryURL = venue.categoryIconURL {
            foursquareClient.fetchData(url: categoryURL, completion: { (result) in
                switch result {
                case .success(let data):
                    self.restaurantCategoryImageView.image = UIImage(data: data)
                    self.restaurantCategoryImageView.backgroundColor = UIColor.random()
                    self.restaurantCategoryImageView.layer.cornerRadius = self.restaurantCategoryImageView.bounds.width / 2.0
                    self.restaurantCategoryImageView.layer.masksToBounds = true
                case .failure(let error):
                    print(error)
                }
            })
        }
        
    }
    
}
private extension UIColor {
    class func random() -> UIColor {
        var colors = [
            UIColor(red: 245/255.0, green: 166/255.0, blue: 35/255.0, alpha: 1.0),
            UIColor(red: 144/255.0, green: 19/255.0, blue: 254/255.0, alpha: 1.0),
            UIColor(red: 249/255.0, green: 103/255.0, blue: 30/255.0, alpha: 1.0),
            UIColor(red: 35/255.0, green: 141/255.0, blue: 255/255.0, alpha: 1.0),
            UIColor(red: 255/255.0, green: 45/255.0, blue: 85/255.0, alpha: 1.0)
        ]
        let random = Int(arc4random()) % colors.count
        
        return colors[random]
    }
}
























