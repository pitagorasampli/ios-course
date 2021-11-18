//
//  DependencyManager.swift
//  HTodo
//
//  Created by Humberto Castro on 18/11/21.
//

import Foundation

class DependencyManager {
    static func makeTodoListViewController() -> TodoListViewController {
        return TodoListViewController(presenter: TodoListPresenter())
    }
    
    static func makeAddTaskViewController() -> AddTaskViewController {
        return AddTaskViewController(presenter: AddTaskPresenter())
    }
}
