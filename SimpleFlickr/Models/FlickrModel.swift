//
//  FlickrModel.swift
//  SimpleFlickr
//
//  Created by Mike Saradeth on 1/20/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
import UIKit
import RxSwift






struct FlickrItem: Codable {
    var title: String
    var imageUrlString: String
    
//    enum CodingKeys: CodingKey {
//        case title
//        case imageUrlString
//    }
}

struct FlickrItemService: Codable {
    var photos: Photos
    var stat: String
}

struct Photos: Codable {
    var photo: [FlickrItem]
    
    //        enum CodingKeys: CodingKey {
    //            case photo
    //        }
}
