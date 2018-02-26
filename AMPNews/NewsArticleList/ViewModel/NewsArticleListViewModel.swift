//
//  NewsArticleListViewModel.swift
//  AMPNews
//
//  Created by Jithesh Valsan on 23/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

import Foundation
import RxSwift

class NewsArticleListViewModel {
    private var newsArticleList:NewsArticleList!
    
    init() {
        newsArticleList = NewsArticleList()
    }
    
    func getNewsFeed() -> Observable<[NewsArticleViewModel]> {
        return Observable.create { observer in
            NetworkService.getNewsArticleList(onSuccess: { [weak self] (data) in
                if let newsArticleList = self?.serialize(data: data) {
                    let newsArticleViewModelList = newsArticleList.newsArticleStoredByLatest.map({
                        return NewsArticleViewModel(newsArticle: $0)
                    })
                    observer.on(.next(newsArticleViewModelList))
                    observer.on(.completed)
                }
                else {
                    observer.on(.next([NewsArticleViewModel()]))
                    observer.on(.completed)
                }
            }) { (errorType) in
                observer.on(.error(errorType))
            }
            return Disposables.create()
        }
    }
    
    private func serialize(data:Data) -> NewsArticleList? {
        return try? JSONDecoder().decode(NewsArticleList.self, from: data)
    }
}
