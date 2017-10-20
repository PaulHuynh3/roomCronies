//
//  Person.swift
//  roomCronies
//
//  Created by Paul on 2017-10-20.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit
import Parse

class Person: PFObject {
    
    @NSManaged var name:String
    @NSManaged var email:String
    @NSManaged var password:String
    
    
    
    
    convenience init?(name:String, email:String, password:String){
        
        self.init()
        
        
        //error handling
        guard !name.isEmpty else {
            return nil
        }
        
        guard !email.isEmpty else {
            return nil
        }
        
        guard !password.isEmpty else {
            return nil
        }
        
        
        //Initialize stored properties
        self.name = name
        self.email = email
        self.password = password
        
        
        
    }
    
    
}


//This allows the other controller to use dot notation properties.
extension Person: PFSubclassing {
    
    static func parseClassName() -> String {
        return "person"
    }
    
}

