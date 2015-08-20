//
//  ViewController.swift
//  SwiftCoreData
//
//  Created by kodejs on 8/20/15.
//  Copyright © 2015 kodejs. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // set delegata
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let context: NSManagedObjectContext = appDel.managedObjectContext
        // call entity and connect to users
        let newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context)
        
        // add object to entity
        newUser.setValue("asharijuang", forKey: "username")
        newUser.setValue("password", forKey: "pasword")
        
        // coba simpan jika berhasil dan tidak
        do {
            try context.save()
        }catch {
            print("There was a problem")
        }
        
        // Membaca atau memanggil entity kemudian menampilkannya
        let request = NSFetchRequest(entityName: "Users")
        
        do {
            let result = try context.executeFetchRequest(request)
            print(result)
        }catch {
            print("Something wrong")
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

