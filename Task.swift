//
//  Task.swift
//  roomCronies
//
//  Created by Paul on 2017-10-20.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit
import Parse

class Task: PFObject {
    @NSManaged var taskName : String
    @NSManaged var taskDescription: String
    @NSManaged var isExpense: Bool
    @NSManaged var isComplete: Bool
    @NSManaged var priority: Int
    @NSManaged var dateCreated: Date
    @NSManaged var dateCompleted: Date
    
    
    
    convenience init(taskName:String, description:String, isExpense:Bool, priority:Int, dateCreated:Date) {
       self.init()
        
        self.taskName = taskName
        self.taskDescription = description
        self.isExpense = isExpense
        self.priority = priority
        self.dateCreated = dateCreated
    }
    
    
    
    
    
    
}



//This allows the other controller to use dot notation properties.
extension Task: PFSubclassing{
    
    static func parseClassName() -> String {
        
        return "task"
    }
    
}
