//
//  Extensions.swift
//  SimpleFlickr
//
//  Created by Mike Saradeth on 2/7/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit

protocol StoryboardInstantiable: NSObjectProtocol {
    associatedtype MyType  // 1
    static var defaultFileName: String { get }  // 2
    static func instantiateViewController(_ bundle: Bundle?) -> MyType // 3
}

extension StoryboardInstantiable where Self: UIViewController {
    static var defaultFileName: String {
        return NSStringFromClass(Self.self).components(separatedBy: ".").last!
    }
    
    static func instantiateViewController(_ bundle: Bundle? = nil) -> Self {
        let fileName = defaultFileName
        let sb = UIStoryboard(name: fileName, bundle: bundle)
        return sb.instantiateInitialViewController() as! Self
    }
}

