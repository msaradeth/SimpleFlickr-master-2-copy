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

protocol FlickrData {
    var image: UIImage? { get set }
    var title: String { get set }
}


struct FlickrItem: FlickrData {
    var image: UIImage?
    var title: String
}
