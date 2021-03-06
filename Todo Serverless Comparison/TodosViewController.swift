//
//  TodosViewController.swift
//  Todo Serverless Comparison
//
//  Created by Kyle Lee on 4/21/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import Combine
import SwiftUI

final class TodosViewController: UIHostingController<TodosView> {
    private var didTapAddToken: Cancellable?
    
    override init(rootView: TodosView) {
        super.init(rootView: rootView)
        configureCommunication()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getTodos()
    }
    
    private func configureCommunication() {
        didTapAddToken = rootView.didTapAddPublisher.sink { [weak self] in
            self?.showAddTodoAlert()
        }
    }
    
    private func getTodos() {
        
    }
    
    private func showAddTodoAlert() {
        let alert = UIAlertController(
            title: "Add Todo",
            message: nil,
            preferredStyle: .alert
        )
        
        alert.addTextField { $0.placeholder = "Name"}
        
        let action = UIAlertAction(title: "Add", style: .default) { [weak self, weak alert] _ in
            guard let name = alert?.textFields?.first?.text else { return }
            self?.createTodo(with: name)
        }
        alert.addAction(action)
        
        present(alert, animated: true)
    }
    
    private func createTodo(with name: String) {
        print("Next todo will have the name: \(name)")
    }
}
