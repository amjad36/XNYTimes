//
//  EndPointType.swift
//  XNYTimes
//
//  Created by Amjad Khan on 28/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var task: HTTPTask { get }
    var httpMethod: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
}
