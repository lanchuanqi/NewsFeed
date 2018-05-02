//
//  APIHelper.swift
//  NewsFeed
//
//  Created by logan on 2018/5/1.
//  Copyright © 2018 Chuanqi. All rights reserved.
//

import UIKit


class APIHelper{
    static let shared = APIHelper()
    
    func getTodaysBreakingNews(completion: @escaping([Article]?) -> ()){
        let newsURLString = "https://newsapi.org/v2/top-headlines?country=us&apiKey=dfcca7a37c054428a93d3b1d3749be04"
        guard let url = URL(string: newsURLString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let error = err{
                print("Failed to read news from newsapi with error: ", error)
                completion(nil)
            }
            guard let newsData = data else {
                print("Failed to read data.")
                completion(nil)
                return }
            do{
                let allArticles = try JSONDecoder().decode(NewsData.self, from: newsData)
                completion(allArticles.articles)
            } catch let readError{
                print("Failed to prase JSON with error: ", readError)
                completion(nil)
            }
        }.resume()
    }



    

}
