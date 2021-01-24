//
//  ViewController.swift
//  iOSClean
//
//  Created by Olarn U. on 23/1/2564 BE.
//

import UIKit

protocol TodolistViewControllerDelegate: class {
    func refresh(_ todoItems: [Todo])
}

class TodolistViewController: UIViewController {
    
    // MARK:- Outlets
    
    @IBOutlet weak var todoListTableView: UITableView!
    
    // MARK:- VIP Boilerplat
    
    let interactor = TodolistInteractor()
    let worker = TodolistWorker()
    let presenter = TodolistPresenter()
    
    var todoItems = [Todo]()

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
    
    func refresh(_ todoItems: [Todo]) {
        self.todoItems = todoItems
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
        return todoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "todoItemCell") as? TodoItemTableViewCell else {
            return UITableViewCell()
        }
        cell.todoItem = todoItems[indexPath.row]
        return cell
    }
}
