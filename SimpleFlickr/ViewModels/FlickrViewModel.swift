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
    var itemsValue = [FlickrItem]()
    var items: BehaviorSubject<[FlickrItem]>!
    var flickrApi: FlickrApi
    var disposeBag = DisposeBag()
    
    init(items: [FlickrItem] = [], flickrApi: FlickrApi = FlickrApi()) {
        self.itemsValue = items
        self.items = BehaviorSubject<[FlickrItem]>(value: items)
        self.flickrApi = flickrApi
    }
    
    func loadModel() {
        flickrApi.loadData()
            .subscribe(onNext: { [weak self] items in
                self?.items.onNext(items)
            })
            .disposed(by: disposeBag)
    }
    
    public func sortItems()  {
        print(itemsValue)
        itemsValue = itemsValue.sorted(by: { $0.title < $1.title })
        items.onNext(itemsValue)
        print(itemsValue)
    }
}
