//
//  TodoSourceOfTruth.swift
//  Todo Serverless Comparison
//
//  Created by Kyle Lee on 4/21/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import Combine

final class TodosSourceOfTruth: ObservableObject {
    @Published var todos = [Todo]()
}
