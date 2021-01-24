//
//  TodoItemTableViewCell.swift
//  iOSClean
//
//  Created by Olarn U. on 23/1/2564 BE.
//

import UIKit

class TodoItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var isDoneSwitch: UISwitch!
    
    private var item: Todo?
    private var index = -1;
    
    func set(_ item: Todo, withIndex index: Int) {
        self.item = item
        titleLabel.text = item.title
        dueDateLabel.text = item.dueDate.toString()
        isDoneSwitch.isOn = item.isDone
        self.index = index
    }
    
    @IBAction func onTodoItemStatusChanged(_ sender: Any) {
        Todolist.todoItems[index].isDone = isDoneSwitch.isOn
    }
}
