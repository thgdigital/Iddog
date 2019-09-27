//
//  RouterManager.swift
//  Iddog
//
//  Created by THIAGO on 27/09/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Alamofire

enum RouterManager: URLRequestConvertible {
    static let baseURLString = "https://api-iddog.idwall.co"
    case login(parameters: Parameters)
    case feed(parameters: Parameters, token: String)
    
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .feed:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .login:
            return "/signup"
        case .feed:
            return "/feed"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try RouterManager.baseURLString.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue

        switch self {
        case .feed(let parameters, let token):
            
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            
            var headers: HTTPHeaders
            
            if let existingHeaders = urlRequest.allHTTPHeaderFields {
                
              headers = existingHeaders
            } else {
              headers = HTTPHeaders()
            }
            
            headers["Authorization"] =  token
            
            urlRequest.allHTTPHeaderFields = headers
        case .login(let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        }
        

        return urlRequest
    }
    

}
