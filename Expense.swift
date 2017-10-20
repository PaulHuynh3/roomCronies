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
    
    
    
    
}



extension Expense: PFSubclassing {

    static func parseClassName() -> String{
    return "expense"
    }

}
