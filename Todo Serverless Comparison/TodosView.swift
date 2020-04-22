//
//  TodosView.swift
//  Todo Serverless Comparison
//
//  Created by Kyle Lee on 4/21/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import Combine
import SwiftUI

struct TodosView: View {
    let didTapAddPublisher = PassthroughSubject<Void, Never>()
    
    @ObservedObject var sot: TodosSourceOfTruth
    
    var body: some View {
        NavigationView {
            List(sot.todos.sorted()) { todo in
                Text(todo.name)
            }
            .navigationBarTitle("Todos")
            .navigationBarItems(
                trailing: Button(
                    action: { self.didTapAddPublisher.send() }
                ) {
                    Image(systemName: "plus")
                }
            )
        }
    }
}
