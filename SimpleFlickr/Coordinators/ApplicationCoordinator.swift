//
//  ApplicationCoordinator.swift
//  SimpleFlickr
//
//  Created by Mike Saradeth on 2/7/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit

class ApplicationCoordinator: Coordinator {
    private let window: UIWindow
    private let rootVC: UINavigationController
    private let flickrVcCoordinator: FlickrVcCoordinator
    private let flickrViewModel: FlickrViewModel
    
    init(window: UIWindow) {
        self.window = window
        flickrViewModel = FlickrViewModel()
        rootVC = UINavigationController()
        flickrVcCoordinator = FlickrVcCoordinator(presenter: rootVC, viewModel: flickrViewModel)
    }
    
    func start() {
        window.rootViewController = rootVC
        flickrVcCoordinator.start()
        window.makeKeyAndVisible()
    }
}
