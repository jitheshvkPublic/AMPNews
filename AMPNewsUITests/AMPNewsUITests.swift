//
//  AMPNewsUITests.swift
//  AMPNewsUITests
//
//  Created by Jithesh Valsan on 23/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

import XCTest
@testable import AMPNews

class AMPNewsUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTapAndViewDetail() {
        let app = XCUIApplication()
        let tableView = app.tables["NewsArticleListTable"].firstMatch
        XCTAssertTrue(tableView.exists)
        let cell = tableView.cells.element(boundBy: 1).firstMatch
        XCTAssertTrue(cell.exists)
        let initialCellCount = tableView.cells.count
        cell.tap()
        
        let navigationBar = app.navigationBars["NewsArticleNavigationBar"].firstMatch
        XCTAssertTrue(navigationBar.exists)
        let barButton = navigationBar.buttons["News"].firstMatch
        XCTAssertTrue(barButton.exists)
        barButton.tap()
        
        let newsListTableView = app.tables["NewsArticleListTable"].firstMatch
        XCTAssertTrue(newsListTableView.exists)
        let newCellCount = tableView.cells.count
        XCTAssertEqual(initialCellCount, newCellCount)
    }
    
}
