//
//  ViewController.swift
//  XNYTimes
//
//  Created by Amjad Khan on 28/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class ArticleViewController: BaseViewController {
    
    @IBOutlet weak var tblArticleView: UITableView!
    var articleArray:[Article] = [Article]()
    let networkManager = NetworkManager()
    var isRefreshControl: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tblArticleView.addSubview(refreshControl)
        getData()
    }
    
    func getData() {
        if isRefreshControl == false { self.showLoader() }
        networkManager.getArticle(page: 7) { (articles, error) in
            performUIUpdatesOnMain {
                self.refreshControl.endRefreshing()
                self.hideLoader()
            }
            if let articles = articles {
                self.articleArray = articles
                performUIUpdatesOnMain {
                    self.tblArticleView.reloadData()
                }
            }
        }
    }
    
    @objc override func handleRefresh() {
        isRefreshControl = true
        getData()
    }

}

extension ArticleViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as! ArticleTableViewCell
        cell.configureCell(article: articleArray[indexPath.row])
        return cell
    }
}
