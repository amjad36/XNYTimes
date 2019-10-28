//
//  Article.swift
//  XNYTimes
//
//  Created by Amjad Khan on 28/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation

enum NetworkEnvironment {
    case development
    case production
    case staging
    case qa
}

enum ArticleApi {
    case popularArticle(page: Int)
}

extension ArticleApi: EndPointType {
    
    var environmentBaseUrl: String {
        switch NetworkManager.environment {
        case .development:
            return "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/"
        case .qa:
            return ""
        case .production:
            return ""
        case .staging:
            return ""
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseUrl) else { fatalError("Base URL could not be configured.") }
        return url
    }
    
    var path: String {
        switch self {
        case .popularArticle(let id):
            return "\(id).json"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .popularArticle:
            return .requestParameters(bodyParameters: nil, bodyEncoding: .urlEncoding, urlParameters: ["api-key": NetworkManager.articleAPIKey])
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
}
