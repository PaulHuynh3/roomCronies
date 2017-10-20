//
//  AppDelegate.swift
//  roomCronies
//
//  Created by Paul on 2017-10-19.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit
import Parse
import UserNotifications


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        configureParse()
        //        createRoom()
        //        createJaison()
        //        createPaul()
        fetchPerson()
        registerForPushNotifications()
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
    
    private func createRoom() {
        
        let room = PFObject(className: "room")
        
        room["type"] = "apartment"
        
        room.saveInBackground{ (success, error) in
            if let error = error {
                print (#line, error)
                return
            }
            print(#line, success)
            
        }
    }
    
    private func createPaul() {
        
        let paul = PFObject(className: "person")
        paul["age"] = 26
        paul["email"] = "paul.huynh3@gmail.com"
        paul["password"] = "password"
        
        paul["parent"] = PFObject.init(withoutDataWithClassName:"room", objectId: "Tk7RVCJkHh")
        
        paul.saveInBackground { (success, error) in
            
            if let error = error {
                print(#line, error)
                return
            }
            print(#line, success)
        }
    }
    
    
    
    private func createJaison() {
        
        let jaison = PFObject(className: "person")
        jaison["age"] = 21
        jaison["email"] = "jb@gmail.com"
        jaison["password"] = "password"
        
        
        //establish the relationship.
        jaison["parent"] = PFObject.init(withoutDataWithClassName:"room", objectId:"Tk7RVCJkHh")
        
        
        
        jaison.saveInBackground{ (success, error) in
            if let error = error {
                print (#line, error)
                return
            }
            print(#line, success)
            
        }
    }
    
    
    //this fetches the person based on predicate
    private func fetchPerson() {
        let predicate = NSPredicate(format: "age > 18")
        let query = PFQuery(className: "person", predicate: predicate)
        query.findObjectsInBackground {(person: [PFObject]?, error: Error?) in
            
            if let error = error {
                print(#line, error.localizedDescription)
                return
            }
            guard let person = person else {
                
                return
            }
            
            
            for jaison in person {
                
                print(jaison)
            }
            
        }
        
    }
    
    //this allows deleteObject to call it and delete the person
    private func fetchPersonCompletion(completion: @escaping (PFObject) -> () ) {
        let predicate = NSPredicate(format: "age > 22")
        let query = PFQuery(className: "CatSnail", predicate: predicate)
        query.findObjectsInBackground {(cats: [PFObject]?, error: Error?) in
            
            if let error = error {
                print(#line, error.localizedDescription)
                return
            }
            guard let cats = cats else {
                
                return
            }
            
            let ian = cats.first!
            
            completion(ian)
            
        }
        
    }
    
    //MARK: - adding push notifications
    func registerForPushNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
            (granted, error) in
            print("Permission granted: \(granted)")
            
            guard granted else { return }
            self.getNotificationSettings()
        }
    }
    
    func getNotificationSettings() {
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            print("Notification settings: \(settings)")
            
            guard settings.authorizationStatus == .authorized else { return }
            OperationQueue.main.addOperation {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
    }
    
    func application(_ application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let tokenParts = deviceToken.map { data -> String in
            return String(format: "%02.2hhx", data)
        }
        
        let token = tokenParts.joined()
        print("Device Token: \(token)")
    }
    
    func application(_ application: UIApplication,
                     didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register: \(error)")
    }
    
}




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









