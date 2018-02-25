//
//  NewsArticleViewModelTests.swift
//  AMPNewsTests
//
//  Created by Jithesh Valsan on 25/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

import XCTest
@testable import AMPNews
import SwiftyJSON

class NewsArticleViewModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNewsArticleViewModelDefaultInitializer() {
        let newsArticleViewModel = NewsArticleViewModel()
        XCTAssertNotNil(newsArticleViewModel)
        XCTAssertEqual(newsArticleViewModel.abstract, "")
        XCTAssertEqual(newsArticleViewModel.byLine, "")
        XCTAssertEqual(newsArticleViewModel.headline, "")
        XCTAssertNil(newsArticleViewModel.url)
        XCTAssertNil(newsArticleViewModel.smallestImageURL)
    }
    
    func testNewsArticleViewModelParameterisedInitializer() {
        let data = getDataFromJSONFile(TestDataFileName.NewsArticleRelatedImages)
        var newsArticle = try! JSONDecoder().decode(NewsArticle.self, from: data)
        let newsArticleViewModel = NewsArticleViewModel(newsArticle: newsArticle)
        XCTAssertNotNil(newsArticleViewModel)
        let jsonData = JSON(data)
        XCTAssertEqual(newsArticleViewModel.abstract, jsonData["theAbstract"].string)
        XCTAssertEqual(newsArticleViewModel.byLine, jsonData["byLine"].string)
        XCTAssertEqual(newsArticleViewModel.headline, jsonData["headline"].string)
        XCTAssertEqual(newsArticleViewModel.url, jsonData["url"].string)
        XCTAssertEqual(newsArticleViewModel.smallestImageURL, "Image5.jpg")
    }
}
