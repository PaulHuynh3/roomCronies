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
   
    @NSManaged var personInRoom: Person
    @NSManaged var numberOfPerson: [Person]
    
    convenience init(personInRoom:Person, numberOfPerson:[Person]) {
       self.init()
        
        
        //initlize stored properties.
        self.personInRoom = personInRoom
        self.numberOfPerson = numberOfPerson
        
    }


}



//This allows the other controller to use dot notation properties.
extension Room: PFSubclassing {
    
    static func parseClassName() -> String {
        return "room"
    }
    
}
