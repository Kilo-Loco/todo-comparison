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
