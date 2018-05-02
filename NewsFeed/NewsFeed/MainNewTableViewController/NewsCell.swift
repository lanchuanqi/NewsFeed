//
//  NewsCell.swift
//  NewsFeed
//
//  Created by logan on 2018/5/1.
//  Copyright © 2018 Chuanqi. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    let newsImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "unknown")
        imageView.contentMode = .scaleAspectFill
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
    let authorLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "by: unknown"
        label.textAlignment = .left
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    let dateLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "2018/05/01"
        label.textAlignment = .right
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    var article: Article? {
        didSet{
            titleLabel.text = article?.title
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    private func setUpUI(){
        backgroundColor = UIColor.cellBackgroundColor
        
        addSubview(newsImageView)
        newsImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        newsImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        newsImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        newsImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: newsImageView.rightAnchor, constant: 5).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        addSubview(authorLabel)
        authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        authorLabel.leftAnchor.constraint(equalTo: newsImageView.rightAnchor, constant: 5).isActive = true
        authorLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        authorLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        addSubview(dateLabel)
        dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        dateLabel.leftAnchor.constraint(equalTo: newsImageView.rightAnchor, constant: 5).isActive = true
        dateLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
