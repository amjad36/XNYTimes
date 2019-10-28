//
//  ArticleTableViewCell.swift
//  XNYTimes
//
//  Created by Amjad Khan on 28/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblByLine: UILabel!
    @IBOutlet weak var lblPublishedDate: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(article: Article) {
        self.lblTitle.text = article.title
        self.lblByLine.text = article.byLine
        self.lblPublishedDate.text = "📅" + " " + (article.publishedDate)
    }

}
