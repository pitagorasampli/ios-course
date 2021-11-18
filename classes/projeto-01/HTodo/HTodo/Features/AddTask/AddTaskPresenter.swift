//
//  AddTaskPresenter.swift
//  HTodo
//
//  Created by Humberto Castro on 18/11/21.
//

import Foundation
import RealmSwift

final class AddTaskPresenter {
    func save(titleText: String?) {
        let titleText = titleText ?? ""
        let task = Task(name: titleText, isCompleted: false)
        let realm = try? Realm()
        try? realm?.write {
            realm?.add(task, update: .all)
        }
    }
    
    func isSaveButtonHidden(text: String?) -> Bool {
        if let text = text {
            return text.isEmpty
        } else {
            return false
        }
    }
}
