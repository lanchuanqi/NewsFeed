//
//  NewsFeedTests.swift
//  NewsFeedTests
//
//  Created by logan on 2018/5/2.
//  Copyright © 2018 Chuanqi. All rights reserved.
//

import XCTest
@testable import NewsFeed

class NewsFeedTests: XCTestCase {
    var mainNewsVC: MainNewsController?

    override func setUp() {
        super.setUp()
        mainNewsVC = MainNewsController()
        let article = Article(author: "author name", title: "title", description: "description", url: "someURL", urlToImage: "someImageURL", publishedAt: "10/12/2017", source: nil)
        mainNewsVC?.allArticles = [article]
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        mainNewsVC = nil
    }
    func testMainTheme(){
        XCTAssertEqual(mainNewsVC?.tableView.backgroundColor, UIColor.darkBlue)
        XCTAssertEqual(UINavigationBar.appearance().barTintColor, UIColor.lightRed)
        XCTAssertEqual(UINavigationBar.appearance().tintColor, UIColor.white)
        
    }
    
    func testMainNewsTableView() {
        XCTAssertEqual(mainNewsVC?.tableView.numberOfRows(inSection: 0), 1)
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = mainNewsVC?.tableView.cellForRow(at: indexPath) as? NewsCell
        XCTAssertEqual(cell?.newsImageView.image, nil)
        XCTAssertEqual(cell?.dateLabel.text, "10/12/2017")
        XCTAssertEqual(cell?.sourceLabel.text, "Source Unknown")
        XCTAssertEqual(cell?.backgroundColor, UIColor.cellBackgroundColor)
    }

    func testCacheAndDownloadImage(){
        let imageURLString = "https://drive.google.com/file/d/1yYbTCZndPIbkOFKsqevMLgyljaqkenqp/view?usp=sharing"
        XCTAssertEqual(imageCache.object(forKey: imageURLString as NSString), nil)
        let imageView = UIImageView()
        imageView.downLoadAndCacheImageFromURL(urlString: imageURLString)
        XCTAssertEqual(imageCache.object(forKey: imageURLString as NSString), imageView.image)
    }
    
}
