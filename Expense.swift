//
//  Expense.swift
//  roomCronies
//
//  Created by Paul on 2017-10-20.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit
import Parse


class Expense: PFObject {
    
    @NSManaged var expenseName: String
    @NSManaged var isPaid: Bool
    @NSManaged var dateCreated: Date
    @NSManaged var dateCompleted: Date
    @NSManaged var expenseCreator: Person
    @NSManaged var expenseOwer: Person
    
    
    convenience init(expenseCreator:Person, expenseName:String, isPaid:Bool, dateCreated:Date) {
        self.init()
        
        self.expenseCreator = expenseCreator
        self.expenseName = expenseName
        self.isPaid = isPaid
        self.dateCreated = dateCreated
    }
    

}


extension Expense: PFSubclassing {

    static func parseClassName() -> String{
    return "expense"
    }

}
