//
//  UserModel.swift
//  SSL_certpinning
//
//  Created by Nitanta Adhikari on 10/11/2022.
//

import Foundation

struct UserList: Codable {
  let users: [User]
  
  enum CodingKeys: String, CodingKey {
    case users = "items"
  }
}

struct BadgeCounts: Codable {
  let bronze: Int
  let silver: Int
  let gold: Int
  
  enum CodingKeys: String, CodingKey {
    case bronze
    case silver
    case gold
  }
}

struct User: Codable {
  let displayName: String
  let reputation: Double
  let badgeCounts: BadgeCounts
  
  enum CodingKeys: String, CodingKey {
    case displayName = "display_name"
    case reputation
    case badgeCounts = "badge_counts"
  }
}
