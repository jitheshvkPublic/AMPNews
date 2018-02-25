//
//  NewsArticleTests.swift
//  AMPNewsTests
//
//  Created by Jithesh Valsan on 24/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

import XCTest
@testable import AMPNews
import SwiftyJSON

class NewsArticleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNewsArticleDefaultInitializer() {
        var newsArticle = NewsArticle()
        XCTAssertNotNil(newsArticle)
        XCTAssertNil(newsArticle.byLine)
        XCTAssertNil(newsArticle.headline)
        XCTAssertNil(newsArticle.relatedImages)
        XCTAssertNil(newsArticle.smallestImageURL)
        XCTAssertNil(newsArticle.theAbstract)
        XCTAssertNil(newsArticle.timeStamp)
        XCTAssertNil(newsArticle.url)
        XCTAssertNil(newsArticle.smallestImageURL)
    }
    
    func testNewsArticleDecodable() {
        let data = getDataFromJSONFile(TestDataFileName.NewsArticle)
        var newsArticle = try! JSONDecoder().decode(NewsArticle.self, from: data)
        XCTAssertNotNil(newsArticle)
        let jsonData = JSON(data)
        XCTAssertEqual(newsArticle.byLine, jsonData["byLine"].string)
        XCTAssertEqual(newsArticle.headline, jsonData["headline"].string)
        XCTAssertNotNil(newsArticle.relatedImages)
        XCTAssertEqual(newsArticle.relatedImages?.count, jsonData["relatedImages"].array?.count)
        XCTAssertEqual(newsArticle.theAbstract, jsonData["theAbstract"].string)
        XCTAssertEqual(newsArticle.timeStamp, jsonData["timeStamp"].int)
        XCTAssertEqual(newsArticle.url, jsonData["url"].string)
        XCTAssertEqual(newsArticle.byLine, jsonData["byLine"].string)
        
        let firstImage = jsonData["relatedImages"].arrayValue[0]
        XCTAssertEqual(newsArticle.smallestImageURL, firstImage["url"].string)
    }
    
    func testNewsArticleKeyNotFound() {
        let data = getDataFromJSONFile(TestDataFileName.NewsArticleKeyNotFound)
        var newsArticle = try! JSONDecoder().decode(NewsArticle.self, from: data)
        XCTAssertNotNil(newsArticle)
        XCTAssertNil(newsArticle.byLine)
        XCTAssertNil(newsArticle.headline)
        XCTAssertNil(newsArticle.relatedImages)
        XCTAssertNil(newsArticle.smallestImageURL)
        XCTAssertNil(newsArticle.theAbstract)
        XCTAssertNil(newsArticle.timeStamp)
        XCTAssertNil(newsArticle.url)
    }
    
    func testNewsArticleRelatedImages() {
        let data = getDataFromJSONFile(TestDataFileName.NewsArticleRelatedImages)
        var newsArticle = try! JSONDecoder().decode(NewsArticle.self, from: data)
        XCTAssertNotNil(newsArticle)
        XCTAssertEqual(newsArticle.smallestImageURL, "Image5.jpg")
        XCTAssertFalse(newsArticle.relatedImages![0] == newsArticle.relatedImages![1])
        XCTAssertTrue(newsArticle.relatedImages![3] == newsArticle.relatedImages![5])
    }
    
    func testPerformanceNewsArticleSmallestImage() {
        let data = getDataFromJSONFile(TestDataFileName.NewsArticleRelatedImages)
        var newsArticle = NewsArticle()
        newsArticle = try! JSONDecoder().decode(NewsArticle.self, from: data)
        self.measure {
            //Test performance of lazy initialized variable smallestImageURL
            _ = newsArticle.smallestImageURL
        }
    }
}
