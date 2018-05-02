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
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func setUpTableView(){
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
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

