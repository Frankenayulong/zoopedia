//
//  AppData.swift
//  zoopedia
//
//  Created by Kendrick on 6/10/17.
//  Copyright © 2017 Nadya. All rights reserved.
//

import Foundation
import CoreData
import UIKit
class AppData {
    static let sharedInstance = AppData()
    private init()
    {
        managedContext = appDelegate.persistentContainer.viewContext
    }
    
    // Get a reference to your App Delegate
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    // Hold a reference to the managed context
    let managedContext: NSManagedObjectContext
    
    // Create a collection of objects to store in the database
    var animaldb = [AnimalDB]()
    
    func getAnimal(_ indexPath: IndexPath) -> AnimalDB
    {
        return animaldb[indexPath.row]
    }
    
    // MARK: - CRUD
    
    func saveAnimal(id: Int, name:String, desc: String, question: String, choice1: String, choice2: String, choice3:String,choice4:String,image_url:String,correct_ans:String, existing: AnimalDB?)
    {
        // Create a new managed object and insert it into the context, so it can be saved
        // into the database
        let entity =  NSEntityDescription.entity(forEntityName: "Animal",
                                                 in:managedContext)
        
        // Update the existing object with the data passed in from the View Controller
        if let _ = existing
        {
            existing!.id = Int32(id)
            existing!.name = name
            existing!.desc = desc
            existing!.question = question
            existing!.choice1 = choice1
            existing!.choice2 = choice2
            existing!.choice3 = choice3
            existing!.choice4 = choice4
            existing!.image_url = image_url
        }
            // Create a new movie object and update it with the data passed in from the View Controller
        else
        {
            // Create an object based on the Entity
            let animal = AnimalDB(entity: entity!,
                              insertInto:managedContext)
            animal.id = Int32(id)
            animal.name = name
            animal.desc = desc
            animal.question = question
            animal.choice1 = choice1
            animal.choice2 = choice2
            animal.choice3 = choice3
            animal.choice4 = choice4
            animal.image_url = image_url
        }
        
        updateDatabase()
    }
    
    func getMovies()
    {
        do
        {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"Animal")
            
            let results =
                try managedContext.fetch(fetchRequest)
            animaldb = results as! [AnimalDB]
        }
        catch let error as NSError
        {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    
    func deleteMovie(_ animal: AnimalDB)
    {
        managedContext.delete(animal)
        updateDatabase()
    }
    
    
    
    
    // Save the current state of the objects in the managed context into the
    // database.
    func updateDatabase()
    {
        do
        {
            try managedContext.save()
        }
        catch let error as NSError
        {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
}
