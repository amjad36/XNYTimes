//
//  BaseViewController.swift
//  XNYTimes
//
//  Created by Amjad Khan on 28/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit
import MBProgressHUD

class BaseViewController: UIViewController {

    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(ArticleViewController.handleRefresh), for: .valueChanged)
        refreshControl.tintColor = UIColor.red
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showLoader() {
        let progressHud = MBProgressHUD.showAdded(to: self.view, animated: true)
        progressHud.label.text = "Loading"
        progressHud.detailsLabel.text = "Popular Articles"
    }
    
    func hideLoader() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    @objc func handleRefresh() { }

}
