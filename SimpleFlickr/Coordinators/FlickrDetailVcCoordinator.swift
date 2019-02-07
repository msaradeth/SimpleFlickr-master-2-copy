//
//  FlickrDetailVcCoordinator.swift
//  SimpleFlickr
//
//  Created by Mike Saradeth on 2/7/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit
import RxSwift


class FlickrDetaiVcCoordinator: Coordinator {
    private let presenter: UINavigationController
    private let item: FlickrItem
    private let disposeBag = DisposeBag()
    var flickrDetailVC: FlickrDetailVC? 
    init(presenter: UINavigationController, item: FlickrItem) {
        self.presenter = presenter
        self.item = item
    }
    
    func start() {
        print(presenter.viewControllers.count)
        let flickrDetailVC = FlickrDetailVC.createWith(storyboard: UIStoryboard(name: "Main", bundle: nil), item: item)
        presenter.pushViewController(flickrDetailVC, animated: true)
        
        self.flickrDetailVC = flickrDetailVC
    }
}

