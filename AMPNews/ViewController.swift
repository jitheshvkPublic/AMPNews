//
//  ViewController.swift
//  AMPNews
//
//  Created by Jithesh Valsan on 23/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

import UIKit
import SwiftyJSON
import RxSwift

class ViewController: UIViewController {
    var viewModel = NewsArticleListViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getNewsFeed()
            .subscribe(onNext: { (value) in
                value.forEach({
                    print($0.headline)
                    print($0.abstract)
                    print($0.byLine)
                    print("\n")
                })
            },
            onError: { [weak self] (error) in
                guard let errorType = error as? ErrorType else { return }
                let alertController = UIAlertController(title: nil, message: errorType.message, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .default, handler:  nil)
                
                alertController.addAction(okAction)
                self?.present(alertController, animated: true, completion: nil)
            })
            .disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
