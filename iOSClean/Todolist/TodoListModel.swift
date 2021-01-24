//
//  TodoListModel.swift
//  iOSClean
//
//  Created by Olarn U. on 23/1/2564 BE.
//

import Foundation

struct Todo: Equatable {
    var title: String
    var dueDate: Date
    var isDone: Bool
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return
            lhs.title == rhs.title &&
            lhs.dueDate == rhs.dueDate &&
            lhs.isDone == rhs.isDone
    }
}

class Todolist {
    static var todoItems: [Todo] = []
}

extension Date {
    func toString(format: String = "dd-MM-yyyy") -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
