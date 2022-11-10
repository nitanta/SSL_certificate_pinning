//
//  Router.swift
//  SSL_certpinning
//
//  Created by Nitanta Adhikari on 10/11/2022.
//

import Foundation

enum Router: URLRequestConvertible {
    case users
    
    static let baseURLString = "https://api.stackexchange.com/2.2"
    
    func asURLRequest() throws -> URLRequest {
        let path: String
        switch self {
        case .users:
            path = "/users?order=desc&sort=reputation&site=stackoverflow"
        }
        
        let url = URL(string: Router.baseURLString + path)!
        return URLRequest(url: url)
    }
}
