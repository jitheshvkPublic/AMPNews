//
//  ErrorType.swift
//  AMPNews
//
//  Created by Jithesh Valsan on 23/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

import Foundation

struct ErrorType:Error {
    var code:Int
    var message:String
    var data:Data? //Data returned in error condition. e.g. HTTP response 400
    
    init(code:Int, message:String, data:Data? = nil) {
        self.code = code
        self.message = message
        self.data = data
    }
    
    init() {
        code = -1
        message = ""
    }
    
    init(error:NSError) {
        code = error.code
        message = error.localizedDescription
    }
}
