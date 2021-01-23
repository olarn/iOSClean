//
//  ViewController.swift
//  iOSClean
//
//  Created by Olarn U. on 23/1/2564 BE.
//

import UIKit

protocol TodolistViewControllerDelegate: class {
    func refresh(_ todoList: Todolist)
}

class TodolistViewController: UIViewController {
    
    // MARK:- Outlets
    
    @IBOutlet weak var todoListTableView: UITableView!
    
    // MARK:- VIP Boilerplat
    
    let interactor = TodolistInteractor()
    let worker = TodolistWorker()
    let presenter = TodolistPresenter()
    
    var todolist: Todolist = Todolist()

    private func setup() {
        interactor.presenter = presenter
        interactor.worker = worker
        worker.interactor = interactor
        presenter.viewController = self
        
        bindingTableViewDelegate()
    }
    
    // MARK:- View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        interactor.requestTodolist()
    }
}

// MARK:- TodolistViewControllerProtocol Handler

extension TodolistViewController: TodolistViewControllerDelegate {
    
    func refresh(_ todoList: Todolist) {
        self.todolist = todoList
        todoListTableView.reloadData()
    }
}

// MARK:- Table Datasource & Delegate handler

extension TodolistViewController: UITableViewDataSource, UITableViewDelegate {
    
    func bindingTableViewDelegate() {
        todoListTableView.dataSource = self
        todoListTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todolist.totalItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "todoItemCell") as? TodoItemTableViewCell else {
            return UITableViewCell()
        }
        cell.todoItem = self.todolist.todoItems[indexPath.row]
        return cell
    }
}
