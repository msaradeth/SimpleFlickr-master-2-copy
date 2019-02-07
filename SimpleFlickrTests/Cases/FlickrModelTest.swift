//
//  FlickrModelTest.swift
//  SimpleFlickrTests
//
//  Created by Mike Saradeth on 1/24/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

//import RxSwift
import XCTest
@testable import SimpleFlickr


class FlickrModelTest: XCTestCase {

    var model: FlickrViewModel!
    
    func testOrder() {
        let items = [FlickrItem(image: nil, title: "D"), FlickrItem(image: nil, title: "Z"), FlickrItem(image: nil, title: "C"), FlickrItem(image: nil, title: "A"),]
        let viewModel = FlickrViewModel(items: items, flickrApi: FlickrApi())

        viewModel.sortItems()

//        XCTAssert(viewModel.items.value[0].title == "A", "Pass")
//        XCTAssert(viewModel.items.value[1].title", "Pass")
        
        //        XCTAssert(viewModel.items.value.count == 3, "Failed")
        //        XCTAssert(viewModel.items.value.count == 4, "Pass")
        
    }

    
    func testOrder2() {
        let items = [FlickrItem(image: nil, title: "D"), FlickrItem(image: nil, title: "Z"), FlickrItem(image: nil, title: "C"), FlickrItem(image: nil, title: "A"),]
        let viewModel = FlickrViewModel(items: items, flickrApi: FlickrApi())
        viewModel.loadModel()
        
        //        viewModel.sortItems()
        
        //        XCTAssert(viewModel.items.value.count == 3, "Failed")
        //        XCTAssert(viewModel.items.value.count == 4, "Pass")
        
//        XCTAssert(viewModel.items.value[1].title == "A", "Pass")
//        XCTAssert(viewModel.items.value[1].title == "Z", "Pass")
    }
    
    
}
