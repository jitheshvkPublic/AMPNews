//
//  NewsArticleListTableViewController.swift
//  AMPNews
//
//  Created by Jithesh Valsan on 25/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class NewsArticleListTableViewController: UITableViewController {
    var viewModel = NewsArticleListViewModel()
    var newsArticles = [NewsArticleViewModel]()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchNewsFeed()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupView() {
        navigationItem.title = "News"
        tableView.applyStyle(.NewsArticleTableViewStyle)
        tableView.register(UINib(nibName: NewsArticleTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier:NewsArticleTableViewCell.reuseIdentifier)
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(fetchNewsFeed), for: .valueChanged)
        refreshControl.applyStyle(.NewsArticleRefreshControleStyle)
        tableView.refreshControl = refreshControl
    }
    
    @objc private func fetchNewsFeed() {
        refreshControl?.beginRefreshing()
        viewModel.getNewsFeed()
            .subscribe(onNext: { [weak self] newsArticles in
                self?.refreshControl?.endRefreshing()
                self?.newsArticles = newsArticles
                self?.tableView.reloadData()
            },
                       onError: { [weak self] (error) in
                        self?.refreshControl?.endRefreshing()
                        guard let errorType = error as? ErrorType else { return }
                        let alertController = UIAlertController(title: nil, message: errorType.message, preferredStyle: .alert)
                        let okAction = UIAlertAction(title: "Ok", style: .default, handler:  nil)

                        alertController.addAction(okAction)
                        self?.present(alertController, animated: true, completion: nil)
            })
            .disposed(by: disposeBag)
    }
}

//MARK :- UITableViewDelegate
extension NewsArticleListTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArticles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsArticleTableViewCell.reuseIdentifier, for: indexPath) as! NewsArticleTableViewCell
        cell.configureWithNewsArticle(newsArticles[indexPath.row])
        return cell
    }
}
