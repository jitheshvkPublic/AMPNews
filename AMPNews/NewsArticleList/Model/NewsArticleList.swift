//
//  NewsArticleList.swift
//  AMPNews
//
//  Created by Jithesh Valsan on 23/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

import Foundation

struct NewsArticleList {
    private var newsArticles:[NewsArticle]
    
    init() {
        newsArticles = [NewsArticle]()
    }
    
    init(newsArticles: [NewsArticle]) {
        self.newsArticles = newsArticles
    }
    
    var newsArticleStoredByLatest:[NewsArticle] {
        return self.newsArticles.sorted()
    }
}

extension NewsArticleList:Decodable {
    enum CodingKeys: String, CodingKey {
        case newsArticle = "assets"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let newsArticles = try container.decode([NewsArticle].self, forKey: .newsArticle)
        
        self.init(newsArticles: newsArticles)
    }
}
