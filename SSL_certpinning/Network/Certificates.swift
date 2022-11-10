//
//  Certificates.swift
//  SSL_certpinning
//
//  Created by Nitanta Adhikari on 10/11/2022.
//

import Foundation

struct Certificates {
    
    static let stackExchange = Certificates.certificate(filename: "stackexchange.com")
    
    private static func certificate(filename: String) -> SecCertificate {
        let filePath = Bundle.main.path(forResource: filename, ofType: "der")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: filePath))
        let certificate = SecCertificateCreateWithData(nil, data as CFData)!
        
        return certificate
    }
}
