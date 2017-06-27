//
//  CreateTaskViewController.swift
//  DoIt2
//
//  Created by Tim McElroy1 on 6/27/17.
//  Copyright © 2017 Tim McElroy1. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var importantSwitch: UISwitch!
    @IBOutlet weak var taskNameTextField: UITextField!
    
    var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addTapped(_ sender: Any) {
        // Create a task from the outlet information
        
        let task = TaskItem()
        task.name = taskNameTextField.text!
        task.imporant = importantSwitch.isOn
        
        // Add new task to the array in main viewController
        
        previousVC.tasks.append(task)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }
    
    
    }
    

