//
//  Requester.swift
//  zoopedia
//
//  Created by Kendrick on 6/10/17.
//  Copyright © 2017 Nadya. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
enum Requester{
    public static func getAnimals(callback: @escaping (_ animals:[SAnimal]) -> ()){
        Alamofire.request("https://propertianda.com/zoopedia/php/animals.php").responseJSON { response in
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
                var ans:[SAnimal] = []
                let body = JSON(json)
                let animals: JSON = JSON(body["body"].arrayValue)
                AppData.sharedInstance.deleteAnimals()
                for (_,animal):(String, JSON) in animals {
                    print("\(animal)")
                    AppData.sharedInstance.saveAnimal(id: animal["id"].intValue, name: animal["name"].stringValue, desc: animal["description"].stringValue, question: animal["question"].stringValue, choice1: animal["choice1"].stringValue, choice2: animal["choice2"].stringValue, choice3: animal["choice3"].stringValue, choice4: animal["choice4"].stringValue, image_url: animal["image_url"].stringValue, correct_ans: animal["correct_answer"].stringValue, latitude: animal["latitude"].doubleValue, longitude:animal["longitude"].doubleValue)
                    ans.append(SAnimal(name: animal["name"].stringValue, image:animal["image_url"].stringValue, desc: animal["description"].stringValue))
                }
                callback(ans)
            }
        }
    }
}
