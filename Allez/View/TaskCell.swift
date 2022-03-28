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
    
    func configure(withTask task: Task)  {
        self.titleLabel.text = task.title
        
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yy"
        if let date = task.date {
            let dateString = df.string(from: date)
            dateLabel.text = dateString
        }
        self.locationLabel.text = task.location?.name
    }
}
