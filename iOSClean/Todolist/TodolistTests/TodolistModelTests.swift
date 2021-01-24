//
//  TodolistModelTests.swift
//  iOSCleanTests
//
//  Created by Olarn U. on 23/1/2564 BE.
//

import Quick
import Nimble
@testable import iOSClean

class TodolistModelTests: QuickSpec {
    override func spec() {
        describe("Test todolist items count") {
            
            Todolist.todoItems =
            [
                Todo(title: "Read a book", dueDate: Date(), isDone: true),
                Todo(title: "Workout", dueDate: Date(), isDone: false),
                Todo(title: "Finish a game", dueDate: Date(), isDone: false),
            ]
        }
    }
}
