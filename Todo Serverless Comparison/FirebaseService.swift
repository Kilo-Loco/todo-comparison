//
//  FirebaseService.swift
//  Todo Serverless Comparison
//
//  Created by Kyle Lee on 4/21/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import Firebase
import FirebaseFirestore
import Foundation

final class FirebaseService {
    private lazy var database = Firestore.firestore()
    private lazy var todosReference = database.collection("todos")
    
    init() {
        configure()
    }
    
    private func configure() {
        FirebaseApp.configure()
    }
    
    func create(_ todo: Todo) {
        todosReference.addDocument(data: todo.document) {
            if let error = $0 {
                print(error)
            }
        }
    }
    
    func observeTodos(completion: @escaping ([Todo]) -> Void) {
        todosReference.addSnapshotListener {
            if let error = $1 {
                print(error)
            } else if let snapshot = $0 {
                let todos = snapshot.documents.map { Todo(from: $0) }
                completion(todos)
            }
        }
    }
}
