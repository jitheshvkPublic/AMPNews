//
//  NewsArticleDetailsViewController.swift
//  AMPNews
//
//  Created by Jithesh Valsan on 26/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

import UIKit
import WebKit

class NewsArticleDetailsViewController: UIViewController {
    var newsURL:String?
    var webView:WKWebView!
    var progressView:UIProgressView!
    
    override func loadView() {
        super.loadView()
        //Add webView
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: view.frame, configuration: webConfiguration)
        view.addSubview(webView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setup() {
        navigationController?.navigationBar.isTranslucent = false
        
        //KVO for webview
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        webView.addObserver(self, forKeyPath: "title", options: .new, context: nil)
        
        //Add progress bar
        progressView = UIProgressView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 2))
        progressView.applyStyle(.NewsArticleDetailsProgressViewStyle)
        view.addSubview(progressView)
        
        guard let newsURL = newsURL,
            let url = URL(string: newsURL) else {
                return
        }
        webView.load(URLRequest(url: url))
    }
    
    deinit {
        webView.removeObserver(self, forKeyPath: "estimatedProgress", context: nil)
        webView.removeObserver(self, forKeyPath: "title", context: nil)
    }
}

//MARK: KVO
extension NewsArticleDetailsViewController {
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard let change = change else { return }
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
            
            if webView.estimatedProgress >= 1.0 {
                UIView.animate(withDuration: 0.2, animations: { [weak self] in
                    self?.progressView.alpha = 0
                })
            }
            return
        }
        if keyPath == "title" {
            if let title = change[NSKeyValueChangeKey.newKey] as? String {
                self.navigationItem.title = title
            }
            return
        }
    }
}
