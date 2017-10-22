//
//  TaskViewController.swift
//  roomCronies
//
//  Created by Paul on 2017-10-20.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddTaskDelegate {

    var tasks:[Task] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    //MARK: Tableview Datasource
    public func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
    return tasks.count
        
    
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
    
    let cellIdentifier = "TaskViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TaskViewCell else {
        
        fatalError("The dequeued cell is not TaskViewCell")
        
        }
        
        let task = tasks[indexPath.row]
        
        cell.setupCell(task: task)
        
        
        return cell

    }
    
    
    //MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        switch (segue.identifier ?? "") {
        case "AddTaskSegue":
            
            guard let addTaskVC = segue.destination as? AddTaskViewController else{
            fatalError("unexpected destination:\(segue.destination)")
            }
            
            //set to be the task delegate
            addTaskVC.taskDelegate = self
            
            print("Adding a new task")
        
        case "ShowDetailTask"
            
            
        default:
            <#code#>
        }
        
        
    }
    
    
    
    //MARK: taskDelegate
    func addTaskObject(task: Task) {
        
        tasks.append(task)
        
    }
    

    
    
    
    

}




