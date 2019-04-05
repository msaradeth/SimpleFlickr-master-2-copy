//
//  MainTableViewCell.swift
//  SimpleFlickr
//
//  Created by Mike Saradeth on 1/20/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    static let CellIdentifier = "Cell"
        
    func configure(item: FlickrItem) {
//        self.imageView?.image = item.image
        self.textLabel?.text = item.title
    }

}
