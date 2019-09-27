//
//  UserModel.swift
//  Iddog
//
//  Created by THIAGO on 27/09/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

struct UserModel: Codable {
    let email, id, token, createdAt: String
    let updatedAt: String
    let version: Int

    enum CodingKeys: String, CodingKey {
        case email
        case id = "_id"
        case token, createdAt, updatedAt
        case version = "__v"
    }
}
