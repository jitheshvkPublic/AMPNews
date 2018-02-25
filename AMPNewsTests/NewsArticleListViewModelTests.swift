//
//  NewsArticleListViewModelTests.swift
//  AMPNewsTests
//
//  Created by Jithesh Valsan on 25/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

import XCTest
@testable import AMPNews
import RxTest
import RxSwift

class NewsArticleListViewModelTests: XCTestCase {
    var testScheduler: TestScheduler!
    var disposeBag: DisposeBag!
    var viewModel: NewsArticleListViewModel!
    var mockApiClient:MockApiClient!
    
    override func setUp() {
        super.setUp()
        testScheduler = TestScheduler(initialClock: 0)
        disposeBag = DisposeBag()
        viewModel = NewsArticleListViewModel()
        
        //Set apiclient to mock data
        mockApiClient = MockApiClient()
        NetworkService.apiClient = mockApiClient
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGetNewsFeedSuccess() {
        mockApiClient.isSuccessCall = true //To return success case
        viewModel.getNewsFeed()
            .subscribe(onNext:{ newsArticleList in
                XCTAssertNotNil(newsArticleList)
                XCTAssertEqual(newsArticleList.count, 15)
            },
                       onError:{ error in
                        XCTAssertNotNil(error)
                        XCTAssertTrue(false, "Returned error in success call")
            })
            .disposed(by: disposeBag)
    }
    
    func testGetNewsFeedFailure() {
        mockApiClient.isSuccessCall = false //To return a failure case
        viewModel.getNewsFeed()
            .subscribe(onNext:{ newsArticleList in
                XCTAssertTrue(false, "Returned onNext in failure call")
            },
                       onError:{ error in
                        XCTAssertNotNil(error)
            })
            .disposed(by: disposeBag)
    }
}
