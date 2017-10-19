//
//  AppDelegate.swift
//  roomCronies
//
//  Created by Paul on 2017-10-19.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        configureParse()
        createUser()
        
        return true
    }
    
    
    private func configureParse() {
        
        let configuration = ParseClientConfiguration {
            $0.applicationId = "com.Paul.Room"
            $0.clientKey = MASTER_KEY
            $0.server = "http://roomcronies.herokuapp.com/parse"
        }
        Parse.initialize(with: configuration)
        
    }
    
    
    private func createUser() {
        
        let paul = PFObject(className: "Person")
        paul["age"] = 26
        paul["email"] = "paul.huynh3@gmail.com"
        paul["password"] = "password"
        
        paul.saveInBackground{ (success, error) in
            if let error = error {
                print (#line, error)
                return
            }
            print(#line, success)
            
        }
    }
    
    
    
    //
    //    //this fetches the person based on predicate
    //    private func fetchPerson() {
    //        let predicate = NSPredicate(format: "age > 22")
    //        let query = PFQuery(className: "CatSnail", predicate: predicate)
    //        query.findObjectsInBackground {(cats: [PFObject]?, error: Error?) in
    //
    //            if let error = error {
    //                print(#line, error.localizedDescription)
    //                return
    //            }
    //            guard let cats = cats else {
    //
    //                return
    //            }
    //
    //            var catArray:[Any] = []
    //
    //            for cat in cats {
    //
    //                catArray.append(cat)
    //            }
    //            print(catArray)
    //
    //        }
    //
    //
    //    }
    //
    //    private func createCat() {
    //        do{
    //            let person = PFObject(className: "CatSnail")
    //            person["age"] = 21
    //            person["name"] = "Paul"
    //            let path = Bundle.main.path(forResource: "mushroom", ofType: "jpg")
    //            let file = try PFFile(name:"mushroom.jpg", contentsAtPath: path!)
    //            person["image"] = file
    //            person.saveInBackground{ (success, error) in
    //                if let error = error {
    //                    print (#line, error)
    //                    return
    //                }
    //                print(#line, success)
    //
    //            }
    //        }
    //        catch{
    //
    //            print(#line, error.localizedDescription)
    //        }
    //
    //    }
    //
    //
    //    //this allows deleteObject to call it and delete the person
    //    private func fetchPersonCompletion(completion: @escaping (PFObject) -> () ) {
    //        let predicate = NSPredicate(format: "age > 22")
    //        let query = PFQuery(className: "CatSnail", predicate: predicate)
    //        query.findObjectsInBackground {(cats: [PFObject]?, error: Error?) in
    //
    //            if let error = error {
    //                print(#line, error.localizedDescription)
    //                return
    //            }
    //            guard let cats = cats else {
    //
    //                return
    //            }
    //
    //            let ian = cats.first!
    //
    //            completion(ian)
    //
    //        }
    //
    //
    //    }
    //
    //
    //    private func deleteObject() {
    //        fetchPersonCompletion{ (person) in
    //            person.deleteInBackground(block: { (success, _) in
    //                print(#line, "Ian dies!")
    //            })
    //        }
    //    }
    //    
    
    
    
    
    
    
    
    
    
}

