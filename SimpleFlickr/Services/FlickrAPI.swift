//
//  FlickrAPI.swift
//  SimpleFlickr
//
//  Created by Mike Saradeth on 1/20/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//  "https://api.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=fee10de350d1f31d5fec0eaf330d2dba&format=json&nojsoncallback=true"
//

import Foundation
import Alamofire
import RxSwift
import SwiftyJSON

class FlickrApi {
    var disposeBag = DisposeBag()
    
    func loadData(completionHandler: @escaping ([FlickrItem]) -> Void) {
        var items: [FlickrItem] = []
        let urlString = "https://api.flickr.com/services/rest/?"
        var params: [String:String] = [:]
        params["method"] = "flickr.photos.getRecent"
        params["api_key"] = "fee10de350d1f31d5fec0eaf330d2dba"
        params["format"] = "json"
        params["nojsoncallback"] = "true"
        
        HttpHelper.request(urlString, method: .get, params: params, success: { (responseObj) in
            let json = JSON(responseObj.result.value!)
            do {
                print(json)
                let photos = json.filter{ $0.0 == "ok"}
                print(photos)
//                let flickrItemService = try JSONDecoder().decode(FlickrItemService.self, from: data)
//                print(flickrItemService)
//                let items = flickrItemService.filter { $0.stat == "ok" }.map { $0.photos.photo }
                
                
            }catch let error {
                print(error.localizedDescription)
            }
        }) { (error) in
            print(error.localizedDescription)
        }
        completionHandler(items)
    }
    
    func loadData2() -> Observable<[FlickrItem]> {
        
       return Observable.create { (observer) -> Disposable in
        
            let urlString = "https://api.flickr.com/services/rest/?"
            var params: [String:String] = [:]
            params["method"] = "flickr.photos.getRecent"
            params["api_key"] = "fee10de350d1f31d5fec0eaf330d2dba"
            params["format"] = "json"
            params["nojsoncallback"] = "true"
        
            HttpHelper.request(urlString, method: .get, params: params, success: { (response) in
                guard let dict = response.result.value as? NSDictionary else {
                    fatalError("Error from API")
                }
                var items: [FlickrItem] = []
                if (dict["stat"] as? String) == "ok", let photosDict = dict["photos"] as? NSDictionary, let photos = photosDict["photo"] as? NSArray   {
                    for ii in 0..<photos.count {
                        if let photoDict = photos[ii] as? NSDictionary {
                            let farm = photoDict["farm"] as! Int
                            let server = photoDict["server"] as! String
                            let id = photoDict["id"] as! String
                            let secret = photoDict["secret"] as! String
                            let title = photoDict["title"] as! String
                            
                            let imageUrlString = "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret).jpg"
                            if let url = URL(string: imageUrlString) {
//                                let data = try? Data(contentsOf: url)
//                                let image = UIImage(data: data!)
//                                items.append(FlickrItem(image: image, title: title))
                            }
                        }
                    }
                }
                observer.onNext(items)
                observer.onCompleted()
                
            }, failure: { (error) in
                observer.onError(error)
            })

            return Disposables.create()
        }
        
    }
    
    
    deinit {
        print("FlickrApi func deinit() debug")
    }
}

