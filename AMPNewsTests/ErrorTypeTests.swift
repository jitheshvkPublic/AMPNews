//
//  ErrorTypeTests.swift
//  AMPNewsTests
//
//  Created by Jithesh Valsan on 25/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

import XCTest
@testable import AMPNews

class ErrorTypeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testErrorTypeDefaultInitializer() {
        let errorType = ErrorType()
        XCTAssertNotNil(errorType)
        XCTAssertEqual(errorType.code, -1)
        XCTAssertEqual(errorType.message, "")
        XCTAssertNil(errorType.data)
    }
    
    func testErrorTypeParameterizedInitializer() {
        let errorType = ErrorType(code: 404, message: "Not found", data: Data())
        XCTAssertNotNil(errorType)
        XCTAssertEqual(errorType.code, 404)
        XCTAssertEqual(errorType.message, "Not found")
        XCTAssertNotNil(errorType.data)
    }
    
    func testErrorTypeFromNSError() {
        let nsError = NSError(domain: kErrorDomain, code: 404, userInfo: [NSLocalizedDescriptionKey: "Not found"])
        let errorType = ErrorType(error: nsError)
        XCTAssertNotNil(errorType)
        XCTAssertEqual(errorType.code, 404)
        XCTAssertEqual(errorType.message, "Not found")
        XCTAssertNil(errorType.data)
    }
}
