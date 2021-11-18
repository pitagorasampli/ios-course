//
//  TodoListPresenter.swift
//  HTodo
//
//  Created by Humberto Castro on 18/11/21.
//

import Foundation
import RealmSwift

class TodoListPresenter {
    var reloadData: (() -> Void)?
    
    func numberOfRowsInSection() -> Int {
        return getOrderedTasks().count
    }
    
    func getTask(row: Int) -> Task {
        return getOrderedTasks()[row]
    }
    
    func didSelectRowAt(row: Int) {
        let realm = try? Realm()
        
        let task = getOrderedTasks()[row]
        try? realm?.write {
            task.isCompleted.toggle()
        }
        
        reloadData?()
    }
    
    func getOrderedTasks() -> [Task] {
        do {
            let realm = try Realm()
            
            let results = realm.objects(Task.self)
            let newTaskList = Array(results)
            
            return newTaskList.sorted { first, second in
                !first.isCompleted && second.isCompleted
            }
        } catch {
            return []
        }
    }
}
