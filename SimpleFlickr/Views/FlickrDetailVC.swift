//
//  FlickrDetailVC.swift
//  SimpleFlickr
//
//  Created by Mike Saradeth on 1/20/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit
import RxSwift

class FlickrDetailVC: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    var item: FlickrItem!
    let titleSubject = PublishSubject<String>()
    
    static func createWith(storyboard: UIStoryboard, item: FlickrItem) -> FlickrDetailVC {
        let vc = storyboard.instantiateViewController(withIdentifier: "FlickrDetailVC") as! FlickrDetailVC
        vc.item = item
        vc.title = item.title
        return vc
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        imageView.image = item?.image
        title = item?.title
    }
    
        
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        titleSubject.onNext(item?.title ?? "")
        titleSubject.onCompleted()
    }

}
