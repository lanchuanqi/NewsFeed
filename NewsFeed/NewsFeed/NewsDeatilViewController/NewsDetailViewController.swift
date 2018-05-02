//
//  NewsDetailViewController.swift
//  NewsFeed
//
//  Created by logan on 2018/5/2.
//  Copyright © 2018 Chuanqi. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController{
    let detailWebView: UIWebView = {
        var webview = UIWebView()
        webview.translatesAutoresizingMaskIntoConstraints = false
        
        return webview
    }()
    private func setUpUI(){
        view.backgroundColor = UIColor.lightBlue
        view.addSubview(detailWebView)
        detailWebView.topAnchor.constraint(equalTo: view.topAnchor, constant: 8).isActive = true
        detailWebView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        detailWebView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        detailWebView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
    }
    var article: Article? {
        didSet{
            if let urlString = article?.url{
                if let url = URL(string: urlString){
                    let urlRequest = URLRequest(url: url)
                    detailWebView.loadRequest(urlRequest)
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        detailWebView.stopLoading()
    }
}
