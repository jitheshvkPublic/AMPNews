//
//  NetworkResource.swift
//  AMPNews
//
//  Created by Jithesh Valsan on 23/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//
import Foundation
import Alamofire

typealias SuccessCallback = (Data)->Void
typealias ErrorCallback = (ErrorType)->Void

class NetworkResource {
    class func request(url: URLConvertible,
                       method: HTTPMethod,
                       parameters: Parameters?,
                       encoding: ParameterEncoding,
                       headers: HTTPHeaders?,
                       onSuccess: SuccessCallback?,
                       onError: ErrorCallback?) {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        Alamofire.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers).responseData (
            completionHandler: { responseData in
                
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                
                switch responseData.result {
                case .success:
                    guard let statusCode = responseData.response?.statusCode else { return }
                    if statusCode >= 200 && statusCode < 300 {
                        if let value = responseData.data {
                            onSuccess?(value)
                        }
                    }
                    else if statusCode == 400 {
                        let errorType = ErrorType(code: statusCode, message: "", data: responseData.data)
                        onError?(errorType)
                    }
                    else {
                        let errorType = ErrorType(code: statusCode, message: "")
                        onError?(errorType)
                    }
                case .failure(let error):
                    var errorType = ErrorType()
                    if let code = responseData.response?.statusCode {
                        errorType.code = code
                    }
                    
                    errorType.message = error.localizedDescription
                    onError?(errorType)
                }
        })
    }
    
    class func request(url: URLConvertible,
                       method: HTTPMethod,
                       onSuccess: SuccessCallback?,
                       onError: ErrorCallback?) {
        request(url: url, method: method, parameters: nil, encoding: JSONEncoding.prettyPrinted, headers: nil, onSuccess: onSuccess, onError: onError)
    }
}
