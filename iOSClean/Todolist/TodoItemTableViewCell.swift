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
    
    var todoItem: Todo? {
        set {
            item = newValue
            titleLabel.text = item?.title
            dueDateLabel.text = item?.dueDate.toString()
            isDoneSwitch.isOn = item?.isDone ?? false
        }
        get {
            return item
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
