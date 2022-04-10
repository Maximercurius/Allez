//
//  ViewController.swift
//  Allez
//
//  Created by Makarov_Maxim on 17.03.2022.
//

import UIKit

class TaskListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet var dataProvider: DataProvider!
    
    @IBAction func addNewTask(_ sender: UIBarButtonItem) {
        if let viewController = storyboard?.instantiateViewController(withIdentifier: String(describing:  NewTaskViewController.self)) as? NewTaskViewController {
            viewController.taskManager = self.dataProvider.taskManager
            present(viewController, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let taskManager = TaskManager()
        dataProvider.taskManager = taskManager
        
        NotificationCenter.default.addObserver(self, selector: #selector(showDetail(withNotification:)), name: NSNotification.Name(rawValue: "DidSelectRaw Notification"), object: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    @objc
    func showDetail(withNotification notification: Notification) {
        guard
            let userInfo = notification.userInfo,
            let task = userInfo["task"] as? Task,
            let detailViewController = storyboard?.instantiateViewController(withIdentifier: String(describing: DetailViewController.self)) as? DetailViewController else {
            fatalError()
            
        }
        detailViewController.task = task
        navigationController?.pushViewController(detailViewController, animated: true)
    }

}

