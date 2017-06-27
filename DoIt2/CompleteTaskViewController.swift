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
   
    var task : TaskItem? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if task!.imporant{
            taskLabel.text = "❗️\(String(describing: task!.name))"
        } else{
            taskLabel.text = task!.name
        }
    }
  
    
    @IBAction func completeTapped(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }
    
    

    
}
