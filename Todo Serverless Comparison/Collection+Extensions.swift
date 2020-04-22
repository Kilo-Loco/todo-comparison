//
//  Collection+Extensions.swift
//  Todo Serverless Comparison
//
//  Created by Kyle Lee on 4/21/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import Foundation

extension Collection where Element == Todo {
    func sorted() -> [Todo] {
        self.sorted { $0.creationDate > $1.creationDate }
    }
}
