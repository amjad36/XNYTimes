//
//  URLParameterEncoder.swift
//  XNYTimes
//
//  Created by Amjad Khan on 28/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation

public struct URLParameterEncoder: ParameterEncoder {
    
    public static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        guard let url = urlRequest.url else { throw NetworkError.missingUrl }
        
        if var urlComponent = URLComponents(url: url, resolvingAgainstBaseURL: false), !parameters.isEmpty {
            urlComponent.queryItems = [URLQueryItem]()
            
            for (key, value) in parameters {
                let queryItem = URLQueryItem(name: key, value: "\(value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
                urlComponent.queryItems?.append(queryItem)
            }
        }
        
        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        }
    }
    
}
