//
//  NewsArticleViewModel.swift
//  AMPNews
//
//  Created by Jithesh Valsan on 23/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

import Foundation

class NewsArticleViewModel {
    private var newsArticle:NewsArticle
    
    var url:String? {
        get {
            return newsArticle.url
        }
    }
    
    var headline:String {
        get {
            return newsArticle.headline ?? ""
        }
    }
    
    var abstract:String {
        get {
            return newsArticle.theAbstract ?? ""
        }
    }
    
    var byLine:String {
        get {
            return newsArticle.byLine ?? ""
        }
    }
    
    var smallestImageURL:String? {
        get {
            return newsArticle.smallestImageURL
        }
    }
    
    init() {
        self.newsArticle = NewsArticle()
    }
    
    init(newsArticle:NewsArticle) {
        self.newsArticle = newsArticle
    }
}
