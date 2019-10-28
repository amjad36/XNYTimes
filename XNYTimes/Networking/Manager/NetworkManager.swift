//
//  NetworkManager.swift
//  XNYTimes
//
//  Created by Amjad Khan on 28/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation

enum NetworkResponse: String {
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed"
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}

enum Result<String> {
    case success
    case failure(String)
}

struct NetworkManager {
    
    static let environment: NetworkEnvironment = .development
    static let articleAPIKey = "oYXG8Sch57JQRnGQzuUvmWjVrhMuRi2c"
    private let router = Router<ArticleApi>()

    func getArticle(page: Int, completion: @escaping (_ article: [Article]?, _ error: String?) -> ()) {
        
        router.request(.popularArticle(page: page)) { (data, response, error) in
            
            if error != nil {
                completion(nil, "Please check your network connection.")
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        let apiResponse = try JSONDecoder().decode(ArticleApiResponse.self, from: responseData)
                        completion(apiResponse.articles, nil)
                    } catch {
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        switch response.statusCode {
            case 200...209: return .success
            case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
            case 501...509: return .failure(NetworkResponse.badRequest.rawValue)
            case 600: return .failure(NetworkResponse.outdated.rawValue)
            default: return .failure(NetworkResponse.badRequest.rawValue)
        }
    }
}
