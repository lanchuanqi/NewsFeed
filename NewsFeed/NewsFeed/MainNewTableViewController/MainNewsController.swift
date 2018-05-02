//
//  ViewController.swift
//  NewsFeed
//
//  Created by logan on 2018/5/1.
//  Copyright © 2018 Chuanqi. All rights reserved.
//

import UIKit

class MainNewsController: UITableViewController {
    let cellId = "tableCellId"
    var allArticles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Today's News"
        setUpTableView()
        getBreakingNewsAndShowOnTableView()
        addRefreshControl()
    }
    
    private func addRefreshControl(){
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(downloadCompaniesFromServer), for: .valueChanged)
        refreshControl.tintColor = .white
        self.refreshControl = refreshControl
    }
    
    @objc private func downloadCompaniesFromServer(){
        APIHelper.shared.getTodaysBreakingNews { (articles) in
            if let all = articles{
                self.allArticles = all
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            DispatchQueue.main.async {
                self.refreshControl?.endRefreshing()
            }
        }
    }
    
    private func setUpTableView(){
        tableView.register(NewsCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorColor = UIColor.white
        tableView.backgroundColor = UIColor.darkBlue
        tableView.tableFooterView = UIView()
    }

    private func getBreakingNewsAndShowOnTableView(){
        APIHelper.shared.getTodaysBreakingNews { (articles) in
            if let all = articles{
                self.allArticles = all
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    
    
    
    

}

