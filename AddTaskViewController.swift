//
//  AddTaskViewController.swift
//  roomCronies
//
//  Created by Paul on 2017-10-20.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit

protocol AddTaskDelegate {
    
    func addTaskObject(task:Task)
}

class AddTaskViewController: UIViewController {
    
    var taskDelegate: AddTaskDelegate?
    
    //this value will either be an existing task or to create a new task
    var task: Task?
    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskDescriptionTextField: UITextField!
    @IBOutlet weak var taskPriorityTextField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let task = task{
            
            taskNameTextField.text = task.taskName
            taskDescriptionTextField.text = task.taskDescription
            
            if var priorty = Int(taskPriorityTextField.text!){
                priorty = task.priority
            }
        }
            
            
    }
        
        
        @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
            
            let task = Task ()
            
            
            if let name = taskNameTextField.text {
                task.taskName = name
                
            }
            
            if let description = taskDescriptionTextField.text {
                task.taskDescription = description
            }
            
            
            if let priorityNumber = Int(taskPriorityTextField.text!) {
                
                task.priority = priorityNumber
            }
            
            
            taskDelegate?.addTaskObject(task: task)
            
            navigationController?.popViewController(animated: true)
            
        }
        
        
        @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
            
            navigationController?.popViewController(animated: true)
            
        }
        
        
        
}