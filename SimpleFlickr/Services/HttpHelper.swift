//
//  HttpHelper.swift
//  SimpleFlickr
//
//  Created by Mike Saradeth on 2/5/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//



import Foundation
import Alamofire
import SwiftyJSON
import RxSwift

class HttpHelper: NSObject {
    
    //Use Closure
    class func requestGETURL(_ strURL: String, success:@escaping (DataResponse<Any>) -> Void, failure:@escaping (Error) -> Void) {
        Alamofire.request(strURL).responseJSON { (response) -> Void in
            switch response.result {
            case .success:
                success(response)
                
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    class func request(_ url: URLConvertible, method: HTTPMethod, params: Parameters?, success: @escaping (DataResponse<Any>) -> Void, failure:@escaping (Error) -> Void) {
        Alamofire.request(url, method: method, parameters: params).responseJSON { response in
            switch response.result {
            case .success:
//                let resJSON = JSON(response.result.value!)
//                print(resJSON)
                success(response)
                
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    deinit {
        print("HttpHelp func deinit() debug")
    }
}
