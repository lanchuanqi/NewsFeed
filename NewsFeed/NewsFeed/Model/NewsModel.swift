//
//  NewsModel.swift
//  NewsFeed
//
//  Created by logan on 2018/5/1.
//  Copyright © 2018 Chuanqi. All rights reserved.
//

import UIKit

struct NewsData: Decodable{
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
}

struct Article: Decodable {
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
}

struct Source: Decodable{
    let id: String?
    let name: String?
}



