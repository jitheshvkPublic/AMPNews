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
        webView = WKWebView(frame: CGRect.zero, configuration: webConfiguration)
        webView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(webView)
        
        //Add constraint to webview with reference to safe area
        webView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: webView.trailingAnchor).isActive = true
        view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: webView.bottomAnchor).isActive = true
        
        //Add progress bar
        progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.applyStyle(.NewsArticleDetailsProgressViewStyle)
        view.addSubview(progressView)
        progressView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        progressView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: progressView.trailingAnchor).isActive = true
        progressView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        view.updateConstraintsIfNeeded()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        navigationController?.navigationBar.isTranslucent = false
        
        //KVO for webview
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        webView.addObserver(self, forKeyPath: "title", options: .new, context: nil)
        
        if let newsURL = newsURL,
            let url = URL(string: newsURL) {
            webView.load(URLRequest(url: url))
        }
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
