//
//  NewsDetailViewController.swift
//  NewsFeed
//
//  Created by logan on 2018/5/2.
//  Copyright © 2018 Chuanqi. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController{
    let newsImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "unknown")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.darkBlue.cgColor
        return imageView
    }()
    let titleLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title"
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = 3
        return label
    }()
    let sourceLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Source Unknown"
        label.textAlignment = .right
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 12, weight: .thin)
        return label
    }()
    let detailTextView: UITextView = {
        var textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isUserInteractionEnabled = false
        textView.adjustsFontForContentSizeCategory = true
        textView.backgroundColor = UIColor.clear
        return textView
    }()
    private func setUpUI(){
        view.backgroundColor = UIColor.lightBlue
        
        view.addSubview(newsImageView)
        newsImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 8).isActive = true
        newsImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        newsImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        newsImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true

        view.addSubview(detailTextView)
        detailTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        detailTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        detailTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15).isActive = true
        detailTextView.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 8).isActive = true
    }
    var article: Article? {
        didSet{
            if let urlString = article?.urlToImage{
                newsImageView.downLoadAndCacheImageFromURL(urlString: urlString)
            }
            detailTextView.text = article?.description
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
}
