//
//  MockApiClient.swift
//  AMPNews
//
//  Created by Jithesh Valsan on 23/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

import Foundation

class MockApiClient: ApiClient {
    var isSuccessCall = true
    func requestNewsArticleList(onSuccess: SuccessCallback?, onError: ErrorCallback?) {
        if isSuccessCall {
            let data = getDataFromJSONFile(TestDataFileName.NewsArticleList)
            onSuccess?(data)
        }
        else {
            onError?(ErrorType(code: 500, message: "Service not available"))
        }
    }
}
