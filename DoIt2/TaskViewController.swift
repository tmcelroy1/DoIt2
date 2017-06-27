//
//  TasksViewController.swift
//  DoIt2
//
//  Created by Tim McElroy1 on 6/26/17.
//  Copyright © 2017 Tim McElroy1. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [TaskItem] = []
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = makeTasks()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.imporant{
            cell.textLabel?.text = "❗️\(task.name)"
        } else{
            cell.textLabel?.text = task.name
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
         selectedIndex = indexPath.row
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    func makeTasks() -> [TaskItem]{
        let task1 = TaskItem()
        task1.name = "Walk the dog!"
        task1.imporant = false
        
        let task2 = TaskItem()
        task2.name = "Buy Cheese!"
        task2.imporant = true
        
        let task3 = TaskItem()
        task3.name = "Mow the lawn"
        task3.imporant = false
        
        return [task1, task2, task3]
    }
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSegue"{
            let nextVC = segue.destination as! CreateTaskViewController
            nextVC.previousVC = self
        }
        if segue.identifier == "selectTaskSegue"{
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as! TaskItem
            nextVC.previousVC = self
            
            
            
            
            
        }
    }
    
}
