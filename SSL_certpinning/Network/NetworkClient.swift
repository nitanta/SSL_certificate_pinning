//
//  NetworkClient.swift
//  SSL_certpinning
//
//  Created by Nitanta Adhikari on 10/11/2022.
//

import Foundation
import Alamofire

final class NetworkClient {
    let evaluators = [
        "api.stackexchange.com":
            PinnedCertificatesTrustEvaluator(certificates: [
                Certificates.stackExchange
            ])
    ]
    
    let session: Session
    
    private init() {
        session = Session.default //Session(serverTrustManager: ServerTrustManager(evaluators: evaluators))
    }
    
    // MARK: - Static Definitions
    private static let shared = NetworkClient()
    
    static func request(_ convertible: URLRequestConvertible) -> DataRequest {
        return shared.session.request(convertible)
    }
}
