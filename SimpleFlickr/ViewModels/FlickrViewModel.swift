//
//  FlickrViewModel.swift
//  SimpleFlickr
//
//  Created by Mike Saradeth on 1/20/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
import RxSwift

class FlickrViewModel {
    var items: [FlickrItem]
    var flickrApi: FlickrApi
    
    init(items: [FlickrItem], flickrApi: FlickrApi) {
        self.items = items
        self.flickrApi = flickrApi
    }
    
    func loadModel(completionHandle: @escaping () -> Void) {
        flickrApi.loadData { [weak self] (items) in
            self?.items = items
            completionHandle()
        }
    }
    
    public func sortItems()  {
        print(items)
        items = items.sorted(by: { $0.title < $1.title })
//        items.onNext(itemsValue)
        print(items)
    }
}
