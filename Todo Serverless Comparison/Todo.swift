//
//  Todo.swift
//  Todo Serverless Comparison
//
//  Created by Kyle Lee on 4/21/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import Foundation

struct Todo: Identifiable {
    let id: String?
    let name: String
    let creationDate: TimeInterval
}

extension Todo {
    init(name: String) {
        self.init(id: nil, name: name, creationDate: Date().timeIntervalSince1970)
    }
    
    init(listQueryItem: ListTodosQuery.Data.ListTodo.Item) {
        self.init(
            id: listQueryItem.id,
            name: listQueryItem.name,
            creationDate: listQueryItem.creationDate
        )
    }
}
