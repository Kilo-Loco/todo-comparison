//
//  Todo.swift
//  Todo Serverless Comparison
//
//  Created by Kyle Lee on 4/21/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import FirebaseFirestore
import Foundation

struct Todo: Identifiable {
    let id: String?
    let name: String
    let creationDate: TimeInterval
}

extension Todo {
    var document: [String: Any] {
        var dict = [String: Any]()
        dict["id"] = id
        dict["name"] = name
        dict["creationDate"] = creationDate
        return dict
    }
    
    init(name: String) {
        self.init(id: nil, name: name, creationDate: Date().timeIntervalSince1970)
    }
    
    init(from document: DocumentSnapshot) {
        let dict = document.data()
        self.init(
            id: document.documentID,
            name: (dict?["name"] as? String) ?? "",
            creationDate: (dict?["creationDate"] as? TimeInterval) ?? 0
        )
    }
}
