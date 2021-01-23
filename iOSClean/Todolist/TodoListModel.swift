//
//  TodoListModel.swift
//  iOSClean
//
//  Created by Olarn U. on 23/1/2564 BE.
//

import Foundation

struct Todo {
    var title: String
    var dueDate: Date
    var isDone: Bool
}

struct Todolist {
    var todoItems: [Todo] = []

    var totalItems: Int {
        return todoItems.count
    }

    var totalRemains: Int {
        return todoItems.filter { !$0.isDone }.count
    }

    var totalDone: Int {
        return todoItems.filter { $0.isDone }.count
    }
}

extension Date {
    func toString(format: String = "dd MM yyyy") -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
