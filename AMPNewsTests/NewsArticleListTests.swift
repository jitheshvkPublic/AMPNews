//
//  NewsArticleListTests.swift
//  AMPNewsTests
//
//  Created by Jithesh Valsan on 25/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

import XCTest
@testable import AMPNews

class NewsArticleListTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNewsArticleListDefaultInitializer() {
        let newsArticleList = NewsArticleList()
        XCTAssertNotNil(newsArticleList)
        XCTAssertEqual(newsArticleList.newsArticleStoredByLatest, [])
    }
    
    func testNewsArticleListParameterisedInitializer() {
        let data = getDataFromJSONFile(TestDataFileName.NewsArticleArray)
        let newsArticle = try! JSONDecoder().decode([NewsArticle].self, from: data)
        let newsArticleList = NewsArticleList(newsArticles: newsArticle)
        XCTAssertNotNil(newsArticleList)
        let sortedNewsArticle = newsArticle.sorted()
        XCTAssertEqual(newsArticleList.newsArticleStoredByLatest, sortedNewsArticle)
        XCTAssertFalse(newsArticleList.newsArticleStoredByLatest[0] == newsArticleList.newsArticleStoredByLatest[1])
    }
    
    func testPerformanceNewsArticleList() {
        let data = getDataFromJSONFile(TestDataFileName.NewsArticleArray)
        var newsArticle = [NewsArticle]()
        newsArticle = try! JSONDecoder().decode([NewsArticle].self, from: data)
        self.measure {
            // Put the code you want to measure the time of here.
            _ = NewsArticleList(newsArticles: newsArticle)
        }
    }
    
}
