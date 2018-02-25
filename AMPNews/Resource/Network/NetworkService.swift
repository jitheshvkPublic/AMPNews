//
//  NetworkService.swift
//  AMPNews
//
//  Created by Jithesh Valsan on 23/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

import Foundation

protocol ApiClient {
    func requestNewsArticleList(onSuccess: SuccessCallback?, onError: ErrorCallback?)
}

class NetworkService {
    static var apiClient:ApiClient = NetworkApiClient() // Inject api client. Mock/Network
    
    static func getNewsArticleList(onSuccess: SuccessCallback?, onError: ErrorCallback?) {
        apiClient.requestNewsArticleList(onSuccess: onSuccess, onError: onError)
    }
}
