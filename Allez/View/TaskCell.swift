//
//  TaskCell.swift
//  Allez
//
//  Created by Makarov_Maxim on 21.03.2022.
//

import UIKit

class TaskCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    func configure(withTask task: Task)  {}
}
