//
//  RelatedImageTests.swift
//  AMPNewsTests
//
//  Created by Jithesh Valsan on 25/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

import XCTest
@testable import AMPNews
import SwiftyJSON

class RelatedImageTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRelatedImage() {
        let data = getDataFromJSONFile(TestDataFileName.RelatedImage)
        let relatedImage = try! JSONDecoder().decode(RelatedImage.self, from: data)
        let jsonData = JSON(data)
        XCTAssertNotNil(relatedImage)
        XCTAssertEqual(relatedImage.height, jsonData["height"].int)
        XCTAssertEqual(relatedImage.width, jsonData["width"].int)
        XCTAssertEqual(relatedImage.url, jsonData["url"].string)
    }
    
    func testRelatedImageKeyNotFound() {
        let data = getDataFromJSONFile(TestDataFileName.RelatedImageKeyNotFound)
        let relatedImage = try! JSONDecoder().decode(RelatedImage.self, from: data)
        XCTAssertNotNil(relatedImage)
        XCTAssertNil(relatedImage.height)
        XCTAssertNil(relatedImage.width)
        XCTAssertNil(relatedImage.url)
    }
}
