//
//  Repository.swift
//  associatedType_Tutorial
//
//  Created by 新垣 清奈 on 2022/09/13.
//

import Foundation

protocol APIConfigure {
    associatedtype ResponseEntity: Codable
    static var path: String { get }
    static func request(completion: ((ResponseEntity) -> ())?)
}

extension APIConfigure {
    static func request(completion: ((ResponseEntity) -> ())?) {
        guard let url = URL(string: Self.path) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, let responseEntity = try? JSONDecoder().decode(ResponseEntity.self, from: data) else {
                return
            }
            completion?(responseEntity)
        }
        task.resume()
    }
}

