//
//  FlickrVcCoordinator.swift
//  SimpleFlickr
//
//  Created by Mike Saradeth on 2/7/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit
import RxSwift


class FlickrVcCoordinator: Coordinator {
    private let presenter: UINavigationController
    private let viewModel: FlickrViewModel
    private var flickrVC: FlickrVC?
    private var flickrDetailVcCoordinator: FlickrDetaiVcCoordinator?
    private let disposeBag = DisposeBag()
    
    init(presenter: UINavigationController, viewModel: FlickrViewModel) {
        self.presenter = presenter
        self.viewModel = viewModel
    }
    
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let flickrVC = FlickrVC.createWith(storyboard: storyboard, viewModel: viewModel, title: "Main")
        flickrVC.delegate = self
        presenter.pushViewController(flickrVC, animated: true)
        
        self.flickrVC = flickrVC
    }
}


// MARK: - FlickrVcDelegate
extension FlickrVcCoordinator: FlickrVcDelegate {
    
    func flickrDidSelectRow(item: FlickrItem) -> FlickrDetailVC? {
        let flickrDetailVcCoordinator = FlickrDetaiVcCoordinator(presenter: presenter, item: item)
        flickrDetailVcCoordinator.start()
        self.flickrDetailVcCoordinator = flickrDetailVcCoordinator
        return flickrDetailVcCoordinator.flickrDetailVC
    }
}

