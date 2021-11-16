//
//  Task.swift
//  HTodo
//
//  Created by Humberto Castro on 16/11/21.
//

import Foundation
import RealmSwift

class Task: Object {
    @Persisted(primaryKey: true) var _id: UUID = .init()
    @Persisted var name = ""
    @Persisted var isCompleted: Bool = false
    
    convenience init(name: String, isCompleted: Bool) {
        self.init()
        self.name = name
        self.isCompleted = isCompleted
    }
}
