//
//  CompleteTaskViewController.swift
//  DoIt2
//
//  Created by Tim McElroy1 on 6/27/17.
//  Copyright © 2017 Tim McElroy1. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {

    
    @IBOutlet weak var taskLabel: UILabel!
   
   var task = TaskItem()
    var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if task.imporant{
            taskLabel.text = "❗️\(task.name)"
        } else{
            taskLabel.text = task.name
        }
    }
  
    
    @IBAction func completeTapped(_ sender: Any) {
        previousVC.tasks .remove(at:  previousVC.selectedIndex)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }
    
    

    
}
