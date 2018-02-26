//
//  RelatedImage.swift
//  AMPNews
//
//  Created by Jithesh Valsan on 23/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

import Foundation

struct RelatedImage:Decodable {
    var url:String?
    var width:Int?
    var height:Int?
}

extension RelatedImage:Comparable {
    //The image can have 0 as height. Hence calculating the area to find
    //the smallest image is not valid. Therefore only width parameter is
    //considered to find the smallest image
    static func <(lhs: RelatedImage, rhs: RelatedImage) -> Bool {
        guard let lhsWidth = lhs.width,
            let rhsWidth = rhs.width else {
                return false    //Image without width will be kept last after sort
        }
        return lhsWidth < rhsWidth
    }
    
    static func ==(lhs: RelatedImage, rhs: RelatedImage) -> Bool {
        if ((lhs.height == rhs.height) &&
        (lhs.url == rhs.url) &&
            (lhs.width == rhs.width)) {
            return true
        }
        return false
    }
}
