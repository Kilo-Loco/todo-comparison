//
//  AmplifyService.swift
//  Todo Serverless Comparison
//
//  Created by Kyle Lee on 4/21/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import AWSAppSync
import Foundation

final class AmplifyService {
    private let client: AWSAppSyncClient
    
    init() {
        do {
            let cacheConfig = try AWSAppSyncCacheConfiguration()
            let serviceConfig = try AWSAppSyncServiceConfig()
            let config = try AWSAppSyncClientConfiguration(
                appSyncServiceConfig: serviceConfig,
                cacheConfiguration: cacheConfig
            )
            self.client = try AWSAppSyncClient(appSyncConfig: config)
            
        } catch {
            fatalError("AmplifyService configuration failed: \(error)")
        }
    }
    
    func create(_ todo: Todo, completion: @escaping () -> Void) {
        let input = CreateTodoInput(id: UUID().uuidString, name: todo.name, creationDate: todo.creationDate)
        let mutation = CreateTodoMutation(input: input)
        client.perform(mutation: mutation) {
            if let error = $1 {
                print(error)
            } else if let result = $0 {
                print(result)
                if let error = result.errors {
                    print(error)
                } else {
                    print("success")
                }
                completion()
            }
        }
    }
    
    func getTodos(completion: @escaping ([Todo]) -> Void) {
        client.fetch(query: ListTodosQuery(), cachePolicy: .returnCacheDataAndFetch) {
            if let error = $1 {
                print(error)
            } else if let todoQueryItems = $0?.data?.listTodos?.items {
                let todos = todoQueryItems
                    .compactMap { $0 }
                    .map { Todo(listQueryItem: $0) }
                completion(todos)
            }
        }
    }
}
