//
//  TestHelper.swift
//  AMPNewsTests
//
//  Created by Jithesh Valsan on 23/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

import Foundation

enum TestDataFileName {
    static let NewsArticleList = "NewsArticleList"
    static let NewsArticleKeyNotFound = "NewsArticleKeyNotFound"
    static let NewsArticle = "NewsArticle"
    static let NewsArticleArray = "NewsArticleArray"
    static let NewsArticleRelatedImages = "NewsArticleRelatedImages"
    static let RelatedImage = "RelatedImage"
    static let RelatedImageKeyNotFound = "RelatedImageKeyNotFound"
}

func getDataFromJSONFile(_ fileName:String) -> Data {
    let path = Bundle(for: TestHelper.self).path(forResource: fileName, ofType: "json")!
    let data = try? Data(contentsOf: URL(fileURLWithPath: path))
    return data!
}

private class TestHelper {}
