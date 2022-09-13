//
//  APIClient.swift
//  associatedType_Tutorial
//
//  Created by 新垣 清奈 on 2022/09/13.
//

import Foundation

public struct APIClient {
    struct UserGet: APIConfigure {
        typealias ResponseEntity = User
        static let path = "https://qiita.com/api/v2/users/anies1212"
    }

    struct ItemsGet: APIConfigure {
        typealias ResponseEntity = [Item]
        static let path = "https://qiita.com/api/v2/items"
    }
}

struct User: Codable {
    let name: String

    init(name: String) {
        self.name = name
    }
}

struct Item: Codable {
    let name: String

    init(name: String) {
        self.name = name
    }
}
