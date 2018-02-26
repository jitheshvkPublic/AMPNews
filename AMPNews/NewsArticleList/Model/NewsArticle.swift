//
//  NewsArticle.swift
//  AMPNews
//
//  Created by Jithesh Valsan on 23/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

import Foundation

struct NewsArticle:Decodable {
    var url:String?
    var headline:String?
    var theAbstract:String?
    var byLine:String?
    var timeStamp:Int?
    var relatedImages:[RelatedImage]?
    
    lazy var smallestImageURL:String? = {
            guard let relatedImages = relatedImages else {
                return nil
            }
            return relatedImages.sorted().first?.url
    }()
}

extension NewsArticle:Comparable {
    static func <(lhs: NewsArticle, rhs: NewsArticle) -> Bool {
        guard let lhsTimeStamp = lhs.timeStamp else {
            return true //If article does not have timestamp consider it as old
        }
        
        guard let rhsTimeStamp = rhs.timeStamp else {
            return false //If article does not have timestamp consider it as old
        }
        //Greatest timestamp is most recent article.
        //To arrange in descending order of timestamp return > instead of <.
        return lhsTimeStamp > rhsTimeStamp
    }
    
    static func ==(lhs: NewsArticle, rhs: NewsArticle) -> Bool {
        if ((lhs.byLine == rhs.byLine) &&
        (lhs.headline == rhs.headline) &&
            (lhs.relatedImages! == rhs.relatedImages!) &&
        (lhs.theAbstract == rhs.theAbstract) &&
        (lhs.timeStamp == rhs.timeStamp) &&
            (lhs.url == rhs.url)) {
            return true
        }
        return false
    }
}
