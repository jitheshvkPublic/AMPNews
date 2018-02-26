//
//  NetworkApiClient.swift
//  AMPNews
//
//  Created by Jithesh Valsan on 23/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

import Foundation
import Alamofire

enum ServiceEndpoint {
    static let ArticleListURL = "https://bruce-v2-mob.fairfaxmedia.com.au/1/coding_test/13ZZQX/full"
}

class NetworkApiClient: ApiClient {
    func requestNewsArticleList(onSuccess: SuccessCallback?, onError: ErrorCallback?) {
        let encodedURL = ServiceEndpoint.ArticleListURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        NetworkResource.request(url: encodedURL!, method: .get, onSuccess: onSuccess, onError: onError)
    }
}
