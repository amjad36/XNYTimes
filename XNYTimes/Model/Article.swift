//
//  Article.swift
//  XNYTimes
//
//  Created by Amjad Khan on 28/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation

class ArticleApiResponse: Codable {
    var articles: [Article] = [Article]()
    enum CodingKeys: String, CodingKey {
        //Encoding/decoding will only include the properties defined in this enum, rest will be ignored
        case articles = "results"
    }
}

class Article: NSObject, Codable {
    var id: Int = 0
    var title: String = ""
    var type: String = ""
    var abstract: String = ""
    var byLine: String = ""
    var publishedDate: String = ""
    
    enum CodingKeys: String, CodingKey {
        //It will replace the respective properties name by assigned string
        //while encoding to Json format.
        //Also, while decoding respective Json, these new names are
        //expected in data rather that that defined in class declaration
        //will not get renamed
        case id
        case title
        case type
        case abstract
        case byLine = "byline"
        case publishedDate = "published_date"
    }
}
