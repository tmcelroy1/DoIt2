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
    
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addTapped(_ sender: Any) {
        // Create a task from the outlet information
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = TaskItem(context: context)
        task.name = taskNameTextField.text!
        task.imporant = importantSwitch.isOn
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        // save data
        
        
        navigationController!.popViewController(animated: true)
    }
    
    
    }
    

