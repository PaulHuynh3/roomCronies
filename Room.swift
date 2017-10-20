//
//  Room.swift
//  roomCronies
//
//  Created by Paul on 2017-10-20.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit
import Parse


class Room: PFObject{
   
    @NSManaged var personInRoom:Int
    
    
    convenience init(personInRoom:Int) {
        
        self.init()
        
        //initlize stored properties.
        self.personInRoom = peopleInRoom
        
    }
    
    
    
    

}



//This allows the other controller to use dot notation properties.
extension Room: PFSubclassing {
    
    static func parseClassName() -> String {
        return "room"
    }
    
}
