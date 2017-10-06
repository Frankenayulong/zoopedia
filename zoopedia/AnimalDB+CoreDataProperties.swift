//
//  AnimalDB+CoreDataProperties.swift
//  zoopedia
//
//  Created by Kendrick on 6/10/17.
//  Copyright © 2017 Nadya. All rights reserved.
//

import Foundation
import CoreData


extension AnimalDB {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AnimalDB> {
        return NSFetchRequest<AnimalDB>(entityName: "AnimalDB")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var desc: String?
    @NSManaged public var question: String?
    @NSManaged public var choice1: String?
    @NSManaged public var choice2: String?
    @NSManaged public var choice3: String?
    @NSManaged public var choice4: String?
    @NSManaged public var correct_answer: String?
    @NSManaged public var image_url: String?
    @NSManaged public var answer: String?
    @NSManaged public var answered: Bool
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double

}
